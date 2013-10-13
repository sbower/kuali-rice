require 'helper'

class TestPermissionInterface < Test::Unit::TestCase
    
  def setup
    @ricews = KualiRice::KualiRESTInterface.new
  end
  
  should "retrieve an array of assigness" do
    assignees = @ricews.getPrincipalsByPremissionName("Initiate Document 117", "KFS-SYS")
    assert assignees.length > 0, "Array should have elements"
    assert_equal "299547", assignees[0].principalId
  end
end
