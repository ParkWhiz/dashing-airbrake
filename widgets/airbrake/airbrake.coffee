class Dashing.Airbrake extends Dashing.Widget

  onData: (data) ->
    num_errors = @get('num_errors')
    red_threshold = parseInt @get('red_threshold') || 30
    yellow_threshold = parseInt @get('yellow_threshold') || 10

    colorclass = switch
      when num_errors >= red_threshold then 'red'
      when num_errors >= yellow_threshold then 'yellow'
      when num_errors < yellow_threshold then 'green'
      else 'gray'

    node = $(@node)
    node.removeClass "red yellow green gray"
    node.addClass colorclass
