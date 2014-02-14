
<cfcomponent displayname="assessmentplans" output="false">
		<cfproperty name="PlanID" type="numeric" default="" />
		<cfproperty name="ReportingUnitID" type="numeric" default="" />
		<cfproperty name="PlanPeriod" type="string" default="" />
		<cfproperty name="PlanType" type="numeric" default="" />
		<cfproperty name="PlanStatus" type="numeric" default="" />
		<cfproperty name="PlanInitialReporter" type="string" default="" />
		<cfproperty name="PlanLastChangeDate" type="date" default="" />
		<cfproperty name="PlanLockDate" type="date" default="" />
		
	<!---
	PROPERTIES
	--->
	<cfset variables.instance = StructNew() />

	<!---
	INITIALIZATION / CONFIGURATION
	--->
	<cffunction name="init" access="public" returntype="assessmentplans" output="false">
		<cfargument name="PlanID" type="string" required="false" default="" />
		<cfargument name="ReportingUnitID" type="string" required="false" default="" />
		<cfargument name="PlanPeriod" type="string" required="false" default="" />
		<cfargument name="PlanType" type="string" required="false" default="" />
		<cfargument name="PlanStatus" type="string" required="false" default="" />
		<cfargument name="PlanInitialReporter" type="string" required="false" default="" />
		<cfargument name="PlanLastChangeDate" type="string" required="false" default="" />
		<cfargument name="PlanLockDate" type="string" required="false" default="" />
		
		<!--- run setters --->
		<cfset setPlanID(arguments.PlanID) />
		<cfset setReportingUnitID(arguments.ReportingUnitID) />
		<cfset setPlanPeriod(arguments.PlanPeriod) />
		<cfset setPlanType(arguments.PlanType) />
		<cfset setPlanStatus(arguments.PlanStatus) />
		<cfset setPlanInitialReporter(arguments.PlanInitialReporter) />
		<cfset setPlanLastChangeDate(arguments.PlanLastChangeDate) />
		<cfset setPlanLockDate(arguments.PlanLockDate) />
		
		<cfreturn this />
 	</cffunction>

	<!---
	PUBLIC FUNCTIONS
	--->
	<cffunction name="setMemento" access="public" returntype="assessmentplans" output="false">
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
		
		<!--- PlanID --->
		<cfif (len(trim(getPlanID())) AND NOT isNumeric(trim(getPlanID())))>
			<cfset thisError.field = "PlanID" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "PlanID is not numeric" />
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
		
		<!--- PlanPeriod --->
		<cfif (NOT len(trim(getPlanPeriod())))>
			<cfset thisError.field = "PlanPeriod" />
			<cfset thisError.type = "required" />
			<cfset thisError.message = "PlanPeriod is required" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getPlanPeriod())) AND NOT IsSimpleValue(trim(getPlanPeriod())))>
			<cfset thisError.field = "PlanPeriod" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "PlanPeriod is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getPlanPeriod())) GT 9)>
			<cfset thisError.field = "PlanPeriod" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "PlanPeriod is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- PlanType --->
		<cfif (len(trim(getPlanType())) AND NOT isNumeric(trim(getPlanType())))>
			<cfset thisError.field = "PlanType" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "PlanType is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- PlanStatus --->
		<cfif (len(trim(getPlanStatus())) AND NOT isNumeric(trim(getPlanStatus())))>
			<cfset thisError.field = "PlanStatus" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "PlanStatus is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- PlanInitialReporter --->
		<cfif (len(trim(getPlanInitialReporter())) AND NOT IsSimpleValue(trim(getPlanInitialReporter())))>
			<cfset thisError.field = "PlanInitialReporter" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "PlanInitialReporter is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getPlanInitialReporter())) GT 50)>
			<cfset thisError.field = "PlanInitialReporter" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "PlanInitialReporter is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- PlanLastChangeDate --->
		<cfif (len(trim(getPlanLastChangeDate())) AND NOT isDate(trim(getPlanLastChangeDate())))>
			<cfset thisError.field = "PlanLastChangeDate" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "PlanLastChangeDate is not a date" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- PlanLockDate --->
		<cfif (len(trim(getPlanLockDate())) AND NOT isDate(trim(getPlanLockDate())))>
			<cfset thisError.field = "PlanLockDate" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "PlanLockDate is not a date" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<cfreturn errors />
	</cffunction>

	<!---
	ACCESSORS
	--->
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

	<cffunction name="setPlanPeriod" access="public" returntype="void" output="false">
		<cfargument name="PlanPeriod" type="string" required="true" />
		<cfset variables.instance.PlanPeriod = arguments.PlanPeriod />
	</cffunction>
	<cffunction name="getPlanPeriod" access="public" returntype="string" output="false">
		<cfreturn variables.instance.PlanPeriod />
	</cffunction>

	<cffunction name="setPlanType" access="public" returntype="void" output="false">
		<cfargument name="PlanType" type="string" required="true" />
		<cfset variables.instance.PlanType = arguments.PlanType />
	</cffunction>
	<cffunction name="getPlanType" access="public" returntype="string" output="false">
		<cfreturn variables.instance.PlanType />
	</cffunction>

	<cffunction name="setPlanStatus" access="public" returntype="void" output="false">
		<cfargument name="PlanStatus" type="string" required="true" />
		<cfset variables.instance.PlanStatus = arguments.PlanStatus />
	</cffunction>
	<cffunction name="getPlanStatus" access="public" returntype="string" output="false">
		<cfreturn variables.instance.PlanStatus />
	</cffunction>

	<cffunction name="setPlanInitialReporter" access="public" returntype="void" output="false">
		<cfargument name="PlanInitialReporter" type="string" required="true" />
		<cfset variables.instance.PlanInitialReporter = arguments.PlanInitialReporter />
	</cffunction>
	<cffunction name="getPlanInitialReporter" access="public" returntype="string" output="false">
		<cfreturn variables.instance.PlanInitialReporter />
	</cffunction>

	<cffunction name="setPlanLastChangeDate" access="public" returntype="void" output="false">
		<cfargument name="PlanLastChangeDate" type="string" required="true" />
		<cfset variables.instance.PlanLastChangeDate = arguments.PlanLastChangeDate />
	</cffunction>
	<cffunction name="getPlanLastChangeDate" access="public" returntype="string" output="false">
		<cfreturn variables.instance.PlanLastChangeDate />
	</cffunction>

	<cffunction name="setPlanLockDate" access="public" returntype="void" output="false">
		<cfargument name="PlanLockDate" type="string" required="true" />
		<cfset variables.instance.PlanLockDate = arguments.PlanLockDate />
	</cffunction>
	<cffunction name="getPlanLockDate" access="public" returntype="string" output="false">
		<cfreturn variables.instance.PlanLockDate />
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
