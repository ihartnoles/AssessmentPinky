
<cfcomponent displayname="organizationDivisionDAO" hint="table ID column = DivisionID">

	<cffunction name="init" access="public" output="false" returntype="organizationDivisionDAO">
		<cfargument name="dsn" type="string" required="true">
		<cfset variables.dsn = arguments.dsn>
		<cfreturn this>
	</cffunction>
	
	<cffunction name="create" access="public" output="false" returntype="boolean">
		<cfargument name="organizationDivision" type="organizationDivision" required="true" />

		<cfset var qCreate = "" />
		<cftry>
			<cfquery name="qCreate" datasource="#variables.dsn#">
				INSERT INTO OrganizationDivision
					(
					DivisionName,
					DivisionAbv,
					SamasDivisionID,
					SuperDivisionID,
					DivisionActive
					)
				VALUES
					(
					<cfqueryparam value="#arguments.organizationDivision.getDivisionName()#" CFSQLType="cf_sql_varchar" />,
					<cfqueryparam value="#arguments.organizationDivision.getDivisionAbv()#" CFSQLType="cf_sql_char" />,
					<cfqueryparam value="#arguments.organizationDivision.getSamasDivisionID()#" CFSQLType="cf_sql_char" null="#not len(arguments.organizationDivision.getSamasDivisionID())#" />,
					<cfqueryparam value="#arguments.organizationDivision.getSuperDivisionID()#" CFSQLType="cf_sql_integer" />,
					<cfqueryparam value="#arguments.organizationDivision.getDivisionActive()#" CFSQLType="cf_sql_integer" null="#not len(arguments.organizationDivision.getDivisionActive())#" />
					)
			</cfquery>
			<cfcatch type="database">
				<cfreturn false />
			</cfcatch>
		</cftry>
		<cfreturn true />
	</cffunction>

	<cffunction name="read" access="public" output="false" returntype="void">
		<cfargument name="organizationDivision" type="organizationDivision" required="true" />

		<cfset var qRead = "" />
		<cfset var strReturn = structNew() />
		<cftry>
			<cfquery name="qRead" datasource="#variables.dsn#">
				SELECT
					DivisionID,
					DivisionName,
					DivisionAbv,
					SamasDivisionID,
					SuperDivisionID,
					DivisionActive
				FROM	OrganizationDivision
				WHERE	DivisionID = <cfqueryparam value="#arguments.organizationDivision.getDivisionID()#" CFSQLType="cf_sql_integer" />
			</cfquery>
			<cfcatch type="database">
				<!--- leave the bean as is and set an empty query for the conditional logic below --->
				<cfset qRead = queryNew("id") />
			</cfcatch>
		</cftry>
		<cfif qRead.recordCount>
			<cfset strReturn = queryRowToStruct(qRead)>
			<cfset arguments.organizationDivision.init(argumentCollection=strReturn)>
		</cfif>
	</cffunction>

	<cffunction name="update" access="public" output="false" returntype="boolean">
		<cfargument name="organizationDivision" type="organizationDivision" required="true" />

		<cfset var qUpdate = "" />
		<cftry>
			<cfquery name="qUpdate" datasource="#variables.dsn#">
				UPDATE	OrganizationDivision
				SET
					DivisionName = <cfqueryparam value="#arguments.organizationDivision.getDivisionName()#" CFSQLType="cf_sql_varchar" />,
					DivisionAbv = <cfqueryparam value="#arguments.organizationDivision.getDivisionAbv()#" CFSQLType="cf_sql_char" />,
					SamasDivisionID = <cfqueryparam value="#arguments.organizationDivision.getSamasDivisionID()#" CFSQLType="cf_sql_char" null="#not len(arguments.organizationDivision.getSamasDivisionID())#" />,
					SuperDivisionID = <cfqueryparam value="#arguments.organizationDivision.getSuperDivisionID()#" CFSQLType="cf_sql_integer" />,
					DivisionActive = <cfqueryparam value="#arguments.organizationDivision.getDivisionActive()#" CFSQLType="cf_sql_integer" null="#not len(arguments.organizationDivision.getDivisionActive())#" />
				WHERE	DivisionID = <cfqueryparam value="#arguments.organizationDivision.getDivisionID()#" CFSQLType="cf_sql_integer" />
			</cfquery>
			<cfcatch type="database">
				<cfreturn false />
			</cfcatch>
		</cftry>
		<cfreturn true />
	</cffunction>

	<cffunction name="delete" access="public" output="false" returntype="boolean">
		<cfargument name="organizationDivision" type="organizationDivision" required="true" />

		<cfset var qDelete = "">
		<cftry>
			<cfquery name="qDelete" datasource="#variables.dsn#">
				DELETE FROM	OrganizationDivision 
				WHERE	DivisionID = <cfqueryparam value="#arguments.organizationDivision.getDivisionID()#" CFSQLType="cf_sql_integer" />
			</cfquery>
			<cfcatch type="database">
				<cfreturn false />
			</cfcatch>
		</cftry>
		<cfreturn true />
	</cffunction>

	<cffunction name="exists" access="public" output="false" returntype="boolean">
		<cfargument name="organizationDivision" type="organizationDivision" required="true" />

		<cfset var qExists = "">
		<cfquery name="qExists" datasource="#variables.dsn#" maxrows="1">
			SELECT count(1) as idexists
			FROM	OrganizationDivision
			WHERE	DivisionID = <cfqueryparam value="#arguments.organizationDivision.getDivisionID()#" CFSQLType="cf_sql_integer" />
		</cfquery>

		<cfif qExists.idexists>
			<cfreturn true />
		<cfelse>
			<cfreturn false />
		</cfif>
	</cffunction>

	<cffunction name="save" access="public" output="false" returntype="boolean">
		<cfargument name="organizationDivision" type="organizationDivision" required="true" />
		
		<cfset var success = false />
		<cfif exists(arguments.organizationDivision)>
			<cfset success = update(arguments.organizationDivision) />
		<cfelse>
			<cfset success = create(arguments.organizationDivision) />
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
