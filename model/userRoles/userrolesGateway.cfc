
<cfcomponent displayname="userrolesGateway" output="false">
	<cffunction name="init" access="public" output="false" returntype="userrolesGateway">
		<cfargument name="dsn" type="string" required="true" />
		<cfset variables.dsn = arguments.dsn />
		<cfreturn this />
	</cffunction>
	
	<cffunction name="getByAttributesQuery" access="public" output="false" returntype="query">
		<cfargument name="RecordID" type="numeric" required="false" />
		<cfargument name="UserID" type="numeric" required="false" />
		<cfargument name="RoleID" type="numeric" required="false" />
		<cfargument name="DefaultRole" type="numeric" required="false" />
		<cfargument name="DateInserted" type="date" required="false" />
		<cfargument name="orderby" type="string" required="false" />
		
		<cfset var qList = "" />		
		<cfquery name="qList" datasource="#variables.dsn#">
			SELECT
				RecordID,
				UserID,
				RoleID,
				DefaultRole,
				DateInserted
			FROM	UserRoles
			WHERE	0=0
		
		<cfif structKeyExists(arguments,"RecordID") and len(arguments.RecordID)>
			AND	RecordID = <cfqueryparam value="#arguments.RecordID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"UserID") and len(arguments.UserID)>
			AND	UserID = <cfqueryparam value="#arguments.UserID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"RoleID") and len(arguments.RoleID)>
			AND	RoleID = <cfqueryparam value="#arguments.RoleID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"DefaultRole") and len(arguments.DefaultRole)>
			AND	DefaultRole = <cfqueryparam value="#arguments.DefaultRole#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"DateInserted") and len(arguments.DateInserted)>
			AND	DateInserted = <cfqueryparam value="#arguments.DateInserted#" CFSQLType="cf_sql_timestamp" />
		</cfif>
		<cfif structKeyExists(arguments, "orderby") and len(arguments.orderBy)>
			ORDER BY #arguments.orderby#
		</cfif>
		</cfquery>
		
		<cfreturn qList />
	</cffunction>

	<cffunction name="getDefaultUserRole" access="public" output="false" returntype="numeric">
		
		<cfargument name="UserID" type="numeric" required="false" />
		
		
		<cfset var qList = "" />		
		<cfquery name="qList" datasource="#variables.dsn#">
			 
			SELECT ur.*, 
				   AssessmentRoleDescription  
		    FROM UserRoles ur, Roles r 

			WHERE	ur.defaultrole = 1
			
		<cfif structKeyExists(arguments,"UserID") and len(arguments.UserID)>
			AND	UserID = <cfqueryparam value="#arguments.UserID#" CFSQLType="cf_sql_integer" />
		</cfif>
		
		</cfquery>

		<!---handle when a default role is not assigned --->
		<cfif qList.recordcount>
			<cfset local.returnVal = qList.RecordID />
		<cfelse>
			<cfset local.returnVal = 0 />
		</cfif>
		
		<cfreturn local.returnVal/>
	</cffunction>

	<cffunction name="getTopDefaultRole" access="public" output="false" returntype="numeric">
		
		<cfargument name="UserID" type="numeric" required="false" />
		
		
		<cfset var qgetTopDefaultRole = "" />		
		<cfquery name="qgetTopDefaultRole" datasource="#variables.dsn#">
			 
			SELECT TOP 1 ur.recordid, AssessmentRoleDescription  
 			FROM UserRoles ur, Roles r   
		     			
			
		<cfif structKeyExists(arguments,"UserID") and len(arguments.UserID)>
			WHERE UserID = <cfqueryparam value="#arguments.UserID#" CFSQLType="cf_sql_integer" />
		</cfif>
		
		</cfquery>

		<cfset local.returnVal = qgetTopDefaultRole.RecordID />		
		
		<cfreturn local.returnVal/>
	</cffunction>

	<cffunction name="getNONDefaultUserRole" access="public" output="false" returntype="numeric">
		<cfargument name="UserID" type="numeric" required="false" />
		
		
		<cfset var qRole = "" />		
		<cfquery name="qRole" datasource="#variables.dsn#">
			 
			SELECT ur.*, 
				   AssessmentRoleDescription  
		    FROM UserRoles ur, Roles r 
			
			WHERE 0=0 
		<cfif structKeyExists(arguments,"UserID") and len(arguments.UserID)>
			AND	UserID = <cfqueryparam value="#arguments.UserID#" CFSQLType="cf_sql_integer" />
		</cfif>
		
		</cfquery>

		<cfreturn qRole.recordID/>
	</cffunction>

	<cffunction name="getDefaultUserRoleDescription" access="public" output="false" returntype="string">
		
		<cfargument name="UserID" type="numeric" required="false" />
		
		
		<cfset var qList = "" />		
		<cfquery name="qList" datasource="#variables.dsn#">
			 
			SELECT ur.*, 
				   AssessmentRoleDescription  
		    FROM UserRoles ur, Roles r 

			WHERE	0=0

			AND ur.RoleID=r.AssessmentRoleID
			AND ur.defaultrole = 1
			
		<cfif structKeyExists(arguments,"UserID") and len(arguments.UserID)>
			AND	UserID = <cfqueryparam value="#arguments.UserID#" CFSQLType="cf_sql_integer" />
		</cfif>
		
		</cfquery>
		
		<cfreturn qList.AssessmentRoleDescription />
	</cffunction>


	<cffunction name="getUserRoleLevels" access="public" output="false" returntype="query">
		
		<cfargument name="UserID" type="numeric" required="false" />
		
		
		<cfset var qList = "" />		
		<cfquery name="qList" datasource="#variables.dsn#">			 
			 SELECT ur.*, AssessmentRoleDescription  
 			 FROM UserRoles ur, Roles r  

			 WHERE	0=0			
		<cfif structKeyExists(session.user,"UserID") and len(session.user.UserID)>
			AND	UserID = <cfqueryparam value="#session.user.UserID#" CFSQLType="cf_sql_integer" />
		</cfif>

		 	 AND ur.RoleID=r.AssessmentRoleID		
		</cfquery>
		
		<cfreturn qList />
	</cffunction>

	<cffunction name="getByAttributes" access="public" output="false" returntype="array">
		<cfargument name="RecordID" type="numeric" required="false" />
		<cfargument name="UserID" type="numeric" required="false" />
		<cfargument name="RoleID" type="numeric" required="false" />
		<cfargument name="DefaultRole" type="numeric" required="false" />
		<cfargument name="DateInserted" type="date" required="false" />
		<cfargument name="orderby" type="string" required="false" />
		
		<cfset var qList = getByAttributesQuery(argumentCollection=arguments) />		
		<cfset var arrObjects = arrayNew(1) />
		<cfset var tmpObj = "" />
		<cfset var i = 0 />
		<cfloop from="1" to="#qList.recordCount#" index="i">
			<cfset tmpObj = createObject("component","userroles").init(argumentCollection=queryRowToStruct(qList,i)) />
			<cfset arrayAppend(arrObjects,tmpObj) />
		</cfloop>
				
		<cfreturn arrObjects />
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
