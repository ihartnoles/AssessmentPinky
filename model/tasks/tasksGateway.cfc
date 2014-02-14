
<cfcomponent displayname="tasksGateway" output="false">
	<cffunction name="init" access="public" output="false" returntype="tasksGateway">
		<cfargument name="dsn" type="string" required="true" />
		<cfset variables.dsn = arguments.dsn />
		<cfreturn this />
	</cffunction>
	
	<cffunction name="getByAttributesQuery" access="public" output="false" returntype="query">
		<cfargument name="TaskID" type="numeric" required="false" />
		<cfargument name="userID" type="numeric" required="false" />
		<cfargument name="task_text" type="string" required="false" />
		<cfargument name="done" type="numeric" required="false" />
		<cfargument name="bookmarked" type="numeric" required="false" />
		<cfargument name="orderby" type="string" required="false" />
		
		<cfset var qList = "" />		
		<cfquery name="qList" datasource="#variables.dsn#">
			SELECT
				TaskID,
				userID,
				task_text,
				done,
				bookmarked
			FROM	Tasks
			WHERE	0=0
		
		<cfif structKeyExists(arguments,"TaskID") and len(arguments.TaskID)>
			AND	TaskID = <cfqueryparam value="#arguments.TaskID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"userID") and len(arguments.userID)>
			AND	userID = <cfqueryparam value="#arguments.userID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"task_text") and len(arguments.task_text)>
			AND	task_text = <cfqueryparam value="#arguments.task_text#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"done") and len(arguments.done)>
			AND	done = <cfqueryparam value="#arguments.done#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"bookmarked") and len(arguments.bookmarked)>
			AND	bookmarked = <cfqueryparam value="#arguments.bookmarked#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments, "orderby") and len(arguments.orderBy)>
			ORDER BY #arguments.orderby#
		</cfif>
		</cfquery>
		
		<cfreturn qList />
	</cffunction>

	<cffunction name="getByAttributes" access="public" output="false" returntype="array">
		<cfargument name="TaskID" type="numeric" required="false" />
		<cfargument name="userID" type="numeric" required="false" />
		<cfargument name="task_text" type="string" required="false" />
		<cfargument name="done" type="numeric" required="false" />
		<cfargument name="bookmarked" type="numeric" required="false" />
		<cfargument name="orderby" type="string" required="false" />
		
		<cfset var qList = getByAttributesQuery(argumentCollection=arguments) />		
		<cfset var arrObjects = arrayNew(1) />
		<cfset var tmpObj = "" />
		<cfset var i = 0 />
		<cfloop from="1" to="#qList.recordCount#" index="i">
			<cfset tmpObj = createObject("component","tasks").init(argumentCollection=queryRowToStruct(qList,i)) />
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
