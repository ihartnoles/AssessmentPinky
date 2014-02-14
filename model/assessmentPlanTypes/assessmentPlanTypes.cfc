
<cfcomponent displayname="assessmentPlanTypes" output="false">
		<cfproperty name="PlanType" type="numeric" default="" />
		<cfproperty name="PlanTypeOrder" type="numeric" default="" />
		<cfproperty name="PlanTypeDescription" type="string" default="" />
		
	<!---
	PROPERTIES
	--->
	<cfset variables.instance = StructNew() />

	<!---
	INITIALIZATION / CONFIGURATION
	--->
	<cffunction name="init" access="public" returntype="assessmentPlanTypes" output="false">
		<cfargument name="PlanType" type="string" required="false" default="" />
		<cfargument name="PlanTypeOrder" type="string" required="false" default="" />
		<cfargument name="PlanTypeDescription" type="string" required="false" default="" />
		
		<!--- run setters --->
		<cfset setPlanType(arguments.PlanType) />
		<cfset setPlanTypeOrder(arguments.PlanTypeOrder) />
		<cfset setPlanTypeDescription(arguments.PlanTypeDescription) />
		
		<cfreturn this />
 	</cffunction>

	<!---
	PUBLIC FUNCTIONS
	--->
	<cffunction name="setMemento" access="public" returntype="assessmentPlanTypes" output="false">
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
		
		<!--- PlanType --->
		<cfif (len(trim(getPlanType())) AND NOT isNumeric(trim(getPlanType())))>
			<cfset thisError.field = "PlanType" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "PlanType is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- PlanTypeOrder --->
		<cfif (NOT len(trim(getPlanTypeOrder())))>
			<cfset thisError.field = "PlanTypeOrder" />
			<cfset thisError.type = "required" />
			<cfset thisError.message = "PlanTypeOrder is required" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getPlanTypeOrder())) AND NOT isNumeric(trim(getPlanTypeOrder())))>
			<cfset thisError.field = "PlanTypeOrder" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "PlanTypeOrder is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- PlanTypeDescription --->
		<cfif (NOT len(trim(getPlanTypeDescription())))>
			<cfset thisError.field = "PlanTypeDescription" />
			<cfset thisError.type = "required" />
			<cfset thisError.message = "PlanTypeDescription is required" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getPlanTypeDescription())) AND NOT IsSimpleValue(trim(getPlanTypeDescription())))>
			<cfset thisError.field = "PlanTypeDescription" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "PlanTypeDescription is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getPlanTypeDescription())) GT 200)>
			<cfset thisError.field = "PlanTypeDescription" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "PlanTypeDescription is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<cfreturn errors />
	</cffunction>

	<!---
	ACCESSORS
	--->
	<cffunction name="setPlanType" access="public" returntype="void" output="false">
		<cfargument name="PlanType" type="string" required="true" />
		<cfset variables.instance.PlanType = arguments.PlanType />
	</cffunction>
	<cffunction name="getPlanType" access="public" returntype="string" output="false">
		<cfreturn variables.instance.PlanType />
	</cffunction>

	<cffunction name="setPlanTypeOrder" access="public" returntype="void" output="false">
		<cfargument name="PlanTypeOrder" type="string" required="true" />
		<cfset variables.instance.PlanTypeOrder = arguments.PlanTypeOrder />
	</cffunction>
	<cffunction name="getPlanTypeOrder" access="public" returntype="string" output="false">
		<cfreturn variables.instance.PlanTypeOrder />
	</cffunction>

	<cffunction name="setPlanTypeDescription" access="public" returntype="void" output="false">
		<cfargument name="PlanTypeDescription" type="string" required="true" />
		<cfset variables.instance.PlanTypeDescription = arguments.PlanTypeDescription />
	</cffunction>
	<cffunction name="getPlanTypeDescription" access="public" returntype="string" output="false">
		<cfreturn variables.instance.PlanTypeDescription />
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
