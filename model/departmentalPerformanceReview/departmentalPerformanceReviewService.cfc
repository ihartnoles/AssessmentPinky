
<cfcomponent name="departmentalPerformanceReviewService" output="false">

	<cffunction name="init" access="public" output="false" returntype="departmentalPerformanceReviewService">
		<cfargument name="departmentalPerformanceReviewDAO" type="departmentalPerformanceReviewDAO" required="true" />
		<cfargument name="departmentalPerformanceReviewGateway" type="departmentalPerformanceReviewGateway" required="true" />

		<cfset variables.departmentalPerformanceReviewDAO = arguments.departmentalPerformanceReviewDAO />
		<cfset variables.departmentalPerformanceReviewGateway = arguments.departmentalPerformanceReviewGateway />

		<cfreturn this/>
	</cffunction>

	<cffunction name="createdepartmentalPerformanceReview" access="public" output="false" returntype="departmentalPerformanceReview">
		<cfargument name="ReviewID" type="numeric" required="true" />
		<cfargument name="ReportingUnitID" type="numeric" required="false" />
		<cfargument name="ReviewPeriod" type="string" required="false" />
		<cfargument name="ReviewStatus" type="string" required="false" />
		<cfargument name="DeanReviewedDDI" type="string" required="false" />
		<cfargument name="DeanReviewedAssessmentPlans" type="string" required="false" />
		<cfargument name="FacultyReview" type="string" required="false" />
		<cfargument name="CoursesReview" type="string" required="false" />
		<cfargument name="StudentsReview" type="string" required="false" />
		<cfargument name="FTEDegreesReview" type="string" required="false" />
		<cfargument name="StudentFeedbackReview" type="string" required="false" />
		<cfargument name="ExaminedScorecard" type="string" required="false" />
		<cfargument name="AssessmentResultsEntered" type="string" required="false" />
		<cfargument name="ResultsForImprovement" type="string" required="false" />
		<cfargument name="DeansEvalInstruction" type="string" required="false" />
		<cfargument name="CommentsInstruction" type="string" required="false" />
		<cfargument name="FundedResearchReview" type="string" required="false" />
		<cfargument name="CreativeScholarlyReview" type="string" required="false" />
		<cfargument name="ResearchGoalsEntered" type="string" required="false" />
		<cfargument name="ResearchGoalsMet" type="string" required="false" />
		<cfargument name="DeansEvalResearch" type="string" required="false" />
		<cfargument name="CommentsResearch" type="string" required="false" />
		<cfargument name="ServiceReview" type="string" required="false" />
		<cfargument name="ServiceGoalsEntered" type="string" required="false" />
		<cfargument name="ServiceGoalsMet" type="string" required="false" />
		<cfargument name="DeansEvalService" type="string" required="false" />
		<cfargument name="CommentsService" type="string" required="false" />
		<cfargument name="SummaryComments" type="string" required="false" />
		<cfargument name="NewInitiatives" type="string" required="false" />
		<cfargument name="ActivityDate" type="date" required="false" />
		
			
		<cfset var departmentalPerformanceReview = createObject("component","departmentalPerformanceReview").init(argumentCollection=arguments) />
		<cfreturn departmentalPerformanceReview />
	</cffunction>

	<cffunction name="getdepartmentalPerformanceReview" access="public" output="false" returntype="departmentalPerformanceReview">
		<cfargument name="ReviewID" type="numeric" required="true" />
		
		<cfset var departmentalPerformanceReview = createdepartmentalPerformanceReview(argumentCollection=arguments) />
		<cfset variables.departmentalPerformanceReviewDAO.read(departmentalPerformanceReview) />
		<cfreturn departmentalPerformanceReview />
	</cffunction>

	<cffunction name="getdepartmentalPerformanceReviews" access="public" output="false" returntype="array">
		<cfargument name="ReviewID" type="numeric" required="false" />
		<cfargument name="ReportingUnitID" type="numeric" required="false" />
		<cfargument name="ReviewPeriod" type="string" required="false" />
		<cfargument name="ReviewStatus" type="string" required="false" />
		<cfargument name="DeanReviewedDDI" type="string" required="false" />
		<cfargument name="DeanReviewedAssessmentPlans" type="string" required="false" />
		<cfargument name="FacultyReview" type="string" required="false" />
		<cfargument name="CoursesReview" type="string" required="false" />
		<cfargument name="StudentsReview" type="string" required="false" />
		<cfargument name="FTEDegreesReview" type="string" required="false" />
		<cfargument name="StudentFeedbackReview" type="string" required="false" />
		<cfargument name="ExaminedScorecard" type="string" required="false" />
		<cfargument name="AssessmentResultsEntered" type="string" required="false" />
		<cfargument name="ResultsForImprovement" type="string" required="false" />
		<cfargument name="DeansEvalInstruction" type="string" required="false" />
		<cfargument name="CommentsInstruction" type="string" required="false" />
		<cfargument name="FundedResearchReview" type="string" required="false" />
		<cfargument name="CreativeScholarlyReview" type="string" required="false" />
		<cfargument name="ResearchGoalsEntered" type="string" required="false" />
		<cfargument name="ResearchGoalsMet" type="string" required="false" />
		<cfargument name="DeansEvalResearch" type="string" required="false" />
		<cfargument name="CommentsResearch" type="string" required="false" />
		<cfargument name="ServiceReview" type="string" required="false" />
		<cfargument name="ServiceGoalsEntered" type="string" required="false" />
		<cfargument name="ServiceGoalsMet" type="string" required="false" />
		<cfargument name="DeansEvalService" type="string" required="false" />
		<cfargument name="CommentsService" type="string" required="false" />
		<cfargument name="SummaryComments" type="string" required="false" />
		<cfargument name="NewInitiatives" type="string" required="false" />
		<cfargument name="ActivityDate" type="date" required="false" />
		
		<cfreturn variables.departmentalPerformanceReviewGateway.getByAttributes(argumentCollection=arguments) />
	</cffunction>

	<cffunction name="savedepartmentalPerformanceReview" access="public" output="false" returntype="boolean">
		<cfargument name="departmentalPerformanceReview" type="departmentalPerformanceReview" required="true" />

		<cfreturn variables.departmentalPerformanceReviewDAO.save(departmentalPerformanceReview) />
	</cffunction>
	

	<cffunction name="deletedepartmentalPerformanceReview" access="public" output="false" returntype="boolean">
		<cfargument name="ReviewID" type="numeric" required="true" />
		
		<cfset var departmentalPerformanceReview = createdepartmentalPerformanceReview(argumentCollection=arguments) />
		<cfreturn variables.departmentalPerformanceReviewDAO.delete(departmentalPerformanceReview) />
	</cffunction>

	<cffunction name="onMissingMethod" access="public" output="false" >
		<cfargument name="missingMethodName" type="string" hint="Name of missing method" />
		<cfargument name="missingMethodArguments" type="any" hint="Arguments passed to the missing method, maybe a named arg set or a numerically indexed set" />

		<cfset var ret = ""/>
		<cfinvoke component="#variables.departmentalPerformanceReviewGateway#" 
				  method="#arguments.missingMethodName#" 
				  argumentcollection="#arguments.missingMethodArguments#" 
				  returnvariable="ret"/>
		<cfreturn ret />
	</cffunction>
</cfcomponent>
