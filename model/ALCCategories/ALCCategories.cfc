
<cfcomponent displayname="ALCCategories" output="false">
		<cfproperty name="CategoryID" type="numeric" default="" />
		<cfproperty name="CategoryOrder" type="numeric" default="" />
		<cfproperty name="CategoryTitle" type="string" default="" />
		<cfproperty name="CategoryActive" type="numeric" default="" />
		
	<!---
	PROPERTIES
	--->
	<cfset variables.instance = StructNew() />

	<!---
	INITIALIZATION / CONFIGURATION
	--->
	<cffunction name="init" access="public" returntype="ALCCategories" output="false">
		<cfargument name="CategoryID" type="string" required="false" default="" />
		<cfargument name="CategoryOrder" type="string" required="false" default="" />
		<cfargument name="CategoryTitle" type="string" required="false" default="" />
		<cfargument name="CategoryActive" type="string" required="false" default="" />
		
		<!--- run setters --->
		<cfset setCategoryID(arguments.CategoryID) />
		<cfset setCategoryOrder(arguments.CategoryOrder) />
		<cfset setCategoryTitle(arguments.CategoryTitle) />
		<cfset setCategoryActive(arguments.CategoryActive) />
		
		<cfreturn this />
 	</cffunction>

	<!---
	PUBLIC FUNCTIONS
	--->
	<cffunction name="setMemento" access="public" returntype="ALCCategories" output="false">
		<cfargument name="memento" type="struct" required="yes"/>
		<cfset variables.instance = arguments.memento />
		<cfreturn this />
	</cffunction>
	<cffunction name="getMemento" access="public" returntype="struct" output="false" >
		<cfreturn variables.instance />
	</cffunction>

	<cffunction name="validate" access="public" returntype="array" output="false">
		<cfset var errors = arrayNew(1) />
		<cfset var thisError = structNew() />
		
		<!--- CategoryID --->
		<cfif (len(trim(getCategoryID())) AND NOT isNumeric(trim(getCategoryID())))>
			<cfset thisError.field = "CategoryID" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "CategoryID is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- CategoryOrder --->
		<cfif (NOT len(trim(getCategoryOrder())))>
			<cfset thisError.field = "CategoryOrder" />
			<cfset thisError.type = "required" />
			<cfset thisError.message = "CategoryOrder is required" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getCategoryOrder())) AND NOT isNumeric(trim(getCategoryOrder())))>
			<cfset thisError.field = "CategoryOrder" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "CategoryOrder is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- CategoryTitle --->
		<cfif (NOT len(trim(getCategoryTitle())))>
			<cfset thisError.field = "CategoryTitle" />
			<cfset thisError.type = "required" />
			<cfset thisError.message = "CategoryTitle is required" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getCategoryTitle())) AND NOT IsSimpleValue(trim(getCategoryTitle())))>
			<cfset thisError.field = "CategoryTitle" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "CategoryTitle is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getCategoryTitle())) GT 60)>
			<cfset thisError.field = "CategoryTitle" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "CategoryTitle is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- CategoryActive --->
		<cfif (len(trim(getCategoryActive())) AND NOT isNumeric(trim(getCategoryActive())))>
			<cfset thisError.field = "CategoryActive" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "CategoryActive is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<cfreturn errors />
	</cffunction>

	<!---
	ACCESSORS
	--->
	<cffunction name="setCategoryID" access="public" returntype="void" output="false">
		<cfargument name="CategoryID" type="string" required="true" />
		<cfset variables.instance.CategoryID = arguments.CategoryID />
	</cffunction>
	<cffunction name="getCategoryID" access="public" returntype="string" output="false">
		<cfreturn variables.instance.CategoryID />
	</cffunction>

	<cffunction name="setCategoryOrder" access="public" returntype="void" output="false">
		<cfargument name="CategoryOrder" type="string" required="true" />
		<cfset variables.instance.CategoryOrder = arguments.CategoryOrder />
	</cffunction>
	<cffunction name="getCategoryOrder" access="public" returntype="string" output="false">
		<cfreturn variables.instance.CategoryOrder />
	</cffunction>

	<cffunction name="setCategoryTitle" access="public" returntype="void" output="false">
		<cfargument name="CategoryTitle" type="string" required="true" />
		<cfset variables.instance.CategoryTitle = arguments.CategoryTitle />
	</cffunction>
	<cffunction name="getCategoryTitle" access="public" returntype="string" output="false">
		<cfreturn variables.instance.CategoryTitle />
	</cffunction>

	<cffunction name="setCategoryActive" access="public" returntype="void" output="false">
		<cfargument name="CategoryActive" type="string" required="true" />
		<cfset variables.instance.CategoryActive = arguments.CategoryActive />
	</cffunction>
	<cffunction name="getCategoryActive" access="public" returntype="string" output="false">
		<cfreturn variables.instance.CategoryActive />
	</cffunction>


	<!---
	DUMP
	--->
	<cffunction name="dump" access="public" output="true" return="void">
		<cfargument name="abort" type="boolean" default="false" />
		<cfdump var="#variables.instance#" />
		<cfif arguments.abort>
			<cfabort />
		</cfif>
	</cffunction>

</cfcomponent>
