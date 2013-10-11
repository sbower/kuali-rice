require 'net/http'
require 'net/https'

# openssl is required to support signed_request
require 'openssl'

require 'rubygems'
require 'xmlsimple'

module KualiRice
  
  attr_accessor :server
  attr_accessor :use_ssl
  attr_accessor :port
  attr_accessor :remoting_path
  attr_accessor :headers
  
  def initialize(server = "localhost")
    @server = server
    @use_ssl = false
    @port = "8080"
    @remoting_path = "/kfs/remoting"
    @headers = nil
  end
  
  require 'kuali-rice/KualiRESTInterface'
  require 'kuali-rice/Responses'
  
end





