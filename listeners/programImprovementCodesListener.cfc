<!---
	COMPONENT: programImprovementCodesListener
--->

<cfcomponent name="programImprovementCodesListener" displayname="programImprovementCodesListener" output="false" 
		extends="MachII.framework.Listener" 
		hint="programImprovementCodesListener">
	
	<cffunction name="configure" access="public" output="false" 
			returntype="void" 
			hint="Configures this listener as part of the Mach-II framework">
		<!--- do nothing for now --->
		<cfset var sf = getProperty("ServiceFactory")>
		

		 <cfset variables.programImprovementCodesService 	= sf.getBean('programImprovementCodesService') /> 
	</cffunction>

	

	
	<cffunction name="getCodesList" access="public" output="false" 
			returntype="query" >
		<cfargument name="event" type="MachII.framework.Event" required="true" />


		<!---
		<cfdump var="#request.event.getArgs()#" abort="true" label="@@UserRoleAccessListener_1" />
		--->
		
		<cfreturn variables.programImprovementCodesService.getByAttributesQuery() >
	</cffunction>
</cfcomponent>