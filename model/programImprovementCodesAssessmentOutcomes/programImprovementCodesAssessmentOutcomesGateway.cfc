
<cfcomponent displayname="programImprovementCodesAssessmentOutcomesGateway" output="false">
	<cffunction name="init" access="public" output="false" returntype="programImprovementCodesAssessmentOutcomesGateway">
		<cfargument name="dsn" type="string" required="true" />
		<cfset variables.dsn = arguments.dsn />
		<cfreturn this />
	</cffunction>
	
	<cffunction name="getByAttributesQuery" access="public" output="false" returntype="query">
		<cfargument name="id" type="numeric" required="false" />
		<cfargument name="outcomeID" type="numeric" required="false" />
		<cfargument name="reportingUnitID" type="numeric" required="false" />
		<cfargument name="planID" type="numeric" required="false" />
		<cfargument name="ProgramImprovementCodeID" type="numeric" required="false" />
		<cfargument name="orderby" type="string" required="false" />
		
		<cfset var qList = "" />		
		<cfquery name="qList" datasource="#variables.dsn#">
			SELECT
				id,
				outcomeID,
				reportingUnitID,
				planID,
				ProgramImprovementCodeID
			FROM	ProgramImprovmentCodesAssessmentOutcomes
			WHERE	0=0
		
		<cfif structKeyExists(arguments,"id") and len(arguments.id)>
			AND	id = <cfqueryparam value="#arguments.id#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"outcomeID") and len(arguments.outcomeID)>
			AND	outcomeID = <cfqueryparam value="#arguments.outcomeID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"reportingUnitID") and len(arguments.reportingUnitID)>
			AND	reportingUnitID = <cfqueryparam value="#arguments.reportingUnitID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"planID") and len(arguments.planID)>
			AND	planID = <cfqueryparam value="#arguments.planID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"ProgramImprovementCodeID") and len(arguments.ProgramImprovementCodeID)>
			AND	ProgramImprovementCodeID = <cfqueryparam value="#arguments.ProgramImprovementCodeID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments, "orderby") and len(arguments.orderBy)>
			ORDER BY #arguments.orderby#
		</cfif>
		</cfquery>
		
		<cfreturn qList />
	</cffunction>


	<cffunction name="getSelectedProgImpCodes" access="public" output="false" returntype="query">
		<cfargument name="id" type="numeric" required="false" />
		<cfargument name="outcomeID" type="numeric" required="false" />
		<cfargument name="reportingUnitID" type="numeric" required="false" />
		<cfargument name="planID" type="numeric" required="false" />
		<cfargument name="ProgramImprovementCodeID" type="numeric" required="false" />
		<cfargument name="orderby" type="string" required="false" />
		
		<cfset var qList = "" />		
		<cfquery name="qList" datasource="#variables.dsn#">
			SELECT
				id,
				outcomeID,
				reportingUnitID,
				planID,
				ProgramImprovementCodeID
			FROM	ProgramImprovmentCodesAssessmentOutcomes
			WHERE	0=0
		
		
		<cfif structKeyExists(arguments,"outcomeID") and len(arguments.outcomeID)>
			AND	outcomeID IN (<cfqueryparam value="#arguments.outcomeID#" CFSQLType="cf_sql_integer" />)
		</cfif>
		
		</cfquery>
		
		<cfreturn qList />
	</cffunction>

	<cffunction name="deleteImprovementCodes" access="public" output="false" returntype="boolean">
		<cfargument name="OutcomeID" type="numeric" required="true" />
		
		<!--- 
		<cfdump var="#arguments#" abort="false" label="arguments in Gateway" />
		<cfdump var="#request.event.getArgs()#" abort="true" label="@@deleteALCCategories in Gateway" />
		--->

		<cfset var qDeleteCategories = "" />		

		<cfquery name="qDeleteCategories" datasource="#variables.dsn#">
			DELETE
			FROM	ProgramImprovmentCodesAssessmentOutcomes
			WHERE		OutcomeID = <cfqueryparam value="#arguments.OutcomeID#" CFSQLType="cf_sql_integer" />
		</cfquery>
		<!---
		<cfdump var="#qList#" abort="true" label="@@deleteALCCategories in Gateway" />
		--->
		<cfreturn true />
	</cffunction>
	
	<cffunction name="getByAttributes" access="public" output="false" returntype="array">
		<cfargument name="id" type="numeric" required="false" />
		<cfargument name="outcomeID" type="numeric" required="false" />
		<cfargument name="reportingUnitID" type="numeric" required="false" />
		<cfargument name="planID" type="numeric" required="false" />
		<cfargument name="ProgramImprovementCodeID" type="numeric" required="false" />
		<cfargument name="orderby" type="string" required="false" />
		
		<cfset var qList = getByAttributesQuery(argumentCollection=arguments) />		
		<cfset var arrObjects = arrayNew(1) />
		<cfset var tmpObj = "" />
		<cfset var i = 0 />
		<cfloop from="1" to="#qList.recordCount#" index="i">
			<cfset tmpObj = createObject("component","programImprovementCodesAssessmentOutcomes").init(argumentCollection=queryRowToStruct(qList,i)) />
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
