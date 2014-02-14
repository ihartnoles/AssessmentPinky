
<cfcomponent displayname="assessmentPlanOutcomesDAO" hint="table ID column = OutcomeID">

	<cffunction name="init" access="public" output="false" returntype="assessmentPlanOutcomesDAO">
		<cfargument name="dsn" type="string" required="true">
		<cfset variables.dsn = arguments.dsn>
		<cfreturn this>
	</cffunction>
	
	<cffunction name="create" access="public" output="false" returntype="numeric">
		<cfargument name="assessmentPlanOutcomes" type="assessmentPlanOutcomes" required="true" />

		<!---
		<cfdump var="#arguments#" abort="true" label="@@assPlanOutcomesDAO"/>
		 --->

		<cfset var qCreate = "" />
		<!--- <cftry> --->
			<cfquery name="qCreate" datasource="#variables.dsn#" result="res" >
				INSERT INTO AssessmentPlanOutcomes
					(
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
					)
				VALUES
					(
					<cfqueryparam value="#arguments.assessmentPlanOutcomes.getPlanID()#" CFSQLType="cf_sql_integer" />,
					<cfqueryparam value="#arguments.assessmentPlanOutcomes.getOutcomeOrder()#" CFSQLType="cf_sql_integer" />,
					<cfqueryparam value="#arguments.assessmentPlanOutcomes.getOutcomeDescription()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.assessmentPlanOutcomes.getOutcomeDescription())#" />,
					<cfqueryparam value="#arguments.assessmentPlanOutcomes.getOutcomeStrategy()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.assessmentPlanOutcomes.getOutcomeStrategy())#" />,
					<cfqueryparam value="#arguments.assessmentPlanOutcomes.getOutcomeMethod()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.assessmentPlanOutcomes.getOutcomeMethod())#" />,
					<cfqueryparam value="#arguments.assessmentPlanOutcomes.getOutcomeCriterion()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.assessmentPlanOutcomes.getOutcomeCriterion())#" />,
					<cfqueryparam value="#arguments.assessmentPlanOutcomes.getOutcomeResults()#" CFSQLType="cf_sql_longvarchar" null="#not len(arguments.assessmentPlanOutcomes.getOutcomeResults())#" />,
					<cfqueryparam value="#arguments.assessmentPlanOutcomes.getOutcomePlanningImprovement()#" CFSQLType="cf_sql_longvarchar" null="#not len(arguments.assessmentPlanOutcomes.getOutcomePlanningImprovement())#" />,
					<cfqueryparam value="#arguments.assessmentPlanOutcomes.getOutcomeResources()#" CFSQLType="cf_sql_longvarchar" null="#not len(arguments.assessmentPlanOutcomes.getOutcomeResources())#" />, 
					CURRENT_TIMESTAMP,
					CURRENT_TIMESTAMP,
					<cfqueryparam value="#arguments.assessmentPlanOutcomes.getQEP_URI_related()#" CFSQLType="cf_sql_integer" null="#not len(arguments.assessmentPlanOutcomes.getQEP_URI_related())#" />,
					<cfqueryparam value="#arguments.assessmentPlanOutcomes.getIFP_related()#" CFSQLType="cf_sql_integer" null="#not len(arguments.assessmentPlanOutcomes.getIFP_related())#" />,
					<cfqueryparam value="#arguments.assessmentPlanOutcomes.getOnline()#" CFSQLType="cf_sql_integer" null="#not len(arguments.assessmentPlanOutcomes.getOnline())#" />
					)
			</cfquery>
		<!---
			<cfcatch type="database">
				<cfreturn false />
			</cfcatch>
		</cftry>
		--->
		<cfreturn res.identitycol />
	</cffunction>

	<cffunction name="read" access="public" output="false" returntype="void">
		<cfargument name="assessmentPlanOutcomes" type="assessmentPlanOutcomes" required="true" />

		<cfset var qRead = "" />
		<cfset var strReturn = structNew() />
		<cftry>
			<cfquery name="qRead" datasource="#variables.dsn#">
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
				WHERE	OutcomeID = <cfqueryparam value="#arguments.assessmentPlanOutcomes.getOutcomeID()#" CFSQLType="cf_sql_integer" />
			</cfquery>
			<cfcatch type="database">
				<!--- leave the bean as is and set an empty query for the conditional logic below --->
				<cfset qRead = queryNew("id") />
			</cfcatch>
		</cftry>
		<cfif qRead.recordCount>
			<cfset strReturn = queryRowToStruct(qRead)>
			<cfset arguments.assessmentPlanOutcomes.init(argumentCollection=strReturn)>
		</cfif>
	</cffunction>

	<cffunction name="update" access="public" output="false" returntype="numeric">
		<cfargument name="assessmentPlanOutcomes" type="assessmentPlanOutcomes" required="true" />

		<!---
		<cfdump var="#arguments#" label="@@assessmentPlanOutcomesDAO" abort="true"/>
		--->

		<cfset var qUpdate = "" />
		<!--- <cftry> --->
			<cfquery name="qUpdate" datasource="#variables.dsn#">
				UPDATE	AssessmentPlanOutcomes
				SET
					PlanID = <cfqueryparam value="#arguments.assessmentPlanOutcomes.getPlanID()#" CFSQLType="cf_sql_integer" />,
					OutcomeOrder = <cfqueryparam value="#arguments.assessmentPlanOutcomes.getOutcomeOrder()#" CFSQLType="cf_sql_integer" />,
					OutcomeDescription = <cfqueryparam value="#arguments.assessmentPlanOutcomes.getOutcomeDescription()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.assessmentPlanOutcomes.getOutcomeDescription())#" />,
					OutcomeStrategy = <cfqueryparam value="#arguments.assessmentPlanOutcomes.getOutcomeStrategy()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.assessmentPlanOutcomes.getOutcomeStrategy())#" />,
					OutcomeMethod = <cfqueryparam value="#arguments.assessmentPlanOutcomes.getOutcomeMethod()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.assessmentPlanOutcomes.getOutcomeMethod())#" />,
					OutcomeCriterion = <cfqueryparam value="#arguments.assessmentPlanOutcomes.getOutcomeCriterion()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.assessmentPlanOutcomes.getOutcomeCriterion())#" />,
					OutcomeResults = <cfqueryparam value="#arguments.assessmentPlanOutcomes.getOutcomeResults()#" CFSQLType="cf_sql_longvarchar" null="#not len(arguments.assessmentPlanOutcomes.getOutcomeResults())#" />,
					OutcomePlanningImprovement = <cfqueryparam value="#arguments.assessmentPlanOutcomes.getOutcomePlanningImprovement()#" CFSQLType="cf_sql_longvarchar" null="#not len(arguments.assessmentPlanOutcomes.getOutcomePlanningImprovement())#" />,
					OutcomeResources = <cfqueryparam value="#arguments.assessmentPlanOutcomes.getOutcomeResources()#" CFSQLType="cf_sql_longvarchar" null="#not len(arguments.assessmentPlanOutcomes.getOutcomeResources())#" />,
					OutcomeCreateDate = <cfqueryparam value="#arguments.assessmentPlanOutcomes.getOutcomeCreateDate()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.assessmentPlanOutcomes.getOutcomeCreateDate())#" />,
					OutcomePlanLastChangeDate = <cfqueryparam value="#arguments.assessmentPlanOutcomes.getOutcomePlanLastChangeDate()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.assessmentPlanOutcomes.getOutcomePlanLastChangeDate())#" />,
					QEP_URI_related = <cfqueryparam value="#arguments.assessmentPlanOutcomes.getQEP_URI_related()#" CFSQLType="cf_sql_integer" null="#not len(arguments.assessmentPlanOutcomes.getQEP_URI_related())#" />,
					IFP_related = <cfqueryparam value="#arguments.assessmentPlanOutcomes.getIFP_related()#" CFSQLType="cf_sql_integer" null="#not len(arguments.assessmentPlanOutcomes.getIFP_related())#" />,
					Online = <cfqueryparam value="#arguments.assessmentPlanOutcomes.getOnline()#" CFSQLType="cf_sql_integer" null="#not len(arguments.assessmentPlanOutcomes.getOnline())#" />
				WHERE	OutcomeID = <cfqueryparam value="#arguments.assessmentPlanOutcomes.getOutcomeID()#" CFSQLType="cf_sql_integer" />
			</cfquery>
		<!---
			<cfcatch type="database">
				<cfreturn false />
			</cfcatch>
		</cftry>
		--->
		<cfreturn #arguments.assessmentPlanOutcomes.getOutcomeID()# />
	</cffunction>

	<cffunction name="delete" access="public" output="false" returntype="boolean">
		<cfargument name="assessmentPlanOutcomes" type="assessmentPlanOutcomes" required="true" />

		<cfset var qDelete = "">
		
			<cfquery name="qDelete" datasource="#variables.dsn#">
				DELETE FROM	AssessmentPlanOutcomes 
				WHERE	OutcomeID = <cfqueryparam value="#arguments.assessmentPlanOutcomes.getOutcomeID()#" CFSQLType="cf_sql_integer" />
			</cfquery>
		
		<cfreturn true />
	</cffunction>

	<cffunction name="exists" access="public" output="false" returntype="boolean">
		<cfargument name="assessmentPlanOutcomes" type="assessmentPlanOutcomes" required="true" />

		<cfset var qExists = "">
		<cfquery name="qExists" datasource="#variables.dsn#" maxrows="1">
			SELECT count(1) as idexists
			FROM	AssessmentPlanOutcomes
			WHERE	OutcomeID = <cfqueryparam value="#arguments.assessmentPlanOutcomes.getOutcomeID()#" CFSQLType="cf_sql_integer" />
		</cfquery>

		<cfif qExists.idexists>
			<cfreturn true />
		<cfelse>
			<cfreturn false />
		</cfif>
	</cffunction>

	<cffunction name="save" access="public" output="false" returntype="boolean">
		<cfargument name="assessmentPlanOutcomes" type="assessmentPlanOutcomes" required="true" />
		
		<cfset var success = false />
		<cfif exists(arguments.assessmentPlanOutcomes)>
			<cfset success = update(arguments.assessmentPlanOutcomes) />
		<cfelse>
			<cfset success = create(arguments.assessmentPlanOutcomes) />
		</cfif>
		
		<cfreturn success />
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
