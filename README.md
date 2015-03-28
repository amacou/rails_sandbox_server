# RailsSandboxServer

Load fixture and Rollback by http api

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rails_sandbox_server', github: 'amacou/rails_sandbox_server'
```

And then execute:

    $ bundle

## Usage

### Load Fixture

```sh
$ curl -X POST http://127.0.0.1:3000/sandbox/setup -d "fixture=articles"
```

default fixture load path is `test/fixtures`
if you'd like to change fixture path, add below to your config/environments/development.rb

```ruby
Rails.application.configure do
...
# add this line
config.rails_sandbox_server.fixture_path = 'some/fixtures/path'
...
end
```

### Rollback

```sh
curl -X DELETE http://127.0.0.1:3000/sandbox/rollback
```

This project rocks and uses MIT-LICENSE.
