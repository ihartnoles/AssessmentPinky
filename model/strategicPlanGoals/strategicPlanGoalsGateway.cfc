
<cfcomponent displayname="strategicPlanGoalsGateway" output="false">
	<cffunction name="init" access="public" output="false" returntype="strategicPlanGoalsGateway">
		<cfargument name="dsn" type="string" required="true" />
		<cfset variables.dsn = arguments.dsn />
		<cfreturn this />
	</cffunction>
	
	<cffunction name="getByAttributesQuery" access="public" output="false" returntype="query">
		<cfargument name="ID" type="numeric" required="false" />
		<cfargument name="objective" type="string" required="false" />
		<cfargument name="goal" type="string" required="false" />
		<cfargument name="orderby" type="string" required="false" />
		
		<cfset var qList = "" />		
		<cfquery name="qList" datasource="#variables.dsn#">
			SELECT
				ID,
				objective,
				goal
			FROM	StrategicPlanGoalList
			WHERE	0=0
		
		<cfif structKeyExists(arguments,"ID") and len(arguments.ID)>
			AND	ID = <cfqueryparam value="#arguments.ID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"objective") and len(arguments.objective)>
			AND	objective = <cfqueryparam value="#arguments.objective#" CFSQLType="cf_sql_longvarchar" />
		</cfif>
		<cfif structKeyExists(arguments,"goal") and len(arguments.goal)>
			AND	goal = <cfqueryparam value="#arguments.goal#" CFSQLType="cf_sql_longvarchar" />
		</cfif>
		<cfif structKeyExists(arguments, "orderby") and len(arguments.orderBy)>
			ORDER BY #arguments.orderby#
		</cfif>
		</cfquery>
		
		<cfreturn qList />
	</cffunction>


	<cffunction name="getGoalsListQuery" access="public" output="false" returntype="query">
				
		<cfset var qGoalsListQuery = "" />

		<cfquery name="qGoalsListQuery" datasource="#variables.dsn#">
			SELECT  StrategicPlanGoals.GoalID, 
					StrategicPlanGoals.GoalTitle, 
					StrategicPlanObjectives.ObjectiveID, 
					StrategicPlanObjectives.ObjectiveOrder, 
					StrategicPlanObjectives.ObjectiveTitle, 
					StrategicPlanObjectives.ObjectiveActive
			FROM    StrategicPlanGoals 
				INNER JOIN StrategicPlanObjectives ON StrategicPlanGoals.GoalID = StrategicPlanObjectives.GoalID		 						      
		</cfquery>
		
		<cfreturn qGoalsListQuery />
	</cffunction>



	<cffunction name="getByAttributes" access="public" output="false" returntype="array">
		<cfargument name="ID" type="numeric" required="false" />
		<cfargument name="objective" type="string" required="false" />
		<cfargument name="goal" type="string" required="false" />
		<cfargument name="orderby" type="string" required="false" />
		
		<cfset var qList = getByAttributesQuery(argumentCollection=arguments) />		
		<cfset var arrObjects = arrayNew(1) />
		<cfset var tmpObj = "" />
		<cfset var i = 0 />
		<cfloop from="1" to="#qList.recordCount#" index="i">
			<cfset tmpObj = createObject("component","strategicPlanGoals").init(argumentCollection=queryRowToStruct(qList,i)) />
			<cfset arrayAppend(arrObjects,tmpObj) />
		</cfloop>
				
		<cfreturn arrObjects />
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
			FROM	OutcomeStrategicPlanGoals
			WHERE		OutcomeID = <cfqueryparam value="#arguments.OutcomeID#" CFSQLType="cf_sql_integer" />
		</cfquery>
		<!---
		<cfdump var="#qList#" abort="true" label="@@deleteALCCategories in Gateway" />
		--->
		<cfreturn true />
	</cffunction>

	<cffunction name="saveGoals" access="public" output="false" returntype="boolean">
		<cfargument name="OutcomeID" type="numeric" required="true" />
		<cfargument name="SubCategoryID" type="numeric" required="true" />

		<!--- 
		<cfdump var="#arguments#" abort="true" label="arguments in saveGoals Gateway" />
		--->

		<cfset var saveGoals = "" />		
		
		<cfquery name="saveGoals" datasource="#variables.dsn#">
			INSERT INTO outcomeStrategicPlanGoals
					(
					OutcomeID,
					SubCategoryID
					)
				VALUES
					(
					<cfqueryparam value="#arguments.OutcomeID#" CFSQLType="cf_sql_integer" />,
					<cfqueryparam value="#arguments.SubCategoryID#" CFSQLType="cf_sql_integer" />
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
