require 'net/http'
require 'net/https'

# openssl is required to support signed_request
require 'openssl'

require 'rubygems'
require 'xmlsimple'

def require_local(suffix)
  require(File.expand_path(File.join(File.dirname(__FILE__), suffix)))
end

module KualiRice
  
  REMOTING_PATH = "/kr-dev/remoting" 
  
  attr_accessor :server
  attr_accessor :use_ssl
  attr_accessor :port
  
  def initialize(server = "localhost")
    @server = server
    @use_ssl = false
    @port = "8080"
  end
  
end

require_local("/kuali-rice/KualiRESTInterface")
require_local("/kuali-rice/Responses")



