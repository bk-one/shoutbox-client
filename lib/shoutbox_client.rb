require 'shoutbox/shout'
require 'shoutbox/configuration'
require 'net/http'
require 'JSON'
require 'yaml'

class ShoutboxClient
  
  def self.configuration
    @configuration ||= Shoutbox::Configuration.new
  end
  
  def self.shout( options )
    response = Net::HTTP.start(configuration.host, configuration.port) do |http|
      req = Net::HTTP::Put.new('/status')
      req['User-Agent']   = 'Ruby shoutbox-client'
      req['Content-Type'] = 'application/json'
      req['Accept']       = 'application/json'
      req.body = { "group" => options[:group], "name" => options[:name], :status => options[:status].to_s }.to_json
      http.request(req)
    end
    response.body == "OK"
  end
end