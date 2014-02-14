
<cfcomponent displayname="userroleaccessGateway" output="false">
	<cffunction name="init" access="public" output="false" returntype="userroleaccessGateway">
		<cfargument name="dsn" type="string" required="true" />
		<cfset variables.dsn = arguments.dsn />
		<cfreturn this />
	</cffunction>
	
	<cffunction name="getByAttributesQuery" access="public" output="false" returntype="query">
		<cfargument name="RecordID" type="numeric" required="false" />
		<cfargument name="UserRoleRecordID" type="numeric" required="false" />
		<cfargument name="ProgramID" type="numeric" required="false" />
		<cfargument name="DeptID" type="numeric" required="false" />
		<cfargument name="DivisionID" type="numeric" required="false" />
		<cfargument name="SuperDivisionID" type="numeric" required="false" />
		<cfargument name="OrganizationID" type="numeric" required="false" />
		<cfargument name="DateInserted" type="date" required="false" />
		<cfargument name="orderby" type="string" required="false" />
		
		<cfset var qList = "" />		
		<cfquery name="qList" datasource="#variables.dsn#">
			SELECT
				RecordID,
				UserRoleRecordID,
				ProgramID,
				DeptID,
				DivisionID,
				SuperDivisionID,
				OrganizationID,
				DateInserted
			FROM	UserRoleAccess
			WHERE	0=0
		
		<cfif structKeyExists(arguments,"RecordID") and len(arguments.RecordID)>
			AND	RecordID = <cfqueryparam value="#arguments.RecordID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"UserRoleRecordID") and len(arguments.UserRoleRecordID)>
			AND	UserRoleRecordID = <cfqueryparam value="#arguments.UserRoleRecordID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"ProgramID") and len(arguments.ProgramID)>
			AND	ProgramID = <cfqueryparam value="#arguments.ProgramID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"DeptID") and len(arguments.DeptID)>
			AND	DeptID = <cfqueryparam value="#arguments.DeptID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"DivisionID") and len(arguments.DivisionID)>
			AND	DivisionID = <cfqueryparam value="#arguments.DivisionID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"SuperDivisionID") and len(arguments.SuperDivisionID)>
			AND	SuperDivisionID = <cfqueryparam value="#arguments.SuperDivisionID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"OrganizationID") and len(arguments.OrganizationID)>
			AND	OrganizationID = <cfqueryparam value="#arguments.OrganizationID#" CFSQLType="cf_sql_integer" />
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

	<cffunction name="getUserRoleAccessIDsQuery" access="public" output="false" returntype="query">
		<cfargument name="UserRoleRecordID" type="numeric" required="false" />
		
		
		<cfset var qList = "" />		
		<cfquery name="qList" datasource="#variables.dsn#">
			SELECT
				
				DivisionID,
				SuperDivisionID,
				OrganizationID
				
			FROM	UserRoleAccess
			WHERE	0=0	
		
		<cfif structKeyExists(arguments,"UserRoleRecordID") and len(arguments.UserRoleRecordID)>
			AND	UserRoleRecordID = <cfqueryparam value="#arguments.UserRoleRecordID#" CFSQLType="cf_sql_integer" />
		</cfif>
		
		</cfquery>
		
		<cfreturn qList />
	</cffunction>

	<cffunction name="getByAttributes" access="public" output="false" returntype="array">
		<cfargument name="RecordID" type="numeric" required="false" />
		<cfargument name="UserRoleRecordID" type="numeric" required="false" />
		<cfargument name="ProgramID" type="numeric" required="false" />
		<cfargument name="DeptID" type="numeric" required="false" />
		<cfargument name="DivisionID" type="numeric" required="false" />
		<cfargument name="SuperDivisionID" type="numeric" required="false" />
		<cfargument name="OrganizationID" type="numeric" required="false" />
		<cfargument name="DateInserted" type="date" required="false" />
		<cfargument name="orderby" type="string" required="false" />
		
		<cfset var qList = getByAttributesQuery(argumentCollection=arguments) />		
		<cfset var arrObjects = arrayNew(1) />
		<cfset var tmpObj = "" />
		<cfset var i = 0 />
		<cfloop from="1" to="#qList.recordCount#" index="i">
			<cfset tmpObj = createObject("component","userroleaccess").init(argumentCollection=queryRowToStruct(qList,i)) />
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
