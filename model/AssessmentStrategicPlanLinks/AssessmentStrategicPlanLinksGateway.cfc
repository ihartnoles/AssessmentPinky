
<cfcomponent displayname="AssessmentStrategicPlanLinksGateway" output="false">
	<cffunction name="init" access="public" output="false" returntype="AssessmentStrategicPlanLinksGateway">
		<cfargument name="dsn" type="string" required="true" />
		<cfset variables.dsn = arguments.dsn />
		<cfreturn this />
	</cffunction>
	
	<cffunction name="getByAttributes" access="public" output="false" returntype="query">
		<cfargument name="RecordID" type="numeric" required="false" />
		<cfargument name="OutcomeID" type="numeric" required="false" />
		<cfargument name="ObjectiveID" type="numeric" required="false" />
		<cfargument name="orderby" type="string" required="false" />
			
		<cfquery name="local.qList" datasource="#variables.dsn#">
			SELECT
				RecordID,
				OutcomeID,
				ObjectiveID
			FROM	
				AssessmentStrategicPlanLinks
			WHERE	
				0=0
		
		<cfif structKeyExists(arguments,"RecordID") and len(arguments.RecordID)>
			AND	RecordID = <cfqueryparam value="#arguments.RecordID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"OutcomeID") and len(arguments.OutcomeID)>
			AND	OutcomeID = <cfqueryparam value="#arguments.OutcomeID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"ObjectiveID") and len(arguments.ObjectiveID)>
			AND	ObjectiveID = <cfqueryparam value="#arguments.ObjectiveID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments, "orderby") and len(arguments.orderBy)>
			ORDER BY #arguments.orderby#
		</cfif>
		</cfquery>
		
		<cfreturn local.qList />
	</cffunction>

	<cffunction name="deleteGoals" access="public" output="false" returntype="boolean">
		<cfargument name="OutcomeID" type="numeric" required="true" />
		
		<!--- 
		<cfdump var="#arguments#" abort="false" label="arguments in Gateway" />
		<cfdump var="#request.event.getArgs()#" abort="true" label="@@deleteALCCategories in Gateway" />
		--->

		<cfset var qDeleteGoals = "" />		

		<cfquery name="qDeleteGoals" datasource="#variables.dsn#">
			DELETE 
			FROM	AssessmentStrategicPlanLinks
			WHERE		OutcomeID = <cfqueryparam value="#arguments.OutcomeID#" CFSQLType="cf_sql_integer" />
		</cfquery>
		<!---
		<cfdump var="#qList#" abort="true" label="@@deleteALCCategories in Gateway" />
		--->
		<cfreturn true />
	</cffunction>
	

	<cffunction name="saveGoals" access="public" output="false" returntype="boolean">
		<cfargument name="OutcomeID" type="numeric" required="true" />
		<cfargument name="ObjectiveID" type="numeric" required="true" />

		<!--- 
		<cfdump var="#arguments#" abort="true" label="arguments @ AssessmentStrategicPlanLinksGateway - 48" />
		--->

		<cfset var saveGoals = "" />		
		
		<cfquery name="saveGoals" datasource="#variables.dsn#">
			INSERT INTO AssessmentStrategicPlanLinks(
				OutcomeID,
				ObjectiveID
			)VALUES(
				<cfqueryparam value="#arguments.OutcomeID#" CFSQLType="cf_sql_integer" />,
				<cfqueryparam value="#arguments.ObjectiveID#" CFSQLType="cf_sql_integer" />
			)
		</cfquery>
		
		<cfreturn true />

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
