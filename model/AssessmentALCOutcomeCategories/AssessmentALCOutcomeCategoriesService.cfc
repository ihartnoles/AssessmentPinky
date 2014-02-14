
<cfcomponent name="AssessmentALCOutcomeCategoriesService" output="false">

	<cffunction name="init" access="public" output="false" returntype="AssessmentALCOutcomeCategoriesService">
		<cfargument name="AssessmentALCOutcomeCategoriesDAO" type="AssessmentALCOutcomeCategoriesDAO" required="true" />
		<cfargument name="AssessmentALCOutcomeCategoriesGateway" type="AssessmentALCOutcomeCategoriesGateway" required="true" />

		<cfset variables.AssessmentALCOutcomeCategoriesDAO = arguments.AssessmentALCOutcomeCategoriesDAO />
		<cfset variables.AssessmentALCOutcomeCategoriesGateway = arguments.AssessmentALCOutcomeCategoriesGateway />

		<cfreturn this/>
	</cffunction>

	<cffunction name="createAssessmentALCOutcomeCategories" access="public" output="false" returntype="AssessmentALCOutcomeCategories">
		<cfargument name="RecordID" type="numeric" required="true" />
		<cfargument name="OutcomeID" type="numeric" required="false" />
		<cfargument name="SubCategoryID" type="numeric" required="false" />
		<cfargument name="OtherDescription" type="string" required="false" />
		
			
		<cfset var AssessmentALCOutcomeCategories = createObject("component","AssessmentALCOutcomeCategories").init(argumentCollection=arguments) />
		<cfreturn AssessmentALCOutcomeCategories />
	</cffunction>

	<cffunction name="getAssessmentALCOutcomeCategories" access="public" output="false" returntype="AssessmentALCOutcomeCategories">
		<cfargument name="RecordID" type="numeric" required="true" />
		
		<cfset var AssessmentALCOutcomeCategories = createAssessmentALCOutcomeCategories(argumentCollection=arguments) />
		<cfset variables.AssessmentALCOutcomeCategoriesDAO.read(AssessmentALCOutcomeCategories) />
		<cfreturn AssessmentALCOutcomeCategories />
	</cffunction>

	<cffunction name="getAssessmentALCOutcomeCategoriess" access="public" output="false" returntype="array">
		<cfargument name="RecordID" type="numeric" required="false" />
		<cfargument name="OutcomeID" type="numeric" required="false" />
		<cfargument name="SubCategoryID" type="numeric" required="false" />
		<cfargument name="OtherDescription" type="string" required="false" />
		
		<cfreturn variables.AssessmentALCOutcomeCategoriesGateway.getByAttributes(argumentCollection=arguments) />
	</cffunction>

	<cffunction name="saveAssessmentALCOutcomeCategories" access="public" output="false" returntype="boolean">
		<cfargument name="AssessmentALCOutcomeCategories" type="AssessmentALCOutcomeCategories" required="true" />

		<cfreturn variables.AssessmentALCOutcomeCategoriesDAO.save(AssessmentALCOutcomeCategories) />
	</cffunction>

	<cffunction name="deleteAssessmentALCOutcomeCategories" access="public" output="false" returntype="boolean">
		<cfargument name="RecordID" type="numeric" required="true" />
		
		<cfset var AssessmentALCOutcomeCategories = createAssessmentALCOutcomeCategories(argumentCollection=arguments) />
		<cfreturn variables.AssessmentALCOutcomeCategoriesDAO.delete(AssessmentALCOutcomeCategories) />
	</cffunction>

	<cffunction name="onMissingMethod" access="public" output="false" >
		<cfargument name="missingMethodName" type="string" hint="Name of missing method" />
		<cfargument name="missingMethodArguments" type="any" hint="Arguments passed to the missing method, maybe a named arg set or a numerically indexed set" />

		<cfset var ret = ""/>
		<cfinvoke component="#variables.AssessmentALCOutcomeCategoriesGateway#" 
				  method="#arguments.missingMethodName#" 
				  argumentcollection="#arguments.missingMethodArguments#" 
				  returnvariable="ret"/>
		<cfreturn ret />
	</cffunction>
</cfcomponent>
