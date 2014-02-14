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
		

		 <cfset variables.userRolesService 	= sf.getBean('userRolesService') />
		 <cfset variables.rolesService 		= sf.getBean('rolesService') />  
	</cffunction>

	

	<cffunction name="getDefaultUserRole" access="public" output="false" 
			returntype="numeric" >
		<cfargument name="event" type="MachII.framework.Event" required="true" />

		<!---
		<cfdump var="#session#" abort="true" label="@@UserRoleListener" />
		--->
		
		<cfreturn variables.userRolesService.getDefaultUserRole(userid=session.user.userid) >
	</cffunction>
	
	<cffunction name="getUserRoleLevels" access="public" output="false" 
			returntype="query" >
		<cfargument name="event" type="MachII.framework.Event" required="true" />
		<cfreturn variables.userRolesService.getUserRoleLevels(userid=session.user.userid) >
	</cffunction>
	
	<cffunction name="getAllUserRoleLevels" access="public" output="false" 
			returntype="query" >
		<cfargument name="event" type="MachII.framework.Event" required="true" />
		<cfreturn variables.rolesService.getByAttributesQuery() >
	</cffunction>

	<cffunction name="updateUserRole" access="public" output="false" 
			returntype="void" >
		<cfargument name="event" type="MachII.framework.Event" required="true" />

		<cfset local.successEvent = 'accountsettings##notifications' />

		<!--- get all of the users existing role levels --->
		<cfset qUserRoleLevels = variables.userRolesService.getUserRoleLevels(userid=session.user.userid) />

		<!---
		<cfdump var="#session#" >
		<cfdump var="#qUserRoleLevels#" >
		--->

		<!--- parse out recordID and roleID --->
		<cfset local.recordID = ListGetAt(arguments.event.getArg('roleid'), 1, "@")/>
		<cfset local.roleID = ListGetAt(arguments.event.getArg('roleid'), 2, "@")/>

			
		<!---
		 <cfdump var="#local#" abort="true" label="@@UserRoleListener_1" /> 
		--->

		<cfloop query="qUserRoleLevels">
			<!--- create a userrole bean --->
			<cfset local.userrolebean = variables.userRolesService.getuserroles(recordID = qUserRoleLevels.recordID) >			
			

			<cfif local.recordID EQ qUserRoleLevels.recordID>
				<!--- set the session userRoleID --->
				<cfset session.user.userroleID 	= qUserRoleLevels.roleID />
				<cfset local.userrolebean.setDefaultRole(1) />
			<cfelse>
				<cfset local.userrolebean.setDefaultRole(0) />
			</cfif>
			
				
			<!---
			<cfdump var="#userrolebean#" abort="false" label="@@UserRoleListener_2" />
			--->

			<!--- save the updated role --->
			<cfset saveUserRoleBean = variables.userRolesService.saveuserroles(local.userrolebean) />
		</cfloop>


		<!--- <cfdump var="#userrolebean#" abort="true" label="@@UserRoleListener_2" /> --->
		<cfset session.user.userRoleDescription =  variables.userRolesService.getDefaultUserRoleDescription(userid=session.user.userid) />
		
		<cfset session.notification = 'Success! User role has been changed!' />

		<cfset redirectEvent("accountsettings") />
	</cffunction>
	
	<!---
	<cffunction name="showUserDashboard" access="public" output="false" 
			returntype="query" >
		<cfargument name="event" type="MachII.framework.Event" required="true" />
		<cfreturn variables.userRolesService.showUserDashboard(argumentCollection=arguments) >
	</cffunction>
    --->
    
</cfcomponent>