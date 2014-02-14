
<cfcomponent displayname="AssessmentStrategicPlanLinksDAO" hint="table ID column = RecordID">

	<cffunction name="init" access="public" output="false" returntype="AssessmentStrategicPlanLinksDAO">
		<cfargument name="dsn" type="string" required="true">
		<cfset variables.dsn = arguments.dsn>
		<cfreturn this>
	</cffunction>
	
	<cffunction name="create" access="public" output="false" returntype="numeric">
		<cfargument name="AssessmentStrategicPlanLinks" type="AssessmentStrategicPlanLinks" required="true" />

		<cfquery name="local.qCreate" datasource="#variables.dsn#" result="local.res">
			INSERT INTO AssessmentStrategicPlanLinks(
				OutcomeID,
				ObjectiveID
			)VALUES(
				<cfqueryparam value="#arguments.AssessmentStrategicPlanLinks.getOutcomeID()#" CFSQLType="cf_sql_integer" />,
				<cfqueryparam value="#arguments.AssessmentStrategicPlanLinks.getObjectiveID()#" CFSQLType="cf_sql_integer" />
			)
		</cfquery>
		
		<cfreturn local.res.generatedKey />
	</cffunction>

	<cffunction name="read" access="public" output="false" returntype="AssessmentStrategicPlanLinks">
		<cfargument name="AssessmentStrategicPlanLinks" type="AssessmentStrategicPlanLinks" required="true" />

		<cfquery name="local.qRead" datasource="#variables.dsn#">
			SELECT
				RecordID,
				OutcomeID,
				ObjectiveID
			FROM	AssessmentStrategicPlanLinks
			WHERE	
				RecordID = <cfqueryparam value="#arguments.AssessmentStrategicPlanLinks.getRecordID()#" CFSQLType="cf_sql_integer" />
		</cfquery>
			
		<cfif local.qRead.recordCount>
			<cfset local.strReturn = queryRowToStruct(local.qRead)>
			<cfset arguments.AssessmentStrategicPlanLinks.init(argumentCollection=local.strReturn)>
		</cfif>
		
		<cfreturn arguments.AssessmentStrategicPlanLinks/>
	</cffunction>

	<cffunction name="update" access="public" output="false" returntype="numeric">
		<cfargument name="AssessmentStrategicPlanLinks" type="AssessmentStrategicPlanLinks" required="true" />

		<cfquery name="local.qUpdate" datasource="#variables.dsn#">
			UPDATE	
				AssessmentStrategicPlanLinks
			SET
				OutcomeID = <cfqueryparam value="#arguments.AssessmentStrategicPlanLinks.getOutcomeID()#" CFSQLType="cf_sql_integer" />,
				ObjectiveID = <cfqueryparam value="#arguments.AssessmentStrategicPlanLinks.getObjectiveID()#" CFSQLType="cf_sql_integer" />
			WHERE	
				RecordID = <cfqueryparam value="#arguments.AssessmentStrategicPlanLinks.getRecordID()#" CFSQLType="cf_sql_integer" />
		</cfquery>

		<cfreturn arguments.AssessmentStrategicPlanLinks.getRecordID() />
	</cffunction>

	<cffunction name="delete" access="public" output="false" returntype="boolean">
		<cfargument name="AssessmentStrategicPlanLinks" type="AssessmentStrategicPlanLinks" required="true" />

		<cfquery name="local.qDelete" datasource="#variables.dsn#">
			DELETE 
			FROM	AssessmentStrategicPlanLinks 
			WHERE	RecordID = <cfqueryparam value="#arguments.AssessmentStrategicPlanLinks.getRecordID()#" CFSQLType="cf_sql_integer" />
		</cfquery>
	
		<cfreturn true />
	</cffunction>

	<cffunction name="exists" access="public" output="false" returntype="boolean">
		<cfargument name="AssessmentStrategicPlanLinks" type="AssessmentStrategicPlanLinks" required="true" />

		<cfquery name="local.qExists" datasource="#variables.dsn#" maxrows="1">
			SELECT  count(1) as idexists
			FROM	AssessmentStrategicPlanLinks
			WHERE	RecordID = <cfqueryparam value="#arguments.AssessmentStrategicPlanLinks.getRecordID()#" CFSQLType="cf_sql_integer" />
		</cfquery>

		<cfif local.qExists.idexists>
			<cfreturn true />
		<cfelse>
			<cfreturn false />
		</cfif>
	</cffunction>

	<cffunction name="save" access="public" output="false" returntype="boolean">
		<cfargument name="AssessmentStrategicPlanLinks" type="AssessmentStrategicPlanLinks" required="true" />
		
		<cfif exists(arguments.AssessmentStrategicPlanLinks)>
			<cfreturn update(arguments.AssessmentStrategicPlanLinks) />
		<cfelse>
			<cfreturn create(arguments.AssessmentStrategicPlanLinks) />
		</cfif>
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
