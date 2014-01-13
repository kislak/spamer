# Spamer

use atomic sms api to send sms
http://www.atompark.com/members/sms/apiv3/

## Installation

Add this line to your application's Gemfile:

    gem 'spamer'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install spamer

## Usage

    spamer = Spamer::Base.new('my_public_key', 'my_private_key')
    spamer.send_sms('375257404426', 'Hello world.', {sender: 'SergeKislak'})

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
