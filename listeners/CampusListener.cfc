<!---
	COMPONENT: CampusListener
--->

<cfcomponent name="CampusListener" displayname="CampusListener" output="false" 
		extends="MachII.framework.Listener" 
		hint="CampusListener">
	
	<cffunction name="configure" access="public" output="false" 
			returntype="void" 
			hint="Configures this listener as part of the Mach-II framework">
		
		 <cfset var sf = getProperty("ServiceFactory")>
	
		 <cfset variables.campusService = sf.getBean('campusService') /> 

	</cffunction>

	<!---
	<cffunction name="getReportingUnitsQuery" access="public" output="false" 
			returntype="query" >
		<cfargument name="event" type="MachII.framework.Event" required="true" />
		<cfreturn variables.campusService.getReportingUnitsQuery(qUserAccessIDs = request.event.getArg("qUserAccessIDs") ) >
	</cffunction>
    --->

	<cffunction name="getAllCampuses" access="public" output="false" 
			returntype="query" >
		<cfargument name="event" type="MachII.framework.Event" required="true" />
		<cfreturn  variables.campusService.getAllCampuses() >
	</cffunction>
	
	    
</cfcomponent>