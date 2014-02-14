
<cfcomponent displayname="tasks" output="false">
		<cfproperty name="TaskID" type="numeric" default="" />
		<cfproperty name="userID" type="numeric" default="" />
		<cfproperty name="task_text" type="string" default="" />
		<cfproperty name="done" type="numeric" default="" />
		<cfproperty name="bookmarked" type="numeric" default="" />
		
	<!---
	PROPERTIES
	--->
	<cfset variables.instance = StructNew() />

	<!---
	INITIALIZATION / CONFIGURATION
	--->
	<cffunction name="init" access="public" returntype="tasks" output="false">
		<cfargument name="TaskID" type="string" required="false" default="" />
		<cfargument name="userID" type="string" required="false" default="" />
		<cfargument name="task_text" type="string" required="false" default="" />
		<cfargument name="done" type="string" required="false" default="" />
		<cfargument name="bookmarked" type="string" required="false" default="" />
		
		<!--- run setters --->
		<cfset setTaskID(arguments.TaskID) />
		<cfset setuserID(arguments.userID) />
		<cfset settask_text(arguments.task_text) />
		<cfset setdone(arguments.done) />
		<cfset setbookmarked(arguments.bookmarked) />
		
		<cfreturn this />
 	</cffunction>

	<!---
	PUBLIC FUNCTIONS
	--->
	<cffunction name="setMemento" access="public" returntype="tasks" output="false">
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
		
		<!--- TaskID --->
		<cfif (NOT len(trim(getTaskID())))>
			<cfset thisError.field = "TaskID" />
			<cfset thisError.type = "required" />
			<cfset thisError.message = "TaskID is required" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getTaskID())) AND NOT isNumeric(trim(getTaskID())))>
			<cfset thisError.field = "TaskID" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "TaskID is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- userID --->
		<cfif (NOT len(trim(getuserID())))>
			<cfset thisError.field = "userID" />
			<cfset thisError.type = "required" />
			<cfset thisError.message = "userID is required" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getuserID())) AND NOT isNumeric(trim(getuserID())))>
			<cfset thisError.field = "userID" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "userID is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- task_text --->
		<cfif (len(trim(gettask_text())) AND NOT IsSimpleValue(trim(gettask_text())))>
			<cfset thisError.field = "task_text" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "task_text is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(gettask_text())) GT 255)>
			<cfset thisError.field = "task_text" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "task_text is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- done --->
		<cfif (len(trim(getdone())) AND NOT isNumeric(trim(getdone())))>
			<cfset thisError.field = "done" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "done is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- bookmarked --->
		<cfif (len(trim(getbookmarked())) AND NOT isNumeric(trim(getbookmarked())))>
			<cfset thisError.field = "bookmarked" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "bookmarked is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<cfreturn errors />
	</cffunction>

	<!---
	ACCESSORS
	--->
	<cffunction name="setTaskID" access="public" returntype="void" output="false">
		<cfargument name="TaskID" type="string" required="true" />
		<cfset variables.instance.TaskID = arguments.TaskID />
	</cffunction>
	<cffunction name="getTaskID" access="public" returntype="string" output="false">
		<cfreturn variables.instance.TaskID />
	</cffunction>

	<cffunction name="setuserID" access="public" returntype="void" output="false">
		<cfargument name="userID" type="string" required="true" />
		<cfset variables.instance.userID = arguments.userID />
	</cffunction>
	<cffunction name="getuserID" access="public" returntype="string" output="false">
		<cfreturn variables.instance.userID />
	</cffunction>

	<cffunction name="settask_text" access="public" returntype="void" output="false">
		<cfargument name="task_text" type="string" required="true" />
		<cfset variables.instance.task_text = arguments.task_text />
	</cffunction>
	<cffunction name="gettask_text" access="public" returntype="string" output="false">
		<cfreturn variables.instance.task_text />
	</cffunction>

	<cffunction name="setdone" access="public" returntype="void" output="false">
		<cfargument name="done" type="string" required="true" />
		<cfset variables.instance.done = arguments.done />
	</cffunction>
	<cffunction name="getdone" access="public" returntype="string" output="false">
		<cfreturn variables.instance.done />
	</cffunction>

	<cffunction name="setbookmarked" access="public" returntype="void" output="false">
		<cfargument name="bookmarked" type="string" required="true" />
		<cfset variables.instance.bookmarked = arguments.bookmarked />
	</cffunction>
	<cffunction name="getbookmarked" access="public" returntype="string" output="false">
		<cfreturn variables.instance.bookmarked />
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
