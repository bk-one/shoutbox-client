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
usage: shout <status> <statusId> [options]

<status> must be one of red, green, remove
<statusId> is any given id you can think of
       
shout allows the folling options:
        EOS
        
        opt :host,    "The hostname of the Shoutbox",       :type => String
        opt :port,    "The port of the Shoutbox",           :type => Integer
        opt :group,   "The group to use",                   :type => String, :default => "default"
        opt :name,    "The display name for the statusId",  :type => String
      end
      
      Trollop::die "provide <status> and <statusId>" if ARGV.size != 2
      @conf[:status]   = ARGV.shift
      Trollop::die "<status> must be one of 'green', 'red', 'destroy'" unless ShoutboxClient.valid_status?( @conf[:status] )
      
      @conf[:statusId] = ARGV.shift

      ShoutboxClient.configuration.host = @conf[:host]  if     @conf[:host]
      ShoutboxClient.configuration.port = @conf[:port]  if     @conf[:port]
    end
    
    def do_it
      ShoutboxClient.shout :name => @conf[:name], :statusId => @conf[:statusId], :status => @conf[:status], :group => @conf[:group]
    end
  end
end