
<cfcomponent displayname="assessmentPlanWorkflow" output="false">
		<cfproperty name="RecordID" type="numeric" default="" />
		<cfproperty name="PlanType" type="numeric" default="" />
		<cfproperty name="WorkflowStep" type="numeric" default="" />
		<cfproperty name="WorkflowStepDescription" type="string" default="" />
		<cfproperty name="WorkflowStepEmailInstructions" type="string" default="" />
		<cfproperty name="WorkflowStepInstructions" type="string" default="" />
		
	<!---
	PROPERTIES
	--->
	<cfset variables.instance = StructNew() />

	<!---
	INITIALIZATION / CONFIGURATION
	--->
	<cffunction name="init" access="public" returntype="assessmentPlanWorkflow" output="false">
		<cfargument name="RecordID" type="string" required="false" default="" />
		<cfargument name="PlanType" type="string" required="false" default="" />
		<cfargument name="WorkflowStep" type="string" required="false" default="" />
		<cfargument name="WorkflowStepDescription" type="string" required="false" default="" />
		<cfargument name="WorkflowStepEmailInstructions" type="string" required="false" default="" />
		<cfargument name="WorkflowStepInstructions" type="string" required="false" default="" />
		
		<!--- run setters --->
		<cfset setRecordID(arguments.RecordID) />
		<cfset setPlanType(arguments.PlanType) />
		<cfset setWorkflowStep(arguments.WorkflowStep) />
		<cfset setWorkflowStepDescription(arguments.WorkflowStepDescription) />
		<cfset setWorkflowStepEmailInstructions(arguments.WorkflowStepEmailInstructions) />
		<cfset setWorkflowStepInstructions(arguments.WorkflowStepInstructions) />
		
		<cfreturn this />
 	</cffunction>

	<!---
	PUBLIC FUNCTIONS
	--->
	<cffunction name="setMemento" access="public" returntype="assessmentPlanWorkflow" output="false">
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
		
		<!--- PlanType --->
		<cfif (len(trim(getPlanType())) AND NOT isNumeric(trim(getPlanType())))>
			<cfset thisError.field = "PlanType" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "PlanType is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- WorkflowStep --->
		<cfif (NOT len(trim(getWorkflowStep())))>
			<cfset thisError.field = "WorkflowStep" />
			<cfset thisError.type = "required" />
			<cfset thisError.message = "WorkflowStep is required" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getWorkflowStep())) AND NOT isNumeric(trim(getWorkflowStep())))>
			<cfset thisError.field = "WorkflowStep" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "WorkflowStep is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- WorkflowStepDescription --->
		<cfif (NOT len(trim(getWorkflowStepDescription())))>
			<cfset thisError.field = "WorkflowStepDescription" />
			<cfset thisError.type = "required" />
			<cfset thisError.message = "WorkflowStepDescription is required" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getWorkflowStepDescription())) AND NOT IsSimpleValue(trim(getWorkflowStepDescription())))>
			<cfset thisError.field = "WorkflowStepDescription" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "WorkflowStepDescription is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getWorkflowStepDescription())) GT 200)>
			<cfset thisError.field = "WorkflowStepDescription" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "WorkflowStepDescription is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- WorkflowStepEmailInstructions --->
		<cfif (len(trim(getWorkflowStepEmailInstructions())) AND NOT IsSimpleValue(trim(getWorkflowStepEmailInstructions())))>
			<cfset thisError.field = "WorkflowStepEmailInstructions" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "WorkflowStepEmailInstructions is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getWorkflowStepEmailInstructions())) GT 1000)>
			<cfset thisError.field = "WorkflowStepEmailInstructions" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "WorkflowStepEmailInstructions is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- WorkflowStepInstructions --->
		<cfif (len(trim(getWorkflowStepInstructions())) AND NOT IsSimpleValue(trim(getWorkflowStepInstructions())))>
			<cfset thisError.field = "WorkflowStepInstructions" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "WorkflowStepInstructions is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getWorkflowStepInstructions())) GT 500)>
			<cfset thisError.field = "WorkflowStepInstructions" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "WorkflowStepInstructions is too long" />
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

	<cffunction name="setPlanType" access="public" returntype="void" output="false">
		<cfargument name="PlanType" type="string" required="true" />
		<cfset variables.instance.PlanType = arguments.PlanType />
	</cffunction>
	<cffunction name="getPlanType" access="public" returntype="string" output="false">
		<cfreturn variables.instance.PlanType />
	</cffunction>

	<cffunction name="setWorkflowStep" access="public" returntype="void" output="false">
		<cfargument name="WorkflowStep" type="string" required="true" />
		<cfset variables.instance.WorkflowStep = arguments.WorkflowStep />
	</cffunction>
	<cffunction name="getWorkflowStep" access="public" returntype="string" output="false">
		<cfreturn variables.instance.WorkflowStep />
	</cffunction>

	<cffunction name="setWorkflowStepDescription" access="public" returntype="void" output="false">
		<cfargument name="WorkflowStepDescription" type="string" required="true" />
		<cfset variables.instance.WorkflowStepDescription = arguments.WorkflowStepDescription />
	</cffunction>
	<cffunction name="getWorkflowStepDescription" access="public" returntype="string" output="false">
		<cfreturn variables.instance.WorkflowStepDescription />
	</cffunction>

	<cffunction name="setWorkflowStepEmailInstructions" access="public" returntype="void" output="false">
		<cfargument name="WorkflowStepEmailInstructions" type="string" required="true" />
		<cfset variables.instance.WorkflowStepEmailInstructions = arguments.WorkflowStepEmailInstructions />
	</cffunction>
	<cffunction name="getWorkflowStepEmailInstructions" access="public" returntype="string" output="false">
		<cfreturn variables.instance.WorkflowStepEmailInstructions />
	</cffunction>

	<cffunction name="setWorkflowStepInstructions" access="public" returntype="void" output="false">
		<cfargument name="WorkflowStepInstructions" type="string" required="true" />
		<cfset variables.instance.WorkflowStepInstructions = arguments.WorkflowStepInstructions />
	</cffunction>
	<cffunction name="getWorkflowStepInstructions" access="public" returntype="string" output="false">
		<cfreturn variables.instance.WorkflowStepInstructions />
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
