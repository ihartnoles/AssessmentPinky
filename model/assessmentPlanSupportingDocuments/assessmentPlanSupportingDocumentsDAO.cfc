
<cfcomponent displayname="assessmentPlanSupportingDocumentsDAO" hint="table ID column = RecordID">

	<cffunction name="init" access="public" output="false" returntype="assessmentPlanSupportingDocumentsDAO">
		<cfargument name="dsn" type="string" required="true">
		<cfset variables.dsn = arguments.dsn>
		<cfreturn this>
	</cffunction>
	
	<cffunction name="create" access="public" output="false" returntype="boolean">
		<cfargument name="assessmentPlanSupportingDocuments" type="assessmentPlanSupportingDocuments" required="true" />

		<cfset var qCreate = "" />
		<cftry>
			<cfquery name="qCreate" datasource="#variables.dsn#">
				INSERT INTO AssessmentPlanSupportingDocuments
					(
					OutcomeID,
					FileName,
					FileNameUploaded,
					FileDescription,
					FileUserID,
					DateInserted
					)
				VALUES
					(
					<cfqueryparam value="#arguments.assessmentPlanSupportingDocuments.getOutcomeID()#" CFSQLType="cf_sql_integer" />,
					<cfqueryparam value="#arguments.assessmentPlanSupportingDocuments.getFileName()#" CFSQLType="cf_sql_varchar" />,
					<cfqueryparam value="#arguments.assessmentPlanSupportingDocuments.getFileNameUploaded()#" CFSQLType="cf_sql_varchar" />,
					<cfqueryparam value="#arguments.assessmentPlanSupportingDocuments.getFileDescription()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.assessmentPlanSupportingDocuments.getFileDescription())#" />,
					<cfqueryparam value="#arguments.assessmentPlanSupportingDocuments.getFileUserID()#" CFSQLType="cf_sql_integer" />,
					<cfqueryparam value="#arguments.assessmentPlanSupportingDocuments.getDateInserted()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.assessmentPlanSupportingDocuments.getDateInserted())#" />
					)
			</cfquery>
			<cfcatch type="database">
				<cfreturn false />
			</cfcatch>
		</cftry>
		<cfreturn true />
	</cffunction>

	<cffunction name="read" access="public" output="false" returntype="void">
		<cfargument name="assessmentPlanSupportingDocuments" type="assessmentPlanSupportingDocuments" required="true" />

		<cfset var qRead = "" />
		<cfset var strReturn = structNew() />
		<cftry>
			<cfquery name="qRead" datasource="#variables.dsn#">
				SELECT
					RecordID,
					OutcomeID,
					FileName,
					FileNameUploaded,
					FileDescription,
					FileUserID,
					DateInserted
				FROM	AssessmentPlanSupportingDocuments
				WHERE	RecordID = <cfqueryparam value="#arguments.assessmentPlanSupportingDocuments.getRecordID()#" CFSQLType="cf_sql_integer" />
			</cfquery>
			<cfcatch type="database">
				<!--- leave the bean as is and set an empty query for the conditional logic below --->
				<cfset qRead = queryNew("id") />
			</cfcatch>
		</cftry>
		<cfif qRead.recordCount>
			<cfset strReturn = queryRowToStruct(qRead)>
			<cfset arguments.assessmentPlanSupportingDocuments.init(argumentCollection=strReturn)>
		</cfif>
	</cffunction>

	<cffunction name="update" access="public" output="false" returntype="boolean">
		<cfargument name="assessmentPlanSupportingDocuments" type="assessmentPlanSupportingDocuments" required="true" />

		<cfset var qUpdate = "" />
		<cftry>
			<cfquery name="qUpdate" datasource="#variables.dsn#">
				UPDATE	AssessmentPlanSupportingDocuments
				SET
					OutcomeID = <cfqueryparam value="#arguments.assessmentPlanSupportingDocuments.getOutcomeID()#" CFSQLType="cf_sql_integer" />,
					FileName = <cfqueryparam value="#arguments.assessmentPlanSupportingDocuments.getFileName()#" CFSQLType="cf_sql_varchar" />,
					FileNameUploaded = <cfqueryparam value="#arguments.assessmentPlanSupportingDocuments.getFileNameUploaded()#" CFSQLType="cf_sql_varchar" />,
					FileDescription = <cfqueryparam value="#arguments.assessmentPlanSupportingDocuments.getFileDescription()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.assessmentPlanSupportingDocuments.getFileDescription())#" />,
					FileUserID = <cfqueryparam value="#arguments.assessmentPlanSupportingDocuments.getFileUserID()#" CFSQLType="cf_sql_integer" />,
					DateInserted = <cfqueryparam value="#arguments.assessmentPlanSupportingDocuments.getDateInserted()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.assessmentPlanSupportingDocuments.getDateInserted())#" />
				WHERE	RecordID = <cfqueryparam value="#arguments.assessmentPlanSupportingDocuments.getRecordID()#" CFSQLType="cf_sql_integer" />
			</cfquery>
			<cfcatch type="database">
				<cfreturn false />
			</cfcatch>
		</cftry>
		<cfreturn true />
	</cffunction>

	<cffunction name="delete" access="public" output="false" returntype="boolean">
		<cfargument name="assessmentPlanSupportingDocuments" type="assessmentPlanSupportingDocuments" required="true" />

		<cfset var qDelete = "">
		<cftry>
			<cfquery name="qDelete" datasource="#variables.dsn#">
				DELETE FROM	AssessmentPlanSupportingDocuments 
				WHERE	RecordID = <cfqueryparam value="#arguments.assessmentPlanSupportingDocuments.getRecordID()#" CFSQLType="cf_sql_integer" />
			</cfquery>
			<cfcatch type="database">
				<cfreturn false />
			</cfcatch>
		</cftry>
		<cfreturn true />
	</cffunction>

	<cffunction name="exists" access="public" output="false" returntype="boolean">
		<cfargument name="assessmentPlanSupportingDocuments" type="assessmentPlanSupportingDocuments" required="true" />

		<cfset var qExists = "">
		<cfquery name="qExists" datasource="#variables.dsn#" maxrows="1">
			SELECT count(1) as idexists
			FROM	AssessmentPlanSupportingDocuments
			WHERE	RecordID = <cfqueryparam value="#arguments.assessmentPlanSupportingDocuments.getRecordID()#" CFSQLType="cf_sql_integer" />
		</cfquery>

		<cfif qExists.idexists>
			<cfreturn true />
		<cfelse>
			<cfreturn false />
		</cfif>
	</cffunction>

	<cffunction name="save" access="public" output="false" returntype="boolean">
		<cfargument name="assessmentPlanSupportingDocuments" type="assessmentPlanSupportingDocuments" required="true" />
		
		<cfset var success = false />
		<cfif exists(arguments.assessmentPlanSupportingDocuments)>
			<cfset success = update(arguments.assessmentPlanSupportingDocuments) />
		<cfelse>
			<cfset success = create(arguments.assessmentPlanSupportingDocuments) />
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
