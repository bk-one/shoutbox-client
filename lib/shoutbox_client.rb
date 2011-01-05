require 'shoutbox/shout'
require 'shoutbox/configuration'
require 'net/http'
require 'JSON'
require 'yaml'

class ShoutboxClient
  VALID_STATUS = { 'red'      => :update,
                   'green'    => :update,
                   'destroy'  => :delete  }
  
  
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
    response = Net::HTTP.start(configuration.host, configuration.port) do |http|
      req = Net::HTTP::Put.new( request_url(options) )
      default_headers(req)
      req['Content-Type'] = 'application/json'
      req.body = { :status => options[:status].to_s }.to_json
      http.request(req)
    end
    response.body == "OK"
  end
  
  def self.delete_status( options )
    response = Net::HTTP.start(configuration.host, configuration.port) do |http|
      req = Net::HTTP::Delete.new( request_url(options) )
      default_headers(req)
      http.request(req)
    end
    response.body == "OK"
  end

  def self.default_headers( request )
    request['User-Agent']   = 'Ruby shoutbox-client'
    request['Accept']       = 'application/json'
  end
  
  def self.request_url( options )
    '/status/' + (options[:group] || 'default') + "/" + options[:statusId]
  end
  
  def self.valid_status?( status )
    VALID_STATUS.keys.include?( status.to_s )
  end
end