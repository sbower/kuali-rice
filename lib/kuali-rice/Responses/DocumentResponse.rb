module KualiRice
  
  class DocumentResponse < StandardResponse
    
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
                    
        @docId = parseddata['docId'][0] if !parseddata['docId'].nil?
        @docContent = parseddata['docContent'][0] if !parseddata['docContent'].nil?
        @title = parseddata['title'][0] if !parseddata['title'].nil?
        @actionRequested = parseddata['actionRequested'][0] if !parseddata['actionRequested'].nil?
        @docStatus = parseddata['docStatus'][0] if !parseddata['docStatus'].nil?
        @createDate = parseddata['createDate'][0] if !parseddata['createDate'].nil?
        @initiatorPrincipalId = parseddata['initiatorPrincipalId'][0] if !parseddata['initiatorPrincipalId'].nil?
        @routedByPrincipalId = parseddata['routedByPrincipalId'][0] if !parseddata['routedByPrincipalId'].nil?
        @routedByUserName = parseddata['routedByUserName'][0] if !parseddata['routedByUserName'].nil?
        @appDocId = parseddata['appDocId'][0] if !parseddata['appDocId'].nil?
        @initiatorName = parseddata['initiatorName'][0] if !parseddata['initiatorName'].nil?
        @errorMessage = parseddata['errorMessage'][0] if !parseddata['errorMessage'].nil?        
      end
    end
    
  end
  
end
