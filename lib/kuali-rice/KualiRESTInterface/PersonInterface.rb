module KualiRice
  
  class KualiRESTInterface
    include KualiRice
    
    def getPersonByPrincipalName(prncpl_nm)
      Person.new(rest_call("/personServiceREST/Person/byprincipalname/#{prncpl_nm}"))
    end

    def getPersonByEmployeeId(emplid)
      Person.new(rest_call("/personServiceREST/Person/byemployeeid/#{emplid}"))
    end
    
    def getPersonByPrincipalID(prncpl_id)
      Person.new(rest_call("/personServiceREST/Person/byprincipalid/#{prncpl_id}"))
    end

    def getPersonByExternalIdentifier(type, id)
      Person.new(rest_call("/personServiceREST/Person/byexternalid/type/#{type}/id/#{id}"))
    end
    
  end

end