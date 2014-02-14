
<cfcomponent name="AssessmentStrategicPlanLinksService" output="false">

	<cffunction name="init" access="public" output="false" returntype="AssessmentStrategicPlanLinksService">
		<cfargument name="AssessmentStrategicPlanLinksDAO" type="AssessmentStrategicPlanLinksDAO" required="true" />
		<cfargument name="AssessmentStrategicPlanLinksGateway" type="AssessmentStrategicPlanLinksGateway" required="true" />

		<cfset variables.AssessmentStrategicPlanLinksDAO = arguments.AssessmentStrategicPlanLinksDAO />
		<cfset variables.AssessmentStrategicPlanLinksGateway = arguments.AssessmentStrategicPlanLinksGateway />

		<cfreturn this/>
	</cffunction>

	<cffunction name="createAssessmentStrategicPlanLinks" access="public" output="false" returntype="AssessmentStrategicPlanLinks">
		<cfargument name="RecordID" type="numeric" required="true" />
		<cfargument name="OutcomeID" type="numeric" required="false" />
		<cfargument name="ObjectiveID" type="numeric" required="false" />
		
			
		<cfset var AssessmentStrategicPlanLinks = createObject("component","AssessmentStrategicPlanLinks").init(argumentCollection=arguments) />
		<cfreturn AssessmentStrategicPlanLinks />
	</cffunction>

	<cffunction name="getAssessmentStrategicPlanLinks" access="public" output="false" returntype="AssessmentStrategicPlanLinks">
		<cfargument name="RecordID" type="numeric" required="true" />
		
		<cfset var AssessmentStrategicPlanLinks = createAssessmentStrategicPlanLinks(argumentCollection=arguments) />
		<cfset variables.AssessmentStrategicPlanLinksDAO.read(AssessmentStrategicPlanLinks) />
		<cfreturn AssessmentStrategicPlanLinks />
	</cffunction>

	<cffunction name="getAssessmentStrategicPlanLinkss" access="public" output="false" returntype="query">
		<cfargument name="RecordID" type="numeric" required="false" />
		<cfargument name="OutcomeID" type="numeric" required="false" />
		<cfargument name="ObjectiveID" type="numeric" required="false" />
		
		<cfreturn variables.AssessmentStrategicPlanLinksGateway.getByAttributes(argumentCollection=arguments) />
	</cffunction>

	<cffunction name="saveAssessmentStrategicPlanLinks" access="public" output="false" returntype="boolean">
		<cfargument name="RecordID" type="numeric" />
		<cfargument name="OutcomeID" type="numeric" />
		<cfargument name="ObjectiveID" type="numeric" />
		
		
		<cfset var AssessmentStrategicPlanLinks = getAssessmentStrategicPlanLinks(arguments.RecordID) />
		<cfif structKeyExists(arguments,"RecordID")>
			<cfset AssessmentStrategicPlanLinks.setRecordID(arguments.RecordID) />
		</cfif>
		<cfif structKeyExists(arguments,"OutcomeID")>
			<cfset AssessmentStrategicPlanLinks.setOutcomeID(arguments.OutcomeID) />
		</cfif>
		<cfif structKeyExists(arguments,"ObjectiveID")>
			<cfset AssessmentStrategicPlanLinks.setObjectiveID(arguments.ObjectiveID) />
		</cfif>
		
		
		<cfreturn variables.AssessmentStrategicPlanLinksDAO.save(AssessmentStrategicPlanLinks) />
	</cffunction>

	<cffunction name="deleteAssessmentStrategicPlanLinks" access="public" output="false" returntype="boolean">
		<cfargument name="RecordID" type="numeric" required="true" />
		
		<cfset var AssessmentStrategicPlanLinks = createAssessmentStrategicPlanLinks(argumentCollection=arguments) />
		<cfreturn variables.AssessmentStrategicPlanLinksDAO.delete(AssessmentStrategicPlanLinks) />
	</cffunction>

	<cffunction name="onMissingMethod" access="public" output="false" hint="Delegate missing methods to the gateway" >
		<cfargument name="missingMethodName" type="string" hint="Name of missing method" />
		<cfargument name="missingMethodArguments" type="any" hint="Arguments passed to the missing method, maybe a named arg set or a numerically indexed set" />
		
		<cfset var ret = "" />
		<cfinvoke component="#variables.AssessmentStrategicPlanLinksGateway#" 
				  method="#arguments.missingMethodName#" 
				  argumentcollection="#arguments.missingMethodArguments#" 
				  returnvariable="ret" />
		
		<cfreturn ret />
	</cffunction>
</cfcomponent>
