
<cfcomponent displayname="outcomeStrategicPlanGoalsGateway" output="false">
	<cffunction name="init" access="public" output="false" returntype="outcomeStrategicPlanGoalsGateway">
		<cfargument name="dsn" type="string" required="true" />
		<cfset variables.dsn = arguments.dsn />
		<cfreturn this />
	</cffunction>
	
	<cffunction name="getByAttributesQuery" access="public" output="false" returntype="query">
		<cfargument name="ID" type="numeric" required="false" />
		<cfargument name="goalID" type="numeric" required="false" />
		<cfargument name="outcomeID" type="numeric" required="false" />
		<cfargument name="reportingUnitID" type="numeric" required="false" />
		<cfargument name="planID" type="numeric" required="false" />
		<cfargument name="orderby" type="string" required="false" />
		
		<cfset var qList = "" />		
		<cfquery name="qList" datasource="#variables.dsn#">
			SELECT  StrategicPlanGoalList.ID, 
					StrategicPlanGoalList.objective, 
					StrategicPlanGoalList.goal,
					OutcomeStrategicPlanGoals.goalID
			FROM     OutcomeStrategicPlanGoals 
				INNER JOIN  StrategicPlanGoalList ON OutcomeStrategicPlanGoals.goalID = StrategicPlanGoalList.ID
																							
			WHERE	0=0
		
		<cfif structKeyExists(arguments,"ID") and len(arguments.ID)>
			AND	ID = <cfqueryparam value="#arguments.ID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"goalID") and len(arguments.goalID)>
			AND	goalID = <cfqueryparam value="#arguments.goalID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"outcomeID") and len(arguments.outcomeID)>
			AND	OutcomeStrategicPlanGoals.outcomeID = <cfqueryparam value="#arguments.outcomeID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"reportingUnitID") and len(arguments.reportingUnitID)>
			AND	reportingUnitID = <cfqueryparam value="#arguments.reportingUnitID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"planID") and len(arguments.planID)>
			AND	planID = <cfqueryparam value="#arguments.planID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments, "orderby") and len(arguments.orderBy)>
			ORDER BY #arguments.orderby#
		</cfif>
		</cfquery>
		
		<cfreturn qList />
	</cffunction>

	<cffunction name="getGoalsByPlanID" access="public" output="false" returntype="query">
		<cfargument name="planID" type="numeric" required="false" />

			<cfset var qSelectedStrategicPlans = "" />	

			<cfquery name="qSelectedStrategicPlans" datasource="#variables.dsn#">
				SELECT a.OutcomeID, a.ObjectiveID, g.Goalid, g.GoalOrder, g.GoalTitle, g.GoalActive,  o.ObjectiveID, o.ObjectiveOrder, o.ObjectiveTitle, o.HelpColumnID, o.ObjectiveActive  
				FROM AssessmentStrategicPlanLinks a, StrategicPlanGoals g, StrategicPlanObjectives o  
			    WHERE a.ObjectiveID = o.ObjectiveID 
				And o.GoalID = g.GoalID 
				AND  a.OutcomeID IN (
									SELECT OutcomeID FROM AssessmentPlanOutcomes WHERE 0=0
									
									<cfif structKeyExists(arguments,"planID") and len(arguments.planID)>
										AND	planID = <cfqueryparam value="#arguments.planID#" CFSQLType="cf_sql_integer" />
									</cfif>
									)
			</cfquery>

			<cfreturn qSelectedStrategicPlans />
	</cffunction>

	<cffunction name="getGoalsByOutcomeID" access="public" output="false" returntype="query">
		<cfargument name="outcomeID" type="numeric" required="false" />

			<cfset var qGoalsByOutcomeID = "" />	

			<cfquery name="qGoalsByOutcomeID" datasource="#variables.dsn#">
				SELECT a.OutcomeID, a.ObjectiveID, g.Goalid, g.GoalOrder, g.GoalTitle, g.GoalActive,  o.ObjectiveID, o.ObjectiveOrder, o.ObjectiveTitle, o.HelpColumnID, o.ObjectiveActive  
				FROM AssessmentStrategicPlanLinks a, StrategicPlanGoals g, StrategicPlanObjectives o  
			    WHERE a.ObjectiveID = o.ObjectiveID 
				And o.GoalID = g.GoalID 
				AND  a.OutcomeID = <cfqueryparam value="#arguments.outcomeID#" CFSQLType="cf_sql_integer" />
			</cfquery>

			<cfreturn qGoalsByOutcomeID />
	</cffunction>


	<cffunction name="getByAttributes" access="public" output="false" returntype="array">
		<cfargument name="ID" type="numeric" required="false" />
		<cfargument name="goalID" type="numeric" required="false" />
		<cfargument name="outcomeID" type="numeric" required="false" />
		<cfargument name="reportingUnitID" type="numeric" required="false" />
		<cfargument name="planID" type="numeric" required="false" />
		<cfargument name="orderby" type="string" required="false" />
		
		<cfset var qList = getByAttributesQuery(argumentCollection=arguments) />		
		<cfset var arrObjects = arrayNew(1) />
		<cfset var tmpObj = "" />
		<cfset var i = 0 />
		<cfloop from="1" to="#qList.recordCount#" index="i">
			<cfset tmpObj = createObject("component","outcomeStrategicPlanGoals").init(argumentCollection=queryRowToStruct(qList,i)) />
			<cfset arrayAppend(arrObjects,tmpObj) />
		</cfloop>
				
		<cfreturn arrObjects />
	</cffunction>

	

	<cffunction name="saveGoals" access="public" output="false" returntype="boolean">
		<cfargument name="goalID" type="numeric" required="false" />
		<cfargument name="outcomeID" type="numeric" required="false" />
		<cfargument name="reportingUnitID" type="numeric" required="false" />
		<cfargument name="planID" type="numeric" required="false" />

		<!--- 
		<cfdump var="#arguments#" abort="true" label="arguments in saveGoals Gateway" />
		--->

		<cfset var saveGoals = "" />		
		
		<cfquery name="saveGoals" datasource="#variables.dsn#">
				INSERT INTO OutcomeStrategicPlanGoals
					(
					goalID,
					outcomeID,
					reportingUnitID,
					planID
					)
				VALUES
					(
					<cfqueryparam value="#arguments.goalID#" CFSQLType="cf_sql_integer" null="#not len(arguments.goalID)#" />,
					<cfqueryparam value="#arguments.outcomeID#" CFSQLType="cf_sql_integer" null="#not len(arguments.outcomeID)#" />,
					<cfqueryparam value="#arguments.reportingUnitID#" CFSQLType="cf_sql_integer" null="#not len(arguments.reportingUnitID)#" />,
					<cfqueryparam value="#arguments.planID#" CFSQLType="cf_sql_integer" null="#not len(arguments.planID)#" />
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
