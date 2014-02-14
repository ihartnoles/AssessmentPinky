<!---
	COMPONENT: messageListener
--->

<cfcomponent name="messageListener" displayname="messageListener" output="false" 
		extends="MachII.framework.Listener" 
		hint="messageListener">
	
	<cffunction name="configure" access="public" output="false" 
			returntype="void" 
			hint="Configures this listener as part of the Mach-II framework">
		<!--- do nothing for now --->
		<cfset var sf = getProperty("ServiceFactory")>
		
         <cfset variables.assessmentplansService 	= sf.getBean('assessmentplansService') /> 
		 <cfset variables.messagesService 			= sf.getBean('messagesService') /> 
		 <cfset variables.usersService 				= sf.getBean('usersService') /> 
	</cffunction>


	<cffunction name="sendMessage" access="public" output="false" 
			returntype="numeric" >
		<cfargument name="event" type="MachII.framework.Event" required="true" />
		
		<!--- save the message here --->
		<cfset local.MessageID = variables.messagesService.sendMessage(sendToUserID = request.event.getArg('sendToUserID'),
																	Subject		 = request.event.getArg('Subject'),
																	Message 	 = request.event.getArg('CK')) />

		<!--- look up sendToUserID email and the createdBy email --->
		<cfset local.getMessage = variables.messagesService.getmessages(local.MessageID) />
		
		<!--- get recipient email--->
		<cfset local.recipientEmail = variables.usersService.getusers(request.event.getArg('sendToUserID')).getUserEmail() />

		<!--- get sender email --->
		<cfset local.senderEmail = variables.usersService.getusers(local.getMessage.getCreatedBy()).getUserEmail() />

		<!---
		<cfdump var="#local#" abort="true" label="@@messageListener" />
		--->

		<!--- physically mail out the message --->
		<cfmail to="#local.recipientEmail#"
				from="#local.senderEmail#"
				subject="#request.event.getArg('Subject')#"
				type="html">
				<html>
					<body>
						<cfoutput>
							#request.event.getArg('CK')#
						</cfoutput>
					</body>
				</html>
				</cfmail>

		<!--- If the message was successfully saved AND sent let's return a message --->
		<cfif isNumeric(MessageID)>
			<cfset request.event.setArg('layout_message','Message Sent!') />
		<cfelse>
			<cfset request.event.setArg('layout_message','Sorry there was a problem sending your message') />
		</cfif>
		

		<cfreturn MessageID />
	</cffunction>



	<cffunction name="sendmessagewithstatusupdate" access="public" output="false" 
			returntype="void" >
		<cfargument name="event" type="MachII.framework.Event" required="true" />
		

		<!--- if this argument is present we will need to update the status of the  --->
		<cfif request.event.isArgDefined('planstatus') >
			<cfscript>
				local.success 			= false;
				local.deptID			= request.event.getArg('deptID');
				local.divisionID   		= request.event.getArg('divisionID');
				local.reportingUnitID   = request.event.getArg('reportingUnitID');
				local.programID   		= request.event.getArg('programID');
				local.planID   			= request.event.getArg('planID');
				

				local.success = variables.assessmentplansService.saveStatus(PlanID = request.event.getArg("PlanID"), planstatus = request.event.getArg("planstatus")) ;
				
			</cfscript>
		</cfif>

		<!--- save the message here --->
		<cfset local.MessageID = variables.messagesService.sendMessage(sendToUserID = arguments.event.getArg('sendToUserID'),
																	Subject		 = arguments.event.getArg('Subject'),
																	Message 	 = arguments.event.getArg('CK')) />

		<!--- look up sendToUserID email and the createdBy email --->
		<cfset local.getMessage = variables.messagesService.getmessages(local.MessageID) />
		
		<!--- get recipient email--->
		<cfset local.recipientEmail = variables.usersService.getusers(arguments.event.getArg('sendToUserID')).getUserEmail() />
		
		<!---
		<cfdump var="#local#" abort="true" label="@@messageListener - 103" />
		 --->

		<!--- get sender email --->
		<cfset local.senderEmail = variables.usersService.getusers(session.user.userid).getUserEmail() />

		

		<!--- physically mail out the message --->
		<cfmail to="#local.recipientEmail#"
				from="#local.senderEmail#"
				subject="#request.event.getArg('Subject')#"
				type="html">
				<html>
					<body>
						<cfoutput>
							#request.event.getArg('CK')#
						</cfoutput>
					</body>
				</html>
		</cfmail>

		<!--- If the message was successfully saved AND sent let's return a message --->
		<cfif isNumeric(MessageID)>
			<cfset session.layout_message = 'Status Updated!' />
		<cfelse>
			<cfset session.layout_message = 'Sorry there was a problem updating the plan status' />
		</cfif>
		
		<cfset redirectEvent("showreportingunits") />

	</cffunction>

	<cffunction name="sendLogin" access="public" output="false" 
			returntype="string" >
		<cfargument name="event" type="MachII.framework.Event" required="true" />
		
		<!--- validate the email address entered 'username' --->
		<cfset local.qExists = variables.usersService.getuserbyemail(UserEmail=trim(request.event.getArg('username'))) />
		
		<cfif local.qExists.recordcount>
			<!--- pull the email address from the query --->
			<cfset local.emailAddress = local.qExists.UserEmail />

		 	<!---
			<cfdump var="#local#" abort="true" label="@@messageListener" />
			--->

			<!--- physically mail out the message --->
			<cfmail to="#local.emailAddress#"
					from="admin@fau.edu"
					subject="FAU Assessment Login Info"
					type="text/html">
					Dear #local.qExists.UserFname#,<br><br>

					Your login credentials for the FAU Assessment Database are below:<br>

					<ul>
						<li>Username: #local.qExists.Username#</li>
						<li>Password: #local.qExists.userpassword#</li>
					</ul>

			</cfmail>

			<cfset local.layout_message = 'Login information sent! Please check your email for details' />
		<cfelse>
			<cfset local.layout_message = 'Sorry your email address was not found!'/>
		</cfif>

		

		<!--- If the message was successfully saved AND sent let's return a message 
		<cfif isNumeric(MessageID)>
			<cfset request.event.setArg('layout_message','Message Sent!') />
		
		</cfif>
		--->
		<cfreturn local.layout_message />
	</cffunction>


	<cffunction name="getInboxMessages" access="public" output="false" 
			returntype="query" >
		<cfargument name="event" type="MachII.framework.Event" required="true" />
		
		<!---
		<cfdump var="#arguments#" abort="true" label="arguments - messageListener - 188" />
		--->
		
		<cfreturn variables.messagesService.getInboxMessages(SendToUserID	= session.user.userID,
														     MessageTypeID	= 1) />
	</cffunction>


	<cffunction name="getSentMessages" access="public" output="false" 
			returntype="query" >
		<cfargument name="event" type="MachII.framework.Event" required="true" />
		
		<cfreturn variables.messagesService.getSentMessages(createdby 		= session.user.userID,
															MessageTypeID	= 2) />
	</cffunction>

	<cffunction name="deletemessage" access="public" output="false" 
			returntype="boolean" >
		<cfargument name="event" type="MachII.framework.Event" required="true" />
		
		<cfreturn variables.messagesService.deletemessage(MessageID	= request.event.getArgs('MessageID'),
														 MessageTypeID	= 3) />
	</cffunction>

	<cffunction name="viewmessage" access="public" output="false" 
			returntype="query" >
		<cfargument name="event" type="MachII.framework.Event" required="true" />
		
		<cfreturn variables.messagesService.viewmessage(MessageID	= request.event.getArgs('MessageID')) />
	</cffunction>

	
	<cffunction name="getDeletedMessages" access="public" output="false" 
			returntype="query" >
		<cfargument name="event" type="MachII.framework.Event" required="true" />
		
		<cfreturn variables.messagesService.getDeletedMessages(SendToUserID	= session.user.userID,
														       MessageTypeID	= 3) />
	</cffunction>
	<!---
	<cffunction name="getDepartments" access="public" output="false" 
			returntype="query" >
		<cfargument name="event" type="MachII.framework.Event" required="true" />
		
		<cfreturn variables.messagesService.getDepartments(divisionid = request.event.getArg('divisionid')) />
	</cffunction>
	--->

</cfcomponent>