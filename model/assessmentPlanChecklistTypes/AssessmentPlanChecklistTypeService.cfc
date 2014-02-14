
<cfcomponent name="AssessmentPlanChecklistTypeService" output="false">

	<cffunction name="init" access="public" output="false" returntype="AssessmentPlanChecklistTypeService">
		<cfargument name="AssessmentPlanChecklistTypeDAO" type="AssessmentPlanChecklistTypeDAO" required="true" />
		<cfargument name="AssessmentPlanChecklistTypeGateway" type="AssessmentPlanChecklistTypeGateway" required="true" />

		<cfset variables.AssessmentPlanChecklistTypeDAO = arguments.AssessmentPlanChecklistTypeDAO />
		<cfset variables.AssessmentPlanChecklistTypeGateway = arguments.AssessmentPlanChecklistTypeGateway />

		<cfreturn this/>
	</cffunction>

	<cffunction name="createAssessmentPlanChecklistType" access="public" output="false" returntype="AssessmentPlanChecklistType">
		<cfargument name="ChecklistTypeID" type="numeric" required="true" />
		<cfargument name="Category" type="string" required="false" />
		<cfargument name="SubCategory" type="string" required="false" />
		
			
		<cfset var AssessmentPlanChecklistType = createObject("component","AssessmentPlanChecklistType").init(argumentCollection=arguments) />
		<cfreturn AssessmentPlanChecklistType />
	</cffunction>

	<cffunction name="getAssessmentPlanChecklistType" access="public" output="false" returntype="AssessmentPlanChecklistType">
		<cfargument name="ChecklistTypeID" type="numeric" required="true" />
		
		<cfset var AssessmentPlanChecklistType = createAssessmentPlanChecklistType(argumentCollection=arguments) />
		<cfset variables.AssessmentPlanChecklistTypeDAO.read(AssessmentPlanChecklistType) />
		<cfreturn AssessmentPlanChecklistType />
	</cffunction>

	<cffunction name="getAssessmentPlanChecklistTypes" access="public" output="false" returntype="array">
		<cfargument name="ChecklistTypeID" type="numeric" required="false" />
		<cfargument name="Category" type="string" required="false" />
		<cfargument name="SubCategory" type="string" required="false" />
		
		<cfreturn variables.AssessmentPlanChecklistTypeGateway.getByAttributes(argumentCollection=arguments) />
	</cffunction>

	<cffunction name="saveAssessmentPlanChecklistType" access="public" output="false" returntype="boolean">
		<cfargument name="AssessmentPlanChecklistType" type="AssessmentPlanChecklistType" required="true" />

		<cfreturn variables.AssessmentPlanChecklistTypeDAO.save(AssessmentPlanChecklistType) />
	</cffunction>

	<cffunction name="deleteAssessmentPlanChecklistType" access="public" output="false" returntype="boolean">
		<cfargument name="ChecklistTypeID" type="numeric" required="true" />
		
		<cfset var AssessmentPlanChecklistType = createAssessmentPlanChecklistType(argumentCollection=arguments) />
		<cfreturn variables.AssessmentPlanChecklistTypeDAO.delete(AssessmentPlanChecklistType) />
	</cffunction>

	<cffunction name="onMissingMethod" access="public" output="false" >
		<cfargument name="missingMethodName" type="string" hint="Name of missing method" />
		<cfargument name="missingMethodArguments" type="any" hint="Arguments passed to the missing method, maybe a named arg set or a numerically indexed set" />

		<cfset var ret = ""/>
		<cfinvoke component="#variables.AssessmentPlanChecklistTypeGateway#" 
				  method="#arguments.missingMethodName#" 
				  argumentcollection="#arguments.missingMethodArguments#" 
				  returnvariable="ret"/>
		<cfreturn ret />
	</cffunction>
</cfcomponent>
