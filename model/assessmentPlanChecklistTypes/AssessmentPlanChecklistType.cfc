
<cfcomponent displayname="AssessmentPlanChecklistType" output="false">
		<cfproperty name="ChecklistTypeID" type="numeric" default="" />
		<cfproperty name="Category" type="string" default="" />
		<cfproperty name="SubCategory" type="string" default="" />
		
	<!---
	PROPERTIES
	--->
	<cfset variables.instance = StructNew() />

	<!---
	INITIALIZATION / CONFIGURATION
	--->
	<cffunction name="init" access="public" returntype="AssessmentPlanChecklistType" output="false">
		<cfargument name="ChecklistTypeID" type="string" required="false" default="" />
		<cfargument name="Category" type="string" required="false" default="" />
		<cfargument name="SubCategory" type="string" required="false" default="" />
		
		<!--- run setters --->
		<cfset setChecklistTypeID(arguments.ChecklistTypeID) />
		<cfset setCategory(arguments.Category) />
		<cfset setSubCategory(arguments.SubCategory) />
		
		<cfreturn this />
 	</cffunction>

	<!---
	PUBLIC FUNCTIONS
	--->
	<cffunction name="setMemento" access="public" returntype="AssessmentPlanChecklistType" output="false">
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
		
		<!--- ChecklistTypeID --->
		<cfif (len(trim(getChecklistTypeID())) AND NOT isNumeric(trim(getChecklistTypeID())))>
			<cfset thisError.field = "ChecklistTypeID" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "ChecklistTypeID is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- Category --->
		<cfif (len(trim(getCategory())) AND NOT IsSimpleValue(trim(getCategory())))>
			<cfset thisError.field = "Category" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "Category is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getCategory())) GT 200)>
			<cfset thisError.field = "Category" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "Category is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- SubCategory --->
		<cfif (len(trim(getSubCategory())) AND NOT IsSimpleValue(trim(getSubCategory())))>
			<cfset thisError.field = "SubCategory" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "SubCategory is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getSubCategory())) GT 250)>
			<cfset thisError.field = "SubCategory" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "SubCategory is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<cfreturn errors />
	</cffunction>

	<!---
	ACCESSORS
	--->
	<cffunction name="setChecklistTypeID" access="public" returntype="void" output="false">
		<cfargument name="ChecklistTypeID" type="string" required="true" />
		<cfset variables.instance.ChecklistTypeID = arguments.ChecklistTypeID />
	</cffunction>
	<cffunction name="getChecklistTypeID" access="public" returntype="string" output="false">
		<cfreturn variables.instance.ChecklistTypeID />
	</cffunction>

	<cffunction name="setCategory" access="public" returntype="void" output="false">
		<cfargument name="Category" type="string" required="true" />
		<cfset variables.instance.Category = arguments.Category />
	</cffunction>
	<cffunction name="getCategory" access="public" returntype="string" output="false">
		<cfreturn variables.instance.Category />
	</cffunction>

	<cffunction name="setSubCategory" access="public" returntype="void" output="false">
		<cfargument name="SubCategory" type="string" required="true" />
		<cfset variables.instance.SubCategory = arguments.SubCategory />
	</cffunction>
	<cffunction name="getSubCategory" access="public" returntype="string" output="false">
		<cfreturn variables.instance.SubCategory />
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
