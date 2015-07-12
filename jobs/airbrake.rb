require 'faraday'
require 'faraday_middleware'

conn = Faraday.new(:url => 'https://airbrake.io', :headers => { 'Accept' => 'application/json' }) do |conn|
  conn.response :json, :content_type => /\bjson$/
  conn.adapter Faraday.default_adapter
end

SCHEDULER.every '10m', :first_in => 0 do
  response = conn.get '/api/v4/projects' do |req|
    req.params['key'] = ENV['AIRBRAKE_API_KEY']
  end
  projects = response.body

  projects['projects'].each do |project|
    send_event("airbrake-#{project['id']}", num_errors: project['groupUnresolvedCount'])
  end
end
