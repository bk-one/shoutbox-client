require 'trollop'

module Shoutbox
  class Shout
    
    def initialize
      parse_options
      do_it
    end


    def parse_options
      @conf = Trollop::options do
        banner <<-EOS
usage: shout <subcommand> <name> [message]

<subcommand> must be one of green, yellow, red, remove
<name> is any given string you can think of
[message] is optional for green and required for red and yellow

examples

shout green db-export
shout yellow db-export "export took too long"
shout red db-export "failed saving file"
shout remove db-export

shout allows the folling options:
EOS
        opt :host,        "The hostname of the Shoutbox",       :type => String
        opt :proxy_host,  "The proxy host to use",              :type => String
        opt :proxy_port,  "The proxy port to use",              :type => Integer
        opt :group,       "The group to use",                   :type => String
        opt :display,     "The display name",                   :type => String
        opt :auth_token,  "The auth-token to use",              :type => String
        opt :expires_in,  "Number of seconds this status should expire in", :type => Integer
      end

      @conf[:status] = ARGV.shift
      @conf[:name]   = ARGV.shift
      @conf[:message] = ARGV.shift
      
      case @conf[:status]
        when "red"
          Trollop::die "provide <name> and <message> when shouting red" if @conf[:message].to_s.empty?
        when "green"
          # noop
        when "yellow"
          Trollop::die "provide <name> and <message> when shouting yellow" if @conf[:message].to_s.empty?
        when "remove"
          # noop
        else
          Trollop::die "unknown <subcommand> #{ @conf[:status] }"
      end
      
      Trollop::die "provide <status> and <name>" unless @conf[:status] and @conf[:name]
      
      ShoutboxClient.configuration.host       = @conf[:host]       if @conf[:host]
      ShoutboxClient.configuration.port       = @conf[:port]       if @conf[:port]
      ShoutboxClient.configuration.auth_token = @conf[:auth_token] if @conf[:auth_token]
    end
    
    def do_it
      ShoutboxClient.shout :name => @conf[:name], :status => @conf[:status], :group => @conf[:group], :message => @conf[:message], :expires_in => @conf[:expires_in], :display_name => @conf[:display]
    end
  end
end
