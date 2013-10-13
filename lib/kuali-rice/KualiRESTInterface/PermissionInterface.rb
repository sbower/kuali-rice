module KualiRice
  
  class KualiRESTInterface
    include KualiRice
    
    def getPrincipalsByPremissionName(perm_nm, nmspc_cd)
      Assignees.new(rest_call("/RestPermissionService/prinicpalsbypermission/#{perm_nm}/namespace/#{nmspc_cd}")).assignees
    end 
  end

end