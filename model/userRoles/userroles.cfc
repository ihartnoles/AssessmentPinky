
<cfcomponent displayname="userroles" output="false">
		<cfproperty name="RecordID" type="numeric" default="" />
		<cfproperty name="UserID" type="numeric" default="" />
		<cfproperty name="RoleID" type="numeric" default="" />
		<cfproperty name="DefaultRole" type="numeric" default="" />
		<cfproperty name="DateInserted" type="date" default="" />
		
	<!---
	PROPERTIES
	--->
	<cfset variables.instance = StructNew() />

	<!---
	INITIALIZATION / CONFIGURATION
	--->
	<cffunction name="init" access="public" returntype="userroles" output="false">
		<cfargument name="RecordID" type="string" required="false" default="" />
		<cfargument name="UserID" type="string" required="false" default="" />
		<cfargument name="RoleID" type="string" required="false" default="" />
		<cfargument name="DefaultRole" type="string" required="false" default="" />
		<cfargument name="DateInserted" type="string" required="false" default="" />
		
		<!--- run setters --->
		<cfset setRecordID(arguments.RecordID) />
		<cfset setUserID(arguments.UserID) />
		<cfset setRoleID(arguments.RoleID) />
		<cfset setDefaultRole(arguments.DefaultRole) />
		<cfset setDateInserted(arguments.DateInserted) />
		
		<cfreturn this />
 	</cffunction>

	<!---
	PUBLIC FUNCTIONS
	--->
	<cffunction name="setMemento" access="public" returntype="userroles" output="false">
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
		
		<!--- UserID --->
		<cfif (NOT len(trim(getUserID())))>
			<cfset thisError.field = "UserID" />
			<cfset thisError.type = "required" />
			<cfset thisError.message = "UserID is required" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getUserID())) AND NOT isNumeric(trim(getUserID())))>
			<cfset thisError.field = "UserID" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "UserID is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- RoleID --->
		<cfif (NOT len(trim(getRoleID())))>
			<cfset thisError.field = "RoleID" />
			<cfset thisError.type = "required" />
			<cfset thisError.message = "RoleID is required" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getRoleID())) AND NOT isNumeric(trim(getRoleID())))>
			<cfset thisError.field = "RoleID" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "RoleID is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- DefaultRole --->
		<cfif (len(trim(getDefaultRole())) AND NOT isNumeric(trim(getDefaultRole())))>
			<cfset thisError.field = "DefaultRole" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "DefaultRole is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- DateInserted --->
		<cfif (NOT len(trim(getDateInserted())))>
			<cfset thisError.field = "DateInserted" />
			<cfset thisError.type = "required" />
			<cfset thisError.message = "DateInserted is required" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getDateInserted())) AND NOT isDate(trim(getDateInserted())))>
			<cfset thisError.field = "DateInserted" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "DateInserted is not a date" />
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

	<cffunction name="setUserID" access="public" returntype="void" output="false">
		<cfargument name="UserID" type="string" required="true" />
		<cfset variables.instance.UserID = arguments.UserID />
	</cffunction>
	<cffunction name="getUserID" access="public" returntype="string" output="false">
		<cfreturn variables.instance.UserID />
	</cffunction>

	<cffunction name="setRoleID" access="public" returntype="void" output="false">
		<cfargument name="RoleID" type="string" required="true" />
		<cfset variables.instance.RoleID = arguments.RoleID />
	</cffunction>
	<cffunction name="getRoleID" access="public" returntype="string" output="false">
		<cfreturn variables.instance.RoleID />
	</cffunction>

	<cffunction name="setDefaultRole" access="public" returntype="void" output="false">
		<cfargument name="DefaultRole" type="string" required="true" />
		<cfset variables.instance.DefaultRole = arguments.DefaultRole />
	</cffunction>
	<cffunction name="getDefaultRole" access="public" returntype="string" output="false">
		<cfreturn variables.instance.DefaultRole />
	</cffunction>

	<cffunction name="setDateInserted" access="public" returntype="void" output="false">
		<cfargument name="DateInserted" type="string" required="true" />
		<cfset variables.instance.DateInserted = arguments.DateInserted />
	</cffunction>
	<cffunction name="getDateInserted" access="public" returntype="string" output="false">
		<cfreturn variables.instance.DateInserted />
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
