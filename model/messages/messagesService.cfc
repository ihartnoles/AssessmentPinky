
<cfcomponent name="messagesService" output="false">

	<cffunction name="init" access="public" output="false" returntype="messagesService">
		<cfargument name="messagesDAO" type="messagesDAO" required="true" />
		<cfargument name="messagesGateway" type="messagesGateway" required="true" />

		<cfset variables.messagesDAO = arguments.messagesDAO />
		<cfset variables.messagesGateway = arguments.messagesGateway />

		<cfreturn this/>
	</cffunction>

	<cffunction name="createmessages" access="public" output="false" returntype="messages">
		<cfargument name="MessageID" type="numeric" required="true" />
		<cfargument name="SendToUserID" type="numeric" required="false" />
		<cfargument name="MessageTypeID" type="numeric" required="false" />
		<cfargument name="Subject" type="string" required="false" />
		<cfargument name="Message" type="string" required="false" />
		<cfargument name="CreatedOn" type="date" required="false" />
		<cfargument name="CreatedBy" type="numeric" required="false" />
		<cfargument name="Important" type="numeric" required="false" />
		
			
		<cfset var messages = createObject("component","messages").init(argumentCollection=arguments) />
		<cfreturn messages />
	</cffunction>

	<cffunction name="getmessages" access="public" output="false" returntype="messages">
		<cfargument name="MessageID" type="numeric" required="true" />
		
		<cfset var messages = createmessages(argumentCollection=arguments) />
		<cfset variables.messagesDAO.read(messages) />
		<cfreturn messages />
	</cffunction>

	<cffunction name="getmessagess" access="public" output="false" returntype="array">
		<cfargument name="MessageID" type="numeric" required="false" />
		<cfargument name="SendToUserID" type="numeric" required="false" />
		<cfargument name="MessageTypeID" type="numeric" required="false" />
		<cfargument name="Subject" type="string" required="false" />
		<cfargument name="Message" type="string" required="false" />
		<cfargument name="CreatedOn" type="date" required="false" />
		<cfargument name="CreatedBy" type="numeric" required="false" />
		<cfargument name="Important" type="numeric" required="false" />
		
		<cfreturn variables.messagesGateway.getByAttributes(argumentCollection=arguments) />
	</cffunction>

	<cffunction name="savemessages" access="public" output="false" returntype="numeric">
		<cfargument name="messages" type="messages" required="true" />

		<cfreturn variables.messagesDAO.save(messages) />
	</cffunction>

	<cffunction name="deletemessages" access="public" output="false" returntype="boolean">
		<cfargument name="MessageID" type="numeric" required="true" />
		
		<cfset var messages = createmessages(argumentCollection=arguments) />
		<cfreturn variables.messagesDAO.delete(messages) />
	</cffunction>

	
	<cffunction name="sendMessage" access="public" output="false" returntype="boolean">
		<!--- <cfargument name="MessageID" type="numeric" required="true" /> --->
		<cfargument name="SendToUserID" type="numeric" required="false" />
		<cfargument name="Subject" type="string" required="false" />
		<cfargument name="Message" type="string" required="false" />
		
			
		<cfset local.message = createObject("component","messages").init(argumentCollection=arguments) />
		
		<cfset local.message.setMessageID(0) />
		<cfset local.message.setCreatedBy(session.user.userID) />
		<cfset local.message.setImportant(0) />
		
		<cfif session.user.userID EQ arguments.SendToUserID>
			<!--- set the message type to 1 if sending to self --->
			<cfset local.message.setMessageTypeID(1) />
		<cfelse>
			<!--- message type 2 = sending to another individual (NOT SELF)--->
			<cfset local.message.setMessageTypeID(2) />
		</cfif>
		<cfset local.message.setCreatedOn(now()) />

		<cfset local.saveMessageBean = saveMessages(local.message) />
		
		<!---
		<cfdump var="#local#" abort="true" label="@@messageService - 89" />
		--->

		<!--- change return type ? --->
		<cfreturn local.saveMessageBean />
	</cffunction>

	<cffunction name="deleteMessage" access="public" output="false" returntype="boolean">
		<!--- <cfargument name="MessageID" type="numeric" required="true" /> --->
		<cfargument name="MessageID" type="any" required="true" />
		<cfargument name="MessageTypeID" type="numeric" required="true" />
		
		<cfset local.message = getmessages(messageID=arguments.messageID.messageID) />

		<cfset local.message.setMessageTypeID(arguments.MessageTypeID) />

		<cfset local.saveMessageBean = saveMessages(local.message) />
				
		<!--- change return type ? --->
		<cfreturn local.saveMessageBean />
	</cffunction>


	<cffunction name="onMissingMethod" access="public" output="false" >
		<cfargument name="missingMethodName" type="string" hint="Name of missing method" />
		<cfargument name="missingMethodArguments" type="any" hint="Arguments passed to the missing method, maybe a named arg set or a numerically indexed set" />

		<cfset var ret = ""/>
		<cfinvoke component="#variables.messagesGateway#" 
				  method="#arguments.missingMethodName#" 
				  argumentcollection="#arguments.missingMethodArguments#" 
				  returnvariable="ret"/>
		<cfreturn ret />
	</cffunction>
</cfcomponent>
