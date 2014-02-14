
<cfcomponent displayname="organizationDept" output="false">
		<cfproperty name="DeptID" type="numeric" default="" />
		<cfproperty name="DeptName" type="string" default="" />
		<cfproperty name="DivisionID" type="numeric" default="" />
		<cfproperty name="SamasDeptID" type="string" default="" />
		<cfproperty name="DeptActive" type="numeric" default="" />
		
	<!---
	PROPERTIES
	--->
	<cfset variables.instance = StructNew() />

	<!---
	INITIALIZATION / CONFIGURATION
	--->
	<cffunction name="init" access="public" returntype="organizationDept" output="false">
		<cfargument name="DeptID" type="string" required="false" default="" />
		<cfargument name="DeptName" type="string" required="false" default="" />
		<cfargument name="DivisionID" type="string" required="false" default="" />
		<cfargument name="SamasDeptID" type="string" required="false" default="" />
		<cfargument name="DeptActive" type="string" required="false" default="" />
		
		<!--- run setters --->
		<cfset setDeptID(arguments.DeptID) />
		<cfset setDeptName(arguments.DeptName) />
		<cfset setDivisionID(arguments.DivisionID) />
		<cfset setSamasDeptID(arguments.SamasDeptID) />
		<cfset setDeptActive(arguments.DeptActive) />
		
		<cfreturn this />
 	</cffunction>

	<!---
	PUBLIC FUNCTIONS
	--->
	<cffunction name="setMemento" access="public" returntype="organizationDept" output="false">
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
		
		<!--- DeptID --->
		<cfif (len(trim(getDeptID())) AND NOT isNumeric(trim(getDeptID())))>
			<cfset thisError.field = "DeptID" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "DeptID is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- DeptName --->
		<cfif (NOT len(trim(getDeptName())))>
			<cfset thisError.field = "DeptName" />
			<cfset thisError.type = "required" />
			<cfset thisError.message = "DeptName is required" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getDeptName())) AND NOT IsSimpleValue(trim(getDeptName())))>
			<cfset thisError.field = "DeptName" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "DeptName is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getDeptName())) GT 50)>
			<cfset thisError.field = "DeptName" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "DeptName is too long" />
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
		
		<!--- SamasDeptID --->
		<cfif (NOT len(trim(getSamasDeptID())))>
			<cfset thisError.field = "SamasDeptID" />
			<cfset thisError.type = "required" />
			<cfset thisError.message = "SamasDeptID is required" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getSamasDeptID())) AND NOT IsSimpleValue(trim(getSamasDeptID())))>
			<cfset thisError.field = "SamasDeptID" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "SamasDeptID is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getSamasDeptID())) GT 4)>
			<cfset thisError.field = "SamasDeptID" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "SamasDeptID is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- DeptActive --->
		<cfif (len(trim(getDeptActive())) AND NOT isNumeric(trim(getDeptActive())))>
			<cfset thisError.field = "DeptActive" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "DeptActive is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<cfreturn errors />
	</cffunction>

	<!---
	ACCESSORS
	--->
	<cffunction name="setDeptID" access="public" returntype="void" output="false">
		<cfargument name="DeptID" type="string" required="true" />
		<cfset variables.instance.DeptID = arguments.DeptID />
	</cffunction>
	<cffunction name="getDeptID" access="public" returntype="string" output="false">
		<cfreturn variables.instance.DeptID />
	</cffunction>

	<cffunction name="setDeptName" access="public" returntype="void" output="false">
		<cfargument name="DeptName" type="string" required="true" />
		<cfset variables.instance.DeptName = arguments.DeptName />
	</cffunction>
	<cffunction name="getDeptName" access="public" returntype="string" output="false">
		<cfreturn variables.instance.DeptName />
	</cffunction>

	<cffunction name="setDivisionID" access="public" returntype="void" output="false">
		<cfargument name="DivisionID" type="string" required="true" />
		<cfset variables.instance.DivisionID = arguments.DivisionID />
	</cffunction>
	<cffunction name="getDivisionID" access="public" returntype="string" output="false">
		<cfreturn variables.instance.DivisionID />
	</cffunction>

	<cffunction name="setSamasDeptID" access="public" returntype="void" output="false">
		<cfargument name="SamasDeptID" type="string" required="true" />
		<cfset variables.instance.SamasDeptID = arguments.SamasDeptID />
	</cffunction>
	<cffunction name="getSamasDeptID" access="public" returntype="string" output="false">
		<cfreturn variables.instance.SamasDeptID />
	</cffunction>

	<cffunction name="setDeptActive" access="public" returntype="void" output="false">
		<cfargument name="DeptActive" type="string" required="true" />
		<cfset variables.instance.DeptActive = arguments.DeptActive />
	</cffunction>
	<cffunction name="getDeptActive" access="public" returntype="string" output="false">
		<cfreturn variables.instance.DeptActive />
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
