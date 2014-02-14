
<cfcomponent name="assessmentPlanWorkflowService" output="false">

	<cffunction name="init" access="public" output="false" returntype="assessmentPlanWorkflowService">
		<cfargument name="assessmentPlanWorkflowDAO" type="assessmentPlanWorkflowDAO" required="true" />
		<cfargument name="assessmentPlanWorkflowGateway" type="assessmentPlanWorkflowGateway" required="true" />

		<cfset variables.assessmentPlanWorkflowDAO = arguments.assessmentPlanWorkflowDAO />
		<cfset variables.assessmentPlanWorkflowGateway = arguments.assessmentPlanWorkflowGateway />

		<cfreturn this/>
	</cffunction>

	<cffunction name="createassessmentPlanWorkflow" access="public" output="false" returntype="assessmentPlanWorkflow">
		<cfargument name="RecordID" type="numeric" required="true" />
		<cfargument name="PlanType" type="numeric" required="false" />
		<cfargument name="WorkflowStep" type="numeric" required="false" />
		<cfargument name="WorkflowStepDescription" type="string" required="false" />
		<cfargument name="WorkflowStepEmailInstructions" type="string" required="false" />
		<cfargument name="WorkflowStepInstructions" type="string" required="false" />
		
			
		<cfset var assessmentPlanWorkflow = createObject("component","assessmentPlanWorkflow").init(argumentCollection=arguments) />
		<cfreturn assessmentPlanWorkflow />
	</cffunction>

	<cffunction name="getassessmentPlanWorkflow" access="public" output="false" returntype="assessmentPlanWorkflow">
		<cfargument name="RecordID" type="numeric" required="true" />
		
		<cfset var assessmentPlanWorkflow = createassessmentPlanWorkflow(argumentCollection=arguments) />
		<cfset variables.assessmentPlanWorkflowDAO.read(assessmentPlanWorkflow) />
		<cfreturn assessmentPlanWorkflow />
	</cffunction>

	<cffunction name="getassessmentPlanWorkflows" access="public" output="false" returntype="array">
		<cfargument name="RecordID" type="numeric" required="false" />
		<cfargument name="PlanType" type="numeric" required="false" />
		<cfargument name="WorkflowStep" type="numeric" required="false" />
		<cfargument name="WorkflowStepDescription" type="string" required="false" />
		<cfargument name="WorkflowStepEmailInstructions" type="string" required="false" />
		<cfargument name="WorkflowStepInstructions" type="string" required="false" />
		
		<cfreturn variables.assessmentPlanWorkflowGateway.getByAttributes(argumentCollection=arguments) />
	</cffunction>

	<cffunction name="saveassessmentPlanWorkflow" access="public" output="false" returntype="boolean">
		<cfargument name="assessmentPlanWorkflow" type="assessmentPlanWorkflow" required="true" />

		<cfreturn variables.assessmentPlanWorkflowDAO.save(assessmentPlanWorkflow) />
	</cffunction>

	<cffunction name="deleteassessmentPlanWorkflow" access="public" output="false" returntype="boolean">
		<cfargument name="RecordID" type="numeric" required="true" />
		
		<cfset var assessmentPlanWorkflow = createassessmentPlanWorkflow(argumentCollection=arguments) />
		<cfreturn variables.assessmentPlanWorkflowDAO.delete(assessmentPlanWorkflow) />
	</cffunction>

	<cffunction name="onMissingMethod" access="public" output="false" >
		<cfargument name="missingMethodName" type="string" hint="Name of missing method" />
		<cfargument name="missingMethodArguments" type="any" hint="Arguments passed to the missing method, maybe a named arg set or a numerically indexed set" />

		<cfset var ret = ""/>
		<cfinvoke component="#variables.assessmentPlanWorkflowGateway#" 
				  method="#arguments.missingMethodName#" 
				  argumentcollection="#arguments.missingMethodArguments#" 
				  returnvariable="ret"/>
		<cfreturn ret />
	</cffunction>
</cfcomponent>
