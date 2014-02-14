
<cfcomponent displayname="AssessmentPlanChecklistRatingsDAO" hint="table ID column = ChecklistRatingID">

	<cffunction name="init" access="public" output="false" returntype="AssessmentPlanChecklistRatingsDAO">
		<cfargument name="dsn" type="string" required="true">
		<cfset variables.dsn = arguments.dsn>
		<cfreturn this>
	</cffunction>
	
	<cffunction name="create" access="public" output="false" returntype="boolean">
		<cfargument name="AssessmentPlanChecklistRatings" type="AssessmentPlanChecklistRatings" required="true" />

		<cfset var qCreate = "" />
		<cftry>
			<cfquery name="qCreate" datasource="#variables.dsn#">
				INSERT INTO AssessmentPlanChecklistRating
					(
					PlanID,
					ReportingUnitID,
					ChecklistTypeID,
					Rating
					)
				VALUES
					(
					<cfqueryparam value="#arguments.AssessmentPlanChecklistRatings.getPlanID()#" CFSQLType="cf_sql_integer" null="#not len(arguments.AssessmentPlanChecklistRatings.getPlanID())#" />,
					<cfqueryparam value="#arguments.AssessmentPlanChecklistRatings.getReportingUnitID()#" CFSQLType="cf_sql_integer" null="#not len(arguments.AssessmentPlanChecklistRatings.getReportingUnitID())#" />,
					<cfqueryparam value="#arguments.AssessmentPlanChecklistRatings.getChecklistTypeID()#" CFSQLType="cf_sql_integer" null="#not len(arguments.AssessmentPlanChecklistRatings.getChecklistTypeID())#" />,
					<cfqueryparam value="#arguments.AssessmentPlanChecklistRatings.getRating()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.AssessmentPlanChecklistRatings.getRating())#" />
					)
			</cfquery>
			<cfcatch type="database">
				<cfreturn false />
			</cfcatch>
		</cftry>
		<cfreturn true />
	</cffunction>

	<cffunction name="read" access="public" output="false" returntype="void">
		<cfargument name="AssessmentPlanChecklistRatings" type="AssessmentPlanChecklistRatings" required="true" />

		<cfset var qRead = "" />
		<cfset var strReturn = structNew() />
		<cftry>
			<cfquery name="qRead" datasource="#variables.dsn#">
				SELECT
					ChecklistRatingID,
					PlanID,
					ReportingUnitID,
					ChecklistTypeID,
					Rating
				FROM	AssessmentPlanChecklistRating
				WHERE	ChecklistRatingID = <cfqueryparam value="#arguments.AssessmentPlanChecklistRatings.getChecklistRatingID()#" CFSQLType="cf_sql_integer" />
			</cfquery>
			<cfcatch type="database">
				<!--- leave the bean as is and set an empty query for the conditional logic below --->
				<cfset qRead = queryNew("id") />
			</cfcatch>
		</cftry>
		<cfif qRead.recordCount>
			<cfset strReturn = queryRowToStruct(qRead)>
			<cfset arguments.AssessmentPlanChecklistRatings.init(argumentCollection=strReturn)>
		</cfif>
	</cffunction>

	<cffunction name="update" access="public" output="false" returntype="boolean">
		<cfargument name="AssessmentPlanChecklistRatings" type="AssessmentPlanChecklistRatings" required="true" />

		<cfset var qUpdate = "" />
		<cftry>
			<cfquery name="qUpdate" datasource="#variables.dsn#">
				UPDATE	AssessmentPlanChecklistRating
				SET
					PlanID = <cfqueryparam value="#arguments.AssessmentPlanChecklistRatings.getPlanID()#" CFSQLType="cf_sql_integer" null="#not len(arguments.AssessmentPlanChecklistRatings.getPlanID())#" />,
					ReportingUnitID = <cfqueryparam value="#arguments.AssessmentPlanChecklistRatings.getReportingUnitID()#" CFSQLType="cf_sql_integer" null="#not len(arguments.AssessmentPlanChecklistRatings.getReportingUnitID())#" />,
					ChecklistTypeID = <cfqueryparam value="#arguments.AssessmentPlanChecklistRatings.getChecklistTypeID()#" CFSQLType="cf_sql_integer" null="#not len(arguments.AssessmentPlanChecklistRatings.getChecklistTypeID())#" />,
					Rating = <cfqueryparam value="#arguments.AssessmentPlanChecklistRatings.getRating()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.AssessmentPlanChecklistRatings.getRating())#" />
				WHERE	ChecklistRatingID = <cfqueryparam value="#arguments.AssessmentPlanChecklistRatings.getChecklistRatingID()#" CFSQLType="cf_sql_integer" />
			</cfquery>
			<cfcatch type="database">
				<cfreturn false />
			</cfcatch>
		</cftry>
		<cfreturn true />
	</cffunction>

	<cffunction name="deleteExisting" access="public" output="false" returntype="boolean">
		<cfargument name="reportingUnitID" type="numeric" required="true" />
		<cfargument name="planID" type="numeric" required="true" />

		<cfset var qDelete = "">
		<cftry>
			<cfquery name="qDelete" datasource="#variables.dsn#">
				DELETE FROM	AssessmentPlanChecklistRating 
				WHERE	reportingUnitID = <cfqueryparam value="#arguments.reportingUnitID#" CFSQLType="cf_sql_integer" />
				AND 	PlanID = <cfqueryparam value="#arguments.planID#" CFSQLType="cf_sql_integer" />
			</cfquery>
			<cfcatch type="database">
				<cfreturn false />
			</cfcatch>
		</cftry>
		<cfreturn true />
	</cffunction>

	<cffunction name="delete" access="public" output="false" returntype="boolean">
		<cfargument name="AssessmentPlanChecklistRatings" type="AssessmentPlanChecklistRatings" required="true" />

		<cfset var qDelete = "">
		<cftry>
			<cfquery name="qDelete" datasource="#variables.dsn#">
				DELETE FROM	AssessmentPlanChecklistRating 
				WHERE	ChecklistRatingID = <cfqueryparam value="#arguments.AssessmentPlanChecklistRatings.getChecklistRatingID()#" CFSQLType="cf_sql_integer" />
			</cfquery>
			<cfcatch type="database">
				<cfreturn false />
			</cfcatch>
		</cftry>
		<cfreturn true />
	</cffunction>

	<cffunction name="exists" access="public" output="false" returntype="boolean">
		<cfargument name="AssessmentPlanChecklistRatings" type="AssessmentPlanChecklistRatings" required="true" />

		<cfset var qExists = "">
		<cfquery name="qExists" datasource="#variables.dsn#" maxrows="1">
			SELECT count(1) as idexists
			FROM	AssessmentPlanChecklistRating
			WHERE	ChecklistRatingID = <cfqueryparam value="#arguments.AssessmentPlanChecklistRatings.getChecklistRatingID()#" CFSQLType="cf_sql_integer" />
		</cfquery>

		<cfif qExists.idexists>
			<cfreturn true />
		<cfelse>
			<cfreturn false />
		</cfif>
	</cffunction>

	<cffunction name="save" access="public" output="false" returntype="boolean">
		<cfargument name="AssessmentPlanChecklistRatings" type="AssessmentPlanChecklistRatings" required="true" />
		
		<cfset var success = false />
		<cfif exists(arguments.AssessmentPlanChecklistRatings)>
			<cfset success = update(arguments.AssessmentPlanChecklistRatings) />
		<cfelse>
			<cfset success = create(arguments.AssessmentPlanChecklistRatings) />
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
