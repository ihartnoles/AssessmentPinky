
<cfcomponent displayname="ProgramImprovementCodes" output="false">
		<cfproperty name="ProgramImprovementCodeID" type="numeric" default="" />
		<cfproperty name="item_number" type="string" default="" />
		<cfproperty name="label" type="string" default="" />
		<cfproperty name="description" type="string" default="" />
		
	<!---
	PROPERTIES
	--->
	<cfset variables.instance = StructNew() />

	<!---
	INITIALIZATION / CONFIGURATION
	--->
	<cffunction name="init" access="public" returntype="ProgramImprovementCodes" output="false">
		<cfargument name="ProgramImprovementCodeID" type="string" required="false" default="" />
		<cfargument name="item_number" type="string" required="false" default="" />
		<cfargument name="label" type="string" required="false" default="" />
		<cfargument name="description" type="string" required="false" default="" />
		
		<!--- run setters --->
		<cfset setProgramImprovementCodeID(arguments.ProgramImprovementCodeID) />
		<cfset setitem_number(arguments.item_number) />
		<cfset setlabel(arguments.label) />
		<cfset setdescription(arguments.description) />
		
		<cfreturn this />
 	</cffunction>

	<!---
	PUBLIC FUNCTIONS
	--->
	<cffunction name="setMemento" access="public" returntype="ProgramImprovementCodes" output="false">
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
		
		<!--- ProgramImprovementCodeID --->
		<cfif (len(trim(getProgramImprovementCodeID())) AND NOT isNumeric(trim(getProgramImprovementCodeID())))>
			<cfset thisError.field = "ProgramImprovementCodeID" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "ProgramImprovementCodeID is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- item_number --->
		<cfif (len(trim(getitem_number())) AND NOT IsSimpleValue(trim(getitem_number())))>
			<cfset thisError.field = "item_number" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "item_number is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getitem_number())) GT 50)>
			<cfset thisError.field = "item_number" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "item_number is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- label --->
		<cfif (len(trim(getlabel())) AND NOT IsSimpleValue(trim(getlabel())))>
			<cfset thisError.field = "label" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "label is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getlabel())) GT 50)>
			<cfset thisError.field = "label" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "label is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- description --->
		<cfif (len(trim(getdescription())) AND NOT IsSimpleValue(trim(getdescription())))>
			<cfset thisError.field = "description" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "description is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getdescription())) GT 2147483647)>
			<cfset thisError.field = "description" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "description is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<cfreturn errors />
	</cffunction>

	<!---
	ACCESSORS
	--->
	<cffunction name="setProgramImprovementCodeID" access="public" returntype="void" output="false">
		<cfargument name="ProgramImprovementCodeID" type="string" required="true" />
		<cfset variables.instance.ProgramImprovementCodeID = arguments.ProgramImprovementCodeID />
	</cffunction>
	<cffunction name="getProgramImprovementCodeID" access="public" returntype="string" output="false">
		<cfreturn variables.instance.ProgramImprovementCodeID />
	</cffunction>

	<cffunction name="setitem_number" access="public" returntype="void" output="false">
		<cfargument name="item_number" type="string" required="true" />
		<cfset variables.instance.item_number = arguments.item_number />
	</cffunction>
	<cffunction name="getitem_number" access="public" returntype="string" output="false">
		<cfreturn variables.instance.item_number />
	</cffunction>

	<cffunction name="setlabel" access="public" returntype="void" output="false">
		<cfargument name="label" type="string" required="true" />
		<cfset variables.instance.label = arguments.label />
	</cffunction>
	<cffunction name="getlabel" access="public" returntype="string" output="false">
		<cfreturn variables.instance.label />
	</cffunction>

	<cffunction name="setdescription" access="public" returntype="void" output="false">
		<cfargument name="description" type="string" required="true" />
		<cfset variables.instance.description = arguments.description />
	</cffunction>
	<cffunction name="getdescription" access="public" returntype="string" output="false">
		<cfreturn variables.instance.description />
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
