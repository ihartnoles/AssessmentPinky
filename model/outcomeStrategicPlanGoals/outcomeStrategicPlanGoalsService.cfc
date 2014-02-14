
<cfcomponent name="outcomeStrategicPlanGoalsService" output="false">

	<cffunction name="init" access="public" output="false" returntype="outcomeStrategicPlanGoalsService">
		<cfargument name="outcomeStrategicPlanGoalsDAO" type="outcomeStrategicPlanGoalsDAO" required="true" />
		<cfargument name="outcomeStrategicPlanGoalsGateway" type="outcomeStrategicPlanGoalsGateway" required="true" />

		<cfset variables.outcomeStrategicPlanGoalsDAO = arguments.outcomeStrategicPlanGoalsDAO />
		<cfset variables.outcomeStrategicPlanGoalsGateway = arguments.outcomeStrategicPlanGoalsGateway />

		<cfreturn this/>
	</cffunction>

	<cffunction name="createoutcomeStrategicPlanGoals" access="public" output="false" returntype="outcomeStrategicPlanGoals">
		<cfargument name="ID" type="numeric" required="true" />
		<cfargument name="goalID" type="numeric" required="false" />
		<cfargument name="outcomeID" type="numeric" required="false" />
		<cfargument name="reportingUnitID" type="numeric" required="false" />
		<cfargument name="planID" type="numeric" required="false" />
		
			
		<cfset var outcomeStrategicPlanGoals = createObject("component","outcomeStrategicPlanGoals").init(argumentCollection=arguments) />
		<cfreturn outcomeStrategicPlanGoals />
	</cffunction>

	<cffunction name="getoutcomeStrategicPlanGoals" access="public" output="false" returntype="outcomeStrategicPlanGoals">
		<cfargument name="ID" type="numeric" required="true" />
		
		<cfset var outcomeStrategicPlanGoals = createoutcomeStrategicPlanGoals(argumentCollection=arguments) />
		<cfset variables.outcomeStrategicPlanGoalsDAO.read(outcomeStrategicPlanGoals) />
		<cfreturn outcomeStrategicPlanGoals />
	</cffunction>

	<cffunction name="getoutcomeStrategicPlanGoalss" access="public" output="false" returntype="array">
		<cfargument name="ID" type="numeric" required="false" />
		<cfargument name="goalID" type="numeric" required="false" />
		<cfargument name="outcomeID" type="numeric" required="false" />
		<cfargument name="reportingUnitID" type="numeric" required="false" />
		<cfargument name="planID" type="numeric" required="false" />
		
		<cfreturn variables.outcomeStrategicPlanGoalsGateway.getByAttributes(argumentCollection=arguments) />
	</cffunction>

	<cffunction name="saveoutcomeStrategicPlanGoals" access="public" output="false" returntype="boolean">
		<cfargument name="outcomeStrategicPlanGoals" type="outcomeStrategicPlanGoals" required="true" />

		<cfreturn variables.outcomeStrategicPlanGoalsDAO.save(outcomeStrategicPlanGoals) />
	</cffunction>

	<cffunction name="deleteoutcomeStrategicPlanGoals" access="public" output="false" returntype="boolean">
		<cfargument name="ID" type="numeric" required="true" />
		
		<cfset var outcomeStrategicPlanGoals = createoutcomeStrategicPlanGoals(argumentCollection=arguments) />
		<cfreturn variables.outcomeStrategicPlanGoalsDAO.delete(outcomeStrategicPlanGoals) />
	</cffunction>

	<cffunction name="onMissingMethod" access="public" output="false" >
		<cfargument name="missingMethodName" type="string" hint="Name of missing method" />
		<cfargument name="missingMethodArguments" type="any" hint="Arguments passed to the missing method, maybe a named arg set or a numerically indexed set" />

		<cfset var ret = ""/>
		<cfinvoke component="#variables.outcomeStrategicPlanGoalsGateway#" 
				  method="#arguments.missingMethodName#" 
				  argumentcollection="#arguments.missingMethodArguments#" 
				  returnvariable="ret"/>
		<cfreturn ret />
	</cffunction>
</cfcomponent>
