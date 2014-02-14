
<cfcomponent name="strategicPlanGoalsService" output="false">

	<cffunction name="init" access="public" output="false" returntype="strategicPlanGoalsService">
		<cfargument name="strategicPlanGoalsDAO" type="strategicPlanGoalsDAO" required="true" />
		<cfargument name="strategicPlanGoalsGateway" type="strategicPlanGoalsGateway" required="true" />

		<cfset variables.strategicPlanGoalsDAO = arguments.strategicPlanGoalsDAO />
		<cfset variables.strategicPlanGoalsGateway = arguments.strategicPlanGoalsGateway />

		<cfreturn this/>
	</cffunction>

	<cffunction name="createstrategicPlanGoals" access="public" output="false" returntype="strategicPlanGoals">
		<cfargument name="ID" type="numeric" required="true" />
		<cfargument name="objective" type="string" required="false" />
		<cfargument name="goal" type="string" required="false" />
		
			
		<cfset var strategicPlanGoals = createObject("component","strategicPlanGoals").init(argumentCollection=arguments) />
		<cfreturn strategicPlanGoals />
	</cffunction>

	<cffunction name="getstrategicPlanGoals" access="public" output="false" returntype="strategicPlanGoals">
		<cfargument name="ID" type="numeric" required="true" />
		
		<cfset var strategicPlanGoals = createstrategicPlanGoals(argumentCollection=arguments) />
		<cfset variables.strategicPlanGoalsDAO.read(strategicPlanGoals) />
		<cfreturn strategicPlanGoals />
	</cffunction>

	<cffunction name="getstrategicPlanGoalss" access="public" output="false" returntype="array">
		<cfargument name="ID" type="numeric" required="false" />
		<cfargument name="objective" type="string" required="false" />
		<cfargument name="goal" type="string" required="false" />
		
		<cfreturn variables.strategicPlanGoalsGateway.getByAttributes(argumentCollection=arguments) />
	</cffunction>

	<cffunction name="savestrategicPlanGoals" access="public" output="false" returntype="boolean">
		<cfargument name="strategicPlanGoals" type="strategicPlanGoals" required="true" />

		<cfreturn variables.strategicPlanGoalsDAO.save(strategicPlanGoals) />
	</cffunction>

	<cffunction name="deletestrategicPlanGoals" access="public" output="false" returntype="boolean">
		<cfargument name="ID" type="numeric" required="true" />
		
		<cfset var strategicPlanGoals = createstrategicPlanGoals(argumentCollection=arguments) />
		<cfreturn variables.strategicPlanGoalsDAO.delete(strategicPlanGoals) />
	</cffunction>

	<cffunction name="onMissingMethod" access="public" output="false" >
		<cfargument name="missingMethodName" type="string" hint="Name of missing method" />
		<cfargument name="missingMethodArguments" type="any" hint="Arguments passed to the missing method, maybe a named arg set or a numerically indexed set" />

		<cfset var ret = ""/>
		<cfinvoke component="#variables.strategicPlanGoalsGateway#" 
				  method="#arguments.missingMethodName#" 
				  argumentcollection="#arguments.missingMethodArguments#" 
				  returnvariable="ret"/>
		<cfreturn ret />
	</cffunction>
</cfcomponent>
