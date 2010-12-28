module KualiRice
  
  class ActionItem
    attr_accessor :delegatorName
    attr_accessor :isInitialized
    attr_accessor :actionItemId
    attr_accessor :principalId
    attr_accessor :dateAssigned 
    attr_accessor :actionRequestCd
    attr_accessor :actionRequestId 
    attr_accessor :routeHeaderId
    attr_accessor :docTitle
    attr_accessor :docLabel
    attr_accessor :docHandlerURL
    attr_accessor :lockVerNbr
    attr_accessor :docName 
    attr_accessor :responsibilityId
    attr_accessor :customActions  
    
    def initialize(xmldata="")
      setActionItem(xmldata)
    end
    
    def setActionItem(xmldata)
      if not xmldata.eql?("") then
        parseddata = XmlSimple.xml_in(xmldata)
                
        @delegatorName = parseddata['delegatorName'][0] if !parseddata['delegatorName'].nil?
        @isInitialized = parseddata['isInitialized'][0] if !parseddata['isInitialized'].nil?
        @actionItemId = parseddata['actionItemId'][0] if !parseddata['actionItemId'].nil?
        @principalId = parseddata['principalId'][0] if !parseddata['principalId'].nil?
        @dateAssigned  = parseddata['dateAssigned'][0] if !parseddata['dateAssigned'].nil?
        @actionRequestCd = parseddata['actionRequestCd'][0] if !parseddata['actionRequestCd'].nil?
        @actionRequestId = parseddata['actionRequestId'][0] if !parseddata['actionRequestId'].nil?
        @routeHeaderId = parseddata['routeHeaderId'][0] if !parseddata['routeHeaderId'].nil?
        @docTitle = parseddata['docTitle'][0] if !parseddata['docTitle'].nil?
        @docLabel = parseddata['docLabel'][0] if !parseddata['docLabel'].nil?
        @docHandlerURL = parseddata['docHandlerURL'][0] if !parseddata['docHandlerURL'].nil?
        @lockVerNbr = parseddata['lockVerNbr'][0] if !parseddata['lockVerNbr'].nil?
        @docName = parseddata['docName'][0] if !parseddata['docName'].nil? 
        @responsibilityId = parseddata['responsibilityId'][0] if !parseddata['responsibilityId'].nil?
        @customActions = parseddata['customActions'][0] if !parseddata['customActions'].nil?
        
      end
    end
  end

end