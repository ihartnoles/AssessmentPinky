
<cfcomponent name="assessmentPlanOutcomesService" output="false">

	<cffunction name="init" access="public" output="false" returntype="assessmentPlanOutcomesService">
		<cfargument name="assessmentPlanOutcomesDAO" type="assessmentPlanOutcomesDAO" required="true" />
		<cfargument name="assessmentPlanOutcomesGateway" type="assessmentPlanOutcomesGateway" required="true" />

		<cfset variables.assessmentPlanOutcomesDAO = arguments.assessmentPlanOutcomesDAO />
		<cfset variables.assessmentPlanOutcomesGateway = arguments.assessmentPlanOutcomesGateway />

		<cfreturn this/>
	</cffunction>

	<cffunction name="createassessmentPlanOutcomes" access="public" output="false" returntype="assessmentPlanOutcomes">
		<cfargument name="OutcomeID" type="numeric" required="true" />
		<cfargument name="PlanID" type="numeric" required="false" />
		<cfargument name="OutcomeOrder" type="numeric" required="false" />
		<cfargument name="OutcomeDescription" type="string" required="false" />
		<cfargument name="OutcomeStrategy" type="string" required="false" />
		<cfargument name="OutcomeMethod" type="string" required="false" />
		<cfargument name="OutcomeCriterion" type="string" required="false" />
		<cfargument name="OutcomeResults" type="string" required="false" />
		<cfargument name="OutcomePlanningImprovement" type="string" required="false" />
		<cfargument name="OutcomeResources" type="string" required="false" />
		<cfargument name="OutcomeCreateDate" type="date" required="false" />
		<cfargument name="OutcomePlanLastChangeDate" type="date" required="false" />
		<cfargument name="QEP_URI_related" type="numeric" required="false" />
		<cfargument name="IFP_related" type="numeric" required="false" />
		<cfargument name="Online" type="numeric" required="false" />
		
			
		<cfset var assessmentPlanOutcomes = createObject("component","assessmentPlanOutcomes").init(argumentCollection=arguments) />
		<cfreturn assessmentPlanOutcomes />
	</cffunction>

	<cffunction name="getassessmentPlanOutcomes" access="public" output="false" returntype="assessmentPlanOutcomes">
		<cfargument name="OutcomeID" type="numeric" required="true" />
		
		<cfset var assessmentPlanOutcomes = createassessmentPlanOutcomes(argumentCollection=arguments) />
		<cfset variables.assessmentPlanOutcomesDAO.read(assessmentPlanOutcomes) />
		<cfreturn assessmentPlanOutcomes />
	</cffunction>

	<cffunction name="getassessmentPlanOutcomess" access="public" output="false" returntype="array">
		<cfargument name="OutcomeID" type="numeric" required="false" />
		<cfargument name="PlanID" type="numeric" required="false" />
		<cfargument name="OutcomeOrder" type="numeric" required="false" />
		<cfargument name="OutcomeDescription" type="string" required="false" />
		<cfargument name="OutcomeStrategy" type="string" required="false" />
		<cfargument name="OutcomeMethod" type="string" required="false" />
		<cfargument name="OutcomeCriterion" type="string" required="false" />
		<cfargument name="OutcomeResults" type="string" required="false" />
		<cfargument name="OutcomePlanningImprovement" type="string" required="false" />
		<cfargument name="OutcomeResources" type="string" required="false" />
		<cfargument name="OutcomeCreateDate" type="date" required="false" />
		<cfargument name="OutcomePlanLastChangeDate" type="date" required="false" />
		<cfargument name="QEP_URI_related" type="numeric" required="false" />
		<cfargument name="IFP_related" type="numeric" required="false" />
		<cfargument name="Online" type="numeric" required="false" />
		
		<cfreturn variables.assessmentPlanOutcomesGateway.getByAttributes(argumentCollection=arguments) />
	</cffunction>

	<cffunction name="saveassessmentPlanOutcomes" access="public" output="false" returntype="boolean">
		<cfargument name="assessmentPlanOutcomes" type="assessmentPlanOutcomes" required="true" />

		<cfreturn variables.assessmentPlanOutcomesDAO.save(assessmentPlanOutcomes) />
	</cffunction>

	<cffunction name="deleteassessmentPlanOutcomes" access="public" output="false" returntype="boolean">
		<cfargument name="assessmentPlanOutcomes" type="assessmentPlanOutcomes" required="true" />
		
		<!--- <cfset var assessmentPlanOutcomes = createassessmentPlanOutcomes(argumentCollection=arguments) /> --->

		<cfreturn variables.assessmentPlanOutcomesDAO.delete(arguments.assessmentPlanOutcomes) />
	</cffunction>

	<cffunction name="onMissingMethod" access="public" output="false" >
		<cfargument name="missingMethodName" type="string" hint="Name of missing method" />
		<cfargument name="missingMethodArguments" type="any" hint="Arguments passed to the missing method, maybe a named arg set or a numerically indexed set" />

		<cfset var ret = ""/>
		<cfinvoke component="#variables.assessmentPlanOutcomesGateway#" 
				  method="#arguments.missingMethodName#" 
				  argumentcollection="#arguments.missingMethodArguments#" 
				  returnvariable="ret"/>
		<cfreturn ret />
	</cffunction>
</cfcomponent>
