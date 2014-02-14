<!---
	COMPONENT: AssessmentPlanWorkflowListener
--->

<cfcomponent name="AssessmentPlanWorkflowListener" displayname="AssessmentPlanWorkflowListener" output="false" 
		extends="MachII.framework.Listener" 
		hint="AssessmentPlanWorkflowListener">
	
	<cffunction name="configure" access="public" output="false" 
			returntype="void" 
			hint="Configures this listener as part of the Mach-II framework">
		<!--- do nothing for now --->
		<cfset var sf = getProperty("ServiceFactory")>
		

		 <cfset variables.assessmentPlanWorkflowService 	= sf.getBean('assessmentPlanWorkflowService') /> 
	</cffunction>

	<cffunction name="getPlanStatuses" access="public" output="false" 
			returntype="query" >
		<cfargument name="event" type="MachII.framework.Event" required="true" />
		<cfreturn variables.assessmentPlanWorkflowService.getPlanStatuses() >
	</cffunction>
    
    <cffunction name="getReportGrid" access="public" output="false" 
			returntype="query" >
		<cfargument name="event" type="MachII.framework.Event" required="true" />
		<cfreturn variables.assessmentPlanWorkflowService.getReportGrid(SuperDivisionID	  =arguments.event.getArg("SuperDivisionID"),
																   DivisionID  		  =arguments.event.getArg("DivisionID"),
																   departmentID 	  =arguments.event.getArg("departmentID"),
																   planperiod   	  =arguments.event.getArg("planperiod"),
																   PlanType 		  =arguments.event.getArg("plantype"),
																   programDegreeLevel =arguments.event.getArg("programdegreelevel"),
																   PlanStatus 		  =arguments.event.getArg("PlanStatus")) >
	</cffunction>
	
</cfcomponent>