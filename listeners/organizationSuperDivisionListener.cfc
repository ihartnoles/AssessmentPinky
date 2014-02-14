<!---
	COMPONENT: organizationSuperDivisionListener
--->

<cfcomponent name="organizationSuperDivisionListener" displayname="organizationSuperDivisionListener" output="false" 
		extends="MachII.framework.Listener" 
		hint="organizationSuperDivisionListener">
	
	<cffunction name="configure" access="public" output="false" 
			returntype="void" 
			hint="Configures this listener as part of the Mach-II framework">
		<!--- do nothing for now --->
		<cfset var sf = getProperty("ServiceFactory")>
		

		 <cfset variables.organizationSuperDivisionService 	= sf.getBean('organizationSuperDivisionService') /> 
	</cffunction>

	<cffunction name="getSuperDivisions" access="public" output="false" 
			returntype="query" >
		<cfargument name="event" type="MachII.framework.Event" required="true" />
		
		<cfreturn variables.organizationSuperDivisionService.getSuperDivisions() />
	</cffunction>



</cfcomponent>