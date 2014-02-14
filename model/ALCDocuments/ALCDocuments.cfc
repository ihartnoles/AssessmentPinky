
<cfcomponent displayname="ALCDocuments" output="false">
		<cfproperty name="DocumentID" type="numeric" default="" />
		<cfproperty name="ReportingUnitID" type="numeric" default="" />
		<cfproperty name="DocumentName" type="string" default="" />
		<cfproperty name="UploadedDocumentName" type="string" default="" />
		<cfproperty name="UploadUserID" type="numeric" default="" />
		<cfproperty name="UploadDate" type="date" default="" />
		
	<!---
	PROPERTIES
	--->
	<cfset variables.instance = StructNew() />

	<!---
	INITIALIZATION / CONFIGURATION
	--->
	<cffunction name="init" access="public" returntype="ALCDocuments" output="false">
		<cfargument name="DocumentID" type="string" required="false" default="" />
		<cfargument name="ReportingUnitID" type="string" required="false" default="" />
		<cfargument name="DocumentName" type="string" required="false" default="" />
		<cfargument name="UploadedDocumentName" type="string" required="false" default="" />
		<cfargument name="UploadUserID" type="string" required="false" default="" />
		<cfargument name="UploadDate" type="string" required="false" default="" />
		
		<!--- run setters --->
		<cfset setDocumentID(arguments.DocumentID) />
		<cfset setReportingUnitID(arguments.ReportingUnitID) />
		<cfset setDocumentName(arguments.DocumentName) />
		<cfset setUploadedDocumentName(arguments.UploadedDocumentName) />
		<cfset setUploadUserID(arguments.UploadUserID) />
		<cfset setUploadDate(arguments.UploadDate) />
		
		<cfreturn this />
 	</cffunction>

	<!---
	PUBLIC FUNCTIONS
	--->
	<cffunction name="setMemento" access="public" returntype="ALCDocuments" output="false">
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
		
		<!--- DocumentID --->
		<cfif (len(trim(getDocumentID())) AND NOT isNumeric(trim(getDocumentID())))>
			<cfset thisError.field = "DocumentID" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "DocumentID is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- ReportingUnitID --->
		<cfif (NOT len(trim(getReportingUnitID())))>
			<cfset thisError.field = "ReportingUnitID" />
			<cfset thisError.type = "required" />
			<cfset thisError.message = "ReportingUnitID is required" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getReportingUnitID())) AND NOT isNumeric(trim(getReportingUnitID())))>
			<cfset thisError.field = "ReportingUnitID" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "ReportingUnitID is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- DocumentName --->
		<cfif (NOT len(trim(getDocumentName())))>
			<cfset thisError.field = "DocumentName" />
			<cfset thisError.type = "required" />
			<cfset thisError.message = "DocumentName is required" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getDocumentName())) AND NOT IsSimpleValue(trim(getDocumentName())))>
			<cfset thisError.field = "DocumentName" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "DocumentName is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getDocumentName())) GT 500)>
			<cfset thisError.field = "DocumentName" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "DocumentName is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- UploadedDocumentName --->
		<cfif (NOT len(trim(getUploadedDocumentName())))>
			<cfset thisError.field = "UploadedDocumentName" />
			<cfset thisError.type = "required" />
			<cfset thisError.message = "UploadedDocumentName is required" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getUploadedDocumentName())) AND NOT IsSimpleValue(trim(getUploadedDocumentName())))>
			<cfset thisError.field = "UploadedDocumentName" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "UploadedDocumentName is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getUploadedDocumentName())) GT 500)>
			<cfset thisError.field = "UploadedDocumentName" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "UploadedDocumentName is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- UploadUserID --->
		<cfif (NOT len(trim(getUploadUserID())))>
			<cfset thisError.field = "UploadUserID" />
			<cfset thisError.type = "required" />
			<cfset thisError.message = "UploadUserID is required" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getUploadUserID())) AND NOT isNumeric(trim(getUploadUserID())))>
			<cfset thisError.field = "UploadUserID" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "UploadUserID is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- UploadDate --->
		<cfif (NOT len(trim(getUploadDate())))>
			<cfset thisError.field = "UploadDate" />
			<cfset thisError.type = "required" />
			<cfset thisError.message = "UploadDate is required" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getUploadDate())) AND NOT isDate(trim(getUploadDate())))>
			<cfset thisError.field = "UploadDate" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "UploadDate is not a date" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<cfreturn errors />
	</cffunction>

	<!---
	ACCESSORS
	--->
	<cffunction name="setDocumentID" access="public" returntype="void" output="false">
		<cfargument name="DocumentID" type="string" required="true" />
		<cfset variables.instance.DocumentID = arguments.DocumentID />
	</cffunction>
	<cffunction name="getDocumentID" access="public" returntype="string" output="false">
		<cfreturn variables.instance.DocumentID />
	</cffunction>

	<cffunction name="setReportingUnitID" access="public" returntype="void" output="false">
		<cfargument name="ReportingUnitID" type="string" required="true" />
		<cfset variables.instance.ReportingUnitID = arguments.ReportingUnitID />
	</cffunction>
	<cffunction name="getReportingUnitID" access="public" returntype="string" output="false">
		<cfreturn variables.instance.ReportingUnitID />
	</cffunction>

	<cffunction name="setDocumentName" access="public" returntype="void" output="false">
		<cfargument name="DocumentName" type="string" required="true" />
		<cfset variables.instance.DocumentName = arguments.DocumentName />
	</cffunction>
	<cffunction name="getDocumentName" access="public" returntype="string" output="false">
		<cfreturn variables.instance.DocumentName />
	</cffunction>

	<cffunction name="setUploadedDocumentName" access="public" returntype="void" output="false">
		<cfargument name="UploadedDocumentName" type="string" required="true" />
		<cfset variables.instance.UploadedDocumentName = arguments.UploadedDocumentName />
	</cffunction>
	<cffunction name="getUploadedDocumentName" access="public" returntype="string" output="false">
		<cfreturn variables.instance.UploadedDocumentName />
	</cffunction>

	<cffunction name="setUploadUserID" access="public" returntype="void" output="false">
		<cfargument name="UploadUserID" type="string" required="true" />
		<cfset variables.instance.UploadUserID = arguments.UploadUserID />
	</cffunction>
	<cffunction name="getUploadUserID" access="public" returntype="string" output="false">
		<cfreturn variables.instance.UploadUserID />
	</cffunction>

	<cffunction name="setUploadDate" access="public" returntype="void" output="false">
		<cfargument name="UploadDate" type="string" required="true" />
		<cfset variables.instance.UploadDate = arguments.UploadDate />
	</cffunction>
	<cffunction name="getUploadDate" access="public" returntype="string" output="false">
		<cfreturn variables.instance.UploadDate />
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
