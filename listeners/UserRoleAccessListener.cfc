<!---
	COMPONENT: UserRoleListener
--->

<cfcomponent name="UserRoleListener" displayname="UserRoleListener" output="false" 
		extends="MachII.framework.Listener" 
		hint="UserRoleListener">
	
	<cffunction name="configure" access="public" output="false" 
			returntype="void" 
			hint="Configures this listener as part of the Mach-II framework">
		<!--- do nothing for now --->
		<cfset var sf = getProperty("ServiceFactory")>
		
		 <cfset variables.userRolesService 		= sf.getBean('userRolesService') /> 
		 <cfset variables.userRoleAccessService = sf.getBean('userRoleAccessService') /> 
	</cffunction>

	

	<cffunction name="getUserRoleAccessIDs" access="public" output="false" 
			returntype="query" >
		<cfargument name="event" type="MachII.framework.Event" required="true" />
		
		<!---
		<cfdump var="#session.user#" abort="false" label="@@UserRoleAccessListener_1" />
		<cfdump var="#request.event.getArgs()#" abort="true" label="@@UserRoleAccessListener_2" />
		
		<cfset temp =  variables.userRoleAccessService.getUserRoleAccessIDsQuery(UserRoleRecordID=request.event.getArg("UserRoleRecordID")) />
		<cfdump var="#temp#" abort="true" label="@@UserRoleAccessListener_2" />
		--->
		<!--- if userRoleRecordID EQ 0 then the user doesn't have a default role --->
		<cfif request.event.getArg('UserRoleRecordID') EQ 0>
			<!--- query for role --->
			<cfset local.UserRoleRecordID =  variables.userRolesService.getNONDefaultUserRole(UserID = session.user.userID) />

		<cfelse>
			<cfset local.UserRoleRecordID =  request.event.getArg('userRoleRecordID') />
		</cfif>
		
		<cfreturn variables.userRoleAccessService.getUserRoleAccessIDsQuery(UserRoleRecordID=local.UserRoleRecordID) >
	</cffunction>
	
	
	<!---
	<cffunction name="showUserDashboard" access="public" output="false" 
			returntype="query" >
		<cfargument name="event" type="MachII.framework.Event" required="true" />
		<cfreturn variables.userRoleAccessService.showUserDashboard(argumentCollection=arguments) >
	</cffunction>
    --->
    
</cfcomponent>