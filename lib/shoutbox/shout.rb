require 'trollop'

module Shoutbox
  class Shout
    
    def initialize
      parse_options
      do_it
    end


    def parse_options

      sub_commands = %w(red green destroy)
      
      
      @conf = Trollop::options do
        banner <<-EOS
usage: shout <subcommand> <statusId>

<subcommand> must be one of red, green, remove
<statusId> is any given string you can think of

If you want to delete a status, you must provide
a message.

shout allows the folling options:
EOS
        opt :host,    "The hostname of the Shoutbox",       :type => String
        opt :port,    "The port of the Shoutbox",           :type => Integer
        opt :group,   "The group to use",                   :type => String, :default => "default"

        stop_on sub_commands
      end

      @conf[:status]   = ARGV.shift
      @conf[:statusId] = ARGV.shift
      
      cmd_opts = case @conf[:status]
        when "red"
          @conf[:message] = ARGV.shift
          Trollop::die "provide <statusId> and <message> when shouting red" if @conf[:message].to_s.empty?
        when "green"
          # noop
        when "remove"
          # noop
        else
          Trollop::die "unknown <subcommand> #{ @conf[:status] }"
      end
      
      Trollop::die "provide <status> and <statusId>" unless @conf[:status] and @conf[:statusId]
      
      ShoutboxClient.configuration.host = @conf[:host]  if     @conf[:host]
      ShoutboxClient.configuration.port = @conf[:port]  if     @conf[:port]
    end
    
    def do_it
      ShoutboxClient.shout :name => @conf[:name], :statusId => @conf[:statusId], :status => @conf[:status], :group => @conf[:group]
    end
  end
end