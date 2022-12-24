# TaskinatorUi
Web interface for taskinator gem. It also allows to see the workflows and enqueue 
a workflow from a specific place.

## Installation
Add this line to your application's Gemfile:

```ruby
gem "taskinator_ui"
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install taskinator_ui
```

Then add this line into `config/routes.rb`
```ruby
mount TaskinatorUi::Engine, at: '/taskinator'
```

Run `rails server` and navigate to `http://localhost:3000/taskinator/`

## Known issues

If you use Rails in API only mode it can happen that you have `Rack::MethodOverride` middleware disabled.
This middleware needed to route HTML form requests. To fix the problem add this line into `config/application.rb`

```ruby
config.middleware.use Rack::MethodOverride
```

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
