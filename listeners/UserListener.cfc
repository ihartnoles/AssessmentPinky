<!---
	COMPONENT: UserListener
	AUTHOR: Matt Woodward (mpwoodward@gmail.com)
	DATE: 10/2/2005
	PURPOSE: UserListener for Hello Mach-II sample application
	CHANGE HISTORY:
		* 10/2/2005: component created (Matt Woodward)
--->

<cfcomponent name="UserListener" displayname="UserListener" output="false" 
		extends="MachII.framework.Listener" 
		hint="UserListener">
	
	<cffunction name="configure" access="public" output="false" 
			returntype="void" 
			hint="Configures this listener as part of the Mach-II framework">
		<!--- do nothing for now --->
		<cfset var sf = getProperty("ServiceFactory")>
		
		 <cfset variables.userrolesService 	= sf.getBean('userrolesService') /> 
		 <cfset variables.usersService 	= sf.getBean('usersService') /> 
	</cffunction>

	<cffunction name="getUserList" access="public" output="false" 
			returntype="query" >
		<cfargument name="event" type="MachII.framework.Event" required="true" />
		<cfreturn variables.usersService.getUserList() >
	</cffunction>

	<cffunction name="getUserBean" access="public" output="false" 
			returntype="struct" >
		<cfargument name="event" type="MachII.framework.Event" required="true" />
		<cfreturn variables.usersService.getusers(userid=session.user.userid) >
	</cffunction>
	
	<cffunction name="validateUser" access="public" output="false" 
			returntype="query" >
		<cfargument name="event" type="MachII.framework.Event" required="true" />
		<cfreturn variables.usersService.validateUser(argumentCollection=arguments) >
	</cffunction>

	<cffunction name="SetUserRole" access="public" output="false" 
			returntype="void" >
		<cfargument name="event" type="MachII.framework.Event" required="true" />

		<!--- 
		<cfdump var="#request.event.getArgs()#" abort="false" label="getArgs@UserListener" />
		<cfdump var="#session#" abort="false" label="session@UserListener" />
		<cfdump var="#arguments#" abort="true" label="arguments@UserListener" />
         --->


         <!--- determine if the user has a default role --->
         <cfset local.hasDefaultRole =  variables.usersService.userHasDefaultRole(userid=session.user.userid) />

         <cfif NOT local.hasDefaultRole.recordcount>
         	<!--- we need to select a default bcuz the user has roles BUT NO DEFAULT --->
         	<cfset local.getTopDefaultRole =  variables.userrolesService.getTopDefaultRole(userid=session.user.userid) />

         	<!---
         	<cfdump var="#local.getTopDefaultRole#" abort="true" label="UserListener - 60" />
			--->
			
         	<!--- set local.recordID based off of default --->
         	<cfset local.recordID = local.getTopDefaultRole >
         <cfelse>
         	<!--- user doesn't have any roles at all! --->
         	<cfset local.recordID = 0 >
         </cfif>


         <!--- create role bean --->
         <cfset local.roleBean = variables.userrolesService.createuserroles(RecordID = local.recordID,
			         														UserID = session.user.userid,
			         														RoleID = request.event.getArg('role'),
			         														DefaultRole = 1,
			         														DateInserted = now()) />


         <!--- set a session var to hold --->
         <cfset session.user.userRoleDescription = local.hasDefaultRole.AssessmentRoleDescription />

         <!--- save the role bean --->
         <cfset local.saveBean = variables.userrolesService.saveuserroles(local.roleBean) />         

		<!--- redirect --->
		<cfset redirectEvent("showUserDashboard",arguments.event.getArgs())>
	</cffunction>

	<cffunction name="getUserDetails" access="public" output="false" 
			returntype="query" >
		<cfargument name="event" type="MachII.framework.Event" required="true" />
		<cfreturn variables.usersService.getUserDetails(userid=session.user.userid) >
	</cffunction>
	
	<cffunction name="updatepassword" access="public" output="false" 
			returntype="boolean" >
		<cfargument name="event" type="MachII.framework.Event" required="true" />

		<!--- <cfdump var="#arguments.event.getArgs()#" abort="true" label="@@UserListener" /> --->

		<cfset session.notification = 'Password Updated!' />

		<cfreturn variables.usersService.updatepassword(UserPassword_1 = arguments.event.getArg('UserPassword_1'),
													    UserPassword_2 = arguments.event.getArg('UserPassword_2')) >
	</cffunction>

	<cffunction name="updateContactInfo" access="public" output="false" 
			returntype="boolean" >
		<cfargument name="event" type="MachII.framework.Event" required="true" />

		<!--- <cfdump var="#arguments.event.getArgs()#" abort="true" label="@@UserListener" /> --->

		<cfset session.notification = 'Profile contact information updated!' />

		<cfreturn variables.usersService.updatecontactinfo(UserAddress = arguments.event.getArg('UserAddress'),
													       UserCampus		= arguments.event.getArg('UserCampus'),
													       UserPhoneAcode = arguments.event.getArg('UserPhoneAcode'),
													       UserPhoneNumber = arguments.event.getArg('UserPhoneNumber')
													    ) >
	</cffunction>
	
	

	<cffunction name="getPrimaryAuthors" access="public" output="false" 
			returntype="query" >
		<cfargument name="event" type="MachII.framework.Event" required="true" />
		<cfreturn variables.usersService.getPrimaryAuthors( reportingUnitID	=request.event.getArg('reportingUnitID'),
															programID		=request.event.getArg('programID'),
															DeptID			=request.event.getArg('DeptID'),
															DivisionID		=request.event.getArg('DivisionID')
														   ) >
	</cffunction>


</cfcomponent>