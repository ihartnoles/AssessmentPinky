
<cfcomponent displayname="assessmentPlanOutcomes" output="false">
		<cfproperty name="OutcomeID" type="numeric" default="" />
		<cfproperty name="PlanID" type="numeric" default="" />
		<cfproperty name="OutcomeOrder" type="numeric" default="" />
		<cfproperty name="OutcomeDescription" type="string" default="" />
		<cfproperty name="OutcomeStrategy" type="string" default="" />
		<cfproperty name="OutcomeMethod" type="string" default="" />
		<cfproperty name="OutcomeCriterion" type="string" default="" />
		<cfproperty name="OutcomeResults" type="string" default="" />
		<cfproperty name="OutcomePlanningImprovement" type="string" default="" />
		<cfproperty name="OutcomeResources" type="string" default="" />
		<cfproperty name="OutcomeCreateDate" type="date" default="" />
		<cfproperty name="OutcomePlanLastChangeDate" type="date" default="" />
		<cfproperty name="QEP_URI_related" type="numeric" default="" />
		<cfproperty name="IFP_related" type="numeric" default="" />
		<cfproperty name="Online" type="numeric" default="" />
		
	<!---
	PROPERTIES
	--->
	<cfset variables.instance = StructNew() />

	<!---
	INITIALIZATION / CONFIGURATION
	--->
	<cffunction name="init" access="public" returntype="assessmentPlanOutcomes" output="false">
		<cfargument name="OutcomeID" type="string" required="false" default="" />
		<cfargument name="PlanID" type="string" required="false" default="" />
		<cfargument name="OutcomeOrder" type="string" required="false" default="" />
		<cfargument name="OutcomeDescription" type="string" required="false" default="" />
		<cfargument name="OutcomeStrategy" type="string" required="false" default="" />
		<cfargument name="OutcomeMethod" type="string" required="false" default="" />
		<cfargument name="OutcomeCriterion" type="string" required="false" default="" />
		<cfargument name="OutcomeResults" type="string" required="false" default="" />
		<cfargument name="OutcomePlanningImprovement" type="string" required="false" default="" />
		<cfargument name="OutcomeResources" type="string" required="false" default="" />
		<cfargument name="OutcomeCreateDate" type="string" required="false" default="" />
		<cfargument name="OutcomePlanLastChangeDate" type="string" required="false" default="" />
		<cfargument name="QEP_URI_related" type="string" required="false" default="" />
		<cfargument name="IFP_related" type="string" required="false" default="" />
		<cfargument name="Online" type="string" required="false" default="" />
		
		<!--- run setters --->
		<cfset setOutcomeID(arguments.OutcomeID) />
		<cfset setPlanID(arguments.PlanID) />
		<cfset setOutcomeOrder(arguments.OutcomeOrder) />
		<cfset setOutcomeDescription(arguments.OutcomeDescription) />
		<cfset setOutcomeStrategy(arguments.OutcomeStrategy) />
		<cfset setOutcomeMethod(arguments.OutcomeMethod) />
		<cfset setOutcomeCriterion(arguments.OutcomeCriterion) />
		<cfset setOutcomeResults(arguments.OutcomeResults) />
		<cfset setOutcomePlanningImprovement(arguments.OutcomePlanningImprovement) />
		<cfset setOutcomeResources(arguments.OutcomeResources) />
		<cfset setOutcomeCreateDate(arguments.OutcomeCreateDate) />
		<cfset setOutcomePlanLastChangeDate(arguments.OutcomePlanLastChangeDate) />
		<cfset setQEP_URI_related(arguments.QEP_URI_related) />
		<cfset setIFP_related(arguments.IFP_related) />
		<cfset setOnline(arguments.Online) />
		
		<cfreturn this />
 	</cffunction>

	<!---
	PUBLIC FUNCTIONS
	--->
	<cffunction name="setMemento" access="public" returntype="assessmentPlanOutcomes" output="false">
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
		
		<!--- OutcomeID --->
		<cfif (len(trim(getOutcomeID())))>
			<cfset thisError.field = "OutcomeID" />
			<cfset thisError.type = "required" />
			<cfset thisError.message = "OutcomeID is required" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- PlanID --->
		<cfif (NOT len(trim(getPlanID())))>
			<cfset thisError.field = "PlanID" />
			<cfset thisError.type = "required" />
			<cfset thisError.message = "PlanID is required" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getPlanID())) AND NOT isNumeric(trim(getPlanID())))>
			<cfset thisError.field = "PlanID" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "PlanID is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- OutcomeOrder --->
		<cfif (NOT len(trim(getOutcomeOrder())))>
			<cfset thisError.field = "OutcomeOrder" />
			<cfset thisError.type = "required" />
			<cfset thisError.message = "OutcomeOrder is required" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getOutcomeOrder())) AND NOT isNumeric(trim(getOutcomeOrder())))>
			<cfset thisError.field = "OutcomeOrder" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "OutcomeOrder is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- OutcomeDescription --->
		<cfif (len(trim(getOutcomeDescription())) AND NOT IsSimpleValue(trim(getOutcomeDescription())))>
			<cfset thisError.field = "OutcomeDescription" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "OutcomeDescription is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getOutcomeDescription())) GT 1500)>
			<cfset thisError.field = "OutcomeDescription" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "OutcomeDescription is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- OutcomeStrategy --->
		<cfif (len(trim(getOutcomeStrategy())) AND NOT IsSimpleValue(trim(getOutcomeStrategy())))>
			<cfset thisError.field = "OutcomeStrategy" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "OutcomeStrategy is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getOutcomeStrategy())) GT 1500)>
			<cfset thisError.field = "OutcomeStrategy" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "OutcomeStrategy is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- OutcomeMethod --->
		<cfif (len(trim(getOutcomeMethod())) AND NOT IsSimpleValue(trim(getOutcomeMethod())))>
			<cfset thisError.field = "OutcomeMethod" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "OutcomeMethod is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getOutcomeMethod())) GT 3500)>
			<cfset thisError.field = "OutcomeMethod" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "OutcomeMethod is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- OutcomeCriterion --->
		<cfif (len(trim(getOutcomeCriterion())) AND NOT IsSimpleValue(trim(getOutcomeCriterion())))>
			<cfset thisError.field = "OutcomeCriterion" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "OutcomeCriterion is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getOutcomeCriterion())) GT 1500)>
			<cfset thisError.field = "OutcomeCriterion" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "OutcomeCriterion is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- OutcomeResults --->
		<cfif (len(trim(getOutcomeResults())) AND NOT IsSimpleValue(trim(getOutcomeResults())))>
			<cfset thisError.field = "OutcomeResults" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "OutcomeResults is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getOutcomeResults())) GT 2147483647)>
			<cfset thisError.field = "OutcomeResults" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "OutcomeResults is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- OutcomePlanningImprovement --->
		<cfif (len(trim(getOutcomePlanningImprovement())) AND NOT IsSimpleValue(trim(getOutcomePlanningImprovement())))>
			<cfset thisError.field = "OutcomePlanningImprovement" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "OutcomePlanningImprovement is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getOutcomePlanningImprovement())) GT 2147483647)>
			<cfset thisError.field = "OutcomePlanningImprovement" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "OutcomePlanningImprovement is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- OutcomeResources --->
		<cfif (len(trim(getOutcomeResources())) AND NOT IsSimpleValue(trim(getOutcomeResources())))>
			<cfset thisError.field = "OutcomeResources" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "OutcomeResources is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getOutcomeResources())) GT 2147483647)>
			<cfset thisError.field = "OutcomeResources" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "OutcomeResources is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- OutcomeCreateDate --->
		<cfif (len(trim(getOutcomeCreateDate())) AND NOT isDate(trim(getOutcomeCreateDate())))>
			<cfset thisError.field = "OutcomeCreateDate" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "OutcomeCreateDate is not a date" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- OutcomePlanLastChangeDate --->
		<cfif (len(trim(getOutcomePlanLastChangeDate())) AND NOT isDate(trim(getOutcomePlanLastChangeDate())))>
			<cfset thisError.field = "OutcomePlanLastChangeDate" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "OutcomePlanLastChangeDate is not a date" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- QEP_URI_related --->
		<cfif (len(trim(getQEP_URI_related())) AND NOT isNumeric(trim(getQEP_URI_related())))>
			<cfset thisError.field = "QEP_URI_related" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "QEP_URI_related is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- IFP_related --->
		<cfif (len(trim(getIFP_related())) AND NOT isNumeric(trim(getIFP_related())))>
			<cfset thisError.field = "IFP_related" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "IFP_related is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- Online --->
		<cfif (len(trim(getOnline())) AND NOT isNumeric(trim(getOnline())))>
			<cfset thisError.field = "Online" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "Online is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<cfreturn errors />
	</cffunction>

	<!---
	ACCESSORS
	--->
	<cffunction name="setOutcomeID" access="public" returntype="void" output="false">
		<cfargument name="OutcomeID" type="string" required="true" />
		<cfset variables.instance.OutcomeID = arguments.OutcomeID />
	</cffunction>
	<cffunction name="getOutcomeID" access="public" returntype="string" output="false">
		<cfreturn variables.instance.OutcomeID />
	</cffunction>

	<cffunction name="setPlanID" access="public" returntype="void" output="false">
		<cfargument name="PlanID" type="string" required="true" />
		<cfset variables.instance.PlanID = arguments.PlanID />
	</cffunction>
	<cffunction name="getPlanID" access="public" returntype="string" output="false">
		<cfreturn variables.instance.PlanID />
	</cffunction>

	<cffunction name="setOutcomeOrder" access="public" returntype="void" output="false">
		<cfargument name="OutcomeOrder" type="string" required="true" />
		<cfset variables.instance.OutcomeOrder = arguments.OutcomeOrder />
	</cffunction>
	<cffunction name="getOutcomeOrder" access="public" returntype="string" output="false">
		<cfreturn variables.instance.OutcomeOrder />
	</cffunction>

	<cffunction name="setOutcomeDescription" access="public" returntype="void" output="false">
		<cfargument name="OutcomeDescription" type="string" required="true" />
		<cfset variables.instance.OutcomeDescription = arguments.OutcomeDescription />
	</cffunction>
	<cffunction name="getOutcomeDescription" access="public" returntype="string" output="false">
		<cfreturn variables.instance.OutcomeDescription />
	</cffunction>

	<cffunction name="setOutcomeStrategy" access="public" returntype="void" output="false">
		<cfargument name="OutcomeStrategy" type="string" required="true" />
		<cfset variables.instance.OutcomeStrategy = arguments.OutcomeStrategy />
	</cffunction>
	<cffunction name="getOutcomeStrategy" access="public" returntype="string" output="false">
		<cfreturn variables.instance.OutcomeStrategy />
	</cffunction>

	<cffunction name="setOutcomeMethod" access="public" returntype="void" output="false">
		<cfargument name="OutcomeMethod" type="string" required="true" />
		<cfset variables.instance.OutcomeMethod = arguments.OutcomeMethod />
	</cffunction>
	<cffunction name="getOutcomeMethod" access="public" returntype="string" output="false">
		<cfreturn variables.instance.OutcomeMethod />
	</cffunction>

	<cffunction name="setOutcomeCriterion" access="public" returntype="void" output="false">
		<cfargument name="OutcomeCriterion" type="string" required="true" />
		<cfset variables.instance.OutcomeCriterion = arguments.OutcomeCriterion />
	</cffunction>
	<cffunction name="getOutcomeCriterion" access="public" returntype="string" output="false">
		<cfreturn variables.instance.OutcomeCriterion />
	</cffunction>

	<cffunction name="setOutcomeResults" access="public" returntype="void" output="false">
		<cfargument name="OutcomeResults" type="string" required="true" />
		<cfset variables.instance.OutcomeResults = arguments.OutcomeResults />
	</cffunction>
	<cffunction name="getOutcomeResults" access="public" returntype="string" output="false">
		<cfreturn variables.instance.OutcomeResults />
	</cffunction>

	<cffunction name="setOutcomePlanningImprovement" access="public" returntype="void" output="false">
		<cfargument name="OutcomePlanningImprovement" type="string" required="true" />
		<cfset variables.instance.OutcomePlanningImprovement = arguments.OutcomePlanningImprovement />
	</cffunction>
	<cffunction name="getOutcomePlanningImprovement" access="public" returntype="string" output="false">
		<cfreturn variables.instance.OutcomePlanningImprovement />
	</cffunction>

	<cffunction name="setOutcomeResources" access="public" returntype="void" output="false">
		<cfargument name="OutcomeResources" type="string" required="true" />
		<cfset variables.instance.OutcomeResources = arguments.OutcomeResources />
	</cffunction>
	<cffunction name="getOutcomeResources" access="public" returntype="string" output="false">
		<cfreturn variables.instance.OutcomeResources />
	</cffunction>

	<cffunction name="setOutcomeCreateDate" access="public" returntype="void" output="false">
		<cfargument name="OutcomeCreateDate" type="string" required="true" />
		<cfset variables.instance.OutcomeCreateDate = arguments.OutcomeCreateDate />
	</cffunction>
	<cffunction name="getOutcomeCreateDate" access="public" returntype="string" output="false">
		<cfreturn variables.instance.OutcomeCreateDate />
	</cffunction>

	<cffunction name="setOutcomePlanLastChangeDate" access="public" returntype="void" output="false">
		<cfargument name="OutcomePlanLastChangeDate" type="string" required="true" />
		<cfset variables.instance.OutcomePlanLastChangeDate = arguments.OutcomePlanLastChangeDate />
	</cffunction>
	<cffunction name="getOutcomePlanLastChangeDate" access="public" returntype="string" output="false">
		<cfreturn variables.instance.OutcomePlanLastChangeDate />
	</cffunction>

	<cffunction name="setQEP_URI_related" access="public" returntype="void" output="false">
		<cfargument name="QEP_URI_related" type="string" required="true" />
		<cfset variables.instance.QEP_URI_related = arguments.QEP_URI_related />
	</cffunction>
	<cffunction name="getQEP_URI_related" access="public" returntype="string" output="false">
		<cfreturn variables.instance.QEP_URI_related />
	</cffunction>

	<cffunction name="setIFP_related" access="public" returntype="void" output="false">
		<cfargument name="IFP_related" type="string" required="true" />
		<cfset variables.instance.IFP_related = arguments.IFP_related />
	</cffunction>
	<cffunction name="getIFP_related" access="public" returntype="string" output="false">
		<cfreturn variables.instance.IFP_related />
	</cffunction>

	<cffunction name="setOnline" access="public" returntype="void" output="false">
		<cfargument name="Online" type="string" required="true" />
		<cfset variables.instance.Online = arguments.Online />
	</cffunction>
	<cffunction name="getOnline" access="public" returntype="string" output="false">
		<cfreturn variables.instance.Online />
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
