<!---
	COMPONENT: organizationDeptListener
--->

<cfcomponent name="organizationDeptListener" displayname="organizationDeptListener" output="false" 
		extends="MachII.framework.Listener" 
		hint="organizationDeptListener">
	
	<cffunction name="configure" access="public" output="false" 
			returntype="void" 
			hint="Configures this listener as part of the Mach-II framework">
		<!--- do nothing for now --->
		<cfset var sf = getProperty("ServiceFactory")>
		

		 <cfset variables.organizationDeptService 	= sf.getBean('organizationDeptService') /> 
	</cffunction>



	<cffunction name="getDepartments" access="public" output="false" 
			returntype="query" >
		<cfargument name="event" type="MachII.framework.Event" required="true" />
		
		<cfreturn variables.organizationDeptService.getDepartments(divisionid = request.event.getArg('divisionid')) />
	</cffunction>


</cfcomponent>