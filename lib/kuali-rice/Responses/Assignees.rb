module KualiRice
  
  class Assignees
    
    attr_accessor :assignees

    def initialize(xmldata="")
      @assignees = Array.new
      add_assigness(xmldata)
    end
    
    def add_assigness(xmldata)      
      if not xmldata.eql?("") then
        parseddata = XmlSimple.xml_in(xmldata)
        parseddata['assignee'].each do |assignee| 
          if !assignee['principalId'].nil?
            @assignees.push(Assignee.new(assignee['principalId'][0]))
          end
        end
                
      end
    end
    
    class Assignee
      attr_accessor :principalId
      
      def initialize(principalId)
        @principalId = principalId
      end
    end
  end
end
