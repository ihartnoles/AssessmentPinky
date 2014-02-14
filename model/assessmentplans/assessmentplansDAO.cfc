
<cfcomponent displayname="assessmentplansDAO" hint="table ID column = PlanID">

	<cffunction name="init" access="public" output="false" returntype="assessmentplansDAO">
		<cfargument name="dsn" type="string" required="true">
		<cfset variables.dsn = arguments.dsn>
		<cfreturn this>
	</cffunction>
	
	<cffunction name="create" access="public" output="false" returntype="numeric">
		<cfargument name="assessmentplans" type="assessmentplans" required="true" />

		<cfset var qCreate = "" />
		
			<cfquery name="qCreate" datasource="#variables.dsn#" result="res">
				INSERT INTO AssessmentPlan
					(
					ReportingUnitID,
					PlanPeriod,
					PlanType,
					PlanStatus,
					PlanInitialReporter,
					PlanLastChangeDate,
					PlanLockDate
					)
				VALUES
					(
					<cfqueryparam value="#arguments.assessmentplans.getReportingUnitID()#" CFSQLType="cf_sql_integer" />,
					<cfqueryparam value="#arguments.assessmentplans.getPlanPeriod()#" CFSQLType="cf_sql_char" />,
					<cfqueryparam value="#arguments.assessmentplans.getPlanType()#" CFSQLType="cf_sql_integer" null="#not len(arguments.assessmentplans.getPlanType())#" />,
					<cfqueryparam value="#arguments.assessmentplans.getPlanStatus()#" CFSQLType="cf_sql_integer" null="#not len(arguments.assessmentplans.getPlanStatus())#" />,
					<cfqueryparam value="#arguments.assessmentplans.getPlanInitialReporter()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.assessmentplans.getPlanInitialReporter())#" />,
					<cfqueryparam value="#now()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.assessmentplans.getPlanLastChangeDate())#" />,
					<cfqueryparam value="#arguments.assessmentplans.getPlanLockDate()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.assessmentplans.getPlanLockDate())#" />
					)
			</cfquery>
			
		<cfreturn res.identitycol />
	</cffunction>

	<cffunction name="read" access="public" output="false" returntype="void">
		<cfargument name="assessmentplans" type="assessmentplans" required="true" />

		<cfset var qRead = "" />
		<cfset var strReturn = structNew() />
		<cftry>
			<cfquery name="qRead" datasource="#variables.dsn#">
				SELECT
					PlanID,
					ReportingUnitID,
					PlanPeriod,
					PlanType,
					PlanStatus,
					PlanInitialReporter,
					PlanLastChangeDate,
					PlanLockDate
				FROM	AssessmentPlan
				WHERE	PlanID = <cfqueryparam value="#arguments.assessmentplans.getPlanID()#" CFSQLType="cf_sql_integer" />
			</cfquery>
			<cfcatch type="database">
				<!--- leave the bean as is and set an empty query for the conditional logic below --->
				<cfset qRead = queryNew("id") />
			</cfcatch>
		</cftry>
		<cfif qRead.recordCount>
			<cfset strReturn = queryRowToStruct(qRead)>
			<cfset arguments.assessmentplans.init(argumentCollection=strReturn)>
		</cfif>
	</cffunction>

	<cffunction name="update" access="public" output="false" returntype="boolean">
		<cfargument name="assessmentplans" type="assessmentplans" required="true" />

		<cfset var qUpdate = "" />
		<cftry>
			<cfquery name="qUpdate" datasource="#variables.dsn#">
				UPDATE	AssessmentPlan
				SET
					ReportingUnitID = <cfqueryparam value="#arguments.assessmentplans.getReportingUnitID()#" CFSQLType="cf_sql_integer" />,
					PlanPeriod = <cfqueryparam value="#arguments.assessmentplans.getPlanPeriod()#" CFSQLType="cf_sql_char" />,
					PlanType = <cfqueryparam value="#arguments.assessmentplans.getPlanType()#" CFSQLType="cf_sql_integer" null="#not len(arguments.assessmentplans.getPlanType())#" />,
					PlanStatus = <cfqueryparam value="#arguments.assessmentplans.getPlanStatus()#" CFSQLType="cf_sql_integer" null="#not len(arguments.assessmentplans.getPlanStatus())#" />,
					PlanInitialReporter = <cfqueryparam value="#arguments.assessmentplans.getPlanInitialReporter()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.assessmentplans.getPlanInitialReporter())#" />,
					PlanLastChangeDate = <cfqueryparam value="#arguments.assessmentplans.getPlanLastChangeDate()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.assessmentplans.getPlanLastChangeDate())#" />,
					PlanLockDate = <cfqueryparam value="#arguments.assessmentplans.getPlanLockDate()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.assessmentplans.getPlanLockDate())#" />
				WHERE	PlanID = <cfqueryparam value="#arguments.assessmentplans.getPlanID()#" CFSQLType="cf_sql_integer" />
			</cfquery>
			<cfcatch type="database">
				<cfreturn false />
			</cfcatch>
		</cftry>
		<cfreturn true />
	</cffunction>

	<cffunction name="delete" access="public" output="false" returntype="boolean">
		<cfargument name="assessmentplans" type="assessmentplans" required="true" />

		<cfset var qDelete = "">
		<cftry>
			<cfquery name="qDelete" datasource="#variables.dsn#">
				DELETE FROM	AssessmentPlan 
				WHERE	PlanID = <cfqueryparam value="#arguments.assessmentplans.getPlanID()#" CFSQLType="cf_sql_integer" />
			</cfquery>
			<cfcatch type="database">
				<cfreturn false />
			</cfcatch>
		</cftry>
		<cfreturn true />
	</cffunction>

	<cffunction name="exists" access="public" output="false" returntype="boolean">
		<cfargument name="assessmentplans" type="assessmentplans" required="true" />

		<cfset var qExists = "">
		<cfquery name="qExists" datasource="#variables.dsn#" maxrows="1">
			SELECT count(1) as idexists
			FROM	AssessmentPlan
			WHERE	PlanID = <cfqueryparam value="#arguments.assessmentplans.getPlanID()#" CFSQLType="cf_sql_integer" />
		</cfquery>

		<cfif qExists.idexists>
			<cfreturn true />
		<cfelse>
			<cfreturn false />
		</cfif>
	</cffunction>

	<cffunction name="save" access="public" output="false" returntype="boolean">
		<cfargument name="assessmentplans" type="assessmentplans" required="true" />
		
		<cfset var success = false />
		<cfif exists(arguments.assessmentplans)>
			<cfset success = update(arguments.assessmentplans) />
		<cfelse>
			<cfset success = create(arguments.assessmentplans) />
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
