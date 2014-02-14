<!---
	COMPONENT: AssessmentPlanSupportingDocumentsListener
--->

<cfcomponent name="AssessmentPlanSupportingDocumentsListener" displayname="AssessmentPlanSupportingDocumentsListener" output="false" 
		extends="MachII.framework.Listener" 
		hint="AssessmentPlanSupportingDocumentsListener">
	
	<cffunction name="configure" access="public" output="false" 
			returntype="void" 
			hint="Configures this listener as part of the Mach-II framework">
		<!--- do nothing for now --->
		<cfset var sf = getProperty("ServiceFactory")>
		

		 <cfset variables.AssessmentPlanSupportingDocumentsService 	= sf.getBean('AssessmentPlanSupportingDocumentsService') /> 
	</cffunction>

	
	<cffunction name="getOutcomeSupportingDocs" access="public" output="false" 
			returntype="query" >
		<cfargument name="event" type="MachII.framework.Event" required="true" />
		
		<cfreturn variables.AssessmentPlanSupportingDocumentsService.getOutcomeSupportingDocs(outcomeID=arguments.event.getArg("outcomeID")) >
	</cffunction>


	<cffunction name="uploaddocument" access="public" output="false" returntype="void" hint="I save a positionAttachment object" >
		<cfargument name="event" type="MachII.framework.Event" required="true" />
		
		
		<cfset local.successEvent = 'outcomeDetails' />
		<!---
		<cfset local.failEvent    = arguments.event.getArg('failEvent','receiverPositions.listAttachments') />
		--->

		<cfset local.aErrors      = [] />
		<cfset local.errorMsg     = "" />
		
		<cfset local.outcomeID 	  = arguments.event.getArg('outcomeID') />
		<cfset local.name 		  = request.event.getArg('name') />
		<cfset local.doctype	  = arguments.event.getArg('doctype') />

		<cfset local.DocumentBean = variables.AssessmentPlanSupportingDocumentsService.createassessmentPlanSupportingDocuments(	recordID=0,
																																outcomeID		 = local.outcomeID,
																																filename    	 = local.name,
																																filenameuploaded = local.name,
																																fileuserID 		 = session.user.userID,
																																dateInserted     = now() ) />

		<!--- 
		<cfdump var="#request.event.getArgs()#" abort="false" label="@@uploaddocument_1" />
		<cfdump var="#local#" abort="true" label="@@uploaddocument_2" />
		--->	


		<!--- TO DO: Deterine where files should go when on server--->
		<!--- <cfset local.destination = "C:\IEAHome\ALC" /> --->
		<cfif local.doctype eq 'support'>
			<cfset local.destination  = application.SupportDocDirectory />
		<cfelse>
			<cfset local.destination  = application.ALCDocDirectory />
		</cfif> 


		 <cfif len(arguments.event.getArg('file'))> 
			
			<!--- set documentbean properties 
			<cfset local.DocumentBean.setFileName(arguments.event.getArg('file')) />
			<cfset local.DocumentBean.setFileNameUploaded(arguments.event.getArg('name')) />
			<cfset local.DocumentBean.setFileUserID(session.user.userID) />
			<cfset local.DocumentBean.setDateInserted(now()) />
			--->
			

			<!--- upload the file --->
			<cffile action		= "upload"
				    filefield	= "file"
				    destination	= "#local.destination#"
			        nameconflict= "makeunique"
				    result		= "local.res">
			

			<!--- save the bean / commit to the DB--->
			<cfset local.DocumentBeanSave = variables.AssessmentPlanSupportingDocumentsService.saveassessmentPlanSupportingDocuments(local.DocumentBean) />

			

			<!---
			<cfset session.layout_message = "Attachment Saved!" />

			<cfset redirectEvent(local.successEvent, {outcomeID 		= arguments.event.getArg('outcomeID'),
													  reportingUnitID	= arguments.event.getArg('reportingUnitID'),
													  planID 			= arguments.event.getArg('planID')}) />--->
						
		</cfif>

	</cffunction>

	<cffunction name="downloadDocument" access="public" output="false" returntype="void">
		<cfargument name="event" type="MachII.framework.Event" required="yes" displayname="Event" hint="I am the current event" />
		<cfscript>
			local.success 				= false;
			local.recordID			= arguments.event.getArg('recordID');
			local.outcomeID   		= arguments.event.getArg('outcomeID');
			local.reportingUnitID   = arguments.event.getArg('reportingUnitID');
			local.planID   			= arguments.event.getArg('planID');
			local.doctype			= arguments.event.getArg('doctype');

			//writeDump(var=#local#, abort="true", label="@@ALCDocumentsListener" );

			local.attachmentExists 			= variables.AssessmentPlanSupportingDocumentsService.getByAttributesQuery(recordID = local.recordID);
			
			if(local.attachmentExists.recordcount gt 0){
				local.success = variables.AssessmentPlanSupportingDocumentsService.downloadDocument(recordID = local.recordID, doctype=local.doctype);
				
			}
			
			if(local.attachmentExists.recordcount eq 0 || local.success eq false){
				session.layout_message = "We couldn't find a record of this document";
				redirectEvent( arguments.event.getArg('successEvent','outcomedetails'),{recordID = local.recordID, reportingUnitID = local.reportingUnitID });
			}
		</cfscript>
	</cffunction>

	



	<cffunction name="deleteDocument" access="public" output="false" returntype="void">
		<cfargument name="event" type="MachII.framework.Event" required="yes" displayname="Event" hint="I am the current event" />
		<cfscript>
			local.success 			= false;
			local.recordID			= arguments.event.getArg('recordID');
			local.outcomeID   		= arguments.event.getArg('outcomeID');
			local.reportingUnitID   = arguments.event.getArg('reportingUnitID');
			local.planID   			= arguments.event.getArg('planID');
			local.doctype			= arguments.event.getArg('doctype');
			
			//writeDump(var=#request.event.getArgs()#, abort="false", label="@@ALCDocumentsListener" );
			//writeDump(var=#local#, abort="true",  label="@@ALCDocumentsListener_2" );

			local.attachmentExists 	= variables.AssessmentPlanSupportingDocumentsService.getByAttributesQuery(recordID = local.recordID);
			
			if(local.attachmentExists.recordcount gt 0){
				local.success = variables.AssessmentPlanSupportingDocumentsService.deleteassessmentPlanSupportingDocuments(recordID = local.recordID , doctype = local.doctype);

				if (local.success) {
					redirectEvent( arguments.event.getArg('successEvent','outcomedetails'),{recordID = local.recordID ,
																							outcomeID = local.outcomeID,
																							reportingUnitID = local.reportingUnitID,
																							planID 	= local.planID  });
				}

			}
			
			if(local.attachmentExists.recordcount eq 0 || local.success eq false){
				session.layout_message = "We couldn't find a record of this document";
				redirectEvent( arguments.event.getArg('successEvent','outcomedetails'),{recordID = local.recordID ,
																							outcomeID = local.outcomeID,
																							reportingUnitID = local.reportingUnitID,
																							planID 	= local.planID  });
			}
		</cfscript>
	</cffunction>

</cfcomponent>