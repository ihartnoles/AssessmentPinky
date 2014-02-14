
<cfcomponent displayname="reportingunits" output="false">
		<cfproperty name="ReportingUnitID" type="numeric" default="" />
		<cfproperty name="ProgramID" type="numeric" default="" />
		<cfproperty name="DeptID" type="numeric" default="" />
		<cfproperty name="DivisionID" type="numeric" default="" />
		<cfproperty name="SuperDivisionID" type="numeric" default="" />
		<cfproperty name="OrganizationID" type="numeric" default="" />
		<cfproperty name="ReportingUnitActive" type="numeric" default="" />
		
	<!---
	PROPERTIES
	--->
	<cfset variables.instance = StructNew() />

	<!---
	INITIALIZATION / CONFIGURATION
	--->
	<cffunction name="init" access="public" returntype="Assessment.model.reportingunits" output="false">
		<cfargument name="ReportingUnitID" type="string" required="false" default="" />
		<cfargument name="ProgramID" type="string" required="false" default="" />
		<cfargument name="DeptID" type="string" required="false" default="" />
		<cfargument name="DivisionID" type="string" required="false" default="" />
		<cfargument name="SuperDivisionID" type="string" required="false" default="" />
		<cfargument name="OrganizationID" type="string" required="false" default="" />
		<cfargument name="ReportingUnitActive" type="string" required="false" default="" />
		
		<!--- run setters --->
		<cfset setReportingUnitID(arguments.ReportingUnitID) />
		<cfset setProgramID(arguments.ProgramID) />
		<cfset setDeptID(arguments.DeptID) />
		<cfset setDivisionID(arguments.DivisionID) />
		<cfset setSuperDivisionID(arguments.SuperDivisionID) />
		<cfset setOrganizationID(arguments.OrganizationID) />
		<cfset setReportingUnitActive(arguments.ReportingUnitActive) />
		
		<cfreturn this />
 	</cffunction>

	<!---
	PUBLIC FUNCTIONS
	--->
	<cffunction name="setMemento" access="public" returntype="Assessment.model.reportingunits" output="false">
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
		
		<!--- ReportingUnitID --->
		<cfif (len(trim(getReportingUnitID())) AND NOT isNumeric(trim(getReportingUnitID())))>
			<cfset thisError.field = "ReportingUnitID" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "ReportingUnitID is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- ProgramID --->
		<cfif (NOT len(trim(getProgramID())))>
			<cfset thisError.field = "ProgramID" />
			<cfset thisError.type = "required" />
			<cfset thisError.message = "ProgramID is required" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getProgramID())) AND NOT isNumeric(trim(getProgramID())))>
			<cfset thisError.field = "ProgramID" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "ProgramID is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- DeptID --->
		<cfif (NOT len(trim(getDeptID())))>
			<cfset thisError.field = "DeptID" />
			<cfset thisError.type = "required" />
			<cfset thisError.message = "DeptID is required" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getDeptID())) AND NOT isNumeric(trim(getDeptID())))>
			<cfset thisError.field = "DeptID" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "DeptID is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- DivisionID --->
		<cfif (NOT len(trim(getDivisionID())))>
			<cfset thisError.field = "DivisionID" />
			<cfset thisError.type = "required" />
			<cfset thisError.message = "DivisionID is required" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getDivisionID())) AND NOT isNumeric(trim(getDivisionID())))>
			<cfset thisError.field = "DivisionID" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "DivisionID is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- SuperDivisionID --->
		<cfif (NOT len(trim(getSuperDivisionID())))>
			<cfset thisError.field = "SuperDivisionID" />
			<cfset thisError.type = "required" />
			<cfset thisError.message = "SuperDivisionID is required" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getSuperDivisionID())) AND NOT isNumeric(trim(getSuperDivisionID())))>
			<cfset thisError.field = "SuperDivisionID" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "SuperDivisionID is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- OrganizationID --->
		<cfif (NOT len(trim(getOrganizationID())))>
			<cfset thisError.field = "OrganizationID" />
			<cfset thisError.type = "required" />
			<cfset thisError.message = "OrganizationID is required" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getOrganizationID())) AND NOT isNumeric(trim(getOrganizationID())))>
			<cfset thisError.field = "OrganizationID" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "OrganizationID is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- ReportingUnitActive --->
		<cfif (len(trim(getReportingUnitActive())) AND NOT isNumeric(trim(getReportingUnitActive())))>
			<cfset thisError.field = "ReportingUnitActive" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "ReportingUnitActive is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<cfreturn errors />
	</cffunction>

	<!---
	ACCESSORS
	--->
	<cffunction name="setReportingUnitID" access="public" returntype="void" output="false">
		<cfargument name="ReportingUnitID" type="string" required="true" />
		<cfset variables.instance.ReportingUnitID = arguments.ReportingUnitID />
	</cffunction>
	<cffunction name="getReportingUnitID" access="public" returntype="string" output="false">
		<cfreturn variables.instance.ReportingUnitID />
	</cffunction>

	<cffunction name="setProgramID" access="public" returntype="void" output="false">
		<cfargument name="ProgramID" type="string" required="true" />
		<cfset variables.instance.ProgramID = arguments.ProgramID />
	</cffunction>
	<cffunction name="getProgramID" access="public" returntype="string" output="false">
		<cfreturn variables.instance.ProgramID />
	</cffunction>

	<cffunction name="setDeptID" access="public" returntype="void" output="false">
		<cfargument name="DeptID" type="string" required="true" />
		<cfset variables.instance.DeptID = arguments.DeptID />
	</cffunction>
	<cffunction name="getDeptID" access="public" returntype="string" output="false">
		<cfreturn variables.instance.DeptID />
	</cffunction>

	<cffunction name="setDivisionID" access="public" returntype="void" output="false">
		<cfargument name="DivisionID" type="string" required="true" />
		<cfset variables.instance.DivisionID = arguments.DivisionID />
	</cffunction>
	<cffunction name="getDivisionID" access="public" returntype="string" output="false">
		<cfreturn variables.instance.DivisionID />
	</cffunction>

	<cffunction name="setSuperDivisionID" access="public" returntype="void" output="false">
		<cfargument name="SuperDivisionID" type="string" required="true" />
		<cfset variables.instance.SuperDivisionID = arguments.SuperDivisionID />
	</cffunction>
	<cffunction name="getSuperDivisionID" access="public" returntype="string" output="false">
		<cfreturn variables.instance.SuperDivisionID />
	</cffunction>

	<cffunction name="setOrganizationID" access="public" returntype="void" output="false">
		<cfargument name="OrganizationID" type="string" required="true" />
		<cfset variables.instance.OrganizationID = arguments.OrganizationID />
	</cffunction>
	<cffunction name="getOrganizationID" access="public" returntype="string" output="false">
		<cfreturn variables.instance.OrganizationID />
	</cffunction>

	<cffunction name="setReportingUnitActive" access="public" returntype="void" output="false">
		<cfargument name="ReportingUnitActive" type="string" required="true" />
		<cfset variables.instance.ReportingUnitActive = arguments.ReportingUnitActive />
	</cffunction>
	<cffunction name="getReportingUnitActive" access="public" returntype="string" output="false">
		<cfreturn variables.instance.ReportingUnitActive />
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
