
<cfcomponent displayname="campusGateway" output="false">
	<cffunction name="init" access="public" output="false" returntype="campusGateway">
		<cfargument name="dsn" type="string" required="true" />
		<cfset variables.dsn = arguments.dsn />
		<cfreturn this />
	</cffunction>
	
	<cffunction name="getAllCampuses" access="public" output="false" returntype="query">
		<cfset local.qList = "" />		
		<cfquery name="local.qList" datasource="#variables.dsn#">
			SELECT
				Campus,
				CampusDescription
			FROM	Campus			
		</cfquery>
		
		<cfreturn local.qList />
	</cffunction>


	<cffunction name="getByAttributesQuery" access="public" output="false" returntype="query">
		<cfargument name="Campus" type="string" required="false" />
		<cfargument name="CampusDescription" type="string" required="false" />
		<cfargument name="orderby" type="string" required="false" />
		
		<cfset local.qList = "" />		
		<cfquery name="local.qList" datasource="#variables.dsn#">
			SELECT
				Campus,
				CampusDescription
			FROM	Campus
			WHERE	0=0
		
		<cfif structKeyExists(arguments,"Campus") and len(arguments.Campus)>
			AND	Campus = <cfqueryparam value="#arguments.Campus#" CFSQLType="cf_sql_char" />
		</cfif>
		<cfif structKeyExists(arguments,"CampusDescription") and len(arguments.CampusDescription)>
			AND	CampusDescription = <cfqueryparam value="#arguments.CampusDescription#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments, "orderby") and len(arguments.orderBy)>
			ORDER BY #arguments.orderby#
		</cfif>
		</cfquery>
		
		<cfreturn local.qList />
	</cffunction>

	<cffunction name="getByAttributes" access="public" output="false" returntype="array">
		<cfargument name="Campus" type="string" required="false" />
		<cfargument name="CampusDescription" type="string" required="false" />
		<cfargument name="orderby" type="string" required="false" />
		
		<cfset local.qList = getByAttributesQuery(argumentCollection=arguments) />		
		<cfset var arrObjects = arrayNew(1) />
		<cfset var tmpObj = "" />
		<cfset var i = 0 />
		<cfloop from="1" to="#qList.recordCount#" index="i">
			<cfset tmpObj = createObject("component","campus").init(argumentCollection=queryRowToStruct(qList,i)) />
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
