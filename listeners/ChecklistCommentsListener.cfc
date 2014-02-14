<!---
	COMPONENT: ChecklistCommentsListener
--->

<cfcomponent name="ChecklistCommentsListener" displayname="ChecklistCommentsListener" output="false" 
		extends="MachII.framework.Listener" 
		hint="ChecklistCommentsListener">
	
	<cffunction name="configure" access="public" output="false" 
			returntype="void" 
			hint="Configures this listener as part of the Mach-II framework">
		<!--- do nothing for now --->
		<cfset var sf = getProperty("ServiceFactory")>
		

		 <cfset variables.ChecklistCommentsService 	= sf.getBean('ChecklistCommentsService') /> 
	</cffunction>

	<cffunction name="saveComments" access="public" output="false" 
			returntype="any" >
		<cfargument name="event" type="MachII.framework.Event" required="true" />

		
		
		<cfset local.commentBean = variables.ChecklistCommentsService.createChecklistComments(ChecklistCommentID = 0,
																							  planID 		  = request.event.getArg('planID'),
																							  reportingUnitID = request.event.getArg('reportingUnitID'),
																							  checklistTypeID = request.event.getArg('checklistTypeID'),
																							  comment 		  = request.event.getArg('comment'),
																							  created_on      = dateformat(now(),'mm/dd/yyyy'),
																							  created_by      = request.event.getArg('created_by')
																							  )/>

	<!--- 
		<cfdump var="#local.commentBean#" abort="false" label="@@ChecklistCommentsService_33" output="c:\commentBean.html" format="html" />
		<cfdump var="#request.event.getArgs()#" abort="true" label="@@ChecklistCommentsService_35" output="c:\checklistcomments.html" format="html"/>
	--->
		
			<cfreturn variables.ChecklistCommentsService.saveChecklistComments(local.commentBean) />
		
	</cffunction>

	
	
	<cffunction name="getChecklistComments" access="public" output="false" 
			returntype="query" >
		<cfargument name="event" type="MachII.framework.Event" required="true" />
		
		<cfreturn variables.ChecklistCommentsService.getByAttributesQuery(planID 		  = request.event.getArg('planID'),
																							  reportingUnitID = request.event.getArg('reportingUnitID'),
																							  checklistTypeID = request.event.getArg('checklistTypeID')) />
	</cffunction>
	
	<cffunction name="getChecklistCommentDetails" access="public" output="false" 
			returntype="query" >
		<cfargument name="event" type="MachII.framework.Event" required="true" />
		
		<cfreturn variables.ChecklistCommentsService.getChecklistCommentDetails(planID 		  = request.event.getArg('planID'),
																							  reportingUnitID = request.event.getArg('reportingUnitID'),
																							  checklistTypeID = request.event.getArg('checklistTypeID')) />
	</cffunction>
    
</cfcomponent>