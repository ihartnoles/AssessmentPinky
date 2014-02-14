
<cfcomponent displayname="ProgramImprovementCodesDAO" hint="table ID column = ProgramImprovementCodeID">

	<cffunction name="init" access="public" output="false" returntype="ProgramImprovementCodesDAO">
		<cfargument name="dsn" type="string" required="true">
		<cfset variables.dsn = arguments.dsn>
		<cfreturn this>
	</cffunction>
	
	<cffunction name="create" access="public" output="false" returntype="boolean">
		<cfargument name="ProgramImprovementCodes" type="ProgramImprovementCodes" required="true" />

		<cfset var qCreate = "" />
		<cftry>
			<cfquery name="qCreate" datasource="#variables.dsn#">
				INSERT INTO ProgramImprovementCodes
					(
					item_number,
					label,
					description
					)
				VALUES
					(
					<cfqueryparam value="#arguments.ProgramImprovementCodes.getitem_number()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.ProgramImprovementCodes.getitem_number())#" />,
					<cfqueryparam value="#arguments.ProgramImprovementCodes.getlabel()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.ProgramImprovementCodes.getlabel())#" />,
					<cfqueryparam value="#arguments.ProgramImprovementCodes.getdescription()#" CFSQLType="cf_sql_longvarchar" null="#not len(arguments.ProgramImprovementCodes.getdescription())#" />
					)
			</cfquery>
			<cfcatch type="database">
				<cfreturn false />
			</cfcatch>
		</cftry>
		<cfreturn true />
	</cffunction>

	<cffunction name="read" access="public" output="false" returntype="void">
		<cfargument name="ProgramImprovementCodes" type="ProgramImprovementCodes" required="true" />

		<cfset var qRead = "" />
		<cfset var strReturn = structNew() />
		<cftry>
			<cfquery name="qRead" datasource="#variables.dsn#">
				SELECT
					ProgramImprovementCodeID,
					item_number,
					label,
					description
				FROM	ProgramImprovementCodes
				WHERE	ProgramImprovementCodeID = <cfqueryparam value="#arguments.ProgramImprovementCodes.getProgramImprovementCodeID()#" CFSQLType="cf_sql_integer" />
			</cfquery>
			<cfcatch type="database">
				<!--- leave the bean as is and set an empty query for the conditional logic below --->
				<cfset qRead = queryNew("id") />
			</cfcatch>
		</cftry>
		<cfif qRead.recordCount>
			<cfset strReturn = queryRowToStruct(qRead)>
			<cfset arguments.ProgramImprovementCodes.init(argumentCollection=strReturn)>
		</cfif>
	</cffunction>

	<cffunction name="update" access="public" output="false" returntype="boolean">
		<cfargument name="ProgramImprovementCodes" type="ProgramImprovementCodes" required="true" />

		<cfset var qUpdate = "" />
		<cftry>
			<cfquery name="qUpdate" datasource="#variables.dsn#">
				UPDATE	ProgramImprovementCodes
				SET
					item_number = <cfqueryparam value="#arguments.ProgramImprovementCodes.getitem_number()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.ProgramImprovementCodes.getitem_number())#" />,
					label = <cfqueryparam value="#arguments.ProgramImprovementCodes.getlabel()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.ProgramImprovementCodes.getlabel())#" />,
					description = <cfqueryparam value="#arguments.ProgramImprovementCodes.getdescription()#" CFSQLType="cf_sql_longvarchar" null="#not len(arguments.ProgramImprovementCodes.getdescription())#" />
				WHERE	ProgramImprovementCodeID = <cfqueryparam value="#arguments.ProgramImprovementCodes.getProgramImprovementCodeID()#" CFSQLType="cf_sql_integer" />
			</cfquery>
			<cfcatch type="database">
				<cfreturn false />
			</cfcatch>
		</cftry>
		<cfreturn true />
	</cffunction>

	<cffunction name="delete" access="public" output="false" returntype="boolean">
		<cfargument name="ProgramImprovementCodes" type="ProgramImprovementCodes" required="true" />

		<cfset var qDelete = "">
		<cftry>
			<cfquery name="qDelete" datasource="#variables.dsn#">
				DELETE FROM	ProgramImprovementCodes 
				WHERE	ProgramImprovementCodeID = <cfqueryparam value="#arguments.ProgramImprovementCodes.getProgramImprovementCodeID()#" CFSQLType="cf_sql_integer" />
			</cfquery>
			<cfcatch type="database">
				<cfreturn false />
			</cfcatch>
		</cftry>
		<cfreturn true />
	</cffunction>

	<cffunction name="exists" access="public" output="false" returntype="boolean">
		<cfargument name="ProgramImprovementCodes" type="ProgramImprovementCodes" required="true" />

		<cfset var qExists = "">
		<cfquery name="qExists" datasource="#variables.dsn#" maxrows="1">
			SELECT count(1) as idexists
			FROM	ProgramImprovementCodes
			WHERE	ProgramImprovementCodeID = <cfqueryparam value="#arguments.ProgramImprovementCodes.getProgramImprovementCodeID()#" CFSQLType="cf_sql_integer" />
		</cfquery>

		<cfif qExists.idexists>
			<cfreturn true />
		<cfelse>
			<cfreturn false />
		</cfif>
	</cffunction>

	<cffunction name="save" access="public" output="false" returntype="boolean">
		<cfargument name="ProgramImprovementCodes" type="ProgramImprovementCodes" required="true" />
		
		<cfset var success = false />
		<cfif exists(arguments.ProgramImprovementCodes)>
			<cfset success = update(arguments.ProgramImprovementCodes) />
		<cfelse>
			<cfset success = create(arguments.ProgramImprovementCodes) />
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
