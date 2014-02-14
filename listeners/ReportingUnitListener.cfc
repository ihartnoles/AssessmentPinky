<!---
	COMPONENT: ReportingUnitListener
--->

<cfcomponent name="ReportingUnitListener" displayname="ReportingUnitListener" output="false" 
		extends="MachII.framework.Listener" 
		hint="ReportingUnitListener">
	
	<cffunction name="configure" access="public" output="false" 
			returntype="void" 
			hint="Configures this listener as part of the Mach-II framework">
		<!--- do nothing for now --->
		<cfset var sf = getProperty("ServiceFactory")>
		

		 <cfset variables.reportingUnitsService 	= sf.getBean('reportingunitsService') /> 
	</cffunction>

	<cffunction name="getReportingUnitsQuery" access="public" output="false" 
			returntype="query" >
		<cfargument name="event" type="MachII.framework.Event" required="true" />
		
		<!---
		<cfdump var="#request.event.getArgs()#" abort="true" label="@@ReportinUnitListener" />
		 --->

		<cfif request.event.getArg('qUserAccessIDs').recordcount >
			<cfreturn variables.reportingUnitsService.getReportingUnitsQuery(qUserAccessIDs = request.event.getArg("qUserAccessIDs") ) >
		<cfelse>
			<cfset redirectEvent("showUserDashboard", {message = 'Sorry! You are not assigned any reporting units' }) />
		</cfif>
		
		
	</cffunction>

	<cffunction name="getAdminReportingUnitsQuery" access="public" output="false" 
			returntype="query" >
		<cfargument name="event" type="MachII.framework.Event" required="true" />
		<cfreturn variables.reportingUnitsService.getAdminReportingUnitsQuery(qUserAccessIDs = request.event.getArg("qUserAccessIDs") ) >
	</cffunction>

	<!---
	<cffunction name="getUserBean" access="public" output="false" 
			returntype="struct" >
		<cfargument name="event" type="MachII.framework.Event" required="true" />
		<cfreturn variables.reportingUnitsService.getusers(userid=session.userid) >
	</cffunction>
	
	<cffunction name="validateUser" access="public" output="false" 
			returntype="query" >
		<cfargument name="event" type="MachII.framework.Event" required="true" />
		<cfreturn variables.reportingUnitsService.validateUser(argumentCollection=arguments) >
	</cffunction>

	<cffunction name="SetUserRole" access="public" output="false" 
			returntype="boolean" >
		<cfargument name="event" type="MachII.framework.Event" required="true" />

		<!--- 
		<cfdump var="#request.event.getArgs()#" abort="false" label="getArgs@UserListener" />
		<cfdump var="#session#" abort="false" label="session@UserListener" />
		<cfdump var="#arguments#" abort="true" label="arguments@UserListener" />
         --->

		<cfreturn variables.reportingUnitsService.SetUserRole(userid=session.userid, roleid=request.event.getArg('role')) >
	</cffunction>

	<cffunction name="showUserDashboard" access="public" output="false" 
			returntype="query" >
		<cfargument name="event" type="MachII.framework.Event" required="true" />
		<cfreturn variables.reportingUnitService.showUserDashboard(argumentCollection=arguments) >
	</cffunction>
    --->
    
</cfcomponent>