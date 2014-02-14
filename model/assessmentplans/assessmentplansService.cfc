
<cfcomponent name="assessmentplansService" output="false">

	<cffunction name="init" access="public" output="false" returntype="assessmentplansService">
		<cfargument name="assessmentplansDAO" type="assessmentplansDAO" required="true" />
		<cfargument name="assessmentplansGateway" type="assessmentplansGateway" required="true" />

		<cfset variables.assessmentplansDAO = arguments.assessmentplansDAO />
		<cfset variables.assessmentplansGateway = arguments.assessmentplansGateway />

		<cfreturn this/>
	</cffunction>

	<cffunction name="createassessmentplans" access="public" output="false" returntype="assessmentplans">
		<cfargument name="PlanID" type="numeric" required="true" />
		<cfargument name="ReportingUnitID" type="numeric" required="false" />
		<cfargument name="PlanPeriod" type="string" required="false" />
		<cfargument name="PlanType" type="numeric" required="false" />
		<cfargument name="PlanStatus" type="numeric" required="false" />
		<cfargument name="PlanInitialReporter" type="string" required="false" />
		<cfargument name="PlanLastChangeDate" type="date" required="false" />
		<cfargument name="PlanLockDate" type="date" required="false" />
		
			
		<cfset var assessmentplans = createObject("component","assessmentplans").init(argumentCollection=arguments) />
		<cfreturn assessmentplans />
	</cffunction>

	<cffunction name="getassessmentplans" access="public" output="false" returntype="assessmentplans">
		<cfargument name="PlanID" type="numeric" required="true" />
		
		<cfset var assessmentplans = createassessmentplans(argumentCollection=arguments) />
		<cfset variables.assessmentplansDAO.read(assessmentplans) />
		<cfreturn assessmentplans />
	</cffunction>

	<cffunction name="getassessmentplanss" access="public" output="false" returntype="array">
		<cfargument name="PlanID" type="numeric" required="false" />
		<cfargument name="ReportingUnitID" type="numeric" required="false" />
		<cfargument name="PlanPeriod" type="string" required="false" />
		<cfargument name="PlanType" type="numeric" required="false" />
		<cfargument name="PlanStatus" type="numeric" required="false" />
		<cfargument name="PlanInitialReporter" type="string" required="false" />
		<cfargument name="PlanLastChangeDate" type="date" required="false" />
		<cfargument name="PlanLockDate" type="date" required="false" />
		
		<cfreturn variables.assessmentplansGateway.getByAttributes(argumentCollection=arguments) />
	</cffunction>

	<cffunction name="saveassessmentplans" access="public" output="false" returntype="boolean">
		<cfargument name="assessmentplans" type="assessmentplans" required="true" />

		<cfreturn variables.assessmentplansDAO.save(assessmentplans) />
	</cffunction>

	<cffunction name="savestatus" access="public" output="false" returntype="boolean">
		<cfargument name="planID" type="numeric" required="true" />
		<cfargument name="planstatus" type="numeric" required="true" />	
		

		<cfset local.assessmentplanbean = getassessmentplans(planID = arguments.planID ) />
		<cfset local.assessmentplanBean.setPlanStatus(arguments.planstatus) />

		<!---
		<cfdump var="#local.assessmentplanBean#" abort="true" label="@assessmentplanservice - 64" />
		--->
		
		<cfreturn variables.assessmentplansDAO.save(local.assessmentplanbean) />
	</cffunction>


	<cffunction name="deleteassessmentplans" access="public" output="false" returntype="boolean">
		<cfargument name="PlanID" type="numeric" required="true" />
		
		<cfset var assessmentplans = createassessmentplans(argumentCollection=arguments) />
		<cfreturn variables.assessmentplansDAO.delete(assessmentplans) />
	</cffunction>

	<cffunction name="createPlan" access="public" output="false" returntype="numeric">
		<cfargument name="PlanID" type="numeric" required="false"/>
		<cfargument name="ReportingUnitID" type="numeric" required="false" />
		<cfargument name="PlanPeriod" type="string" required="false" />
		<cfargument name="PlanType" type="numeric" required="false" />
		<cfargument name="PlanStatus" type="numeric" required="false" />
		<cfargument name="PlanInitialReporter" type="string" required="false" />
		<cfargument name="PlanLastChangeDate" type="date" required="false" />
		<cfargument name="PlanLockDate" type="date" required="false" />
		
			
		<cfset local.assessmentplanBean = createObject("component","assessmentplans").init(argumentCollection=arguments) />

		<cfset local.assessmentplanBean.setPlanID(0) />
		<cfset local.assessmentplanBean.setPlanStatus(10) />
		<cfset local.assessmentplanBean.setPlanLastChangeDate(now()) />

		<!---
		<cfdump var="#local.assessmentplanBean#" abort="true" label="@@assessmentplansService" />
		--->

		<!---
		<cfset local.tmp = variables.assessmentplansDAO.save(local.assessmentplanBean) />

		<cfif local.tmp>
			
		<cfelse>

		</cfif>
		--->

		<cfreturn variables.assessmentplansDAO.save(local.assessmentplanBean) />
	</cffunction>

	<cffunction name="onMissingMethod" access="public" output="false" >
		<cfargument name="missingMethodName" type="string" hint="Name of missing method" />
		<cfargument name="missingMethodArguments" type="any" hint="Arguments passed to the missing method, maybe a named arg set or a numerically indexed set" />

		<cfset var ret = ""/>
		<cfinvoke component="#variables.assessmentplansGateway#" 
				  method="#arguments.missingMethodName#" 
				  argumentcollection="#arguments.missingMethodArguments#" 
				  returnvariable="ret"/>
		<cfreturn ret />
	</cffunction>
</cfcomponent>
