= shoutbox-client

A simple Ruby client to manage your shoutbox (see https://github.com/benjaminkrause/shoutbox). 

== Examples

You can use it via ruby

    ruby-1.9.2-p0 > ShoutboxClient.shout :name => "nightly-rake-task", :status => :red
    true
    
or as a shell script

    benjamin@Jiji % shout -n important-task -s red

== Configuration

The shoutbox-client will look for a ~/.shoutbox config file with a hostname and portnumber
in YAML format, like this

    host: localhost
    port: 3001
    
Otherwise you can set the configuration manually via ruby

    ShoutboxClient.configuration.config_file = 'some/file'
    # or
    ShoutboxClient.configuration.host = 'shoutbox.moviepilot.com'
    ShoutboxClient.configuration.port = 80

The shell script accepts host and port parameters

    benjamin@Jiji % shout -n important-task -s red -h shoutbox.moviepilot.com -p 80


== Contributing to shoutbox-client
 
* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it
* Fork the project
* Start a feature/bugfix branch
* Commit and push until you are happy with your contribution
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

== Copyright

Copyright (c) 2011 Benjamin Krause. See LICENSE.txt for
further details.

