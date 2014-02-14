
<cfcomponent displayname="organizationDeptGateway" output="false">
	<cffunction name="init" access="public" output="false" returntype="organizationDeptGateway">
		<cfargument name="dsn" type="string" required="true" />
		<cfset variables.dsn = arguments.dsn />
		<cfreturn this />
	</cffunction>

	<cffunction name="getDepartments" access="public" output="false" returntype="query">
		<cfargument name="divisionID" type="string" required="true" />
		
		<!---
		<cfdump var="#arguments#" abort="true" label="@@orgDivisionGateway" />
		--->
		
		<cfset var qList = "" />		
		<cfquery name="qList" datasource="#variables.dsn#">
			SELECT
				DeptID,
				DeptName
			FROM	OrganizationDept
			WHERE	0=0
		
		
		<cfif structKeyExists(arguments,"divisionID") and len(arguments.divisionID)>
			AND	divisionID = <cfqueryparam value="#LSParseNumber(arguments.divisionID)#" CFSQLType="cf_sql_integer" />
		</cfif>
		 
		  ORDER BY DeptName
		</cfquery>
		
		<cfreturn qList />
	</cffunction>
	
	<cffunction name="getByAttributesQuery" access="public" output="false" returntype="query">
		<cfargument name="DeptID" type="numeric" required="false" />
		<cfargument name="DeptName" type="string" required="false" />
		<cfargument name="DivisionID" type="numeric" required="false" />
		<cfargument name="SamasDeptID" type="string" required="false" />
		<cfargument name="DeptActive" type="numeric" required="false" />
		<cfargument name="orderby" type="string" required="false" />
		
		<cfset var qList = "" />		
		<cfquery name="qList" datasource="#variables.dsn#">
			SELECT
				DeptID,
				DeptName,
				DivisionID,
				SamasDeptID,
				DeptActive
			FROM	OrganizationDept
			WHERE	0=0
		
		<cfif structKeyExists(arguments,"DeptID") and len(arguments.DeptID)>
			AND	DeptID = <cfqueryparam value="#arguments.DeptID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"DeptName") and len(arguments.DeptName)>
			AND	DeptName = <cfqueryparam value="#arguments.DeptName#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"DivisionID") and len(arguments.DivisionID)>
			AND	DivisionID = <cfqueryparam value="#arguments.DivisionID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"SamasDeptID") and len(arguments.SamasDeptID)>
			AND	SamasDeptID = <cfqueryparam value="#arguments.SamasDeptID#" CFSQLType="cf_sql_char" />
		</cfif>
		<cfif structKeyExists(arguments,"DeptActive") and len(arguments.DeptActive)>
			AND	DeptActive = <cfqueryparam value="#arguments.DeptActive#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments, "orderby") and len(arguments.orderBy)>
			ORDER BY #arguments.orderby#
		</cfif>
		</cfquery>
		
		<cfreturn qList />
	</cffunction>

	<cffunction name="getByAttributes" access="public" output="false" returntype="array">
		<cfargument name="DeptID" type="numeric" required="false" />
		<cfargument name="DeptName" type="string" required="false" />
		<cfargument name="DivisionID" type="numeric" required="false" />
		<cfargument name="SamasDeptID" type="string" required="false" />
		<cfargument name="DeptActive" type="numeric" required="false" />
		<cfargument name="orderby" type="string" required="false" />
		
		<cfset var qList = getByAttributesQuery(argumentCollection=arguments) />		
		<cfset var arrObjects = arrayNew(1) />
		<cfset var tmpObj = "" />
		<cfset var i = 0 />
		<cfloop from="1" to="#qList.recordCount#" index="i">
			<cfset tmpObj = createObject("component","organizationDept").init(argumentCollection=queryRowToStruct(qList,i)) />
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
