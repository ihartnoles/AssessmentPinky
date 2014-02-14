
<cfcomponent displayname="tasksDAO" hint="table ID column = taskID">

	<cffunction name="init" access="public" output="false" returntype="tasksDAO">
		<cfargument name="dsn" type="string" required="true">
		<cfset variables.dsn = arguments.dsn>
		<cfreturn this>
	</cffunction>
	
	<cffunction name="create" access="public" output="false" returntype="numeric">
		<cfargument name="tasks" type="tasks" required="true" />

		<cfset var qCreate = "" />
		
			<cfquery name="qCreate" datasource="#variables.dsn#" result="res">
				INSERT INTO Tasks
					(
					userID,
					task_text,
					done,
					bookmarked
					)
				VALUES
					(
					<cfqueryparam value="#arguments.tasks.getuserID()#" CFSQLType="cf_sql_integer" null="#not len(arguments.tasks.getuserID())#" />,
					<cfqueryparam value="#arguments.tasks.gettask_text()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.tasks.gettask_text())#" />,
					<cfqueryparam value="#arguments.tasks.getdone()#" CFSQLType="cf_sql_integer" null="#not len(arguments.tasks.getdone())#" />,
					<cfqueryparam value="#arguments.tasks.getbookmarked()#" CFSQLType="cf_sql_integer" null="#not len(arguments.tasks.getbookmarked())#" />
					)
			</cfquery>
			
		<cfreturn res.identitycol />
	</cffunction>

	<cffunction name="read" access="public" output="false" returntype="void">
		<cfargument name="tasks" type="tasks" required="true" />

		<cfset var qRead = "" />
		<cfset var strReturn = structNew() />
		<cftry>
			<cfquery name="qRead" datasource="#variables.dsn#">
				SELECT
					taskID,
					userID,
					task_text,
					done,
					bookmarked
				FROM	Tasks
				WHERE	taskID = <cfqueryparam value="#arguments.tasks.gettaskID()#" CFSQLType="cf_sql_integer" />
			</cfquery>
			<cfcatch type="database">
				<!--- leave the bean as is and set an empty query for the conditional logic below --->
				<cfset qRead = queryNew("id") />
			</cfcatch>
		</cftry>
		<cfif qRead.recordCount>
			<cfset strReturn = queryRowToStruct(qRead)>
			<cfset arguments.tasks.init(argumentCollection=strReturn)>
		</cfif>
	</cffunction>

	<cffunction name="update" access="public" output="false" returntype="boolean">
		<cfargument name="tasks" type="tasks" required="true" />

		<cfset var qUpdate = "" />
		
			<cfquery name="qUpdate" datasource="#variables.dsn#">
				UPDATE	Tasks
				SET
					userID = <cfqueryparam value="#arguments.tasks.getuserID()#" CFSQLType="cf_sql_integer" null="#not len(arguments.tasks.getuserID())#" />,
					task_text = <cfqueryparam value="#arguments.tasks.gettask_text()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.tasks.gettask_text())#" />,
					done = <cfqueryparam value="#arguments.tasks.getdone()#" CFSQLType="cf_sql_integer" null="#not len(arguments.tasks.getdone())#" />,
					bookmarked = <cfqueryparam value="#arguments.tasks.getbookmarked()#" CFSQLType="cf_sql_integer" null="#not len(arguments.tasks.getbookmarked())#" />
				WHERE	taskID = <cfqueryparam value="#arguments.tasks.gettaskID()#" CFSQLType="cf_sql_integer" />
			</cfquery>
			
		<cfreturn true />
	</cffunction>

	<cffunction name="delete" access="public" output="false" returntype="boolean">
		<cfargument name="tasks" type="tasks" required="true" />

		<cfset var qDelete = "">
		
			<cfquery name="qDelete" datasource="#variables.dsn#">
				DELETE FROM	Tasks 
				WHERE	taskID = <cfqueryparam value="#arguments.tasks.gettaskID()#" CFSQLType="cf_sql_integer" />
			</cfquery>
			
		
		<cfreturn true />
	</cffunction>

	<cffunction name="exists" access="public" output="false" returntype="boolean">
		<cfargument name="tasks" type="tasks" required="true" />

		<cfset var qExists = "">
		<cfquery name="qExists" datasource="#variables.dsn#" maxrows="1">
			SELECT count(1) as idexists
			FROM	Tasks
			WHERE	taskID = <cfqueryparam value="#arguments.tasks.gettaskID()#" CFSQLType="cf_sql_integer" />
		</cfquery>

		<cfif qExists.idexists>
			<cfreturn true />
		<cfelse>
			<cfreturn false />
		</cfif>
	</cffunction>

	<cffunction name="save" access="public" output="false" returntype="boolean">
		<cfargument name="tasks" type="tasks" required="true" />
		
		<cfset var success = false />
		<cfif exists(arguments.tasks)>
			<cfset success = update(arguments.tasks) />
		<cfelse>
			<cfset success = create(arguments.tasks) />
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
