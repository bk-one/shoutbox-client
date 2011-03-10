require 'shoutbox/shout'
require 'shoutbox/configuration'
require 'net/http'
require 'json'
require 'yaml'

class ShoutboxClient
  VALID_STATUS = { 'red'      => :update,
                   'yellow'   => :update,
                   'green'    => :update,
                   'remove'   => :delete  }
  
  
  def self.configuration
    @configuration ||= Shoutbox::Configuration.new
  end
  
  def self.shout( options )
    if valid_status?( options[:status] )
      VALID_STATUS[options[:status].to_s] == :update ? update_status( options ) : delete_status( options )
    else
      false
    end
  end
  
  def self.update_status( options )
    response = Net::HTTP.Proxy(configuration.proxy_host, configuration.proxy_port).start(configuration.host, configuration.port) do |http|
      req = Net::HTTP::Put.new( request_url(options) )
      default_headers(req)
      body_data = { :statusId => options[:statusId], :group => (options[:group] || configuration.default_group), :status => options[:status].to_s }
      body_data[:message] = options[:message] if options[:status].to_s == 'red' or (options[:status].to_s == 'yellow' and options[:message])
      raise ArgumentError if (options[:status] == :red) and body_data[:message].to_s.empty?
      req.body = body_data.to_json
      http.request(req)
    end
    response.body == "OK"
  end
  
  def self.delete_status( options )
    response = Net::HTTP.Proxy(configuration.proxy_host, configuration.proxy_port).start(configuration.host, configuration.port) do |http|
      req = Net::HTTP::Delete.new( request_url(options) )
      req.body = { :statusId => options[:statusId], :group => (options[:group] || configuration.default_group) }.to_json
      default_headers(req)
      http.request(req)
    end
    response.body == "OK"
  end

  def self.default_headers( request )
    request['User-Agent']   = 'Ruby shoutbox-client'
    request['Content-Type'] = 'application/json'
    request['Accept']       = 'application/json'
  end
  
  def self.request_url( options )
    '/status'
  end
  
  def self.valid_status?( status )
    VALID_STATUS.keys.include?( status.to_s )
  end
end