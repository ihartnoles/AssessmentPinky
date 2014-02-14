
<cfcomponent displayname="programImprovementCodesAssessmentOutcomes" output="false">
		<cfproperty name="id" type="numeric" default="" />
		<cfproperty name="outcomeID" type="numeric" default="" />
		<cfproperty name="reportingUnitID" type="numeric" default="" />
		<cfproperty name="planID" type="numeric" default="" />
		<cfproperty name="ProgramImprovementCodeID" type="numeric" default="" />
		
	<!---
	PROPERTIES
	--->
	<cfset variables.instance = StructNew() />

	<!---
	INITIALIZATION / CONFIGURATION
	--->
	<cffunction name="init" access="public" returntype="programImprovementCodesAssessmentOutcomes" output="false">
		<cfargument name="id" type="string" required="false" default="" />
		<cfargument name="outcomeID" type="string" required="false" default="" />
		<cfargument name="reportingUnitID" type="string" required="false" default="" />
		<cfargument name="planID" type="string" required="false" default="" />
		<cfargument name="ProgramImprovementCodeID" type="string" required="false" default="" />
		
		<!--- run setters --->
		<cfset setid(arguments.id) />
		<cfset setoutcomeID(arguments.outcomeID) />
		<cfset setreportingUnitID(arguments.reportingUnitID) />
		<cfset setplanID(arguments.planID) />
		<cfset setProgramImprovementCodeID(arguments.ProgramImprovementCodeID) />
		
		<cfreturn this />
 	</cffunction>

	<!---
	PUBLIC FUNCTIONS
	--->
	<cffunction name="setMemento" access="public" returntype="programImprovementCodesAssessmentOutcomes" output="false">
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
		
		<!--- id --->
		<cfif (len(trim(getid())) AND NOT isNumeric(trim(getid())))>
			<cfset thisError.field = "id" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "id is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- outcomeID --->
		<cfif (NOT len(trim(getoutcomeID())))>
			<cfset thisError.field = "outcomeID" />
			<cfset thisError.type = "required" />
			<cfset thisError.message = "outcomeID is required" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getoutcomeID())) AND NOT isNumeric(trim(getoutcomeID())))>
			<cfset thisError.field = "outcomeID" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "outcomeID is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- reportingUnitID --->
		<cfif (NOT len(trim(getreportingUnitID())))>
			<cfset thisError.field = "reportingUnitID" />
			<cfset thisError.type = "required" />
			<cfset thisError.message = "reportingUnitID is required" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getreportingUnitID())) AND NOT isNumeric(trim(getreportingUnitID())))>
			<cfset thisError.field = "reportingUnitID" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "reportingUnitID is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- planID --->
		<cfif (NOT len(trim(getplanID())))>
			<cfset thisError.field = "planID" />
			<cfset thisError.type = "required" />
			<cfset thisError.message = "planID is required" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getplanID())) AND NOT isNumeric(trim(getplanID())))>
			<cfset thisError.field = "planID" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "planID is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- ProgramImprovementCodeID --->
		<cfif (NOT len(trim(getProgramImprovementCodeID())))>
			<cfset thisError.field = "ProgramImprovementCodeID" />
			<cfset thisError.type = "required" />
			<cfset thisError.message = "ProgramImprovementCodeID is required" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getProgramImprovementCodeID())) AND NOT isNumeric(trim(getProgramImprovementCodeID())))>
			<cfset thisError.field = "ProgramImprovementCodeID" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "ProgramImprovementCodeID is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<cfreturn errors />
	</cffunction>

	<!---
	ACCESSORS
	--->
	<cffunction name="setid" access="public" returntype="void" output="false">
		<cfargument name="id" type="string" required="true" />
		<cfset variables.instance.id = arguments.id />
	</cffunction>
	<cffunction name="getid" access="public" returntype="string" output="false">
		<cfreturn variables.instance.id />
	</cffunction>

	<cffunction name="setoutcomeID" access="public" returntype="void" output="false">
		<cfargument name="outcomeID" type="string" required="true" />
		<cfset variables.instance.outcomeID = arguments.outcomeID />
	</cffunction>
	<cffunction name="getoutcomeID" access="public" returntype="string" output="false">
		<cfreturn variables.instance.outcomeID />
	</cffunction>

	<cffunction name="setreportingUnitID" access="public" returntype="void" output="false">
		<cfargument name="reportingUnitID" type="string" required="true" />
		<cfset variables.instance.reportingUnitID = arguments.reportingUnitID />
	</cffunction>
	<cffunction name="getreportingUnitID" access="public" returntype="string" output="false">
		<cfreturn variables.instance.reportingUnitID />
	</cffunction>

	<cffunction name="setplanID" access="public" returntype="void" output="false">
		<cfargument name="planID" type="string" required="true" />
		<cfset variables.instance.planID = arguments.planID />
	</cffunction>
	<cffunction name="getplanID" access="public" returntype="string" output="false">
		<cfreturn variables.instance.planID />
	</cffunction>

	<cffunction name="setProgramImprovementCodeID" access="public" returntype="void" output="false">
		<cfargument name="ProgramImprovementCodeID" type="string" required="true" />
		<cfset variables.instance.ProgramImprovementCodeID = arguments.ProgramImprovementCodeID />
	</cffunction>
	<cffunction name="getProgramImprovementCodeID" access="public" returntype="string" output="false">
		<cfreturn variables.instance.ProgramImprovementCodeID />
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
