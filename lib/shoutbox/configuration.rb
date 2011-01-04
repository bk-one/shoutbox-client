module Shoutbox
  class Configuration
    attr_reader :host, :port

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
        @config_file || File.join('~', '.shoutbox')
      end
    
      def default_config
        @host = 'localhost'
        @port = 3000
      end

      def read_config_file
        config_data = YAML::load_file(config_file)
        @host = config_data["host"]
        @port = config_data["port"]
      end

  end
end