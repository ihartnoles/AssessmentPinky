
<cfcomponent displayname="checklistCommentsGateway" output="false">
	<cffunction name="init" access="public" output="false" returntype="checklistCommentsGateway">
		<cfargument name="dsn" type="string" required="true" />
		<cfset variables.dsn = arguments.dsn />
		<cfreturn this />
	</cffunction>
	
	<cffunction name="getByAttributesQuery" access="public" output="false" returntype="query">
		<cfargument name="checklistCommentID" type="numeric" required="false" />
		<cfargument name="planID" type="numeric" required="false" />
		<cfargument name="reportingUnitID" type="numeric" required="false" />
		<cfargument name="checklistTypeID" type="numeric" required="false" />
		<cfargument name="comment" type="string" required="false" />
		<cfargument name="created_on" type="date" required="false" />
		<cfargument name="created_by" type="numeric" required="false" />
		<cfargument name="orderby" type="string" required="false" />
		
		<cfset var qList = "" />		
		<cfquery name="qList" datasource="#variables.dsn#">
			SELECT
				checklistCommentID,
				planID,
				reportingUnitID,
				checklistTypeID,
				comment,
				created_on,
				created_by
			FROM	ChecklistComments
			WHERE	0=0
		
		<cfif structKeyExists(arguments,"checklistCommentID") and len(arguments.checklistCommentID)>
			AND	checklistCommentID = <cfqueryparam value="#arguments.checklistCommentID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"planID") and len(arguments.planID)>
			AND	planID = <cfqueryparam value="#arguments.planID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"reportingUnitID") and len(arguments.reportingUnitID)>
			AND	reportingUnitID = <cfqueryparam value="#arguments.reportingUnitID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"checklistTypeID") and len(arguments.checklistTypeID)>
			AND	checklistTypeID = <cfqueryparam value="#arguments.checklistTypeID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"comment") and len(arguments.comment)>
			AND	comment = <cfqueryparam value="#arguments.comment#" CFSQLType="cf_sql_longvarchar" />
		</cfif>
		<cfif structKeyExists(arguments,"created_on") and len(arguments.created_on)>
			AND	created_on = <cfqueryparam value="#arguments.created_on#" CFSQLType="cf_sql_timestamp" />
		</cfif>
		<cfif structKeyExists(arguments,"created_by") and len(arguments.created_by)>
			AND	created_by = <cfqueryparam value="#arguments.created_by#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments, "orderby") and len(arguments.orderBy)>
			ORDER BY #arguments.orderby#
		</cfif>
		</cfquery>
		
		<cfreturn qList />
	</cffunction>

<cffunction name="getChecklistCommentDetails" access="public" output="false" returntype="query">
		<cfargument name="planID" type="numeric" required="false" />
		<cfargument name="reportingUnitID" type="numeric" required="false" />
		<cfargument name="checklistTypeID" type="numeric" required="false" />
	
		
		<cfset var qList = "" />		
		<cfquery name="qList" datasource="#variables.dsn#">
			SELECT AssessmentPlanChecklistType.*, ChecklistComments.checklistCommentID, ChecklistComments.planID, ChecklistComments.reportingUnitID, 
		                  ChecklistComments.comment, ChecklistComments.created_on, ChecklistComments.created_by
			FROM     AssessmentPlanChecklistType INNER JOIN
		                  ChecklistComments ON AssessmentPlanChecklistType.ChecklistTypeID = ChecklistComments.checklistTypeID

		    WHERE 0=0
		    <cfif structKeyExists(arguments,"planID") and len(arguments.planID)>
				AND	planID = <cfqueryparam value="#arguments.planID#" CFSQLType="cf_sql_integer" />
			</cfif>
			<cfif structKeyExists(arguments,"reportingUnitID") and len(arguments.reportingUnitID)>
				AND	reportingUnitID = <cfqueryparam value="#arguments.reportingUnitID#" CFSQLType="cf_sql_integer" />
			</cfif>
			<cfif structKeyExists(arguments,"checklistTypeID") and len(arguments.checklistTypeID)>
				AND	ChecklistComments.checklistTypeID = <cfqueryparam value="#arguments.checklistTypeID#" CFSQLType="cf_sql_integer" />
			</cfif>

		</cfquery>

		<cfreturn qList />

	</cffunction>



	<cffunction name="getByAttributes" access="public" output="false" returntype="array">
		<cfargument name="checklistCommentID" type="numeric" required="false" />
		<cfargument name="planID" type="numeric" required="false" />
		<cfargument name="reportingUnitID" type="numeric" required="false" />
		<cfargument name="checklistTypeID" type="numeric" required="false" />
		<cfargument name="comment" type="string" required="false" />
		<cfargument name="created_on" type="date" required="false" />
		<cfargument name="created_by" type="numeric" required="false" />
		<cfargument name="orderby" type="string" required="false" />
		
		<cfset var qList = getByAttributesQuery(argumentCollection=arguments) />		
		<cfset var arrObjects = arrayNew(1) />
		<cfset var tmpObj = "" />
		<cfset var i = 0 />
		<cfloop from="1" to="#qList.recordCount#" index="i">
			<cfset tmpObj = createObject("component","checklistComments").init(argumentCollection=queryRowToStruct(qList,i)) />
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
