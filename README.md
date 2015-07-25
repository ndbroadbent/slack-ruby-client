Slack Ruby Client
=================

[![Gem Version](https://badge.fury.io/rb/slack-ruby-client.svg)](http://badge.fury.io/rb/slack-ruby-client)
[![Build Status](https://travis-ci.org/dblock/slack-ruby-client.png)](https://travis-ci.org/dblock/slack-ruby-client)

A Ruby wrapper for the Slack [Web](https://api.slack.com/web) and [RealTime Messaging](https://api.slack.com/rtm) APIs.

## Installation

Add to Gemfile.

```
gem 'slack-ruby-client'
```

Run `bundle install`.

## Usage

### Create a New Bot Integration

This is something done in Slack, under [integrations](https://artsy.slack.com/services). Create a [new bot](https://artsy.slack.com/services/new/bot), and note its API token.

### Use the API Token

```ruby
Slack.configure do |config|
  config.token = 'token'
end
```

### Web Client

The Slack Web API allows you to build applications that interact with Slack in more complex ways than the integrations we provide out of the box. For example, send messages with [chat_PostMessage](https://api.slack.com/methods/chat.postMessage).

```ruby
client = Slack::Web::Client.new
client.chat_postMessage(channel: 'general', text: 'Hello World')
```

### RealTime Client

The Real Time Messaging API is a WebSocket-based API that allows you to receive events from Slack in real time and send messages as user.

```ruby
client = Slack::RealTime::Client.new

client.on :hello do
  puts 'Successfully connected.'
end

client.on :message do |data|
  case data['text']
    when 'bot hi'
      web_client.chat_postMessage channel: data['channel'], text: "Hi <@#{data.user}>!"
    when /^bot/
      web_client.chat_postMessage channel: data['channel'], text: "Sorry <@#{data.user}>, what?"
    end
  end
end

client.start
```

## History

This gem is based on [slack-ruby-gem](https://github.com/aki017/slack-ruby-gem), but it more clearly separates the Web and RTM APIs, is more thoroughly tested and is in active development.

## Contributing

See [CONTRIBUTING](CONTRIBUTING.md).

## Copyright and License

Copyright (c) 2015, Daniel Doubrovkine, Artsy and [Contributors](CHANGELOG.md).

This project is licensed under the [MIT License](LICENSE.md).
