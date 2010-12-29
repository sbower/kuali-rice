module KualiRice
  
  class KualiRESTInterface
    include KualiRice
    
    def rest_call (path, verb = "get", post_data = "")
                  
      http = Net::HTTP.new(@server, @use_ssl ? 443 : @port)
      http.use_ssl = true if @use_ssl
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE
      
      path = REMOTING_PATH + path
      path = URI.escape(path)
      
      result = http.start { |http|
       response, body = (verb.eql?(:post) ? http.post(path, encode_params(post_data)) : http.get(path))
       body
      }
    end
    
    protected
    def encode_params(param_hash)
      param_hash
    end  
            
  end
  
end