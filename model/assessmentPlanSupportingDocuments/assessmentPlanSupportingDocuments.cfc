
<cfcomponent displayname="assessmentPlanSupportingDocuments" output="false">
		<cfproperty name="RecordID" type="numeric" default="" />
		<cfproperty name="OutcomeID" type="numeric" default="" />
		<cfproperty name="FileName" type="string" default="" />
		<cfproperty name="FileNameUploaded" type="string" default="" />
		<cfproperty name="FileDescription" type="string" default="" />
		<cfproperty name="FileUserID" type="numeric" default="" />
		<cfproperty name="DateInserted" type="date" default="" />
		
	<!---
	PROPERTIES
	--->
	<cfset variables.instance = StructNew() />

	<!---
	INITIALIZATION / CONFIGURATION
	--->
	<cffunction name="init" access="public" returntype="assessmentPlanSupportingDocuments" output="false">
		<cfargument name="RecordID" type="string" required="false" default="" />
		<cfargument name="OutcomeID" type="string" required="false" default="" />
		<cfargument name="FileName" type="string" required="false" default="" />
		<cfargument name="FileNameUploaded" type="string" required="false" default="" />
		<cfargument name="FileDescription" type="string" required="false" default="" />
		<cfargument name="FileUserID" type="string" required="false" default="" />
		<cfargument name="DateInserted" type="string" required="false" default="" />
		
		<!--- run setters --->
		<cfset setRecordID(arguments.RecordID) />
		<cfset setOutcomeID(arguments.OutcomeID) />
		<cfset setFileName(arguments.FileName) />
		<cfset setFileNameUploaded(arguments.FileNameUploaded) />
		<cfset setFileDescription(arguments.FileDescription) />
		<cfset setFileUserID(arguments.FileUserID) />
		<cfset setDateInserted(arguments.DateInserted) />
		
		<cfreturn this />
 	</cffunction>

	<!---
	PUBLIC FUNCTIONS
	--->
	<cffunction name="setMemento" access="public" returntype="assessmentPlanSupportingDocuments" output="false">
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
		
		<!--- FileName --->
		<cfif (NOT len(trim(getFileName())))>
			<cfset thisError.field = "FileName" />
			<cfset thisError.type = "required" />
			<cfset thisError.message = "FileName is required" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getFileName())) AND NOT IsSimpleValue(trim(getFileName())))>
			<cfset thisError.field = "FileName" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "FileName is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getFileName())) GT 200)>
			<cfset thisError.field = "FileName" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "FileName is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- FileNameUploaded --->
		<cfif (NOT len(trim(getFileNameUploaded())))>
			<cfset thisError.field = "FileNameUploaded" />
			<cfset thisError.type = "required" />
			<cfset thisError.message = "FileNameUploaded is required" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getFileNameUploaded())) AND NOT IsSimpleValue(trim(getFileNameUploaded())))>
			<cfset thisError.field = "FileNameUploaded" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "FileNameUploaded is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getFileNameUploaded())) GT 200)>
			<cfset thisError.field = "FileNameUploaded" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "FileNameUploaded is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- FileDescription --->
		<cfif (len(trim(getFileDescription())) AND NOT IsSimpleValue(trim(getFileDescription())))>
			<cfset thisError.field = "FileDescription" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "FileDescription is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getFileDescription())) GT 200)>
			<cfset thisError.field = "FileDescription" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "FileDescription is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- FileUserID --->
		<cfif (NOT len(trim(getFileUserID())))>
			<cfset thisError.field = "FileUserID" />
			<cfset thisError.type = "required" />
			<cfset thisError.message = "FileUserID is required" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getFileUserID())) AND NOT isNumeric(trim(getFileUserID())))>
			<cfset thisError.field = "FileUserID" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "FileUserID is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- DateInserted --->
		<cfif (len(trim(getDateInserted())) AND NOT isDate(trim(getDateInserted())))>
			<cfset thisError.field = "DateInserted" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "DateInserted is not a date" />
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

	<cffunction name="setFileName" access="public" returntype="void" output="false">
		<cfargument name="FileName" type="string" required="true" />
		<cfset variables.instance.FileName = arguments.FileName />
	</cffunction>
	<cffunction name="getFileName" access="public" returntype="string" output="false">
		<cfreturn variables.instance.FileName />
	</cffunction>

	<cffunction name="setFileNameUploaded" access="public" returntype="void" output="false">
		<cfargument name="FileNameUploaded" type="string" required="true" />
		<cfset variables.instance.FileNameUploaded = arguments.FileNameUploaded />
	</cffunction>
	<cffunction name="getFileNameUploaded" access="public" returntype="string" output="false">
		<cfreturn variables.instance.FileNameUploaded />
	</cffunction>

	<cffunction name="setFileDescription" access="public" returntype="void" output="false">
		<cfargument name="FileDescription" type="string" required="true" />
		<cfset variables.instance.FileDescription = arguments.FileDescription />
	</cffunction>
	<cffunction name="getFileDescription" access="public" returntype="string" output="false">
		<cfreturn variables.instance.FileDescription />
	</cffunction>

	<cffunction name="setFileUserID" access="public" returntype="void" output="false">
		<cfargument name="FileUserID" type="string" required="true" />
		<cfset variables.instance.FileUserID = arguments.FileUserID />
	</cffunction>
	<cffunction name="getFileUserID" access="public" returntype="string" output="false">
		<cfreturn variables.instance.FileUserID />
	</cffunction>

	<cffunction name="setDateInserted" access="public" returntype="void" output="false">
		<cfargument name="DateInserted" type="string" required="true" />
		<cfset variables.instance.DateInserted = arguments.DateInserted />
	</cffunction>
	<cffunction name="getDateInserted" access="public" returntype="string" output="false">
		<cfreturn variables.instance.DateInserted />
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
