<!---
	COMPONENT: organizationDivisionListener
--->

<cfcomponent name="organizationDivisionListener" displayname="organizationDivisionListener" output="false" 
		extends="MachII.framework.Listener" 
		hint="organizationDivisionListener">
	
	<cffunction name="configure" access="public" output="false" 
			returntype="void" 
			hint="Configures this listener as part of the Mach-II framework">
		<!--- do nothing for now --->
		<cfset var sf = getProperty("ServiceFactory")>
		

		 <cfset variables.organizationDivisionService 	= sf.getBean('organizationDivisionService') /> 
	</cffunction>



	<cffunction name="getDivisions" access="public" output="false" 
			returntype="query" >
		<cfargument name="event" type="MachII.framework.Event" required="true" />
		
		<cfreturn variables.organizationDivisionService.getDivisions(superdivisionid = request.event.getArg('superdivisionid')) />
	</cffunction>


</cfcomponent>