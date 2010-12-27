module KualiRice
  
  class DocumentResponse < StandardResponse
    
    require 'PP'
    
    attr_accessor :docId
    attr_accessor :docContent
    attr_accessor :title
    attr_accessor :notes
    attr_accessor :actionRequested
    
    def initialize(xmldata="")
      setDocumentResponse(xmldata)
    end
    
    def setDocumentResponse(xmldata)
      if not xmldata.eql?("") then
        parseddata = XmlSimple.xml_in(xmldata)
                
        @docId = parseddata['docId']
        @docContent = parseddata['docContent']
        @title = parseddata['title']
        @actionRequested = parseddata['actionRequested']
        @docStatus = parseddata['docStatus']
        @createDate = parseddata['createDate']
        @initiatorPrincipalId = parseddata['initiatorPrincipalId']
        @routedByPrincipalId = parseddata['routedByPrincipalId']
        @routedByUserName = parseddata['routedByUserName']
        @appDocId = parseddata['appDocId']
        @initiatorName = parseddata['initiatorName']
        @errorMessage = parseddata['errorMessage']          
      end
    end
    
  end
  
end
