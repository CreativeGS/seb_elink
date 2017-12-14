# SebElink
Lightweight Ruby wrapper for communicating with SEB.lv i-bank payment API.  
Solves the cryptographic requirements for you.  

## Installation
Bundle or manually install the latest version of the gem:

```ruby
gem 'seb_elink'
```

## Usage
Please note that for consistency in this gem all hash keys are constant-case __symbols__.

The gem has three elements represented as Ruby classes:

__1. SebElink::Gateway__  
Think of this as the communication adapter. Initialize it with a base64-encoded private key string (the human-readable .pem format). You can store the instance in a constant to reduce processing overhead.  

You can pass an optional options hash as the second argument that will specify default values for communications processed by that gateway instance. Useful for setting company-related data just once.  

```rb
SebElink::Gateway.new(
  <privkey string>,
  {
    IB_SND_ID: "TESTCOMPANY",
    IB_NAME: "Test Inc."
  }
)
```

Additionally, you can rewrite values used by the gem pertaining to SEB.lv i-bank, such as their public key, API uri etc. Here's a complete list:

```rb
{
  IB_VERSION: "001", # which API version to use
  IBANK_CERT: "-----BEGIN CERTIFICATE-----..." # public key/cer of SEB.lv, changes rarely
  IBANK_API_URI: "https://ibanka.seb.lv/ipc/epakindex.jsp" # where to POST users
}
```

__2. SebElink::Message__   
Instances represent requests to i-bank, generally for payment.  

Initialize these with `SebElink::Message.new(gateway_instance, message_code, data_hash)`

```rb
SEB_LV_GATEWAY = SebElink::Gateway.new(<privkey string>)
message_instance = SebElink::Message.new(SEB_LV_GATEWAY, "0002", {IB_SND_ID: ...})
```

Please consult message.rb for the full list of data_hash keys.  

Instances of `SebElink::Message` have two methods:

```rb
message_instance.to_h
#=> hash of all fields you need to POST to i-bank API uri.

message_instance.digital_signature
#=> outputs the value of :IB_CRC key, the digital signature of the message
```

__3. SebElink::Response__   
Instances represent responses from SEB.lv i-bank server.   

Initialize these with `SebElink::Response.new(response_body)`

```rb
SEB_LV_GATEWAY = SebElink::Gateway.new(<privkey string>)
response = SebElink::Response.new("IB_SND_ID=TEST...")

# in a Rails controller context you can obtain the response body with:
# TODO
```

Tests have been written in a documenting manner, so, please,
have a look at the contents of `spec/` directory to get a feel of what the gem can do.  

Version 001 (current) uses the deprecated SHA-1 hashing algorithm. Let SEB.lv know that v2 that uses SHA-256 is needed. 

## Contributing
Bug reports and pull requests are welcome on GitHub at https://github.com/CreativeGS/seb_elink. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

The project uses TDD approach to software development, follow these steps to set up:
1. fork and clone the repo on github
2. Install appropriate Ruby and Bundler
3. `bundle`
4. See if all specs are green with `rspec`
5. TDD new features
6. Make a Pull Request in github

## Releasing a new version
TODO

## License

The gem is available as open source under the terms of the [BSD-3-Clause License](https://opensource.org/licenses/BSD-3-Clause).

## Code of Conduct

Everyone interacting in the SebElink project’s codebases and issue trackers is expected to follow the [code of conduct](https://github.com/CreativeGS/seb_elink/blob/master/CODE_OF_CONDUCT.md).
