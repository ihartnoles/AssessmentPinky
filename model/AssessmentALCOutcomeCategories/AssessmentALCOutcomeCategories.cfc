
<cfcomponent displayname="AssessmentALCOutcomeCategories" output="false">
		<cfproperty name="RecordID" type="numeric" default="" />
		<cfproperty name="OutcomeID" type="numeric" default="" />
		<cfproperty name="SubCategoryID" type="numeric" default="" />
		<cfproperty name="OtherDescription" type="string" default="" />
		
	<!---
	PROPERTIES
	--->
	<cfset variables.instance = StructNew() />

	<!---
	INITIALIZATION / CONFIGURATION
	--->
	<cffunction name="init" access="public" returntype="AssessmentALCOutcomeCategories" output="false">
		<cfargument name="RecordID" type="string" required="false" default="" />
		<cfargument name="OutcomeID" type="string" required="false" default="" />
		<cfargument name="SubCategoryID" type="string" required="false" default="" />
		<cfargument name="OtherDescription" type="string" required="false" default="" />
		
		<!--- run setters --->
		<cfset setRecordID(arguments.RecordID) />
		<cfset setOutcomeID(arguments.OutcomeID) />
		<cfset setSubCategoryID(arguments.SubCategoryID) />
		<cfset setOtherDescription(arguments.OtherDescription) />
		
		<cfreturn this />
 	</cffunction>

	<!---
	PUBLIC FUNCTIONS
	--->
	<cffunction name="setMemento" access="public" returntype="AssessmentALCOutcomeCategories" output="false">
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
		
		<!--- RecordID --->
		<cfif (len(trim(getRecordID())) AND NOT isNumeric(trim(getRecordID())))>
			<cfset thisError.field = "RecordID" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "RecordID is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- OutcomeID --->
		<cfif (NOT len(trim(getOutcomeID())))>
			<cfset thisError.field = "OutcomeID" />
			<cfset thisError.type = "required" />
			<cfset thisError.message = "OutcomeID is required" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getOutcomeID())) AND NOT isNumeric(trim(getOutcomeID())))>
			<cfset thisError.field = "OutcomeID" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "OutcomeID is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- SubCategoryID --->
		<cfif (NOT len(trim(getSubCategoryID())))>
			<cfset thisError.field = "SubCategoryID" />
			<cfset thisError.type = "required" />
			<cfset thisError.message = "SubCategoryID is required" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getSubCategoryID())) AND NOT isNumeric(trim(getSubCategoryID())))>
			<cfset thisError.field = "SubCategoryID" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "SubCategoryID is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- OtherDescription --->
		<cfif (len(trim(getOtherDescription())) AND NOT IsSimpleValue(trim(getOtherDescription())))>
			<cfset thisError.field = "OtherDescription" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "OtherDescription is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getOtherDescription())) GT 300)>
			<cfset thisError.field = "OtherDescription" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "OtherDescription is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<cfreturn errors />
	</cffunction>

	<!---
	ACCESSORS
	--->
	<cffunction name="setRecordID" access="public" returntype="void" output="false">
		<cfargument name="RecordID" type="string" required="true" />
		<cfset variables.instance.RecordID = arguments.RecordID />
	</cffunction>
	<cffunction name="getRecordID" access="public" returntype="string" output="false">
		<cfreturn variables.instance.RecordID />
	</cffunction>

	<cffunction name="setOutcomeID" access="public" returntype="void" output="false">
		<cfargument name="OutcomeID" type="string" required="true" />
		<cfset variables.instance.OutcomeID = arguments.OutcomeID />
	</cffunction>
	<cffunction name="getOutcomeID" access="public" returntype="string" output="false">
		<cfreturn variables.instance.OutcomeID />
	</cffunction>

	<cffunction name="setSubCategoryID" access="public" returntype="void" output="false">
		<cfargument name="SubCategoryID" type="string" required="true" />
		<cfset variables.instance.SubCategoryID = arguments.SubCategoryID />
	</cffunction>
	<cffunction name="getSubCategoryID" access="public" returntype="string" output="false">
		<cfreturn variables.instance.SubCategoryID />
	</cffunction>

	<cffunction name="setOtherDescription" access="public" returntype="void" output="false">
		<cfargument name="OtherDescription" type="string" required="true" />
		<cfset variables.instance.OtherDescription = arguments.OtherDescription />
	</cffunction>
	<cffunction name="getOtherDescription" access="public" returntype="string" output="false">
		<cfreturn variables.instance.OtherDescription />
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
