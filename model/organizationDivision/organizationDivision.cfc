
<cfcomponent displayname="organizationDivision" output="false">
		<cfproperty name="DivisionID" type="numeric" default="" />
		<cfproperty name="DivisionName" type="string" default="" />
		<cfproperty name="DivisionAbv" type="string" default="" />
		<cfproperty name="SamasDivisionID" type="string" default="" />
		<cfproperty name="SuperDivisionID" type="numeric" default="" />
		<cfproperty name="DivisionActive" type="numeric" default="" />
		
	<!---
	PROPERTIES
	--->
	<cfset variables.instance = StructNew() />

	<!---
	INITIALIZATION / CONFIGURATION
	--->
	<cffunction name="init" access="public" returntype="organizationDivision" output="false">
		<cfargument name="DivisionID" type="string" required="false" default="" />
		<cfargument name="DivisionName" type="string" required="false" default="" />
		<cfargument name="DivisionAbv" type="string" required="false" default="" />
		<cfargument name="SamasDivisionID" type="string" required="false" default="" />
		<cfargument name="SuperDivisionID" type="string" required="false" default="" />
		<cfargument name="DivisionActive" type="string" required="false" default="" />
		
		<!--- run setters --->
		<cfset setDivisionID(arguments.DivisionID) />
		<cfset setDivisionName(arguments.DivisionName) />
		<cfset setDivisionAbv(arguments.DivisionAbv) />
		<cfset setSamasDivisionID(arguments.SamasDivisionID) />
		<cfset setSuperDivisionID(arguments.SuperDivisionID) />
		<cfset setDivisionActive(arguments.DivisionActive) />
		
		<cfreturn this />
 	</cffunction>

	<!---
	PUBLIC FUNCTIONS
	--->
	<cffunction name="setMemento" access="public" returntype="organizationDivision" output="false">
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
		
		<!--- DivisionID --->
		<cfif (len(trim(getDivisionID())) AND NOT isNumeric(trim(getDivisionID())))>
			<cfset thisError.field = "DivisionID" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "DivisionID is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- DivisionName --->
		<cfif (NOT len(trim(getDivisionName())))>
			<cfset thisError.field = "DivisionName" />
			<cfset thisError.type = "required" />
			<cfset thisError.message = "DivisionName is required" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getDivisionName())) AND NOT IsSimpleValue(trim(getDivisionName())))>
			<cfset thisError.field = "DivisionName" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "DivisionName is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getDivisionName())) GT 50)>
			<cfset thisError.field = "DivisionName" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "DivisionName is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- DivisionAbv --->
		<cfif (NOT len(trim(getDivisionAbv())))>
			<cfset thisError.field = "DivisionAbv" />
			<cfset thisError.type = "required" />
			<cfset thisError.message = "DivisionAbv is required" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getDivisionAbv())) AND NOT IsSimpleValue(trim(getDivisionAbv())))>
			<cfset thisError.field = "DivisionAbv" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "DivisionAbv is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getDivisionAbv())) GT 2)>
			<cfset thisError.field = "DivisionAbv" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "DivisionAbv is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- SamasDivisionID --->
		<cfif (len(trim(getSamasDivisionID())) AND NOT IsSimpleValue(trim(getSamasDivisionID())))>
			<cfset thisError.field = "SamasDivisionID" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "SamasDivisionID is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getSamasDivisionID())) GT 2)>
			<cfset thisError.field = "SamasDivisionID" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "SamasDivisionID is too long" />
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
		
		<!--- DivisionActive --->
		<cfif (len(trim(getDivisionActive())) AND NOT isNumeric(trim(getDivisionActive())))>
			<cfset thisError.field = "DivisionActive" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "DivisionActive is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<cfreturn errors />
	</cffunction>

	<!---
	ACCESSORS
	--->
	<cffunction name="setDivisionID" access="public" returntype="void" output="false">
		<cfargument name="DivisionID" type="string" required="true" />
		<cfset variables.instance.DivisionID = arguments.DivisionID />
	</cffunction>
	<cffunction name="getDivisionID" access="public" returntype="string" output="false">
		<cfreturn variables.instance.DivisionID />
	</cffunction>

	<cffunction name="setDivisionName" access="public" returntype="void" output="false">
		<cfargument name="DivisionName" type="string" required="true" />
		<cfset variables.instance.DivisionName = arguments.DivisionName />
	</cffunction>
	<cffunction name="getDivisionName" access="public" returntype="string" output="false">
		<cfreturn variables.instance.DivisionName />
	</cffunction>

	<cffunction name="setDivisionAbv" access="public" returntype="void" output="false">
		<cfargument name="DivisionAbv" type="string" required="true" />
		<cfset variables.instance.DivisionAbv = arguments.DivisionAbv />
	</cffunction>
	<cffunction name="getDivisionAbv" access="public" returntype="string" output="false">
		<cfreturn variables.instance.DivisionAbv />
	</cffunction>

	<cffunction name="setSamasDivisionID" access="public" returntype="void" output="false">
		<cfargument name="SamasDivisionID" type="string" required="true" />
		<cfset variables.instance.SamasDivisionID = arguments.SamasDivisionID />
	</cffunction>
	<cffunction name="getSamasDivisionID" access="public" returntype="string" output="false">
		<cfreturn variables.instance.SamasDivisionID />
	</cffunction>

	<cffunction name="setSuperDivisionID" access="public" returntype="void" output="false">
		<cfargument name="SuperDivisionID" type="string" required="true" />
		<cfset variables.instance.SuperDivisionID = arguments.SuperDivisionID />
	</cffunction>
	<cffunction name="getSuperDivisionID" access="public" returntype="string" output="false">
		<cfreturn variables.instance.SuperDivisionID />
	</cffunction>

	<cffunction name="setDivisionActive" access="public" returntype="void" output="false">
		<cfargument name="DivisionActive" type="string" required="true" />
		<cfset variables.instance.DivisionActive = arguments.DivisionActive />
	</cffunction>
	<cffunction name="getDivisionActive" access="public" returntype="string" output="false">
		<cfreturn variables.instance.DivisionActive />
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
