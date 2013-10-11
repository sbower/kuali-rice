module KualiRice
  
  class KualiRESTInterface
    include KualiRice
    
    def getPersonByPrincipalName(prncpl_nm)
      Person.new(rest_call("/Person/byprincipalname/#{prncpl_nm}"))
    end

    def getPersonByEmployeeId(emplid)
      Person.new(rest_call("/Person/byemployeeid/#{emplid}"))
    end
    
    def getPersonByPrincipalID(prncpl_id)
      Person.new(rest_call("/Person/byprincipalid/#{prncpl_id}"))
    end

    def getPersonByExternalIdentifier(type, id)
      Person.new(rest_call("/Person/byexternalid/type/#{type}/id/#{id}"))
    end
      
  end

end