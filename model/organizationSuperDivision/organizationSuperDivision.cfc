
<cfcomponent displayname="organizationSuperDivision" output="false">
		<cfproperty name="SuperDivisionID" type="numeric" default="" />
		<cfproperty name="SuperDivisionName" type="string" default="" />
		<cfproperty name="OrganizationID" type="numeric" default="" />
		<cfproperty name="SuperDivisionActive" type="numeric" default="" />
		
	<!---
	PROPERTIES
	--->
	<cfset variables.instance = StructNew() />

	<!---
	INITIALIZATION / CONFIGURATION
	--->
	<cffunction name="init" access="public" returntype="organizationSuperDivision" output="false">
		<cfargument name="SuperDivisionID" type="string" required="false" default="" />
		<cfargument name="SuperDivisionName" type="string" required="false" default="" />
		<cfargument name="OrganizationID" type="string" required="false" default="" />
		<cfargument name="SuperDivisionActive" type="string" required="false" default="" />
		
		<!--- run setters --->
		<cfset setSuperDivisionID(arguments.SuperDivisionID) />
		<cfset setSuperDivisionName(arguments.SuperDivisionName) />
		<cfset setOrganizationID(arguments.OrganizationID) />
		<cfset setSuperDivisionActive(arguments.SuperDivisionActive) />
		
		<cfreturn this />
 	</cffunction>

	<!---
	PUBLIC FUNCTIONS
	--->
	<cffunction name="setMemento" access="public" returntype="organizationSuperDivision" output="false">
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
		
		<!--- SuperDivisionName --->
		<cfif (NOT len(trim(getSuperDivisionName())))>
			<cfset thisError.field = "SuperDivisionName" />
			<cfset thisError.type = "required" />
			<cfset thisError.message = "SuperDivisionName is required" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getSuperDivisionName())) AND NOT IsSimpleValue(trim(getSuperDivisionName())))>
			<cfset thisError.field = "SuperDivisionName" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "SuperDivisionName is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getSuperDivisionName())) GT 50)>
			<cfset thisError.field = "SuperDivisionName" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "SuperDivisionName is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- OrganizationID --->
		<cfif (len(trim(getOrganizationID())) AND NOT isNumeric(trim(getOrganizationID())))>
			<cfset thisError.field = "OrganizationID" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "OrganizationID is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- SuperDivisionActive --->
		<cfif (len(trim(getSuperDivisionActive())) AND NOT isNumeric(trim(getSuperDivisionActive())))>
			<cfset thisError.field = "SuperDivisionActive" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "SuperDivisionActive is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<cfreturn errors />
	</cffunction>

	<!---
	ACCESSORS
	--->
	<cffunction name="setSuperDivisionID" access="public" returntype="void" output="false">
		<cfargument name="SuperDivisionID" type="string" required="true" />
		<cfset variables.instance.SuperDivisionID = arguments.SuperDivisionID />
	</cffunction>
	<cffunction name="getSuperDivisionID" access="public" returntype="string" output="false">
		<cfreturn variables.instance.SuperDivisionID />
	</cffunction>

	<cffunction name="setSuperDivisionName" access="public" returntype="void" output="false">
		<cfargument name="SuperDivisionName" type="string" required="true" />
		<cfset variables.instance.SuperDivisionName = arguments.SuperDivisionName />
	</cffunction>
	<cffunction name="getSuperDivisionName" access="public" returntype="string" output="false">
		<cfreturn variables.instance.SuperDivisionName />
	</cffunction>

	<cffunction name="setOrganizationID" access="public" returntype="void" output="false">
		<cfargument name="OrganizationID" type="string" required="true" />
		<cfset variables.instance.OrganizationID = arguments.OrganizationID />
	</cffunction>
	<cffunction name="getOrganizationID" access="public" returntype="string" output="false">
		<cfreturn variables.instance.OrganizationID />
	</cffunction>

	<cffunction name="setSuperDivisionActive" access="public" returntype="void" output="false">
		<cfargument name="SuperDivisionActive" type="string" required="true" />
		<cfset variables.instance.SuperDivisionActive = arguments.SuperDivisionActive />
	</cffunction>
	<cffunction name="getSuperDivisionActive" access="public" returntype="string" output="false">
		<cfreturn variables.instance.SuperDivisionActive />
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
