
<cfcomponent displayname="checklistComments" output="false">
		<cfproperty name="checklistCommentID" type="numeric" default="" />
		<cfproperty name="planID" type="numeric" default="" />
		<cfproperty name="reportingUnitID" type="numeric" default="" />
		<cfproperty name="checklistTypeID" type="numeric" default="" />
		<cfproperty name="comment" type="string" default="" />
		<cfproperty name="created_on" type="date" default="" />
		<cfproperty name="created_by" type="numeric" default="" />
		
	<!---
	PROPERTIES
	--->
	<cfset variables.instance = StructNew() />

	<!---
	INITIALIZATION / CONFIGURATION
	--->
	<cffunction name="init" access="public" returntype="checklistComments" output="false">
		<cfargument name="checklistCommentID" type="string" required="false" default="" />
		<cfargument name="planID" type="string" required="false" default="" />
		<cfargument name="reportingUnitID" type="string" required="false" default="" />
		<cfargument name="checklistTypeID" type="string" required="false" default="" />
		<cfargument name="comment" type="string" required="false" default="" />
		<cfargument name="created_on" type="string" required="false" default="" />
		<cfargument name="created_by" type="string" required="false" default="" />
		
		<!--- run setters --->
		<cfset setchecklistCommentID(arguments.checklistCommentID) />
		<cfset setplanID(arguments.planID) />
		<cfset setreportingUnitID(arguments.reportingUnitID) />
		<cfset setchecklistTypeID(arguments.checklistTypeID) />
		<cfset setcomment(arguments.comment) />
		<cfset setcreated_on(arguments.created_on) />
		<cfset setcreated_by(arguments.created_by) />
		
		<cfreturn this />
 	</cffunction>

	<!---
	PUBLIC FUNCTIONS
	--->
	<cffunction name="setMemento" access="public" returntype="checklistComments" output="false">
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
		
		<!--- checklistCommentID --->
		<cfif (len(trim(getchecklistCommentID())) AND NOT isNumeric(trim(getchecklistCommentID())))>
			<cfset thisError.field = "checklistCommentID" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "checklistCommentID is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- planID --->
		<cfif (len(trim(getplanID())) AND NOT isNumeric(trim(getplanID())))>
			<cfset thisError.field = "planID" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "planID is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- reportingUnitID --->
		<cfif (len(trim(getreportingUnitID())) AND NOT isNumeric(trim(getreportingUnitID())))>
			<cfset thisError.field = "reportingUnitID" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "reportingUnitID is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- checklistTypeID --->
		<cfif (len(trim(getchecklistTypeID())) AND NOT isNumeric(trim(getchecklistTypeID())))>
			<cfset thisError.field = "checklistTypeID" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "checklistTypeID is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- comment --->
		<cfif (len(trim(getcomment())) AND NOT IsSimpleValue(trim(getcomment())))>
			<cfset thisError.field = "comment" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "comment is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getcomment())) GT 2147483647)>
			<cfset thisError.field = "comment" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "comment is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- created_on --->
		<cfif (len(trim(getcreated_on())) AND NOT isDate(trim(getcreated_on())))>
			<cfset thisError.field = "created_on" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "created_on is not a date" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- created_by --->
		<cfif (len(trim(getcreated_by())) AND NOT isNumeric(trim(getcreated_by())))>
			<cfset thisError.field = "created_by" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "created_by is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<cfreturn errors />
	</cffunction>

	<!---
	ACCESSORS
	--->
	<cffunction name="setchecklistCommentID" access="public" returntype="void" output="false">
		<cfargument name="checklistCommentID" type="string" required="true" />
		<cfset variables.instance.checklistCommentID = arguments.checklistCommentID />
	</cffunction>
	<cffunction name="getchecklistCommentID" access="public" returntype="string" output="false">
		<cfreturn variables.instance.checklistCommentID />
	</cffunction>

	<cffunction name="setplanID" access="public" returntype="void" output="false">
		<cfargument name="planID" type="string" required="true" />
		<cfset variables.instance.planID = arguments.planID />
	</cffunction>
	<cffunction name="getplanID" access="public" returntype="string" output="false">
		<cfreturn variables.instance.planID />
	</cffunction>

	<cffunction name="setreportingUnitID" access="public" returntype="void" output="false">
		<cfargument name="reportingUnitID" type="string" required="true" />
		<cfset variables.instance.reportingUnitID = arguments.reportingUnitID />
	</cffunction>
	<cffunction name="getreportingUnitID" access="public" returntype="string" output="false">
		<cfreturn variables.instance.reportingUnitID />
	</cffunction>

	<cffunction name="setchecklistTypeID" access="public" returntype="void" output="false">
		<cfargument name="checklistTypeID" type="string" required="true" />
		<cfset variables.instance.checklistTypeID = arguments.checklistTypeID />
	</cffunction>
	<cffunction name="getchecklistTypeID" access="public" returntype="string" output="false">
		<cfreturn variables.instance.checklistTypeID />
	</cffunction>

	<cffunction name="setcomment" access="public" returntype="void" output="false">
		<cfargument name="comment" type="string" required="true" />
		<cfset variables.instance.comment = arguments.comment />
	</cffunction>
	<cffunction name="getcomment" access="public" returntype="string" output="false">
		<cfreturn variables.instance.comment />
	</cffunction>

	<cffunction name="setcreated_on" access="public" returntype="void" output="false">
		<cfargument name="created_on" type="string" required="true" />
		<cfset variables.instance.created_on = arguments.created_on />
	</cffunction>
	<cffunction name="getcreated_on" access="public" returntype="string" output="false">
		<cfreturn variables.instance.created_on />
	</cffunction>

	<cffunction name="setcreated_by" access="public" returntype="void" output="false">
		<cfargument name="created_by" type="string" required="true" />
		<cfset variables.instance.created_by = arguments.created_by />
	</cffunction>
	<cffunction name="getcreated_by" access="public" returntype="string" output="false">
		<cfreturn variables.instance.created_by />
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
