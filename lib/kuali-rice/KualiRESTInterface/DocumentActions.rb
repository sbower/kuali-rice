module KualiRice
  
  class KualiRESTInterface
    include KualiRice
    
    def ping
      rest_call("/simpleDocAction/ping")
    end
    
    def getDocument(docid, userid)
      DocumentResponse.new(rest_call("/simpleDocAction/doc/getdocument/userID/#{userid}/docid/#{docid}"))
    end
    
    def create(initiatorId, appDocId, docType, docTitle)
      DocumentResponse.new(rest_call("/simpleDocAction/doc/create/initiatorID/#{initiatorId}/appid/#{appDocId}/type/#{docType}/title/#{docTitle}", :post))
    end

    def save(docid, userID, docTitle, annotation)
      StandardResponse.new(rest_call("/simpleDocAction/doc/save/userID/#{userID}/docid/#{docid}/title/#{docTitle}/annotation/#{annotation}", :post))
    end

    def acknowledge(docid, userID, annotation)
      StandardResponse.new(rest_call("/simpleDocAction/doc/acknowledge/userID/#{userID}/docid/#{docid}/annotation/#{annotation}", :post))
    end

    def approve(docid, userID, docTitle, annotation)
      StandardResponse.new(rest_call("/simpleDocAction/doc/approve/userID/#{userID}/docid/#{docid}/title/#{docTitle}/annotation/#{annotation}", :post))
    end

    def blanketApprove(docid, userID, docTitle, annotation)
      StandardResponse.new(rest_call("/simpleDocAction/doc/blanketApprove/userID/#{userID}/docid/#{docid}/title/#{docTitle}/annotation/#{annotation}", :post))
    end

    def cancel(docid, userID, annotation)
      StandardResponse.new(rest_call("/simpleDocAction/doc/cancel/userID/#{userID}/docid/#{docid}/annotation/#{annotation}", :post))
    end

    def disapprove(docid, userID, annotation)
      StandardResponse.new(rest_call("/simpleDocAction/doc/disapprove/userID/#{userID}/docid/#{docid}/annotation/#{annotation}", :post))
    end

    def fyi(docid, userID)
      StandardResponse.new(rest_call("/simpleDocAction/doc/fyi/userID/#{userID}/docid/#{docid}", :post))
    end

    def route(docid, userID, docTitle, annotation)
      StandardResponse.new(rest_call("/simpleDocAction/doc/route/userID/#{userID}/docid/#{docid}/title/#{docTitle}/annotation/#{annotation}", :post))
    end
    
    def requestAdHocAckToGroup(docid, userID, recipientGroupId, annotation)
      StandardResponse.new(rest_call("/simpleDocAction/doc/requestAdHocAckToGroup/userID/#{userID}/docid/#{docid}/recipientgroupid/#{recipientGroupId}/annotation/#{annotation}", :post))
    end

    def requestAdHocAckToUser(docid, userID, recipientId,  annotation)
      StandardResponse.new(rest_call("/simpleDocAction/doc/requestAdHocAckToUser/userID/#{userID}/docid/#{docid}/recipientid/#{recipientId}/annotation/#{annotation}", :post))
    end
    
    def requestAdHocApproveToGroup(docid, userID, recipientGroupId, annotation)
      StandardResponse.new(rest_call("/simpleDocAction/doc/requestAdHocApproveToGroup/userID/#{userID}/docid/#{docid}/recipientgroupid/#{recipientGroupId}/annotation/#{annotation}", :post))
    end

    def requestAdHocApproveToUser(docid, userID, recipientId,  annotation)
      StandardResponse.new(rest_call("/simpleDocAction/doc/requestAdHocApproveToUser/userID/#{userID}/docid/#{docid}/recipientid/#{recipientId}/annotation/#{annotation}", :post))
    end

    def requestAdHocFyiToGroup(docid, userID, recipientGroupId, annotation)
      StandardResponse.new(rest_call("/simpleDocAction/doc/requestAdHocFyiToGroup/userID/#{userID}/docid/#{docid}/recipientgroupid/#{recipientGroupId}/annotation/#{annotation}", :post))
    end
       
    def requestAdHocFyiToUser(docid, userID, recipientId,  annotation)
      StandardResponse.new(rest_call("/simpleDocAction/doc/requestAdHocFyiToUser/userID/#{userID}/docid/#{docid}/recipientid/#{recipientId}/annotation/#{annotation}", :post))  
    end

    def isUserInRouteLog(docid, userID)
      xmldata = rest_call("/simpleDocAction/doc/isUserInRouteLog/userID/#{userID}/docid/#{docid}")  
      parseddata = XmlSimple.xml_in(xmldata) 
      
      if(parseddata['isUserInRouteLog'][0].eql?("true")) then 
        return true
      end
      
      return false
    end

    def getUserInbox(userID)
       createActionList(rest_call("/simpleDocAction/actionitems/getinbox/#{userID}"))          
    end

    def countUserInboxItems(userID)
      rest_call("/simpleDocAction/actionitems/countinbox/#{userID}")  
    end

    def findByRouteHeaderId(routeHeaderIdStr)
      createActionList(rest_call("/simpleDocAction/actionitems/findbyrouteheader/#{routeHeaderIdStr}"))  
    end

    def sendNotification(message)
      rest_call("/simpleDocAction/notification/send/", :post, message)  
    end
    
    private 
    
    def createActionList(xmldata)
      parseddata = XmlSimple.xml_in(xmldata)
      actionItems = Array.new
      
      if !parseddata['ActionItem'].nil? then
        parseddata['ActionItem'].each do |item|
          newactionitem = ActionItem.new(XmlSimple.xml_out(item))
          actionItems.push(newactionitem)
        end
      end
      
      actionItems  
    end 
    
    
     
  end
end