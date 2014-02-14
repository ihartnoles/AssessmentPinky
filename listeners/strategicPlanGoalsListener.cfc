<!---
	COMPONENT: strategicPlanGoalsListener
--->

<cfcomponent name="strategicPlanGoalsListener" displayname="strategicPlanGoalsListener" output="false" 
		extends="MachII.framework.Listener" 
		hint="strategicPlanGoalsListener">
	
	<cffunction name="configure" access="public" output="false" 
			returntype="void" 
			hint="Configures this listener as part of the Mach-II framework">
		<!--- do nothing for now --->
		<cfset var sf = getProperty("ServiceFactory")>
		

		 <cfset variables.strategicPlanGoalsService 		= sf.getBean('strategicPlanGoalsService') /> 
		 <cfset variables.outcomeStrategicPlanGoalsService	= sf.getBean('outcomeStrategicPlanGoalsService') />
	</cffunction>

	<cffunction name="getGoalList" access="public" output="false" 
			returntype="query" >
		<cfargument name="event" type="MachII.framework.Event" required="true" />

			
		<cfreturn variables.strategicPlanGoalsService.getGoalsListQuery() >
	</cffunction>
	

	<cffunction name="saveGoals" access="public" output="false" 
			returntype="void" >
		<cfargument name="event" type="MachII.framework.Event" required="true" />
		
		<!--- 	
		<cfdump var="#arguments#" abort="false" label="arguments @@strategicPlanGoalsListener" />
		<cfdump var="#request.event.getArgs()#" abort="true" label="@@strategicPlanGoalsListener" />
		--->

		<!--- 1) Delete all existing for the outcomeID; delete * from  ??? where outcomeID = request.event.getArg('outcomeID') --->
		<cfset local.deleteExisting = variables.strategicPlanGoalsService.deleteGoals(outcomeID = request.event.getArg('outcomeID')) />
		

		<!--- 2) Loop over  goalID --->
		<cfloop list="#request.event.getArg('goalID')#" index="idx">
			<!--- 3) Save the categories one by one --->
			<cfset local.saveALCCategories = variables.outcomeStrategicPlanGoalsService.saveGoals(outcomeID 	 	= request.event.getArg('outcomeID'),
																								   goalID 		 	= idx,
																								   reportingUnitID 	= request.event.getArg('reportingUnitID'), 
																								   planID			= request.event.getArg('planID')) />
		</cfloop>		
		
	</cffunction>
	
</cfcomponent>