
<cfcomponent name="usersService" output="false">

	<cffunction name="init" access="public" output="false" returntype="usersService">
		<cfargument name="usersDAO" type="usersDAO" required="true" />
		<cfargument name="usersGateway" type="usersGateway" required="true" />

		<cfset variables.usersDAO = arguments.usersDAO />
		<cfset variables.usersGateway = arguments.usersGateway />

		<cfreturn this/>
	</cffunction>

	<cffunction name="createusers" access="public" output="false" returntype="users">
		<cfargument name="UserID" type="numeric" required="true" />
		<cfargument name="UserLname" type="string" required="false" />
		<cfargument name="UserFname" type="string" required="false" />
		<cfargument name="UserInitial" type="string" required="false" />
		<cfargument name="UserTitle" type="string" required="false" />
		<cfargument name="UserAddress" type="string" required="false" />
		<cfargument name="UserCampus" type="string" required="false" />
		<cfargument name="UserPhoneAcode" type="string" required="false" />
		<cfargument name="UserPhoneNumber" type="string" required="false" />
		<cfargument name="UserEmail" type="string" required="false" />
		<cfargument name="UserName" type="string" required="false" />
		<cfargument name="UserPassword" type="string" required="false" />
		<cfargument name="UserTrained" type="numeric" required="false" />
		
			
		<cfset var users = createObject("component","users").init(argumentCollection=arguments) />
		<cfreturn users />
	</cffunction>

	<cffunction name="getusers" access="public" output="false" returntype="users">
		<cfargument name="UserID" type="numeric" required="true" />
		
		<cfset var users = createusers(argumentCollection=arguments) />
		<cfset variables.usersDAO.read(users) />
		<cfreturn users />
	</cffunction>

	<cffunction name="getuserss" access="public" output="false" returntype="array">
		<cfargument name="UserID" type="numeric" required="false" />
		<cfargument name="UserLname" type="string" required="false" />
		<cfargument name="UserFname" type="string" required="false" />
		<cfargument name="UserInitial" type="string" required="false" />
		<cfargument name="UserTitle" type="string" required="false" />
		<cfargument name="UserAddress" type="string" required="false" />
		<cfargument name="UserCampus" type="string" required="false" />
		<cfargument name="UserPhoneAcode" type="string" required="false" />
		<cfargument name="UserPhoneNumber" type="string" required="false" />
		<cfargument name="UserEmail" type="string" required="false" />
		<cfargument name="UserName" type="string" required="false" />
		<cfargument name="UserPassword" type="string" required="false" />
		<cfargument name="UserTrained" type="numeric" required="false" />
		
		<cfreturn variables.usersGateway.getByAttributes(argumentCollection=arguments) />
	</cffunction>

	<cffunction name="saveusers" access="public" output="false" returntype="boolean">
		<cfargument name="users" type="users" required="true" />

		<cfreturn variables.usersDAO.save(users) />
	</cffunction>

	<cffunction name="deleteusers" access="public" output="false" returntype="boolean">
		<cfargument name="UserID" type="numeric" required="true" />
		
		<cfset var users = createusers(argumentCollection=arguments) />
		<cfreturn variables.usersDAO.delete(users) />
	</cffunction>
	
	<cffunction name="validateUser" access="public" output="false" returntype="query">
		<cfargument name="UserName" type="string" required="false" />
		<cfargument name="UserPassword" type="string" required="false" />
	
		<cfreturn  variables.usersDAO.validate(argumentCollection=arguments) />
	</cffunction>

	<cffunction name="setUserRole" access="public" output="false" returntype="boolean">
		<cfargument name="UserID" type="string" required="false" />
		<cfargument name="RoleID" type="numeric" required="true" />

		<cfreturn  variables.usersDAO.setUserRole(userid=session.user.userid,roleid=arguments.roleid) />
	</cffunction>

	<cffunction name="userHasDefaultRole" access="public" output="false" returntype="query">
		<cfargument name="userid" type="string" required="false" />				
		
		<cfreturn  variables.usersDAO.userHasDefaultRole(userid=arguments.userid) />
	</cffunction>

	<cffunction name="getUserRole" access="public" output="false" returntype="query">
		<cfargument name="userid" type="string" required="false" />				
		
		<cfreturn  variables.usersDAO.getUserRole(userid=arguments.userid) />
	</cffunction>


	<cffunction name="updatepassword" access="public" output="false" returntype="boolean">
		<cfargument name="UserPassword_1" type="string" required="true" />
		<cfargument name="UserPassword_2" type="string" required="true" />

		<!--- <cfdump var="#arguments#" abort="true" label="@@UserListener" /> --->

		<cfreturn  variables.usersDAO.updatepassword(UserPassword_1 = arguments.UserPassword_1,
													 UserPassword_2 = arguments.UserPassword_2) />
	</cffunction>

	<cffunction name="updateContactInfo" access="public" output="false" returntype="boolean">
		<cfargument name="UserAddress" type="string" required="false" />
		<cfargument name="UserCampus" type="string" required="false" />
		<cfargument name="UserPhoneAcode" type="string" required="false" />
		<cfargument name="UserPhoneNumber" type="string" required="false" />

		<!--- <cfdump var="#arguments#" abort="true" label="@@UserListener" /> --->

		<cfreturn  variables.usersDAO.updatecontactinfo(UserAddress 	= arguments.UserAddress,
													    UserCampus		= arguments.UserCampus,
													    UserPhoneAcode 	= arguments.UserPhoneAcode,
													    UserPhoneNumber = arguments.UserPhoneNumber
													    ) />
	</cffunction>

	<!---
	<cffunction name="showUserDashboard" access="public" output="false" returntype="query">
		<cfargument name="userid" type="string" required="false" />				
		
		<cfreturn  variables.usersDAO.???(userid=arguments.userid) />
	</cffunction>
	--->

	<!---
	<cffunction name="getUserBean" access="public" output="false" returntype="query">
		<cfargument name="UserID" type="string" required="false" />		
	
		<cfreturn  variables.usersDAO.getUserInfo(userid=arguments.userid) />
	</cffunction>
    --->

	<cffunction name="onMissingMethod" access="public" output="false" >
		
		<cfset var ret = ""/>
		<cfinvoke component="#variables.usersGateway#" 
				  method="#arguments.missingMethodName#" 
				  argumentcollection="#arguments.missingMethodArguments#" 
				  returnvariable="ret"/>
		<cfreturn ret />
	</cffunction>
</cfcomponent>
