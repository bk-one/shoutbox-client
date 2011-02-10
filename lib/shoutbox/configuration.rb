module Shoutbox
  class Configuration
    attr_accessor :host, :port, :proxy_host, :proxy_port

    def initialize
      config_file_exists? ? read_config_file : default_config
    end
    
    def config_file=( filename )
      @config_file = filename
      config_file_exists? ? read_config_file : default_config
    end
    
    private
    
      def config_file_exists?
        File.exists?(config_file)
      end
    
      def config_file
        @config_file || File.join(ENV['HOME'], '.shoutbox')
      end
    
      def default_config
        @host       = 'localhost'
        @port       = 3000
        @proxy_host = nil
        @proxy_port = nil
      end

      def read_config_file
        config_data = YAML::load_file(config_file)
        @host       = config_data["host"]
        @port       = config_data["port"]
        @proxy_host = config_data["proxy_host"]
        @proxy_port = config_data["proxy_port"]
      end
  end
end