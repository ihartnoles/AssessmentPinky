
<cfcomponent displayname="ALCDocumentsDAO" hint="table ID column = DocumentID">

	<cffunction name="init" access="public" output="false" returntype="ALCDocumentsDAO">
		<cfargument name="dsn" type="string" required="true">
		<cfset variables.dsn = arguments.dsn>
		<cfreturn this>
	</cffunction>
	
	<cffunction name="create" access="public" output="false" returntype="numeric">
		<cfargument name="ALCDocuments" type="ALCDocuments" required="true" />

		<cfset var qCreate = "" />
		<cftry>
			<cfquery name="qCreate" datasource="#variables.dsn#" result="res">
				INSERT INTO ALCDocuments
					(
					ReportingUnitID,
					DocumentName,
					UploadedDocumentName,
					UploadUserID,
					UploadDate
					)
				VALUES
					(
					<cfqueryparam value="#arguments.ALCDocuments.getReportingUnitID()#" CFSQLType="cf_sql_integer" />,
					<cfqueryparam value="#arguments.ALCDocuments.getDocumentName()#" CFSQLType="cf_sql_varchar" />,
					<cfqueryparam value="#arguments.ALCDocuments.getUploadedDocumentName()#" CFSQLType="cf_sql_varchar" />,
					<cfqueryparam value="#arguments.ALCDocuments.getUploadUserID()#" CFSQLType="cf_sql_integer" />,
					<cfqueryparam value="#arguments.ALCDocuments.getUploadDate()#" CFSQLType="cf_sql_timestamp" />
					)
			</cfquery>
			<cfcatch type="database">
				<cfreturn 0 />
			</cfcatch>
		</cftry>
		<cfreturn res.identitycol />
	</cffunction>

	<cffunction name="read" access="public" output="false" returntype="void">
		<cfargument name="ALCDocuments" type="ALCDocuments" required="true" />

		<cfset var qRead = "" />
		<cfset var strReturn = structNew() />
		<cftry>
			<cfquery name="qRead" datasource="#variables.dsn#">
				SELECT
					DocumentID,
					ReportingUnitID,
					DocumentName,
					UploadedDocumentName,
					UploadUserID,
					UploadDate
				FROM	ALCDocuments
				WHERE	DocumentID = <cfqueryparam value="#arguments.ALCDocuments.getDocumentID()#" CFSQLType="cf_sql_integer" />
			</cfquery>
			<cfcatch type="database">
				<!--- leave the bean as is and set an empty query for the conditional logic below --->
				<cfset qRead = queryNew("id") />
			</cfcatch>
		</cftry>
		<cfif qRead.recordCount>
			<cfset strReturn = queryRowToStruct(qRead)>
			<cfset arguments.ALCDocuments.init(argumentCollection=strReturn)>
		</cfif>
	</cffunction>

	<cffunction name="update" access="public" output="false" returntype="numeric">
		<cfargument name="ALCDocuments" type="ALCDocuments" required="true" />

		<cfset var qUpdate = "" />
		<cftry>
			<cfquery name="qUpdate" datasource="#variables.dsn#">
				UPDATE	ALCDocuments
				SET
					ReportingUnitID = <cfqueryparam value="#arguments.ALCDocuments.getReportingUnitID()#" CFSQLType="cf_sql_integer" />,
					DocumentName = <cfqueryparam value="#arguments.ALCDocuments.getDocumentName()#" CFSQLType="cf_sql_varchar" />,
					UploadedDocumentName = <cfqueryparam value="#arguments.ALCDocuments.getUploadedDocumentName()#" CFSQLType="cf_sql_varchar" />,
					UploadUserID = <cfqueryparam value="#arguments.ALCDocuments.getUploadUserID()#" CFSQLType="cf_sql_integer" />,
					UploadDate = <cfqueryparam value="#arguments.ALCDocuments.getUploadDate()#" CFSQLType="cf_sql_timestamp" />
				WHERE	DocumentID = <cfqueryparam value="#arguments.ALCDocuments.getDocumentID()#" CFSQLType="cf_sql_integer" />
			</cfquery>
			<cfcatch type="database">
				<cfreturn 0 />
			</cfcatch>
		</cftry>
		<cfreturn arguments.ALCDocuments.getDocumentID() />
	</cffunction>

	<cffunction name="delete" access="public" output="false" returntype="boolean">
		<cfargument name="ALCDocuments" type="ALCDocuments" required="true" />

		<cfset var qDelete = "">
		<cftry>
			<cfquery name="qDelete" datasource="#variables.dsn#">
				DELETE FROM	ALCDocuments 
				WHERE	DocumentID = <cfqueryparam value="#arguments.ALCDocuments.getDocumentID()#" CFSQLType="cf_sql_integer" />
			</cfquery>
			<cfcatch type="database">
				<cfreturn false />
			</cfcatch>
		</cftry>
		<cfreturn true />
	</cffunction>

	<cffunction name="exists" access="public" output="false" returntype="boolean">
		<cfargument name="ALCDocuments" type="ALCDocuments" required="true" />

		<cfset var qExists = "">
		<cfquery name="qExists" datasource="#variables.dsn#" maxrows="1">
			SELECT count(1) as idexists
			FROM	ALCDocuments
			WHERE	DocumentID = <cfqueryparam value="#arguments.ALCDocuments.getDocumentID()#" CFSQLType="cf_sql_integer" />
		</cfquery>

		<cfif qExists.idexists>
			<cfreturn true />
		<cfelse>
			<cfreturn false />
		</cfif>
	</cffunction>

	<cffunction name="save" access="public" output="false" returntype="boolean">
		<cfargument name="ALCDocuments" type="ALCDocuments" required="true" />
		
		<cfset var success = false />
		<cfif exists(arguments.ALCDocuments)>
			<cfset success = update(arguments.ALCDocuments) />
		<cfelse>
			<cfset success = create(arguments.ALCDocuments) />
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
