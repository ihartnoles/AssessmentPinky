
<cfcomponent displayname="messages" output="false">
		<cfproperty name="MessageID" type="numeric" default="" />
		<cfproperty name="SendToUserID" type="numeric" default="" />
		<cfproperty name="MessageTypeID" type="numeric" default="" />
		<cfproperty name="Subject" type="string" default="" />
		<cfproperty name="Message" type="string" default="" />
		<cfproperty name="CreatedOn" type="date" default="" />
		<cfproperty name="CreatedBy" type="numeric" default="" />
		<cfproperty name="Important" type="numeric" default="" />
		
	<!---
	PROPERTIES
	--->
	<cfset variables.instance = StructNew() />

	<!---
	INITIALIZATION / CONFIGURATION
	--->
	<cffunction name="init" access="public" returntype="messages" output="false">
		<cfargument name="MessageID" type="string" required="false" default="" />
		<cfargument name="SendToUserID" type="string" required="false" default="" />
		<cfargument name="MessageTypeID" type="string" required="false" default="" />
		<cfargument name="Subject" type="string" required="false" default="" />
		<cfargument name="Message" type="string" required="false" default="" />
		<cfargument name="CreatedOn" type="string" required="false" default="" />
		<cfargument name="CreatedBy" type="string" required="false" default="" />
		<cfargument name="Important" type="string" required="false" default="" />
		
		<!--- run setters --->
		<cfset setMessageID(arguments.MessageID) />
		<cfset setSendToUserID(arguments.SendToUserID) />
		<cfset setMessageTypeID(arguments.MessageTypeID) />
		<cfset setSubject(arguments.Subject) />
		<cfset setMessage(arguments.Message) />
		<cfset setCreatedOn(arguments.CreatedOn) />
		<cfset setCreatedBy(arguments.CreatedBy) />
		<cfset setImportant(arguments.Important) />
		
		<cfreturn this />
 	</cffunction>

	<!---
	PUBLIC FUNCTIONS
	--->
	<cffunction name="setMemento" access="public" returntype="messages" output="false">
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
		
		<!--- MessageID --->
		<cfif (len(trim(getMessageID())) AND NOT isNumeric(trim(getMessageID())))>
			<cfset thisError.field = "MessageID" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "MessageID is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- SendToUserID --->
		<cfif (len(trim(getSendToUserID())) AND NOT isNumeric(trim(getSendToUserID())))>
			<cfset thisError.field = "SendToUserID" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "SendToUserID is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- MessageTypeID --->
		<cfif (len(trim(getMessageTypeID())) AND NOT isNumeric(trim(getMessageTypeID())))>
			<cfset thisError.field = "MessageTypeID" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "MessageTypeID is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- Subject --->
		<cfif (len(trim(getSubject())) AND NOT IsSimpleValue(trim(getSubject())))>
			<cfset thisError.field = "Subject" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "Subject is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getSubject())) GT 50)>
			<cfset thisError.field = "Subject" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "Subject is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- Message --->
		<cfif (len(trim(getMessage())) AND NOT IsSimpleValue(trim(getMessage())))>
			<cfset thisError.field = "Message" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "Message is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getMessage())) GT 2147483647)>
			<cfset thisError.field = "Message" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "Message is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- CreatedOn --->
		<cfif (len(trim(getCreatedOn())) AND NOT isDate(trim(getCreatedOn())))>
			<cfset thisError.field = "CreatedOn" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "CreatedOn is not a date" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- CreatedBy 
		<cfif (len(trim(getCreatedBy())) AND NOT isNumeric(trim(getCreatedBy())))>
			<cfset thisError.field = "CreatedBy" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "CreatedBy is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		--->

		<!--- Important --->
		<cfif (len(trim(getImportant())) AND NOT isNumeric(trim(getImportant())))>
			<cfset thisError.field = "Important" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "Important is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<cfreturn errors />
	</cffunction>

	<!---
	ACCESSORS
	--->
	<cffunction name="setMessageID" access="public" returntype="void" output="false">
		<cfargument name="MessageID" type="string" required="true" />
		<cfset variables.instance.MessageID = arguments.MessageID />
	</cffunction>
	<cffunction name="getMessageID" access="public" returntype="string" output="false">
		<cfreturn variables.instance.MessageID />
	</cffunction>

	<cffunction name="setSendToUserID" access="public" returntype="void" output="false">
		<cfargument name="SendToUserID" type="string" required="true" />
		<cfset variables.instance.SendToUserID = arguments.SendToUserID />
	</cffunction>
	<cffunction name="getSendToUserID" access="public" returntype="string" output="false">
		<cfreturn variables.instance.SendToUserID />
	</cffunction>

	<cffunction name="setMessageTypeID" access="public" returntype="void" output="false">
		<cfargument name="MessageTypeID" type="string" required="true" />
		<cfset variables.instance.MessageTypeID = arguments.MessageTypeID />
	</cffunction>
	<cffunction name="getMessageTypeID" access="public" returntype="string" output="false">
		<cfreturn variables.instance.MessageTypeID />
	</cffunction>

	<cffunction name="setSubject" access="public" returntype="void" output="false">
		<cfargument name="Subject" type="string" required="true" />
		<cfset variables.instance.Subject = arguments.Subject />
	</cffunction>
	<cffunction name="getSubject" access="public" returntype="string" output="false">
		<cfreturn variables.instance.Subject />
	</cffunction>

	<cffunction name="setMessage" access="public" returntype="void" output="false">
		<cfargument name="Message" type="string" required="true" />
		<cfset variables.instance.Message = arguments.Message />
	</cffunction>
	<cffunction name="getMessage" access="public" returntype="string" output="false">
		<cfreturn variables.instance.Message />
	</cffunction>

	<cffunction name="setCreatedOn" access="public" returntype="void" output="false">
		<cfargument name="CreatedOn" type="string" required="true" />
		<cfset variables.instance.CreatedOn = arguments.CreatedOn />
	</cffunction>
	<cffunction name="getCreatedOn" access="public" returntype="string" output="false">
		<cfreturn variables.instance.CreatedOn />
	</cffunction>

	<cffunction name="setCreatedBy" access="public" returntype="void" output="false">
		<cfargument name="CreatedBy" type="string" required="true" />
		<cfset variables.instance.CreatedBy = arguments.CreatedBy />
	</cffunction>
	<cffunction name="getCreatedBy" access="public" returntype="string" output="false">
		<cfreturn variables.instance.CreatedBy />
	</cffunction>

	<cffunction name="setImportant" access="public" returntype="void" output="false">
		<cfargument name="Important" type="string" required="true" />
		<cfset variables.instance.Important = arguments.Important />
	</cffunction>
	<cffunction name="getImportant" access="public" returntype="string" output="false">
		<cfreturn variables.instance.Important />
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
