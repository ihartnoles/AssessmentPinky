
<cfcomponent displayname="messagesDAO" hint="table ID column = MessageID">

	<cffunction name="init" access="public" output="false" returntype="messagesDAO">
		<cfargument name="dsn" type="string" required="true">
		<cfset variables.dsn = arguments.dsn>
		<cfreturn this>
	</cffunction>
	
	<cffunction name="create" access="public" output="false" returntype="numeric">
		<cfargument name="messages" type="messages" required="true" />

		<cfset var qCreate = "" />
		
			<cfquery name="qCreate" datasource="#variables.dsn#" result="res">
				INSERT INTO Messages
					(
					SendToUserID,
					MessageTypeID,
					Subject,
					Message,
					CreatedOn,
					CreatedBy,
					Important
					)
				VALUES
					(
					<cfqueryparam value="#arguments.messages.getSendToUserID()#" CFSQLType="cf_sql_integer" null="#not len(arguments.messages.getSendToUserID())#" />,
					<cfqueryparam value="#arguments.messages.getMessageTypeID()#" CFSQLType="cf_sql_integer" null="#not len(arguments.messages.getMessageTypeID())#" />,
					<cfqueryparam value="#arguments.messages.getSubject()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.messages.getSubject())#" />,
					<cfqueryparam value="#arguments.messages.getMessage()#" CFSQLType="cf_sql_longvarchar" null="#not len(arguments.messages.getMessage())#" />,
					<cfqueryparam value="#arguments.messages.getCreatedOn()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.messages.getCreatedOn())#" />,
					<cfqueryparam value="#arguments.messages.getCreatedBy()#" CFSQLType="cf_sql_integer" null="#not len(arguments.messages.getCreatedBy())#" />,
					<cfqueryparam value="#arguments.messages.getImportant()#" CFSQLType="cf_sql_integer" null="#not len(arguments.messages.getImportant())#" />
					)
			</cfquery>
			
		<cfreturn res.identitycol />
	</cffunction>

	<cffunction name="read" access="public" output="false" returntype="void">
		<cfargument name="messages" type="messages" required="true" />

		<cfset var qRead = "" />
		<cfset var strReturn = structNew() />
		
			<cfquery name="qRead" datasource="#variables.dsn#">
				SELECT
					MessageID,
					SendToUserID,
					MessageTypeID,
					Subject,
					Message,
					CreatedOn,
					CreatedBy,
					Important
				FROM	Messages
				WHERE	MessageID = <cfqueryparam value="#arguments.messages.getMessageID()#" CFSQLType="cf_sql_integer" />
			</cfquery>
			
		<cfif qRead.recordCount>
			<cfset strReturn = queryRowToStruct(qRead)>
			<cfset arguments.messages.init(argumentCollection=strReturn)>
		</cfif>
	</cffunction>

	<cffunction name="update" access="public" output="false" returntype="boolean">
		<cfargument name="messages" type="messages" required="true" />

		<cfset var qUpdate = "" />
		
			<cfquery name="qUpdate" datasource="#variables.dsn#">
				UPDATE	Messages
				SET
					SendToUserID = <cfqueryparam value="#arguments.messages.getSendToUserID()#" CFSQLType="cf_sql_integer" null="#not len(arguments.messages.getSendToUserID())#" />,
					MessageTypeID = <cfqueryparam value="#arguments.messages.getMessageTypeID()#" CFSQLType="cf_sql_integer" null="#not len(arguments.messages.getMessageTypeID())#" />,
					Subject = <cfqueryparam value="#arguments.messages.getSubject()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.messages.getSubject())#" />,
					Message = <cfqueryparam value="#arguments.messages.getMessage()#" CFSQLType="cf_sql_longvarchar" null="#not len(arguments.messages.getMessage())#" />,
					CreatedOn = <cfqueryparam value="#arguments.messages.getCreatedOn()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.messages.getCreatedOn())#" />,
					CreatedBy = <cfqueryparam value="#arguments.messages.getCreatedBy()#" CFSQLType="cf_sql_integer" null="#not len(arguments.messages.getCreatedBy())#" />,
					Important = <cfqueryparam value="#arguments.messages.getImportant()#" CFSQLType="cf_sql_integer" null="#not len(arguments.messages.getImportant())#" />
				WHERE	MessageID = <cfqueryparam value="#arguments.messages.getMessageID()#" CFSQLType="cf_sql_integer" />
			</cfquery>
			
		<cfreturn true />
	</cffunction>

	<cffunction name="delete" access="public" output="false" returntype="boolean">
		<cfargument name="messages" type="messages" required="true" />

		<cfset var qDelete = "">
		
			<cfquery name="qDelete" datasource="#variables.dsn#">
				DELETE FROM	Messages 
				WHERE	MessageID = <cfqueryparam value="#arguments.messages.getMessageID()#" CFSQLType="cf_sql_integer" />
			</cfquery>
					
		<cfreturn true />
	</cffunction>

	<cffunction name="exists" access="public" output="false" returntype="boolean">
		<cfargument name="messages" type="messages" required="true" />

		<cfset var qExists = "">
		<cfquery name="qExists" datasource="#variables.dsn#" maxrows="1">
			SELECT count(1) as idexists
			FROM	Messages
			WHERE	MessageID = <cfqueryparam value="#arguments.messages.getMessageID()#" CFSQLType="cf_sql_integer" />
		</cfquery>

		<cfif qExists.idexists>
			<cfreturn true />
		<cfelse>
			<cfreturn false />
		</cfif>
	</cffunction>

	<cffunction name="save" access="public" output="false" returntype="boolean">
		<cfargument name="messages" type="messages" required="true" />
		
		<cfset var success = false />
		<cfif exists(arguments.messages)>
			<cfset success = update(arguments.messages) />
		<cfelse>
			<cfset success = create(arguments.messages) />
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
