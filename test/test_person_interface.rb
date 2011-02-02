require 'helper'

class TestPersonInterface < Test::Unit::TestCase
    
  def setup
    @ricews = KualiRice::KualiRESTInterface.new
    @ricews.remoting_path += '/personServiceREST'
  end
  
  should "retrieve a person object by principal name" do
    person = @ricews.getPersonByPrincipalName("admin")
    assert_equal 1100, person.entityId.to_i
  end
  
  should "retrieve a person object by principal id" do
    person = @ricews.getPersonByPrincipalID("admin")
    assert_equal 1100, person.entityId.to_i
    assert_equal "test@email.edu", person.emailAddress
  end
  
  should "retrieve a person object by emplid" do
    person = @ricews.getPersonByEmployeeId("admin")
  end
  
  should "retrieve a person object by external id" do
    person = @ricews.getPersonByExternalIdentifier("admin", 1100)
  end
   
end
