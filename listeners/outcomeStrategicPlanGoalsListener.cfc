<!---
	COMPONENT: outcomeStrategicPlanGoalsListener
--->

<cfcomponent name="outcomeStrategicPlanGoalsListener" displayname="outcomeStrategicPlanGoalsListener" output="false" 
		extends="MachII.framework.Listener" 
		hint="outcomeStrategicPlanGoalsListener">
	
	<cffunction name="configure" access="public" output="false" 
			returntype="void" 
			hint="Configures this listener as part of the Mach-II framework">
		<!--- do nothing for now --->
		<cfset var sf = getProperty("ServiceFactory")>
		

		<cfset variables.outcomeStrategicPlanGoalsService	= sf.getBean('outcomeStrategicPlanGoalsService') />
	</cffunction>

	<cffunction name="getSelectedGoals" access="public" output="false" returntype="query" >
		<cfargument name="event" type="MachII.framework.Event" required="true" />

			
		<cfreturn variables.outcomeStrategicPlanGoalsService.getGoalsByPlanID(planID = request.event.getArg('planID')) >
	</cffunction>
	
	

	<cffunction name="getGoalsByOutcomeID" access="public" output="false" returntype="query" >
		<cfargument name="event" type="MachII.framework.Event" required="true" />
			
		<cfreturn variables.outcomeStrategicPlanGoalsService.getGoalsByOutcomeID(outcomeID = request.event.getArg('outcomeID')) >
	</cffunction>


</cfcomponent>