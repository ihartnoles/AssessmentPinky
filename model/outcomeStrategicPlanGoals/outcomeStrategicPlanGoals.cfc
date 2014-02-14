
<cfcomponent displayname="outcomeStrategicPlanGoals" output="false">
		<cfproperty name="ID" type="numeric" default="" />
		<cfproperty name="goalID" type="numeric" default="" />
		<cfproperty name="outcomeID" type="numeric" default="" />
		<cfproperty name="reportingUnitID" type="numeric" default="" />
		<cfproperty name="planID" type="numeric" default="" />
		
	<!---
	PROPERTIES
	--->
	<cfset variables.instance = StructNew() />

	<!---
	INITIALIZATION / CONFIGURATION
	--->
	<cffunction name="init" access="public" returntype="outcomeStrategicPlanGoals" output="false">
		<cfargument name="ID" type="string" required="false" default="" />
		<cfargument name="goalID" type="string" required="false" default="" />
		<cfargument name="outcomeID" type="string" required="false" default="" />
		<cfargument name="reportingUnitID" type="string" required="false" default="" />
		<cfargument name="planID" type="string" required="false" default="" />
		
		<!--- run setters --->
		<cfset setID(arguments.ID) />
		<cfset setgoalID(arguments.goalID) />
		<cfset setoutcomeID(arguments.outcomeID) />
		<cfset setreportingUnitID(arguments.reportingUnitID) />
		<cfset setplanID(arguments.planID) />
		
		<cfreturn this />
 	</cffunction>

	<!---
	PUBLIC FUNCTIONS
	--->
	<cffunction name="setMemento" access="public" returntype="outcomeStrategicPlanGoals" output="false">
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
		
		<!--- ID --->
		<cfif (len(trim(getID())) AND NOT isNumeric(trim(getID())))>
			<cfset thisError.field = "ID" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "ID is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- goalID --->
		<cfif (len(trim(getgoalID())) AND NOT isNumeric(trim(getgoalID())))>
			<cfset thisError.field = "goalID" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "goalID is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- outcomeID --->
		<cfif (len(trim(getoutcomeID())) AND NOT isNumeric(trim(getoutcomeID())))>
			<cfset thisError.field = "outcomeID" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "outcomeID is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- reportingUnitID --->
		<cfif (len(trim(getreportingUnitID())) AND NOT isNumeric(trim(getreportingUnitID())))>
			<cfset thisError.field = "reportingUnitID" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "reportingUnitID is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- planID --->
		<cfif (len(trim(getplanID())) AND NOT isNumeric(trim(getplanID())))>
			<cfset thisError.field = "planID" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "planID is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<cfreturn errors />
	</cffunction>

	<!---
	ACCESSORS
	--->
	<cffunction name="setID" access="public" returntype="void" output="false">
		<cfargument name="ID" type="string" required="true" />
		<cfset variables.instance.ID = arguments.ID />
	</cffunction>
	<cffunction name="getID" access="public" returntype="string" output="false">
		<cfreturn variables.instance.ID />
	</cffunction>

	<cffunction name="setgoalID" access="public" returntype="void" output="false">
		<cfargument name="goalID" type="string" required="true" />
		<cfset variables.instance.goalID = arguments.goalID />
	</cffunction>
	<cffunction name="getgoalID" access="public" returntype="string" output="false">
		<cfreturn variables.instance.goalID />
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
