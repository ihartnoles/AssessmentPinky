<!---
	COMPONENT: AssessmentPlanChecklistTypeListener
--->

<cfcomponent name="AssessmentPlanChecklistTypeListener" displayname="AssessmentPlanChecklistTypeListener" output="false" 
		extends="MachII.framework.Listener" 
		hint="AssessmentPlanChecklistTypeListener">
	
	<cffunction name="configure" access="public" output="false" 
			returntype="void" 
			hint="Configures this listener as part of the Mach-II framework">
		
		 <cfset var sf = getProperty("ServiceFactory")>
	
		 <cfset variables.AssessmentPlanChecklistTypeService = sf.getBean('AssessmentPlanChecklistTypeService') /> 

	</cffunction>

	
	<cffunction name="getChecklistTypes" access="public" output="false" 
			returntype="query" >
		<cfargument name="event" type="MachII.framework.Event" required="true" />
		<cfreturn variables.AssessmentPlanChecklistTypeService.getByAttributesQuery() >
	</cffunction>


   <!---

	<cffunction name="getAllAssessmentPlanChecklistTypees" access="public" output="false" 
			returntype="query" >
		<cfargument name="event" type="MachII.framework.Event" required="true" />
		<cfreturn  variables.AssessmentPlanChecklistTypeService.getAllAssessmentPlanChecklistTypees() >
	</cffunction>
	 --->
	    
</cfcomponent>