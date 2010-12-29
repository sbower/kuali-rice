module KualiRice
  
  class Person
    
    attr_accessor :principalId
    attr_accessor :principalName
    attr_accessor :entityId
    attr_accessor :entityTypeCode
    attr_accessor :firstName
    attr_accessor :middleName
    attr_accessor :lastName
    attr_accessor :name
    attr_accessor :addressLine1
    attr_accessor :addressLine2
    attr_accessor :addressLine3
    attr_accessor :addressCityName
    attr_accessor :addressStateCode
    attr_accessor :addressPostalCode
    attr_accessor :addressCountryCode
    attr_accessor :emailAddress
    attr_accessor :phoneNumber
    attr_accessor :suppressName
    attr_accessor :suppressAddress
    attr_accessor :suppressPhone
    attr_accessor :suppressPersonal
    attr_accessor :suppressEmail
    attr_accessor :campusCode
    attr_accessor :employeeStatusCode
    attr_accessor :employeeTypeCode
    attr_accessor :primaryDepartmentCode
    attr_accessor :employeeId
    attr_accessor :baseSalaryAmount
    attr_accessor :active
    
    #figure out what to do with affiliations and external identifiers
    #protected List<? extends KimEntityAffiliation> affiliations
    #protected Map<String,String> externalIdentifiers = null
    
    def initialize(xmldata="")
      setPerson(xmldata)
    end
    
    def setPerson(xmldata)      
      if not xmldata.eql?("") then
        parseddata = XmlSimple.xml_in(xmldata)
        
        @principalId = parseddata['principalId'][0] if !parseddata['principalId'].nil?
        @principalName = parseddata['principalName'][0] if !parseddata['principalName'].nil?
        @entityId = parseddata['entityId'][0] if !parseddata['entityId'].nil?
        @entityTypeCode = parseddata['entityTypeCode'][0] if !parseddata['entityTypeCode'].nil?
        @firstName = parseddata['firstName'][0] if !parseddata['firstName'].nil?
        @middleName = parseddata['middleName'][0] if !parseddata['middleName'].nil?
        @lastName = parseddata['lastName'][0] if !parseddata['lastName'].nil?
        @name = parseddata['name'][0] if !parseddata['name'].nil?
        @addressLine1 = parseddata['addressLine1'][0] if !parseddata['addressLine1'].nil?
        @addressLine2 = parseddata['addressLine2'][0] if !parseddata['addressLine2'].nil?
        @addressLine3 = parseddata['addressLine3'][0] if !parseddata['addressLine3'].nil?
        @addressCityName = parseddata['addressCityName'][0] if !parseddata['addressCityName'].nil?
        @addressStateCode = parseddata['addressStateCode'][0] if !parseddata['addressStateCode'].nil?
        @addressPostalCode = parseddata['addressPostalCode'][0] if !parseddata['addressPostalCode'].nil?
        @addressCountryCode = parseddata['addressCountryCode'][0] if !parseddata['addressCountryCode'].nil?
        @emailAddress = parseddata['emailAddress'][0] if !parseddata['emailAddress'].nil?
        @phoneNumber = parseddata['phoneNumber'][0] if !parseddata['phoneNumber'].nil?
        @suppressName = parseddata['suppressName'][0] if !parseddata['suppressName'].nil?
        @suppressAddress = parseddata['suppressAddress'][0] if !parseddata['suppressAddress'].nil?
        @suppressPhone = parseddata['suppressPersonal'][0] if !parseddata['suppressPersonal'].nil?
        @suppressPersonal = parseddata['suppressPersonal'][0] if !parseddata['suppressPersonal'].nil?
        @suppressEmail = parseddata['suppressEmail'][0] if !parseddata['suppressEmail'].nil?
        @campusCode = parseddata['campusCode'][0] if !parseddata['campusCode'].nil?
        @employeeStatusCode = parseddata['employeeStatusCode'][0] if !parseddata['employeeStatusCode'].nil?
        @employeeTypeCode = parseddata['employeeTypeCode'][0] if !parseddata['employeeTypeCode'].nil?
        @primaryDepartmentCode = parseddata['primaryDepartmentCode'][0] if !parseddata['primaryDepartmentCode'].nil?
        @employeeId= parseddata['employeeId'][0] if !parseddata['employeeId'].nil?
        @baseSalaryAmount = parseddata['baseSalaryAmount'][0]['value'][0] if !parseddata['baseSalaryAmount'].nil?
        @active = parseddata['active'][0] if !parseddata['active'].nil?
                
      end
    end
    
  end
end
