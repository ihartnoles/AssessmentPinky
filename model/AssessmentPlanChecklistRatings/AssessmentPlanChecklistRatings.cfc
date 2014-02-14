
<cfcomponent displayname="AssessmentPlanChecklistRatings" output="false">
		<cfproperty name="ChecklistRatingID" type="numeric" default="" />
		<cfproperty name="PlanID" type="numeric" default="" />
		<cfproperty name="ReportingUnitID" type="numeric" default="" />
		<cfproperty name="ChecklistTypeID" type="numeric" default="" />
		<cfproperty name="Rating" type="string" default="" />
		
	<!---
	PROPERTIES
	--->
	<cfset variables.instance = StructNew() />

	<!---
	INITIALIZATION / CONFIGURATION
	--->
	<cffunction name="init" access="public" returntype="AssessmentPlanChecklistRatings" output="false">
		<cfargument name="ChecklistRatingID" type="string" required="false" default="" />
		<cfargument name="PlanID" type="string" required="false" default="" />
		<cfargument name="ReportingUnitID" type="string" required="false" default="" />
		<cfargument name="ChecklistTypeID" type="string" required="false" default="" />
		<cfargument name="Rating" type="string" required="false" default="" />
		
		<!--- run setters --->
		<cfset setChecklistRatingID(arguments.ChecklistRatingID) />
		<cfset setPlanID(arguments.PlanID) />
		<cfset setReportingUnitID(arguments.ReportingUnitID) />
		<cfset setChecklistTypeID(arguments.ChecklistTypeID) />
		<cfset setRating(arguments.Rating) />
		
		<cfreturn this />
 	</cffunction>

	<!---
	PUBLIC FUNCTIONS
	--->
	<cffunction name="setMemento" access="public" returntype="AssessmentPlanChecklistRatings" output="false">
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
		
		<!--- ChecklistRatingID --->
		<cfif (len(trim(getChecklistRatingID())) AND NOT isNumeric(trim(getChecklistRatingID())))>
			<cfset thisError.field = "ChecklistRatingID" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "ChecklistRatingID is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- PlanID --->
		<cfif (len(trim(getPlanID())) AND NOT isNumeric(trim(getPlanID())))>
			<cfset thisError.field = "PlanID" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "PlanID is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- ReportingUnitID --->
		<cfif (len(trim(getReportingUnitID())) AND NOT isNumeric(trim(getReportingUnitID())))>
			<cfset thisError.field = "ReportingUnitID" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "ReportingUnitID is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- ChecklistTypeID --->
		<cfif (len(trim(getChecklistTypeID())) AND NOT isNumeric(trim(getChecklistTypeID())))>
			<cfset thisError.field = "ChecklistTypeID" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "ChecklistTypeID is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- Rating --->
		<cfif (len(trim(getRating())) AND NOT IsSimpleValue(trim(getRating())))>
			<cfset thisError.field = "Rating" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "Rating is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getRating())) GT 50)>
			<cfset thisError.field = "Rating" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "Rating is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<cfreturn errors />
	</cffunction>

	<!---
	ACCESSORS
	--->
	<cffunction name="setChecklistRatingID" access="public" returntype="void" output="false">
		<cfargument name="ChecklistRatingID" type="string" required="true" />
		<cfset variables.instance.ChecklistRatingID = arguments.ChecklistRatingID />
	</cffunction>
	<cffunction name="getChecklistRatingID" access="public" returntype="string" output="false">
		<cfreturn variables.instance.ChecklistRatingID />
	</cffunction>

	<cffunction name="setPlanID" access="public" returntype="void" output="false">
		<cfargument name="PlanID" type="string" required="true" />
		<cfset variables.instance.PlanID = arguments.PlanID />
	</cffunction>
	<cffunction name="getPlanID" access="public" returntype="string" output="false">
		<cfreturn variables.instance.PlanID />
	</cffunction>

	<cffunction name="setReportingUnitID" access="public" returntype="void" output="false">
		<cfargument name="ReportingUnitID" type="string" required="true" />
		<cfset variables.instance.ReportingUnitID = arguments.ReportingUnitID />
	</cffunction>
	<cffunction name="getReportingUnitID" access="public" returntype="string" output="false">
		<cfreturn variables.instance.ReportingUnitID />
	</cffunction>

	<cffunction name="setChecklistTypeID" access="public" returntype="void" output="false">
		<cfargument name="ChecklistTypeID" type="string" required="true" />
		<cfset variables.instance.ChecklistTypeID = arguments.ChecklistTypeID />
	</cffunction>
	<cffunction name="getChecklistTypeID" access="public" returntype="string" output="false">
		<cfreturn variables.instance.ChecklistTypeID />
	</cffunction>

	<cffunction name="setRating" access="public" returntype="void" output="false">
		<cfargument name="Rating" type="string" required="true" />
		<cfset variables.instance.Rating = arguments.Rating />
	</cffunction>
	<cffunction name="getRating" access="public" returntype="string" output="false">
		<cfreturn variables.instance.Rating />
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
