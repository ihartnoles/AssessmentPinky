
<cfcomponent displayname="assessmentPlanSupportingDocumentsGateway" output="false">
	<cffunction name="init" access="public" output="false" returntype="assessmentPlanSupportingDocumentsGateway">
		<cfargument name="dsn" type="string" required="true" />
		<cfset variables.dsn = arguments.dsn />
		<cfreturn this />
	</cffunction>
	
	<cffunction name="getByAttributesQuery" access="public" output="false" returntype="query">
		<cfargument name="RecordID" type="numeric" required="false" />
		<cfargument name="OutcomeID" type="numeric" required="false" />
		<cfargument name="FileName" type="string" required="false" />
		<cfargument name="FileNameUploaded" type="string" required="false" />
		<cfargument name="FileDescription" type="string" required="false" />
		<cfargument name="FileUserID" type="numeric" required="false" />
		<cfargument name="DateInserted" type="date" required="false" />
		<cfargument name="orderby" type="string" required="false" />
		
		<cfset var qList = "" />		
		<cfquery name="qList" datasource="#variables.dsn#">
			SELECT
				RecordID,
				OutcomeID,
				FileName,
				FileNameUploaded,
				FileDescription,
				FileUserID,
				DateInserted
			FROM	AssessmentPlanSupportingDocuments
			WHERE	0=0
		
		<cfif structKeyExists(arguments,"RecordID") and len(arguments.RecordID)>
			AND	RecordID = <cfqueryparam value="#arguments.RecordID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"OutcomeID") and len(arguments.OutcomeID)>
			AND	OutcomeID = <cfqueryparam value="#arguments.OutcomeID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"FileName") and len(arguments.FileName)>
			AND	FileName = <cfqueryparam value="#arguments.FileName#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"FileNameUploaded") and len(arguments.FileNameUploaded)>
			AND	FileNameUploaded = <cfqueryparam value="#arguments.FileNameUploaded#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"FileDescription") and len(arguments.FileDescription)>
			AND	FileDescription = <cfqueryparam value="#arguments.FileDescription#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"FileUserID") and len(arguments.FileUserID)>
			AND	FileUserID = <cfqueryparam value="#arguments.FileUserID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"DateInserted") and len(arguments.DateInserted)>
			AND	DateInserted = <cfqueryparam value="#arguments.DateInserted#" CFSQLType="cf_sql_timestamp" />
		</cfif>
		<cfif structKeyExists(arguments, "orderby") and len(arguments.orderBy)>
			ORDER BY #arguments.orderby#
		</cfif>
		</cfquery>
		
		<cfreturn qList />
	</cffunction>

	<cffunction name="getOutcomeSupportingDocs" access="public" output="false" returntype="query">
		<cfargument name="OutcomeID" type="numeric" required="false" />
		
		
		<cfset var qList = "" />		
		<cfquery name="qList" datasource="#variables.dsn#">
			 SELECT d.*, UserLname, UserFname 
			  FROM AssessmentPlanSupportingDocuments d, Users u  
			  WHERE 0=0


			  	 <cfif structKeyExists(arguments,"OutcomeID") and len(arguments.OutcomeID)>
					AND	OutcomeID = <cfqueryparam value="#arguments.OutcomeID#" CFSQLType="cf_sql_integer" />
				</cfif>
			  
			  AND d.FileUserID=u.UserID  
			  ORDER BY OutcomeID, RecordID 
		</cfquery>
		
		<cfreturn qList />
	</cffunction>

	<cffunction name="getByAttributes" access="public" output="false" returntype="array">
		<cfargument name="RecordID" type="numeric" required="false" />
		<cfargument name="OutcomeID" type="numeric" required="false" />
		<cfargument name="FileName" type="string" required="false" />
		<cfargument name="FileNameUploaded" type="string" required="false" />
		<cfargument name="FileDescription" type="string" required="false" />
		<cfargument name="FileUserID" type="numeric" required="false" />
		<cfargument name="DateInserted" type="date" required="false" />
		<cfargument name="orderby" type="string" required="false" />
		
		<cfset var qList = getByAttributesQuery(argumentCollection=arguments) />		
		<cfset var arrObjects = arrayNew(1) />
		<cfset var tmpObj = "" />
		<cfset var i = 0 />
		<cfloop from="1" to="#qList.recordCount#" index="i">
			<cfset tmpObj = createObject("component","assessmentPlanSupportingDocuments").init(argumentCollection=queryRowToStruct(qList,i)) />
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
