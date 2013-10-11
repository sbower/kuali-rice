module KualiRice
  
  class KualiRESTInterface
    include KualiRice
    
    def rest_call (path, verb = "get", post_data = "")
                  
      http = Net::HTTP.new(@server, @use_ssl ? 443 : @port)
      http.use_ssl = true if @use_ssl
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE
      
      path = @remoting_path + path
      path = URI.escape(path)

puts "#{path}, #{verb}"   
         
      http.start do |http|
        response = (verb.eql?(:post) ? http.post(path, encode_params(post_data),  @headers) : http.request_get(path, @headers))
       
        response.body
      end
    end
    
    protected
    
    def encode_params(param_hash)
      param_hash
    end  
            
  end
  
end