
<cfcomponent displayname="usersDAO" hint="table ID column = UserID">

	<cffunction name="init" access="public" output="false" returntype="usersDAO">
		<cfargument name="dsn" type="string" required="true">
		<cfset variables.dsn = arguments.dsn>
		<cfreturn this>
	</cffunction>
	
	<cffunction name="create" access="public" output="false" returntype="boolean">
		<cfargument name="users" type="users" required="true" />

		<cfset var qCreate = "" />
		<cftry>
			<cfquery name="qCreate" datasource="#variables.dsn#">
				INSERT INTO Users
					(
					UserLname,
					UserFname,
					UserInitial,
					UserTitle,
					UserAddress,
					UserCampus,
					UserPhoneAcode,
					UserPhoneNumber,
					UserEmail,
					UserName,
					UserPassword,
					UserTrained
					)
				VALUES
					(
					<cfqueryparam value="#arguments.users.getUserLname()#" CFSQLType="cf_sql_varchar" />,
					<cfqueryparam value="#arguments.users.getUserFname()#" CFSQLType="cf_sql_varchar" />,
					<cfqueryparam value="#arguments.users.getUserInitial()#" CFSQLType="cf_sql_char" null="#not len(arguments.users.getUserInitial())#" />,
					<cfqueryparam value="#arguments.users.getUserTitle()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.users.getUserTitle())#" />,
					<cfqueryparam value="#arguments.users.getUserAddress()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.users.getUserAddress())#" />,
					<cfqueryparam value="#arguments.users.getUserCampus()#" CFSQLType="cf_sql_char" null="#not len(arguments.users.getUserCampus())#" />,
					<cfqueryparam value="#arguments.users.getUserPhoneAcode()#" CFSQLType="cf_sql_char" null="#not len(arguments.users.getUserPhoneAcode())#" />,
					<cfqueryparam value="#arguments.users.getUserPhoneNumber()#" CFSQLType="cf_sql_char" null="#not len(arguments.users.getUserPhoneNumber())#" />,
					<cfqueryparam value="#arguments.users.getUserEmail()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.users.getUserEmail())#" />,
					<cfqueryparam value="#arguments.users.getUserName()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.users.getUserName())#" />,
					<cfqueryparam value="#arguments.users.getUserPassword()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.users.getUserPassword())#" />,
					<cfqueryparam value="#arguments.users.getUserTrained()#" CFSQLType="cf_sql_integer" null="#not len(arguments.users.getUserTrained())#" />
					)
			</cfquery>
			<cfcatch type="database">
				<cfreturn false />
			</cfcatch>
		</cftry>
		<cfreturn true />
	</cffunction>

	<cffunction name="read" access="public" output="false" returntype="void">
		<cfargument name="users" type="users" required="true" />

		<cfset var qRead = "" />
		<cfset var strReturn = structNew() />
		<cftry>
			<cfquery name="qRead" datasource="#variables.dsn#">
				SELECT
					UserID,
					UserLname,
					UserFname,
					UserInitial,
					UserTitle,
					UserAddress,
					UserCampus,
					UserPhoneAcode,
					UserPhoneNumber,
					UserEmail,
					UserName,
					UserPassword,
					UserTrained
				FROM	Users
				WHERE	UserID = <cfqueryparam value="#arguments.users.getUserID()#" CFSQLType="cf_sql_integer" />
			</cfquery>
			<cfcatch type="database">
				<!--- leave the bean as is and set an empty query for the conditional logic below --->
				<cfset qRead = queryNew("id") />
			</cfcatch>
		</cftry>
		<cfif qRead.recordCount>
			<cfset strReturn = queryRowToStruct(qRead)>
			<cfset arguments.users.init(argumentCollection=strReturn)>
		</cfif>
	</cffunction>

	<cffunction name="update" access="public" output="false" returntype="boolean">
		<cfargument name="users" type="users" required="true" />

		<cfset var qUpdate = "" />
		<cftry>
			<cfquery name="qUpdate" datasource="#variables.dsn#">
				UPDATE	Users
				SET
					UserLname = <cfqueryparam value="#arguments.users.getUserLname()#" CFSQLType="cf_sql_varchar" />,
					UserFname = <cfqueryparam value="#arguments.users.getUserFname()#" CFSQLType="cf_sql_varchar" />,
					UserInitial = <cfqueryparam value="#arguments.users.getUserInitial()#" CFSQLType="cf_sql_char" null="#not len(arguments.users.getUserInitial())#" />,
					UserTitle = <cfqueryparam value="#arguments.users.getUserTitle()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.users.getUserTitle())#" />,
					UserAddress = <cfqueryparam value="#arguments.users.getUserAddress()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.users.getUserAddress())#" />,
					UserCampus = <cfqueryparam value="#arguments.users.getUserCampus()#" CFSQLType="cf_sql_char" null="#not len(arguments.users.getUserCampus())#" />,
					UserPhoneAcode = <cfqueryparam value="#arguments.users.getUserPhoneAcode()#" CFSQLType="cf_sql_char" null="#not len(arguments.users.getUserPhoneAcode())#" />,
					UserPhoneNumber = <cfqueryparam value="#arguments.users.getUserPhoneNumber()#" CFSQLType="cf_sql_char" null="#not len(arguments.users.getUserPhoneNumber())#" />,
					UserEmail = <cfqueryparam value="#arguments.users.getUserEmail()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.users.getUserEmail())#" />,
					UserName = <cfqueryparam value="#arguments.users.getUserName()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.users.getUserName())#" />,
					UserPassword = <cfqueryparam value="#arguments.users.getUserPassword()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.users.getUserPassword())#" />,
					UserTrained = <cfqueryparam value="#arguments.users.getUserTrained()#" CFSQLType="cf_sql_integer" null="#not len(arguments.users.getUserTrained())#" />
				WHERE	UserID = <cfqueryparam value="#arguments.users.getUserID()#" CFSQLType="cf_sql_integer" />
			</cfquery>
			<cfcatch type="database">
				<cfreturn false />
			</cfcatch>
		</cftry>
		<cfreturn true />
	</cffunction>

	<cffunction name="delete" access="public" output="false" returntype="boolean">
		<cfargument name="users" type="users" required="true" />

		<cfset var qDelete = "">
		<cftry>
			<cfquery name="qDelete" datasource="#variables.dsn#">
				DELETE FROM	Users 
				WHERE	UserID = <cfqueryparam value="#arguments.users.getUserID()#" CFSQLType="cf_sql_integer" />
			</cfquery>
			<cfcatch type="database">
				<cfreturn false />
			</cfcatch>
		</cftry>
		<cfreturn true />
	</cffunction>

	<cffunction name="exists" access="public" output="false" returntype="boolean">
		<cfargument name="users" type="users" required="true" />

		<cfset var qExists = "">
		<cfquery name="qExists" datasource="#variables.dsn#" maxrows="1">
			SELECT count(1) as idexists
			FROM	Users
			WHERE	UserID = <cfqueryparam value="#arguments.users.getUserID()#" CFSQLType="cf_sql_integer" />
		</cfquery>

		<cfif qExists.idexists>
			<cfreturn true />
		<cfelse>
			<cfreturn false />
		</cfif>
	</cffunction>

	<cffunction name="validate" access="public" output="false" returntype="query">
		<cfargument name="username" type="string" required="true" />
		<cfargument name="UserPassword" type="string" required="false" />

		<!--- <cfdump var="#arguments#" abort="false" label="@usersDAO" /> --->


		<cfset var qExists = "">
		<cfquery name="qExists" datasource="#variables.dsn#" maxrows="1">
			SELECT  TOP 1 UserID, UserName
			FROM	Users
			WHERE	UserName = <cfqueryparam value="#arguments.username#" CFSQLType="cf_sql_varchar" />
			<cfif structKeyExists(arguments,"UserPassword") and len(arguments.UserPassword)>
				AND	UserPassword = <cfqueryparam value="#arguments.UserPassword#" CFSQLType="cf_sql_varchar" />
			</cfif>
		</cfquery>

			
		<cfreturn qExists />		
	</cffunction>


	<cffunction name="userHasDefaultRole" access="public" output="false" returntype="query">
		<cfargument name="userid" type="string" required="true" />
		

		<cfset var qDefaultRole = "">
		<cfquery name="qDefaultRole" datasource="#variables.dsn#" >
			 SELECT ur.*, AssessmentRoleDescription, ura.DeptID 
			 FROM UserRoles ur, Roles r , UserRoleAccess ura
			 WHERE ur.UserID= <cfqueryparam value="#arguments.userid#" CFSQLType="cf_sql_integer" />
			 AND ur.DefaultRole = 1
			 AND ur.RoleID=r.AssessmentRoleID
			  AND ur.recordID = ura.UserRoleRecordID
		</cfquery>


		<cfif qDefaultRole.recordcount>
			<cfreturn qDefaultRole />
		<cfelse>
			<cfreturn qDefaultRole />
		</cfif>
	</cffunction>


	<cffunction name="getUserRole" access="public" output="false" returntype="query">
		<cfargument name="userid" type="string" required="true" />
		

		<cfset var qUserRole = "">
		<cfquery name="qUserRole" datasource="#variables.dsn#" >
			 SELECT ur.*, AssessmentRoleDescription, ura.DeptID  
			 FROM UserRoles ur, Roles r , UserRoleAccess ura
			 WHERE ur.UserID= <cfqueryparam value="#arguments.userid#" CFSQLType="cf_sql_integer" />
			 AND ur.RoleID=r.AssessmentRoleID
			 AND ur.recordID = ura.UserRoleRecordID
		</cfquery>

		<cfreturn qUserRole />
	</cffunction>



	<cffunction name="setUserRole" access="public" output="false" returntype="boolean">
		<cfargument name="RoleID" type="numeric" required="false" />
		
		<!--- Zero out existing default role --->
		<cfset clear_existing_default_role = ZeroDefaultRoles() >


		<!--- Set new default role--->
		<cfset local.qSetDefaultRole = "" />		
		
		<cftry>	
			<cfquery name="local.qSetDefaultRole" datasource="#variables.dsn#">
				UPDATE	UserRoles
					SET     DefaultRole = 1
				WHERE	UserID = <cfqueryparam value="#session.user.UserID#" CFSQLType="cf_sql_integer" />
					AND     RoleID = <cfqueryparam value="#arguments.RoleID#" CFSQLType="cf_sql_integer" />
			</cfquery>

		<cfcatch type="database">
				<cfreturn false />
			</cfcatch>
		</cftry>

		<cfreturn true />
	</cffunction>


	<cffunction name="ZeroDefaultRoles" access="public" output="false" returntype="boolean">
		<cfset local.qZeroDefaultRoles = "" />		
		
		<cftry>		
			<cfquery name="local.qZeroDefaultRoles" datasource="#variables.dsn#">
				UPDATE	UserRoles
					SET     DefaultRole = 0
				WHERE	UserID = <cfqueryparam value="#session.user.UserID#" CFSQLType="cf_sql_integer" />				
			</cfquery>
			<cfcatch type="database">
				<cfreturn false />
			</cfcatch>
		</cftry>

		<cfreturn true />
			
	</cffunction>

	<cffunction name="updatepassword" access="public" output="false" returntype="boolean">
		<cfargument name="UserPassword_1" type="string" required="true" />
		
		<!--- <cfdump var="#arguments#" abort="true" label="@@usersDAO" /> --->

		<cfset var qUpdate = "" />
		<cftry>
			<cfquery name="qUpdate" datasource="#variables.dsn#">
				UPDATE	Users
				SET					
					UserPassword = <cfqueryparam value="#arguments.UserPassword_1#" CFSQLType="cf_sql_varchar" null="#not len(arguments.UserPassword_1)#" />
				WHERE	UserID = <cfqueryparam value="#session.user.userID#" CFSQLType="cf_sql_integer" />
			</cfquery>
			<cfcatch type="database">
				<cfreturn false />
			</cfcatch>
		</cftry>
		<cfreturn true />
	</cffunction>



	<cffunction name="updatecontactinfo" access="public" output="false" returntype="boolean">
		<cfargument name="UserAddress" type="string" required="false" />
		<cfargument name="UserCampus" type="string" required="false" />
		<cfargument name="UserPhoneAcode" type="string" required="false" />
		<cfargument name="UserPhoneNumber" type="string" required="false" />
		
		<!--- <cfdump var="#arguments#" abort="true" label="@@usersDAO" /> --->

		<cfset var qUpdate = "" />
		<cftry>
			<cfquery name="qUpdate" datasource="#variables.dsn#">
				UPDATE	Users
				SET					
					
					UserAddress = <cfqueryparam value="#arguments.UserAddress#" CFSQLType="cf_sql_varchar" null="#not len(arguments.UserAddress)#" />,
					UserCampus = <cfqueryparam value="#arguments.UserCampus#" CFSQLType="cf_sql_char" null="#not len(arguments.UserCampus)#" />,
					UserPhoneAcode = <cfqueryparam value="#arguments.UserPhoneAcode#" CFSQLType="cf_sql_char" null="#not len(arguments.UserPhoneAcode)#" />,
					UserPhoneNumber = <cfqueryparam value="#arguments.UserPhoneNumber#" CFSQLType="cf_sql_char" null="#not len(arguments.UserPhoneNumber)#" />
					
					
				WHERE	UserID = <cfqueryparam value="#session.user.userID#" CFSQLType="cf_sql_integer" />
			</cfquery>
			<cfcatch type="database">
				<cfreturn false />
			</cfcatch>
		</cftry>
		<cfreturn true />
	</cffunction>



	<cffunction name="save" access="public" output="false" returntype="boolean">
		<cfargument name="users" type="users" required="true" />
		
		<cfset var success = false />
		<cfif exists(arguments.users)>
			<cfset success = update(arguments.users) />
		<cfelse>
			<cfset success = create(arguments.users) />
		</cfif>
		
		<cfreturn success />
	</cffunction>

	<cffunction name="queryRowToStruct" access="private" output="false" returntype="struct">
		<cfargument name="qry" type="query" required="true">
		
		<cfscript>
			/**
			 * Makes a row of a query into a structure.
			 * 
			 * @param query 	 The query to work with. 
			 * @param row 	 Row number to check. Defaults to row 1. 
			 * @return Returns a structure. 
			 * @author Nathan Dintenfass (nathan@changemedia.com) 
			 * @version 1, December 11, 2001 
			 */
			//by default, do this to the first row of the query
			var row = 1;
			//a var for looping
			var ii = 1;
			//the cols to loop over
			var cols = listToArray(qry.columnList);
			//the struct to return
			var stReturn = structnew();
			//if there is a second argument, use that for the row number
			if(arrayLen(arguments) GT 1)
				row = arguments[2];
			//loop over the cols and build the struct from the query row
			for(ii = 1; ii lte arraylen(cols); ii = ii + 1){
				stReturn[cols[ii]] = qry[cols[ii]][row];
			}		
			//return the struct
			return stReturn;
		</cfscript>
	</cffunction>

</cfcomponent>
