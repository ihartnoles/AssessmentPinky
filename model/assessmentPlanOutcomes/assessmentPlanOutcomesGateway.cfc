
<cfcomponent displayname="assessmentPlanOutcomesGateway" output="false">
	<cffunction name="init" access="public" output="false" returntype="assessmentPlanOutcomesGateway">
		<cfargument name="dsn" type="string" required="true" />
		<cfset variables.dsn = arguments.dsn />
		<cfreturn this />
	</cffunction>
	
	<cffunction name="getByAttributesQuery" access="public" output="false" returntype="query">
		<cfargument name="OutcomeID" type="numeric" required="false" />
		<cfargument name="PlanID" type="numeric" required="false" />
		<cfargument name="OutcomeOrder" type="numeric" required="false" />
		<cfargument name="OutcomeDescription" type="string" required="false" />
		<cfargument name="OutcomeStrategy" type="string" required="false" />
		<cfargument name="OutcomeMethod" type="string" required="false" />
		<cfargument name="OutcomeCriterion" type="string" required="false" />
		<cfargument name="OutcomeResults" type="string" required="false" />
		<cfargument name="OutcomePlanningImprovement" type="string" required="false" />
		<cfargument name="OutcomeResources" type="string" required="false" />
		<cfargument name="OutcomeCreateDate" type="date" required="false" />
		<cfargument name="OutcomePlanLastChangeDate" type="date" required="false" />
		<cfargument name="orderby" type="string" required="false" />
		
		<cfset var qList = "" />		
		<cfquery name="qList" datasource="#variables.dsn#">
			SELECT
				OutcomeID,
				PlanID,
				OutcomeOrder,
				OutcomeDescription,
				OutcomeStrategy,
				OutcomeMethod,
				OutcomeCriterion,
				OutcomeResults,
				OutcomePlanningImprovement,
				OutcomeResources,
				OutcomeCreateDate,
				OutcomePlanLastChangeDate,
				QEP_URI_related,
				IFP_related,
				Online
			FROM	AssessmentPlanOutcomes
			WHERE	0=0
		
		<cfif structKeyExists(arguments,"OutcomeID") and len(arguments.OutcomeID)>
			AND	OutcomeID = <cfqueryparam value="#arguments.OutcomeID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"PlanID") and len(arguments.PlanID)>
			AND	PlanID = <cfqueryparam value="#arguments.PlanID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"OutcomeOrder") and len(arguments.OutcomeOrder)>
			AND	OutcomeOrder = <cfqueryparam value="#arguments.OutcomeOrder#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"OutcomeDescription") and len(arguments.OutcomeDescription)>
			AND	OutcomeDescription = <cfqueryparam value="#arguments.OutcomeDescription#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"OutcomeStrategy") and len(arguments.OutcomeStrategy)>
			AND	OutcomeStrategy = <cfqueryparam value="#arguments.OutcomeStrategy#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"OutcomeMethod") and len(arguments.OutcomeMethod)>
			AND	OutcomeMethod = <cfqueryparam value="#arguments.OutcomeMethod#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"OutcomeCriterion") and len(arguments.OutcomeCriterion)>
			AND	OutcomeCriterion = <cfqueryparam value="#arguments.OutcomeCriterion#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"OutcomeResults") and len(arguments.OutcomeResults)>
			AND	OutcomeResults = <cfqueryparam value="#arguments.OutcomeResults#" CFSQLType="cf_sql_longvarchar" />
		</cfif>
		<cfif structKeyExists(arguments,"OutcomePlanningImprovement") and len(arguments.OutcomePlanningImprovement)>
			AND	OutcomePlanningImprovement = <cfqueryparam value="#arguments.OutcomePlanningImprovement#" CFSQLType="cf_sql_longvarchar" />
		</cfif>
		<cfif structKeyExists(arguments,"OutcomeResources") and len(arguments.OutcomeResources)>
			AND	OutcomeResources = <cfqueryparam value="#arguments.OutcomeResources#" CFSQLType="cf_sql_longvarchar" />
		</cfif>
		<cfif structKeyExists(arguments,"OutcomeCreateDate") and len(arguments.OutcomeCreateDate)>
			AND	OutcomeCreateDate = <cfqueryparam value="#arguments.OutcomeCreateDate#" CFSQLType="cf_sql_timestamp" />
		</cfif>
		<cfif structKeyExists(arguments,"OutcomePlanLastChangeDate") and len(arguments.OutcomePlanLastChangeDate)>
			AND	OutcomePlanLastChangeDate = <cfqueryparam value="#arguments.OutcomePlanLastChangeDate#" CFSQLType="cf_sql_timestamp" />
		</cfif>
		<cfif structKeyExists(arguments, "orderby") and len(arguments.orderBy)>
			ORDER BY #arguments.orderby#
		</cfif>
		</cfquery>
		
		<cfreturn qList />
	</cffunction>

	<cffunction name="countOutcomes" access="public" output="false" returntype="query">
		<cfargument name="PlanID" type="numeric" required="false" />
		
		<cfset var qList = "" />		
		<cfquery name="qList" datasource="#variables.dsn#">
			SELECT
				OutcomeID,
				PlanID,
				OutcomeOrder,
				OutcomeDescription,
				OutcomeStrategy,
				OutcomeMethod,
				OutcomeCriterion,
				OutcomeResults,
				OutcomePlanningImprovement,
				OutcomeResources,
				OutcomeCreateDate,
				OutcomePlanLastChangeDate,
				QEP_URI_related,
				IFP_related,
				Online
			FROM	AssessmentPlanOutcomes
			WHERE	0=0
		
		
		<cfif structKeyExists(arguments,"PlanID") and len(arguments.PlanID)>
			AND	PlanID = <cfqueryparam value="#arguments.PlanID#" CFSQLType="cf_sql_integer" />
		</cfif>

		ORDER BY OutcomeOrder
		
		</cfquery>
		
		<cfreturn qList />
	</cffunction>

	<cffunction name="getMAXOutcomeOrder" access="public" output="false" returntype="numeric">
		<cfargument name="PlanID" type="numeric" required="false" />
		
		<cfset var qList = "" />		
		<cfquery name="qList" datasource="#variables.dsn#">
			SELECT
				max(outcomeorder) + 1 AS CT
			FROM	AssessmentPlanOutcomes
			WHERE	0=0
		
		
		<cfif structKeyExists(arguments,"PlanID") and len(arguments.PlanID)>
			AND	PlanID = <cfqueryparam value="#arguments.PlanID#" CFSQLType="cf_sql_integer" />
		</cfif>
	
		</cfquery>
		
		<cfreturn qList.CT />
	</cffunction>

	<cffunction name="getOutcomeDetail" access="public" output="false" returntype="query">
		<cfargument name="OutcomeID" type="numeric" required="false" />
		
		<!---
		<cfdump var="#arguments#" abort="true" label="@@assPlanOutcomesGateway" />
		--->
		
		<cfset var qList = "" />		
		<cfquery name="qList" datasource="#variables.dsn#">
			SELECT
				OutcomeID,
				PlanID,
				OutcomeOrder,
				OutcomeDescription,
				OutcomeStrategy,
				OutcomeMethod,
				OutcomeCriterion,
				OutcomeResults,
				OutcomePlanningImprovement,
				OutcomeResources,
				OutcomeCreateDate,
				OutcomePlanLastChangeDate,
				QEP_URI_related,
				IFP_related,
				Online
			FROM	AssessmentPlanOutcomes
			WHERE	0=0
		
		
		<cfif structKeyExists(arguments,"OutcomeID") and len(arguments.OutcomeID)>
			AND	OutcomeID = <cfqueryparam value="#arguments.OutcomeID#" CFSQLType="cf_sql_integer" />
		</cfif>
		
		</cfquery>
		
		<cfreturn qList />
	</cffunction>

	<cffunction name="getByAttributes" access="public" output="false" returntype="array">
		<cfargument name="OutcomeID" type="numeric" required="false" />
		<cfargument name="PlanID" type="numeric" required="false" />
		<cfargument name="OutcomeOrder" type="numeric" required="false" />
		<cfargument name="OutcomeDescription" type="string" required="false" />
		<cfargument name="OutcomeStrategy" type="string" required="false" />
		<cfargument name="OutcomeMethod" type="string" required="false" />
		<cfargument name="OutcomeCriterion" type="string" required="false" />
		<cfargument name="OutcomeResults" type="string" required="false" />
		<cfargument name="OutcomePlanningImprovement" type="string" required="false" />
		<cfargument name="OutcomeResources" type="string" required="false" />
		<cfargument name="OutcomeCreateDate" type="date" required="false" />
		<cfargument name="OutcomePlanLastChangeDate" type="date" required="false" />
		<cfargument name="orderby" type="string" required="false" />
		
		<cfset var qList = getByAttributesQuery(argumentCollection=arguments) />		
		<cfset var arrObjects = arrayNew(1) />
		<cfset var tmpObj = "" />
		<cfset var i = 0 />
		<cfloop from="1" to="#qList.recordCount#" index="i">
			<cfset tmpObj = createObject("component","assessmentPlanOutcomes").init(argumentCollection=queryRowToStruct(qList,i)) />
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
