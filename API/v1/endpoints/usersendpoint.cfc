<cfcomponent extends="Assessment.API.v1.endpoints.masterendpoint" output="false" depends="usersService">
	
	<!--- MachII.endpoints.rest.BaseEndpoint --->

	<cffunction name="configure" access="public" returntype="void" output="false">
		<cfscript>
			super.configure();
			sf = getProperty('serviceFactory');

			// services
			variables.usersService = sf.getBean('usersService');
			//variables.stringHelper          = sf.getBean('stringHelper');

			// constants
			//variables.validActions = "save,delete";        
			//variables.objectType   = "Basic";        
		</cfscript>
	</cffunction>

	<!---
	RL 033012 NOTE: this method will get any user by PID without regards to permissions so 
	don't use it in production
	--->
    <cffunction name="getUsers" access="public" returntype="Any" output="false"    
    		    rest:uri="/users" rest:method="GET"
				hint="I retrieve a single formatted user record">    

		<cfargument name="event" type="MachII.framework.Event" required="true">   
		
		<cfscript>		
			local.a = usersService.getByAttributesQuery();
    		return serializeJSON(local.a);
    	</cfscript>    
    </cffunction>	

</cfcomponent>