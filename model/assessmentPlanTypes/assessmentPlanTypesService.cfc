
<cfcomponent name="assessmentPlanTypesService" output="false">

	<cffunction name="init" access="public" output="false" returntype="assessmentPlanTypesService">
		<cfargument name="assessmentPlanTypesDAO" type="assessmentPlanTypesDAO" required="true" />
		<cfargument name="assessmentPlanTypesGateway" type="assessmentPlanTypesGateway" required="true" />

		<cfset variables.assessmentPlanTypesDAO = arguments.assessmentPlanTypesDAO />
		<cfset variables.assessmentPlanTypesGateway = arguments.assessmentPlanTypesGateway />

		<cfreturn this/>
	</cffunction>

	<cffunction name="createassessmentPlanTypes" access="public" output="false" returntype="assessmentPlanTypes">
		<cfargument name="PlanType" type="numeric" required="true" />
		<cfargument name="PlanTypeOrder" type="numeric" required="false" />
		<cfargument name="PlanTypeDescription" type="string" required="false" />
		
			
		<cfset var assessmentPlanTypes = createObject("component","assessmentPlanTypes").init(argumentCollection=arguments) />
		<cfreturn assessmentPlanTypes />
	</cffunction>

	<cffunction name="getassessmentPlanTypes" access="public" output="false" returntype="assessmentPlanTypes">
		<cfargument name="PlanType" type="numeric" required="true" />
		
		<cfset var assessmentPlanTypes = createassessmentPlanTypes(argumentCollection=arguments) />
		<cfset variables.assessmentPlanTypesDAO.read(assessmentPlanTypes) />
		<cfreturn assessmentPlanTypes />
	</cffunction>

	<cffunction name="getassessmentPlanTypess" access="public" output="false" returntype="array">
		<cfargument name="PlanType" type="numeric" required="false" />
		<cfargument name="PlanTypeOrder" type="numeric" required="false" />
		<cfargument name="PlanTypeDescription" type="string" required="false" />
		
		<cfreturn variables.assessmentPlanTypesGateway.getByAttributes(argumentCollection=arguments) />
	</cffunction>

	<cffunction name="saveassessmentPlanTypes" access="public" output="false" returntype="boolean">
		<cfargument name="assessmentPlanTypes" type="assessmentPlanTypes" required="true" />

		<cfreturn variables.assessmentPlanTypesDAO.save(assessmentPlanTypes) />
	</cffunction>

	<cffunction name="deleteassessmentPlanTypes" access="public" output="false" returntype="boolean">
		<cfargument name="PlanType" type="numeric" required="true" />
		
		<cfset var assessmentPlanTypes = createassessmentPlanTypes(argumentCollection=arguments) />
		<cfreturn variables.assessmentPlanTypesDAO.delete(assessmentPlanTypes) />
	</cffunction>

	<cffunction name="onMissingMethod" access="public" output="false" >
		<cfargument name="missingMethodName" type="string" hint="Name of missing method" />
		<cfargument name="missingMethodArguments" type="any" hint="Arguments passed to the missing method, maybe a named arg set or a numerically indexed set" />

		<cfset var ret = ""/>
		<cfinvoke component="#variables.assessmentPlanTypesGateway#" 
				  method="#arguments.missingMethodName#" 
				  argumentcollection="#arguments.missingMethodArguments#" 
				  returnvariable="ret"/>
		<cfreturn ret />
	</cffunction>
</cfcomponent>
