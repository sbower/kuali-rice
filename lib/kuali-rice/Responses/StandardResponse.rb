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