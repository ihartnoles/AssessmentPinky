
<cfcomponent displayname="ALCCategoriesGateway" output="false">
	<cffunction name="init" access="public" output="false" returntype="ALCCategoriesGateway">
		<cfargument name="dsn" type="string" required="true" />
		<cfset variables.dsn = arguments.dsn />
		<cfreturn this />
	</cffunction>
	
	<cffunction name="getByAttributesQuery" access="public" output="false" returntype="query">
		<cfargument name="CategoryID" type="numeric" required="false" />
		<cfargument name="CategoryOrder" type="numeric" required="false" />
		<cfargument name="CategoryTitle" type="string" required="false" />
		<cfargument name="CategoryActive" type="numeric" required="false" />
		<cfargument name="orderby" type="string" required="false" />
		
		<cfset var qList = "" />		
		<cfquery name="qList" datasource="#variables.dsn#">
			SELECT
				CategoryID,
				CategoryOrder,
				CategoryTitle,
				CategoryActive
			FROM	ALCCategories
			WHERE	0=0
		
		<cfif structKeyExists(arguments,"CategoryID") and len(arguments.CategoryID)>
			AND	CategoryID = <cfqueryparam value="#arguments.CategoryID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"CategoryOrder") and len(arguments.CategoryOrder)>
			AND	CategoryOrder = <cfqueryparam value="#arguments.CategoryOrder#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"CategoryTitle") and len(arguments.CategoryTitle)>
			AND	CategoryTitle = <cfqueryparam value="#arguments.CategoryTitle#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"CategoryActive") and len(arguments.CategoryActive)>
			AND	CategoryActive = <cfqueryparam value="#arguments.CategoryActive#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments, "orderby") and len(arguments.orderBy)>
			ORDER BY #arguments.orderby#
		</cfif>
		</cfquery>
		
		<cfreturn qList />
	</cffunction>

	<cffunction name="getALCCheckboxes" access="public" output="false" returntype="query">				
		<cfset var qList = "" />		
		<cfquery name="qList" datasource="#variables.dsn#">
			SELECT 
				ALCCategories.CategoryID, 
				ALCCategories.CategoryTitle, 
				ALCSubcategories.SubCategoryID, 
				CASE 
					WHEN ALCSubcategories.SubCategoryID = 10011 THEN 'Content Knowledge'
					WHEN ALCSubcategories.SubCategoryID = 10012 THEN 'Communication'
					WHEN ALCSubcategories.SubCategoryID = 10013 THEN 'Critical Thinking'
					ELSE ALCSubcategories.SubCategoryTitle
				END as SubCategoryTitle, 
				ALCSubcategories.SubCategoryActive 

			FROM ALCCategories 
				INNER JOIN ALCSubcategories ON ALCCategories.CategoryID = ALCSubcategories.CategoryID 

			WHERE 0=0

			AND ALCSubcategories.SubCategoryID NOT IN (10014) 

			ORDER BY ALCCategories.CategoryID, ALCSubcategories.SubCategoryID DESC
		</cfquery>		
		<cfreturn qList />
	</cffunction>

	<cffunction name="getALCCategoriesSelected" access="public" output="false" returntype="query">				
		<cfset var qList = "" />		
		<cfquery name="qList" datasource="#variables.dsn#">
			SELECT 
				recordId,
				outcomeID,
				SubCategoryID
			FROM 
				AssessmentALCOutcomeCategories

			WHERE 0=0

			<cfif structKeyExists(arguments,"outcomeID") and len(arguments.outcomeID)>
				AND	outcomeID = <cfqueryparam value="#arguments.outcomeID#" CFSQLType="cf_sql_integer" />
			</cfif>

			ORDER BY SubCategoryID DESC

		</cfquery>		
		<cfreturn qList />
	</cffunction>

	<cffunction name="getByAttributes" access="public" output="false" returntype="array">
		<cfargument name="CategoryID" type="numeric" required="false" />
		<cfargument name="CategoryOrder" type="numeric" required="false" />
		<cfargument name="CategoryTitle" type="string" required="false" />
		<cfargument name="CategoryActive" type="numeric" required="false" />
		<cfargument name="orderby" type="string" required="false" />
		
		<cfset var qList = getByAttributesQuery(argumentCollection=arguments) />		
		<cfset var arrObjects = arrayNew(1) />
		<cfset var tmpObj = "" />
		<cfset var i = 0 />
		<cfloop from="1" to="#qList.recordCount#" index="i">
			<cfset tmpObj = createObject("component","ALCCategories").init(argumentCollection=queryRowToStruct(qList,i)) />
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
