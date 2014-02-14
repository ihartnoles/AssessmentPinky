
<cfcomponent name="programImprovementCodesAssessmentOutcomesService" output="false">

	<cffunction name="init" access="public" output="false" returntype="programImprovementCodesAssessmentOutcomesService">
		<cfargument name="programImprovementCodesAssessmentOutcomesDAO" type="programImprovementCodesAssessmentOutcomesDAO" required="true" />
		<cfargument name="programImprovementCodesAssessmentOutcomesGateway" type="programImprovementCodesAssessmentOutcomesGateway" required="true" />

		<cfset variables.programImprovementCodesAssessmentOutcomesDAO = arguments.programImprovementCodesAssessmentOutcomesDAO />
		<cfset variables.programImprovementCodesAssessmentOutcomesGateway = arguments.programImprovementCodesAssessmentOutcomesGateway />

		<cfreturn this/>
	</cffunction>

	<cffunction name="createprogramImprovementCodesAssessmentOutcomes" access="public" output="false" returntype="programImprovementCodesAssessmentOutcomes">
		<cfargument name="id" type="numeric" required="true" />
		<cfargument name="outcomeID" type="numeric" required="false" />
		<cfargument name="reportingUnitID" type="numeric" required="false" />
		<cfargument name="planID" type="numeric" required="false" />
		<cfargument name="ProgramImprovementCodeID" type="numeric" required="false" />
		
			
		<cfset var programImprovementCodesAssessmentOutcomes = createObject("component","programImprovementCodesAssessmentOutcomes").init(argumentCollection=arguments) />
		<cfreturn programImprovementCodesAssessmentOutcomes />
	</cffunction>

	<cffunction name="getprogramImprovementCodesAssessmentOutcomes" access="public" output="false" returntype="programImprovementCodesAssessmentOutcomes">
		<cfargument name="id" type="numeric" required="true" />
		
		<cfset var programImprovementCodesAssessmentOutcomes = createprogramImprovementCodesAssessmentOutcomes(argumentCollection=arguments) />
		<cfset variables.programImprovementCodesAssessmentOutcomesDAO.read(programImprovementCodesAssessmentOutcomes) />
		<cfreturn programImprovementCodesAssessmentOutcomes />
	</cffunction>

	<cffunction name="getprogramImprovementCodesAssessmentOutcomess" access="public" output="false" returntype="array">
		<cfargument name="id" type="numeric" required="false" />
		<cfargument name="outcomeID" type="numeric" required="false" />
		<cfargument name="reportingUnitID" type="numeric" required="false" />
		<cfargument name="planID" type="numeric" required="false" />
		<cfargument name="ProgramImprovementCodeID" type="numeric" required="false" />
		
		<cfreturn variables.programImprovementCodesAssessmentOutcomesGateway.getByAttributes(argumentCollection=arguments) />
	</cffunction>

	<cffunction name="saveprogramImprovementCodesAssessmentOutcomes" access="public" output="false" returntype="boolean">
		<cfargument name="programImprovementCodesAssessmentOutcomes" type="programImprovementCodesAssessmentOutcomes" required="true" />

		<cfreturn variables.programImprovementCodesAssessmentOutcomesDAO.save(programImprovementCodesAssessmentOutcomes) />
	</cffunction>

	<cffunction name="deleteprogramImprovementCodesAssessmentOutcomes" access="public" output="false" returntype="boolean">
		<cfargument name="id" type="numeric" required="true" />
		
		<cfset var programImprovementCodesAssessmentOutcomes = createprogramImprovementCodesAssessmentOutcomes(argumentCollection=arguments) />
		<cfreturn variables.programImprovementCodesAssessmentOutcomesDAO.delete(programImprovementCodesAssessmentOutcomes) />
	</cffunction>

	<cffunction name="onMissingMethod" access="public" output="false" >
		<cfargument name="missingMethodName" type="string" hint="Name of missing method" />
		<cfargument name="missingMethodArguments" type="any" hint="Arguments passed to the missing method, maybe a named arg set or a numerically indexed set" />

		<cfset var ret = ""/>
		<cfinvoke component="#variables.programImprovementCodesAssessmentOutcomesGateway#" 
				  method="#arguments.missingMethodName#" 
				  argumentcollection="#arguments.missingMethodArguments#" 
				  returnvariable="ret"/>
		<cfreturn ret />
	</cffunction>
</cfcomponent>
