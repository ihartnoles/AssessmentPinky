
<cfcomponent displayname="AssessmentStrategicPlanLinks" output="false">

	<!---
	PROPERTIES
	--->
	
	<cfproperty name="RecordID" type="numeric" default="" />
	<cfproperty name="OutcomeID" type="numeric" default="" />
	<cfproperty name="ObjectiveID" type="numeric" default="" />
	
	
	<cfset variables.instance = {
		RecordID = "",
		OutcomeID = "",
		ObjectiveID = ""
	} />

	<!---
	INITIALIZATION / CONFIGURATION
	--->
	<cffunction name="init" access="public" returntype="AssessmentStrategicPlanLinks" output="false">
		<cfargument name="RecordID" type="string" required="false" />
		<cfargument name="OutcomeID" type="string" required="false" />
		<cfargument name="ObjectiveID" type="string" required="false" />
		
		<!--- run setters --->
		<cfif structKeyExists( arguments, 'RecordID' ) >
			<cfset setRecordID(arguments.RecordID) />
		</cfif>
		<cfif structKeyExists( arguments, 'OutcomeID' ) >
			<cfset setOutcomeID(arguments.OutcomeID) />
		</cfif>
		<cfif structKeyExists( arguments, 'ObjectiveID' ) >
			<cfset setObjectiveID(arguments.ObjectiveID) />
		</cfif>
		
		<cfreturn this />
 	</cffunction>

	<!---
	PUBLIC FUNCTIONS
	--->
	<cffunction name="setMemento" access="public" returntype="AssessmentStrategicPlanLinks" output="false">
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
		
		<!--- ObjectiveID --->
		<cfif (NOT len(trim(getObjectiveID())))>
			<cfset thisError.field = "ObjectiveID" />
			<cfset thisError.type = "required" />
			<cfset thisError.message = "ObjectiveID is required" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getObjectiveID())) AND NOT isNumeric(trim(getObjectiveID())))>
			<cfset thisError.field = "ObjectiveID" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "ObjectiveID is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<cfreturn errors />
	</cffunction>

	<cffunction name="isValid" access="public" returntype="boolean" output="false">
		<cfreturn arrayLen( validate() ) ? false : true >
	</cffunction >

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

	<cffunction name="setObjectiveID" access="public" returntype="void" output="false">
		<cfargument name="ObjectiveID" type="string" required="true" />
		<cfset variables.instance.ObjectiveID = arguments.ObjectiveID />
	</cffunction>
	<cffunction name="getObjectiveID" access="public" returntype="string" output="false">
		<cfreturn variables.instance.ObjectiveID />
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
