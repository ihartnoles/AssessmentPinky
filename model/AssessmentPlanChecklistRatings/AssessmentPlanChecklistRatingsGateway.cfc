
<cfcomponent displayname="AssessmentPlanChecklistRatingsGateway" output="false">
	<cffunction name="init" access="public" output="false" returntype="AssessmentPlanChecklistRatingsGateway">
		<cfargument name="dsn" type="string" required="true" />
		<cfset variables.dsn = arguments.dsn />
		<cfreturn this />
	</cffunction>
	
	<cffunction name="getByAttributesQuery" access="public" output="false" returntype="query">
		<cfargument name="ChecklistRatingID" type="numeric" required="false" />
		<cfargument name="PlanID" type="numeric" required="false" />
		<cfargument name="ReportingUnitID" type="numeric" required="false" />
		<cfargument name="ChecklistTypeID" type="numeric" required="false" />
		<cfargument name="Rating" type="string" required="false" />
		<cfargument name="orderby" type="string" required="false" />
		
		<cfset var qList = "" />		
		<cfquery name="qList" datasource="#variables.dsn#">
			SELECT
				ChecklistRatingID,
				PlanID,
				ReportingUnitID,
				ChecklistTypeID,
				Rating,
				CAST(ChecklistTypeID as varchar(10)) + '@' + Rating AS composite
			FROM	AssessmentPlanChecklistRating
			WHERE	0=0
		
		<cfif structKeyExists(arguments,"ChecklistRatingID") and len(arguments.ChecklistRatingID)>
			AND	ChecklistRatingID = <cfqueryparam value="#arguments.ChecklistRatingID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"PlanID") and len(arguments.PlanID)>
			AND	PlanID = <cfqueryparam value="#arguments.PlanID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"ReportingUnitID") and len(arguments.ReportingUnitID)>
			AND	ReportingUnitID = <cfqueryparam value="#arguments.ReportingUnitID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"ChecklistTypeID") and len(arguments.ChecklistTypeID)>
			AND	ChecklistTypeID = <cfqueryparam value="#arguments.ChecklistTypeID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"Rating") and len(arguments.Rating)>
			AND	Rating = <cfqueryparam value="#arguments.Rating#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments, "orderby") and len(arguments.orderBy)>
			ORDER BY #arguments.orderby#
		</cfif>
		</cfquery>
		
		<cfreturn qList />
	</cffunction>

	<cffunction name="getByAttributes" access="public" output="false" returntype="array">
		<cfargument name="ChecklistRatingID" type="numeric" required="false" />
		<cfargument name="PlanID" type="numeric" required="false" />
		<cfargument name="ReportingUnitID" type="numeric" required="false" />
		<cfargument name="ChecklistTypeID" type="numeric" required="false" />
		<cfargument name="Rating" type="string" required="false" />
		<cfargument name="orderby" type="string" required="false" />
		
		<cfset var qList = getByAttributesQuery(argumentCollection=arguments) />		
		<cfset var arrObjects = arrayNew(1) />
		<cfset var tmpObj = "" />
		<cfset var i = 0 />
		<cfloop from="1" to="#qList.recordCount#" index="i">
			<cfset tmpObj = createObject("component","AssessmentPlanChecklistRatings").init(argumentCollection=queryRowToStruct(qList,i)) />
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
