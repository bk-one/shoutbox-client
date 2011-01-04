require 'trollop'

module Shoutbox
  class Shout
    
    def initialize
      parse_options
      do_it
    end
    
    def parse_options
      @conf = Trollop::options do
        # banner = MPPerf.options_banner
        opt :host,    "The hostname of the Shoutbox", :type => String
        opt :port,    "The port of the Shoutbox",     :type => Integer
        opt :name,    "", :type => String
        opt :status,  "", :type => String
      end

      Trollop::die :name,   "name must be given"        unless @conf[:name]
      Trollop::die :status, "status must be given"      unless @conf[:status]
      ShoutboxClient.configuration.host = @conf[:host]  if     @conf[:host]
      ShoutboxClient.configuration.port = @conf[:port]  if     @conf[:port]
    end
    
    def do_it
      ShoutboxClient.shout :name => @conf[:name], :status => @conf[:status]
    end
  end
end