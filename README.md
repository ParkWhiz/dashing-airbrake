##Preview

![](https://raw.githubusercontent.com/ParkWhiz/dashing-airbrake/master/preview.png)

## Description

This is a [Dashing](http://shopify.github.com/dashing) widget to display the number of unresolved errors from your [Airbrake](https://airbrake.io/) projects.

##Dependencies

[faraday](https://github.com/lostisland/faraday) and [faraday_middleware](https://github.com/lostisland/faraday_middleware)

Add it to dashing's gemfile:

    gem 'faraday'
    gem 'faraday_middleware'
    
and run `bundle install`.

##Usage

To use this widget, copy `airbrake.html`, `airbrake.coffee`, and `airbrake.scss` into a `/widgets/airbrake` directory, and copy the `airbrake.rb` file into your `/jobs` folder.


To include the widget in a dashboard, add the following snippet to the dashboard layout file:


```html
<li data-row="1" data-col="1" data-sizex="2" data-sizey="1">
  <div data-id="airbrake-119403" data-view="Airbrake" data-title="My Project"></div>
</li>
<li data-row="1" data-col="1" data-sizex="1" data-sizey="1">
  <div data-red="200" data-yellow="100" data-id="airbrake-130822" data-view="Airbrake" data-title="Second backlog"></div>
</li>
```

Create a widget for each airbrake project, with the ID specified in the `data-id` attribute.

##Settings

**API Key**: When you run dashing, you need to set the `AIRBRAKE_API_KEY` environment variable. e.g. `AIRBRAKE_API_KEY=YOUR_API_TOKEN dashing start`

**Red/yellow/green Thresholds**: If you provide `data-red` and `data-yellow` attributes (like in the "Second backlog" example in the *Usage* section above) you can control the thresholds for red, yellow, and gree backgrounds. e.g. specifying `data-red="10" data-yellow="5"` will cause the background to be green for 0-4 errors, yellow for 5-9, and red for 10+ errors.
