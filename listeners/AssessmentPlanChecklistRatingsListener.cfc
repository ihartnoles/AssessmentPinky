<!---
	COMPONENT: AssessmentPlanChecklistRatingsListener
--->

<cfcomponent name="AssessmentPlanChecklistRatingsListener" displayname="AssessmentPlanChecklistRatingsListener" output="false" 
		extends="MachII.framework.Listener" 
		hint="AssessmentPlanChecklistRatingsListener">
	
	<cffunction name="configure" access="public" output="false" 
			returntype="void" 
			hint="Configures this listener as part of the Mach-II framework">
		
		 <cfset var sf = getProperty("ServiceFactory")>
	
		 <cfset variables.AssessmentPlanChecklistRatingsService = sf.getBean('AssessmentPlanChecklistRatingsService') /> 

	</cffunction>

	<cffunction name="getRatings" access="public" output="false" returntype="query" >
		<cfargument name="event" type="MachII.framework.Event" required="true" />


		
		<cfreturn variables.AssessmentPlanChecklistRatingsService.getByAttributesQuery(PlanID 			= request.event.getArg('PlanID'),
																			  		   ReportingUnitID 	= request.event.getArg('ReportingUnitID')) />

	</cffunction>


	<cffunction name="saveRatings" access="public" output="false" returntype="boolean" >
		<cfargument name="event" type="MachII.framework.Event" required="true" />

		<!---
		<cfargument name="ChecklistRatingID" type="numeric" required="false" />
		<cfargument name="PlanID" type="numeric" required="false" />
		<cfargument name="ReportingUnitID" type="numeric" required="false" />
		<cfargument name="ChecklistTypeID" type="numeric" required="false" />
		<cfargument name="Rating" type="string" required="false" />
		--->

		<!--- 
		<cfdump var="#request.event.getArgs()#" abort="true" label="@@RatingsListener" />
		--->

		<cfreturn variables.AssessmentPlanChecklistRatingsService.saveRatings(PlanID 			= request.event.getArg('PlanID'),
																			  ReportingUnitID 	= request.event.getArg('ReportingUnitID'),
																			  ChecklistTypeID 	= request.event.getArg('ChecklistTypeID'),
																			  Rating 			= request.event.getArg('Rating')) />
	</cffunction>

	    
</cfcomponent>