require 'helper'

class TestKualiRice < Test::Unit::TestCase
  should "get document" do
    
    @ricews = KualiRice::KualiRESTInterface.new
    @ricews.use_ssl = false
    document = @ricews.getDocument(3003, "user1")
    puts document.docId
  
  end
end
