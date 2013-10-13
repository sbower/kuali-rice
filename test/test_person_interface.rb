require 'helper'

class TestPersonInterface < Test::Unit::TestCase
    
  def setup
    @ricews = KualiRice::KualiRESTInterface.new
  end
  
  should "retrieve a person object by principal name" do
    person = @ricews.getPersonByPrincipalName("admin")
    assert_equal 3, person.entityId.to_i
  end
  
  should "retrieve a person object by principal id" do
    person = @ricews.getPersonByPrincipalID("3")
    assert_equal 3, person.entityId.to_i
    assert_equal "admin", person.firstName
  end
   
end
