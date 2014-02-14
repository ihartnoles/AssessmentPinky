
<cfcomponent displayname="organizationDivisionGateway" output="false">
	<cffunction name="init" access="public" output="false" returntype="organizationDivisionGateway">
		<cfargument name="dsn" type="string" required="true" />
		<cfset variables.dsn = arguments.dsn />
		<cfreturn this />
	</cffunction>
	
	<cffunction name="getDivisions" access="public" output="false" returntype="query">
		<cfargument name="SuperDivisionID" type="string" required="true" />
		
		<!---
		<cfdump var="#arguments#" abort="true" label="@@orgDivisionGateway" />
		--->
		
		<cfset var qList = "" />		
		<cfquery name="qList" datasource="#variables.dsn#">
			SELECT
				DivisionID,
				DivisionName
			FROM	OrganizationDivision
			WHERE	0=0
		
		
		<cfif structKeyExists(arguments,"SuperDivisionID") and len(arguments.SuperDivisionID)>
			AND	SuperDivisionID = <cfqueryparam value="#LSParseNumber(arguments.SuperDivisionID)#" CFSQLType="cf_sql_integer" />
		</cfif>
		
			ORDER BY DivisionName
		</cfquery>
		
		<cfreturn qList />
	</cffunction>

	<cffunction name="getByAttributesQuery" access="public" output="false" returntype="query">
		<cfargument name="DivisionID" type="numeric" required="false" />
		<cfargument name="DivisionName" type="string" required="false" />
		<cfargument name="DivisionAbv" type="string" required="false" />
		<cfargument name="SamasDivisionID" type="string" required="false" />
		<cfargument name="SuperDivisionID" type="numeric" required="false" />
		<cfargument name="DivisionActive" type="numeric" required="false" />
		<cfargument name="orderby" type="string" required="false" />
		
		<cfset var qList = "" />		
		<cfquery name="qList" datasource="#variables.dsn#">
			SELECT
				DivisionID,
				DivisionName,
				DivisionAbv,
				SamasDivisionID,
				SuperDivisionID,
				DivisionActive
			FROM	OrganizationDivision
			WHERE	0=0
		
		<cfif structKeyExists(arguments,"DivisionID") and len(arguments.DivisionID)>
			AND	DivisionID = <cfqueryparam value="#arguments.DivisionID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"DivisionName") and len(arguments.DivisionName)>
			AND	DivisionName = <cfqueryparam value="#arguments.DivisionName#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"DivisionAbv") and len(arguments.DivisionAbv)>
			AND	DivisionAbv = <cfqueryparam value="#arguments.DivisionAbv#" CFSQLType="cf_sql_char" />
		</cfif>
		<cfif structKeyExists(arguments,"SamasDivisionID") and len(arguments.SamasDivisionID)>
			AND	SamasDivisionID = <cfqueryparam value="#arguments.SamasDivisionID#" CFSQLType="cf_sql_char" />
		</cfif>
		<cfif structKeyExists(arguments,"SuperDivisionID") and len(arguments.SuperDivisionID)>
			AND	SuperDivisionID = <cfqueryparam value="#arguments.SuperDivisionID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"DivisionActive") and len(arguments.DivisionActive)>
			AND	DivisionActive = <cfqueryparam value="#arguments.DivisionActive#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments, "orderby") and len(arguments.orderBy)>
			ORDER BY #arguments.orderby#
		</cfif>
		</cfquery>
		
		<cfreturn qList />
	</cffunction>

	<cffunction name="getByAttributes" access="public" output="false" returntype="array">
		<cfargument name="DivisionID" type="numeric" required="false" />
		<cfargument name="DivisionName" type="string" required="false" />
		<cfargument name="DivisionAbv" type="string" required="false" />
		<cfargument name="SamasDivisionID" type="string" required="false" />
		<cfargument name="SuperDivisionID" type="numeric" required="false" />
		<cfargument name="DivisionActive" type="numeric" required="false" />
		<cfargument name="orderby" type="string" required="false" />
		
		<cfset var qList = getByAttributesQuery(argumentCollection=arguments) />		
		<cfset var arrObjects = arrayNew(1) />
		<cfset var tmpObj = "" />
		<cfset var i = 0 />
		<cfloop from="1" to="#qList.recordCount#" index="i">
			<cfset tmpObj = createObject("component","organizationDivision").init(argumentCollection=queryRowToStruct(qList,i)) />
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
