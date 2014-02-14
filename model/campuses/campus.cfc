
<cfcomponent displayname="campus" output="false">
		<cfproperty name="Campus" type="string" default="" />
		<cfproperty name="CampusDescription" type="string" default="" />
		
	<!---
	PROPERTIES
	--->
	<cfset variables.instance = StructNew() />

	<!---
	INITIALIZATION / CONFIGURATION
	--->
	<cffunction name="init" access="public" returntype="campus" output="false">
		<cfargument name="Campus" type="string" required="false" default="" />
		<cfargument name="CampusDescription" type="string" required="false" default="" />
		
		<!--- run setters --->
		<cfset setCampus(arguments.Campus) />
		<cfset setCampusDescription(arguments.CampusDescription) />
		
		<cfreturn this />
 	</cffunction>

	<!---
	PUBLIC FUNCTIONS
	--->
	<cffunction name="setMemento" access="public" returntype="campus" output="false">
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
		
		<!--- Campus --->
		<cfif (NOT len(trim(getCampus())))>
			<cfset thisError.field = "Campus" />
			<cfset thisError.type = "required" />
			<cfset thisError.message = "Campus is required" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getCampus())) AND NOT IsSimpleValue(trim(getCampus())))>
			<cfset thisError.field = "Campus" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "Campus is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getCampus())) GT 2)>
			<cfset thisError.field = "Campus" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "Campus is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- CampusDescription --->
		<cfif (NOT len(trim(getCampusDescription())))>
			<cfset thisError.field = "CampusDescription" />
			<cfset thisError.type = "required" />
			<cfset thisError.message = "CampusDescription is required" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getCampusDescription())) AND NOT IsSimpleValue(trim(getCampusDescription())))>
			<cfset thisError.field = "CampusDescription" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "CampusDescription is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getCampusDescription())) GT 50)>
			<cfset thisError.field = "CampusDescription" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "CampusDescription is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<cfreturn errors />
	</cffunction>

	<!---
	ACCESSORS
	--->
	<cffunction name="setCampus" access="public" returntype="void" output="false">
		<cfargument name="Campus" type="string" required="true" />
		<cfset variables.instance.Campus = arguments.Campus />
	</cffunction>
	<cffunction name="getCampus" access="public" returntype="string" output="false">
		<cfreturn variables.instance.Campus />
	</cffunction>

	<cffunction name="setCampusDescription" access="public" returntype="void" output="false">
		<cfargument name="CampusDescription" type="string" required="true" />
		<cfset variables.instance.CampusDescription = arguments.CampusDescription />
	</cffunction>
	<cffunction name="getCampusDescription" access="public" returntype="string" output="false">
		<cfreturn variables.instance.CampusDescription />
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
