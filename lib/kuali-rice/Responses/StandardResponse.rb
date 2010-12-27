module KualiRice
  
  class StandardResponse < ErrorResponse
    
    attr_accessor :docStatus
    attr_accessor :createDate
    attr_accessor :initiatorPrincipalId
    attr_accessor :routedByPrincipalId
    attr_accessor :routedByUserName
    attr_accessor :appDocId
    attr_accessor :initiatorName
    
    def initialize(xmldata="")
      setStandardResponse(xmldata)
    end
    
    def setStandardResponse(xmldata)
      if not xmldata.eql?("") then
        parseddata = XmlSimple.xml_in(xmldata)
                
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