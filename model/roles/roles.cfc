
<cfcomponent displayname="roles" output="false">
		<cfproperty name="AssessmentRoleID" type="numeric" default="" />
		<cfproperty name="AssessmentRoleDescription" type="string" default="" />
		<cfproperty name="LastChangeDate" type="date" default="" />
		
	<!---
	PROPERTIES
	--->
	<cfset variables.instance = StructNew() />

	<!---
	INITIALIZATION / CONFIGURATION
	--->
	<cffunction name="init" access="public" returntype="roles" output="false">
		<cfargument name="AssessmentRoleID" type="string" required="false" default="" />
		<cfargument name="AssessmentRoleDescription" type="string" required="false" default="" />
		<cfargument name="LastChangeDate" type="string" required="false" default="" />
		
		<!--- run setters --->
		<cfset setAssessmentRoleID(arguments.AssessmentRoleID) />
		<cfset setAssessmentRoleDescription(arguments.AssessmentRoleDescription) />
		<cfset setLastChangeDate(arguments.LastChangeDate) />
		
		<cfreturn this />
 	</cffunction>

	<!---
	PUBLIC FUNCTIONS
	--->
	<cffunction name="setMemento" access="public" returntype="roles" output="false">
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
		
		<!--- AssessmentRoleID --->
		<cfif (len(trim(getAssessmentRoleID())) AND NOT isNumeric(trim(getAssessmentRoleID())))>
			<cfset thisError.field = "AssessmentRoleID" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "AssessmentRoleID is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- AssessmentRoleDescription --->
		<cfif (NOT len(trim(getAssessmentRoleDescription())))>
			<cfset thisError.field = "AssessmentRoleDescription" />
			<cfset thisError.type = "required" />
			<cfset thisError.message = "AssessmentRoleDescription is required" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getAssessmentRoleDescription())) AND NOT IsSimpleValue(trim(getAssessmentRoleDescription())))>
			<cfset thisError.field = "AssessmentRoleDescription" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "AssessmentRoleDescription is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getAssessmentRoleDescription())) GT 50)>
			<cfset thisError.field = "AssessmentRoleDescription" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "AssessmentRoleDescription is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- LastChangeDate --->
		<cfif (NOT len(trim(getLastChangeDate())))>
			<cfset thisError.field = "LastChangeDate" />
			<cfset thisError.type = "required" />
			<cfset thisError.message = "LastChangeDate is required" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getLastChangeDate())) AND NOT isDate(trim(getLastChangeDate())))>
			<cfset thisError.field = "LastChangeDate" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "LastChangeDate is not a date" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<cfreturn errors />
	</cffunction>

	<!---
	ACCESSORS
	--->
	<cffunction name="setAssessmentRoleID" access="public" returntype="void" output="false">
		<cfargument name="AssessmentRoleID" type="string" required="true" />
		<cfset variables.instance.AssessmentRoleID = arguments.AssessmentRoleID />
	</cffunction>
	<cffunction name="getAssessmentRoleID" access="public" returntype="string" output="false">
		<cfreturn variables.instance.AssessmentRoleID />
	</cffunction>

	<cffunction name="setAssessmentRoleDescription" access="public" returntype="void" output="false">
		<cfargument name="AssessmentRoleDescription" type="string" required="true" />
		<cfset variables.instance.AssessmentRoleDescription = arguments.AssessmentRoleDescription />
	</cffunction>
	<cffunction name="getAssessmentRoleDescription" access="public" returntype="string" output="false">
		<cfreturn variables.instance.AssessmentRoleDescription />
	</cffunction>

	<cffunction name="setLastChangeDate" access="public" returntype="void" output="false">
		<cfargument name="LastChangeDate" type="string" required="true" />
		<cfset variables.instance.LastChangeDate = arguments.LastChangeDate />
	</cffunction>
	<cffunction name="getLastChangeDate" access="public" returntype="string" output="false">
		<cfreturn variables.instance.LastChangeDate />
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
