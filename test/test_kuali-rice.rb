require 'helper'

class TestKualiRice < Test::Unit::TestCase
    
  def setup
    @ricews = KualiRice::KualiRESTInterface.new
    @ricews.remoting_path += '/simpleDocAction'
    
    document = @ricews.create("user4", "0", "RiceWSTest", "TestTitle")    
    
    @createdDocId = document.docId
  end
  
  should "create new interface object" do
     assert_equal  @ricews.use_ssl, false
  end
  
  should "ping server" do
     ping = @ricews.ping
     assert_equal "PING: kr-dev", ping
  end
  
  should "create document" do
    document = @ricews.create("user1", "1", "eDoc.Example1Doctype", "TestTitle")    
    assert_equal "TestTitle", document.title
    assert_equal "One, User", document.initiatorName
    assert_equal "1", document.appDocId
  end
    
  should "get document" do
    document = @ricews.getDocument( @createdDocId, "user4")
    assert_equal "TestTitle", document.title
    assert_equal "I", document.docStatus
  end
  
  should "save document" do 
    document = @ricews.save(@createdDocId, "user4", "TestTitle", "SavingDoc")
    assert_equal "S", document.docStatus
    assert_equal "user4, user4", document.initiatorName
  end
  
  should "cancel document" do
    document = @ricews.cancel(@createdDocId, "user4", "CancelDoc")
    assert_equal "X", document.docStatus
    assert_equal "user4, user4", document.initiatorName
  end
  
  should "fyi document" do
    document = @ricews.fyi(@createdDocId, "user3")
    document = @ricews.route(@createdDocId, "user4", "TestTitle", "RouteDoc ")
    
    #assert_equal "X", document.docStatus
    assert_equal "user4, user4", document.initiatorName
  end
  
  should "route document" do 
    document = @ricews.route(@createdDocId, "user4", "TestTitle", "RouteDoc")
    assert_equal "R", document.docStatus
    assert_equal "user4, user4", document.initiatorName
    
    sleep(1)
    document = @ricews.getDocument( @createdDocId, "user2")  
    assert_equal "APPROVE", document.actionRequested
  end
  
  should "approve document, should go final" do
    @ricews.save(@createdDocId, "user4", "TestTitle", "SavingDoc")
    @ricews.route(@createdDocId, "user4", "TestTitle", "SavingDoc")
    @ricews.approve(@createdDocId, "user2", "TestTitle", "ApproveDoc")
    
    sleep(1)
    document = @ricews.getDocument( @createdDocId, "user4")  
    assert_equal "F", document.docStatus
    assert_not_same "APPROVE", document.actionRequested
  end
  
  should "disapprove document, should go final" do
    @ricews.save(@createdDocId, "user4", "TestTitle", "SavingDoc")
    @ricews.route(@createdDocId, "user4", "TestTitle", "SavingDoc")
    @ricews.disapprove(@createdDocId, "user2", "ApproveDoc")
    
    sleep(1)
    document = @ricews.getDocument( @createdDocId, "user4")  
    assert_equal "D", document.docStatus
    assert_not_same "APPROVE", document.actionRequested
  end
    
  should "set ad hoc route to user2" do    
    @ricews.requestAdHocApproveToUser(@createdDocId, "user4", "user2", "AdHocDoc")
    @ricews.save(@createdDocId, "user4", "TestTitle", "SavingDoc")
    
    document = @ricews.getDocument( @createdDocId, "user2")
    assert_not_same "APPROVE", document.actionRequested
    assert_equal "S", document.docStatus
    
    @ricews.approve(@createdDocId, "user1", "TestTitle", "ApproveDoc")
    
    document = @ricews.getDocument( @createdDocId, "user2")
    assert_equal "APPROVE", document.actionRequested
    assert_equal "R", document.docStatus
  end
  
  should "set ad hoc route to WorkflowAdmin" do    
    @ricews.requestAdHocApproveToGroup(@createdDocId, "user4", "1", "AdHocDoc")
    @ricews.save(@createdDocId, "user4", "TestTitle", "SavingDoc")
    
    document = @ricews.getDocument( @createdDocId, "admin")
    assert_not_same "APPROVE", document.actionRequested
    assert_equal "S", document.docStatus
    
    @ricews.approve(@createdDocId, "user1", "TestTitle", "ApproveDoc")
    
    document = @ricews.getDocument( @createdDocId, "admin")
    assert_equal "APPROVE", document.actionRequested
    assert_equal "R", document.docStatus
  end
  
  should "send adhoc fyi to user3" do    
    @ricews.requestAdHocFyiToUser(@createdDocId, "user4", "user3", "FYI")
    @ricews.route(@createdDocId, "user4", "TestTitle", "SavingDoc")
    
    sleep(1)
    document = @ricews.getDocument( @createdDocId, "user3")
    assert_equal "FYI", document.actionRequested
    assert_equal "R", document.docStatus
        
    document = @ricews.fyi( @createdDocId, "user3")
    document = @ricews.getDocument( @createdDocId, "user3")
    
    assert_not_same "FYI", document.actionRequested
    assert_equal "R", document.docStatus
  end
  
  should "send adhoc fyi to WorkflowAdmin" do    
    @ricews.requestAdHocFyiToGroup(@createdDocId, "user4", "1", "FYI")
    @ricews.route(@createdDocId, "user4", "TestTitle", "SavingDoc")
    
    sleep(1)
    document = @ricews.getDocument( @createdDocId, "admin")
    assert_equal "FYI", document.actionRequested
    assert_equal "R", document.docStatus
        
    document = @ricews.fyi( @createdDocId, "admin")
    document = @ricews.getDocument( @createdDocId, "admin")
    
    assert_not_same "FYI", document.actionRequested
    assert_equal "R", document.docStatus
  end
  
  should "send adhoc acknowledge to user3" do    
    @ricews.requestAdHocAckToUser(@createdDocId, "user4", "user3", "ACK")
    @ricews.route(@createdDocId, "user4", "TestTitle", "RouteDoc")
    
    sleep(1)
    document = @ricews.getDocument( @createdDocId, "user3")
    assert_equal "ACKNOWLEDGE", document.actionRequested
    assert_equal "R", document.docStatus
        
    @ricews.acknowledge(@createdDocId, "user3", "ACK")
    document = @ricews.getDocument( @createdDocId, "user3")
    
    assert_not_same "ACKNOWLEDGE", document.actionRequested
    assert_equal "R", document.docStatus
  end
  
  should "send adhoc acknowledge to group WorkflowAdmin" do    
    @ricews.requestAdHocAckToGroup(@createdDocId, "user4", "1", "ACK")
    @ricews.route(@createdDocId, "user4", "TestTitle", "RouteDoc")
    
    sleep(1)
    document = @ricews.getDocument( @createdDocId, "admin")
    assert_equal "ACKNOWLEDGE", document.actionRequested
    assert_equal "R", document.docStatus
        
    @ricews.acknowledge(@createdDocId, "admin", "ACK")
    document = @ricews.getDocument( @createdDocId, "admin")
    
    assert_not_same "ACKNOWLEDGE", document.actionRequested
    assert_equal "R", document.docStatus
  end
  
  should "blanket approve document, should go PROCESSED awaiting ack from user1, user2" do
    @ricews.requestAdHocApproveToUser(@createdDocId, "user1", "user2", "AdHocDoc")
    @ricews.requestAdHocApproveToUser(@createdDocId, "user1", "admin", "AdHocDoc")
    @ricews.save(@createdDocId, "user1", "TestTitle", "SavingDoc")
    
    document = @ricews.blanketApprove(@createdDocId, "user1", "TestTitle", "ApproveDoc")
    assert_equal "Workflow Error: User is not authorized to BlanketApprove document", document.errorMessage
    
    @ricews.blanketApprove(@createdDocId, "admin", "TestTitle", "ApproveDoc")
    
    document = @ricews.getDocument( @createdDocId, "admin")  
    assert_match /[R|P]/, document.docStatus
    assert_not_same "APPROVE", document.actionRequested
  end
  
  should "chack to see if user is in route log" do 
    document = @ricews.route(@createdDocId, "user4", "TestTitle", "RouteDoc")
    assert_equal "R", document.docStatus
    assert_equal "user4, user4", document.initiatorName
    
    assert(@ricews.isUserInRouteLog(@createdDocId, "user2"))
    assert_equal false, @ricews.isUserInRouteLog(@createdDocId, "user3")
  end
  
  should "get user's inbox" do
    action_list = @ricews.getUserInbox("admin")
    
    action_list.each do |actionItem|
      assert_equal "admin", actionItem.principalId
    end
      
  end
  
  should "action list by route header" do
    @ricews.requestAdHocAckToUser(@createdDocId, "user4", "user3", "ACK")
    @ricews.route(@createdDocId, "user4", "TestTitle", "RouteDoc")
    
    sleep(1)
    action_list = @ricews.findByRouteHeaderId(@createdDocId)
    num = 0
    
    action_list.each do |actionItem|
      num += 1
      
      if actionItem.principalId.eql?("user3") then
        assert_equal "K", actionItem.actionRequestCd
      end
    end
    
    assert_equal 4, num
      
  end
  
  should "get user's inbox action Item count" do
    action_list = @ricews.getUserInbox("admin")
    num = 0
    
    action_list.each do |actionItem|
      num += 1
    end
    
     count = @ricews.countUserInboxItems("admin")
     assert_equal num, count.to_i   
     
  end
  
  should "Create a long annotation with spaces" do
    document = @ricews.save(@createdDocId, "user4", "TestTitle", "This is a long annotation with many awesome spaces")
    assert_equal "S", document.docStatus
    assert_equal "user4, user4", document.initiatorName
  end
    
end
