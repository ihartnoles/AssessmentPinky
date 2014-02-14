<!---
	COMPONENT: AssessmentePlanListener
--->

<cfcomponent name="AssessmentPlanListener" displayname="AssessmentPlanListener" output="false" 
		extends="MachII.framework.Listener" 
		hint="AssessmentPlanListener">
	
	<cffunction name="configure" access="public" output="false" 
			returntype="void" 
			hint="Configures this listener as part of the Mach-II framework">
		<!--- do nothing for now --->
		<cfset var sf = getProperty("ServiceFactory")>
		

		 <cfset variables.assessmentplansService 					= sf.getBean('assessmentplansService') /> 
		 <cfset variables.assessmentPlanTypesService 				= sf.getBean('assessmentPlanTypesService') /> 
		 <cfset variables.assessmentPlanChecklistRatingsService 	= sf.getBean('assessmentPlanChecklistRatingsService') /> 
	</cffunction>

	<cffunction name="getAssessmentPlanPeriodsQuery" access="public" output="false" 
			returntype="query" >
		<cfargument name="event" type="MachII.framework.Event" required="true" />
		<cfreturn variables.assessmentplansService.getAssessmentPlanPeriodsQuery(ReportingUnitID=arguments.event.getArg("ReportingUnitID")) >
	</cffunction>

	<cffunction name="getAssessmentPlanDetails" access="public" output="false" 
			returntype="query" >
		<cfargument name="event" type="MachII.framework.Event" required="true" />
		<cfreturn variables.assessmentplansService.getAssessmentPlanDetails(ReportingUnitID=arguments.event.getArg("ReportingUnitID"),
																			PlanID=arguments.event.getArg("PlanID")) >
	</cffunction>


	<cffunction name="getPlanGrid" access="public" output="false" 
			returntype="query" >
		<cfargument name="event" type="MachII.framework.Event" required="true" />

		<!---
		<cfset local.planStatus = len(arguments.event.getArg('planStatus')) ? arguments.event.getArg('planStatus') : '' />

		
		<cfdump var="#local#" abort="true" label="@@AssPlanListener - 42" />
		--->

		<cfreturn variables.assessmentplansService.getPlanGrid(SuperDivisionID	  =arguments.event.getArg("SuperDivisionID"),
															   DivisionID  		  =arguments.event.getArg("DivisionID"),
															   departmentID 	  =arguments.event.getArg("departmentID"),
															   planperiod   	  =arguments.event.getArg("planperiod"),
															   PlanType 		  =arguments.event.getArg("plantype"),
															   programDegreeLevel =arguments.event.getArg("programdegreelevel"),
															   planStatus		  =arguments.event.getArg('planStatus')) />
	</cffunction>

	

	<cffunction name="getPlanTypes" access="public" output="false" 
			returntype="query" >
		<cfargument name="event" type="MachII.framework.Event" required="true" />
		<cfreturn variables.assessmentPlanTypesService.getPlanTypes()>
	</cffunction>

	

	<cffunction name="getPlanPeriods" access="public" output="false" 
			returntype="query" >
		<cfargument name="event" type="MachII.framework.Event" required="true" />
		<cfreturn variables.assessmentplansService.getPlanPeriods()>
	</cffunction>

	
	
	<cffunction name="createPlan" access="public" output="false" 
			returntype="void" >
		<cfargument name="event" type="MachII.framework.Event" required="true" />

		<!--- check if a review for this reportingunit & period already exists --->
		<cfset local.planExists = variables.assessmentplansService.getByAttributesQuery(reportingUnitID = request.event.getArg('reportingUnitID'),
																						PlanPeriod 		=request.event.getArg("PlanPeriod"),
																			   			PlanType 		=request.event.getArg("PlanType")
																						) />

		<!---
		<cfdump var="#request.event.getArgs()#" abort="false" label="local.planexists - 82" />
		<cfdump var="#local.planExists#" abort="true" label="local.planexists - 83" />
		--->
		
		<cfif local.planExists.recordCount gt 0>
			<!--- check for existing plan period and stop them and redirect them to event=addPlan&reportingUnitID=136001&ProgramID=136001&DeptID=1360&DivisionID=13 --->
			<!--- set the error message --->
			<cfset session.layout_message = "Sorry! A plan for the selected period that already exists!" />
			<!--- redirect them --->
			<cfset redirectEvent("addPlan", arguments.event.getArgs()) />

		<cfelse>
			<cfset local.result = variables.assessmentplansService.createPlan( ReportingUnitID		=arguments.event.getArg("ReportingUnitID"),
																			   PlanPeriod 			=arguments.event.getArg("PlanPeriod"),
																			   PlanType 			=arguments.event.getArg("PlanType"),
																			   PlanInitialReporter 	=arguments.event.getArg("PlanInitialReporter")) />



				<cfif isNumeric(local.result)>
					
					<cfset private.resultArgs = {layout_message="New logo uploaded"} />

					<!--- populate plan checklist items for the new planID --->
					<cfloop from="1" to="11" index="i">
						<cfset local.checklistBean = variables.assessmentPlanChecklistRatingsService.createAssessmentPlanChecklistRatings(ChecklistRatingID = 0,
																																		  ReportingUnitID	= arguments.event.getArg("ReportingUnitID"),
																																		  ChecklistTypeID 	= i,
																																		  PlanID 			= local.result	) />

						<!--- <cfdump var="#local.checklistBean#" abort="true" label="@@AssessmentPlanListener_82" /> --->

						<cfset local.saveBean =  variables.assessmentPlanChecklistRatingsService.saveAssessmentPlanChecklistRatings(local.checklistBean) />
					</cfloop>

					<cfset redirectEvent("showPlan", {planID = local.result, ReportingUnitID = arguments.event.getArg("ReportingUnitID")  }) />
				<cfelse>
					<cfset announceEvent("addPlan",arguments.event.getArgs()) />
				</cfif>
		</cfif>
	</cffunction>

	<cffunction name="getLOPlanTotals" access="public" output="false" 
			returntype="query" >
		<cfargument name="event" type="MachII.framework.Event" required="true" />
		<cfreturn variables.assessmentplansService.getLOPlanTotals(PlanPeriod ='2013-2014')>
	</cffunction>

	<cffunction name="getResearchPlanTotals" access="public" output="false" 
			returntype="query" >
		<cfargument name="event" type="MachII.framework.Event" required="true" />
		<cfreturn variables.assessmentplansService.getResearchPlanTotals(PlanPeriod ='2013-2014')>
	</cffunction>

	<cffunction name="getAdminPlanTotals" access="public" output="false" 
			returntype="query" >
		<cfargument name="event" type="MachII.framework.Event" required="true" />
		<cfreturn variables.assessmentplansService.getAdminPlanTotals(PlanPeriod ='2013-2014')>
	</cffunction>

	<cffunction name="getServicePlanTotals" access="public" output="false" 
			returntype="query" >
		<cfargument name="event" type="MachII.framework.Event" required="true" />
		<cfreturn variables.assessmentplansService.getServicePlanTotals(PlanPeriod ='2013-2014')>
	</cffunction>

	
	<cffunction name="getPlanStatusByPlanID" access="public" output="false" 
			returntype="query" >
		<cfargument name="event" type="MachII.framework.Event" required="true" />
		<cfreturn variables.assessmentplansService.getPlanStatusByPlanID(PlanID = arguments.event.getArg("PlanID"))>
	</cffunction>

	<cffunction name="saveStatus" access="public" output="false" 
			returntype="void" >
		<cfargument name="event" type="MachII.framework.Event" required="true" />

		<!---
		<cfdump var="#arguments.event.getArgs()#" abort="true" label="@AssessmentPlanListener - 142" />
		--->

		<cfscript>
			local.success 			= false;
			local.deptID			= arguments.event.getArg('deptID');
			local.divisionID   		= arguments.event.getArg('divisionID');
			local.reportingUnitID   = arguments.event.getArg('reportingUnitID');
			local.programID   		= arguments.event.getArg('programID');
			local.planID   			= arguments.event.getArg('planID');
			local.programname   	= arguments.event.getArg('programname');

			local.success = variables.assessmentplansService.saveStatus(PlanID = arguments.event.getArg("PlanID"), planstatus = arguments.event.getArg("planstatus")) ;

			if (local.success) {
			    request.event.setArg('layout_message','Status Updated!');
				redirectEvent( arguments.event.getArg('successEvent','ShowAssessmentPlanList'),{deptID 			= local.deptID ,
																								DivisionID 		= local.divisionID,
																								reportingUnitID = local.reportingUnitID,
																								programID 		= local.programID,
																								programname     = local.programname });
			}
		</cfscript>
		
		<cfreturn >
	</cffunction>


	<!---
	<cffunction name="getUserBean" access="public" output="false" 
			returntype="struct" >
		<cfargument name="event" type="MachII.framework.Event" required="true" />
		<cfreturn variables.reportingUnitsService.getusers(userid=session.userid) >
	</cffunction>
	
	<cffunction name="validateUser" access="public" output="false" 
			returntype="query" >
		<cfargument name="event" type="MachII.framework.Event" required="true" />
		<cfreturn variables.reportingUnitsService.validateUser(argumentCollection=arguments) >
	</cffunction>

	<cffunction name="SetUserRole" access="public" output="false" 
			returntype="boolean" >
		<cfargument name="event" type="MachII.framework.Event" required="true" />

		<!--- 
		<cfdump var="#request.event.getArgs()#" abort="false" label="getArgs@UserListener" />
		<cfdump var="#session#" abort="false" label="session@UserListener" />
		<cfdump var="#arguments#" abort="true" label="arguments@UserListener" />
         --->

		<cfreturn variables.reportingUnitsService.SetUserRole(userid=session.userid, roleid=request.event.getArg('role')) >
	</cffunction>

	<cffunction name="showUserDashboard" access="public" output="false" 
			returntype="query" >
		<cfargument name="event" type="MachII.framework.Event" required="true" />
		<cfreturn variables.reportingUnitService.showUserDashboard(argumentCollection=arguments) >
	</cffunction>
    --->
    
</cfcomponent>