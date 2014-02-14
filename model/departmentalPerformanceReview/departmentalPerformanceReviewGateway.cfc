
<cfcomponent displayname="departmentalPerformanceReviewGateway" output="false">
	<cffunction name="init" access="public" output="false" returntype="departmentalPerformanceReviewGateway">
		<cfargument name="dsn" type="string" required="true" />
		<cfset variables.dsn = arguments.dsn />
		<cfreturn this />
	</cffunction>
	
	<cffunction name="getReviewPeriods" access="public" output="false" returntype="query">
		
		<cfargument name="ReportingUnitID" type="numeric" required="false" />
		
		
		<cfset var qList = "" />		
		<cfquery name="qList" datasource="#variables.dsn#">
			SELECT dpr.*, ru.DivisionID, odi.DivisionName, ru.DeptID, ode.DeptName, ode.SAMASDeptID  
			FROM DepartmentalPerformanceReview dpr, ReportingUnit ru, OrganizationDivision odi, OrganizationDept ode  
			WHERE 0=0

			<cfif structKeyExists(arguments,"ReportingUnitID") and len(arguments.ReportingUnitID)>
				AND	dpr.ReportingUnitID = <cfqueryparam value="#arguments.ReportingUnitID#" CFSQLType="cf_sql_integer" />
			</cfif>

			AND dpr.ReportingUnitID=ru.ReportingUnitID 
			AND ru.DivisionID=odi.DivisionID 
			AND ru.DeptID=ode.DeptID 

			ORDER BY ReviewPeriod DESC
		</cfquery>
		
		<cfreturn qList />
	</cffunction>


	<cffunction name="getReviewPlanPeriods" access="public" output="false" returntype="query">
		
		<cfargument name="ReportingUnitID" type="numeric" required="false" />
		
		
		<cfset var qList = "" />		
		<cfquery name="qList" datasource="#variables.dsn#">
			SELECT ReviewPeriod
			FROM DepartmentalPerformanceReviewPeriods
			ORDER BY ReviewPeriod DESC
		</cfquery>
		
		<cfreturn qList />
	</cffunction>

	<cffunction name="getDeptReviewDetails" access="public" output="false" returntype="query">
		<cfargument name="ReviewID" type="any" required="false" />
		
		<cfset var qList = "" />		
		<cfquery name="qList" datasource="#variables.dsn#">
			SELECT dpr.*, ru.DivisionID, odi.DivisionName, ru.DeptID, ode.DeptName, ode.SAMASDeptID  
			FROM DepartmentalPerformanceReview dpr, ReportingUnit ru, OrganizationDivision odi, OrganizationDept ode  
			WHERE 0=0

			<cfif structKeyExists(arguments,"ReviewID") and len(arguments.ReviewID)>
				AND	dpr.ReviewID = <cfqueryparam value="#arguments.ReviewID#" CFSQLType="cf_sql_integer" />
			</cfif>

			 AND dpr.ReportingUnitID=ru.ReportingUnitID 
			 AND ru.DivisionID=odi.DivisionID 
			 AND ru.DeptID=ode.DeptID 
		</cfquery>

		<cfreturn qList />
	</cffunction>

	<cffunction name="getByAttributesQuery" access="public" output="false" returntype="query">
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
		<cfargument name="orderby" type="string" required="false" />
		
		<cfset var qList = "" />		
		<cfquery name="qList" datasource="#variables.dsn#">
			SELECT
				ReviewID,
				ReportingUnitID,
				ReviewPeriod,
				ReviewStatus,
				DeanReviewedDDI,
				DeanReviewedAssessmentPlans,
				FacultyReview,
				CoursesReview,
				StudentsReview,
				FTEDegreesReview,
				StudentFeedbackReview,
				ExaminedScorecard,
				AssessmentResultsEntered,
				ResultsForImprovement,
				DeansEvalInstruction,
				CommentsInstruction,
				FundedResearchReview,
				CreativeScholarlyReview,
				ResearchGoalsEntered,
				ResearchGoalsMet,
				DeansEvalResearch,
				CommentsResearch,
				ServiceReview,
				ServiceGoalsEntered,
				ServiceGoalsMet,
				DeansEvalService,
				CommentsService,
				SummaryComments,
				NewInitiatives,
				ActivityDate
			FROM	DepartmentalPerformanceReview
			WHERE	0=0
		
		<cfif structKeyExists(arguments,"ReviewID") and len(arguments.ReviewID)>
			AND	ReviewID = <cfqueryparam value="#arguments.ReviewID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"ReportingUnitID") and len(arguments.ReportingUnitID)>
			AND	ReportingUnitID = <cfqueryparam value="#arguments.ReportingUnitID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"ReviewPeriod") and len(arguments.ReviewPeriod)>
			AND	ReviewPeriod = <cfqueryparam value="#arguments.ReviewPeriod#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"ReviewStatus") and len(arguments.ReviewStatus)>
			AND	ReviewStatus = <cfqueryparam value="#arguments.ReviewStatus#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"DeanReviewedDDI") and len(arguments.DeanReviewedDDI)>
			AND	DeanReviewedDDI = <cfqueryparam value="#arguments.DeanReviewedDDI#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"DeanReviewedAssessmentPlans") and len(arguments.DeanReviewedAssessmentPlans)>
			AND	DeanReviewedAssessmentPlans = <cfqueryparam value="#arguments.DeanReviewedAssessmentPlans#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"FacultyReview") and len(arguments.FacultyReview)>
			AND	FacultyReview = <cfqueryparam value="#arguments.FacultyReview#" CFSQLType="cf_sql_longvarchar" />
		</cfif>
		<cfif structKeyExists(arguments,"CoursesReview") and len(arguments.CoursesReview)>
			AND	CoursesReview = <cfqueryparam value="#arguments.CoursesReview#" CFSQLType="cf_sql_longvarchar" />
		</cfif>
		<cfif structKeyExists(arguments,"StudentsReview") and len(arguments.StudentsReview)>
			AND	StudentsReview = <cfqueryparam value="#arguments.StudentsReview#" CFSQLType="cf_sql_longvarchar" />
		</cfif>
		<cfif structKeyExists(arguments,"FTEDegreesReview") and len(arguments.FTEDegreesReview)>
			AND	FTEDegreesReview = <cfqueryparam value="#arguments.FTEDegreesReview#" CFSQLType="cf_sql_longvarchar" />
		</cfif>
		<cfif structKeyExists(arguments,"StudentFeedbackReview") and len(arguments.StudentFeedbackReview)>
			AND	StudentFeedbackReview = <cfqueryparam value="#arguments.StudentFeedbackReview#" CFSQLType="cf_sql_longvarchar" />
		</cfif>
		<cfif structKeyExists(arguments,"ExaminedScorecard") and len(arguments.ExaminedScorecard)>
			AND	ExaminedScorecard = <cfqueryparam value="#arguments.ExaminedScorecard#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"AssessmentResultsEntered") and len(arguments.AssessmentResultsEntered)>
			AND	AssessmentResultsEntered = <cfqueryparam value="#arguments.AssessmentResultsEntered#" CFSQLType="cf_sql_longvarchar" />
		</cfif>
		<cfif structKeyExists(arguments,"ResultsForImprovement") and len(arguments.ResultsForImprovement)>
			AND	ResultsForImprovement = <cfqueryparam value="#arguments.ResultsForImprovement#" CFSQLType="cf_sql_longvarchar" />
		</cfif>
		<cfif structKeyExists(arguments,"DeansEvalInstruction") and len(arguments.DeansEvalInstruction)>
			AND	DeansEvalInstruction = <cfqueryparam value="#arguments.DeansEvalInstruction#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"CommentsInstruction") and len(arguments.CommentsInstruction)>
			AND	CommentsInstruction = <cfqueryparam value="#arguments.CommentsInstruction#" CFSQLType="cf_sql_longvarchar" />
		</cfif>
		<cfif structKeyExists(arguments,"FundedResearchReview") and len(arguments.FundedResearchReview)>
			AND	FundedResearchReview = <cfqueryparam value="#arguments.FundedResearchReview#" CFSQLType="cf_sql_longvarchar" />
		</cfif>
		<cfif structKeyExists(arguments,"CreativeScholarlyReview") and len(arguments.CreativeScholarlyReview)>
			AND	CreativeScholarlyReview = <cfqueryparam value="#arguments.CreativeScholarlyReview#" CFSQLType="cf_sql_longvarchar" />
		</cfif>
		<cfif structKeyExists(arguments,"ResearchGoalsEntered") and len(arguments.ResearchGoalsEntered)>
			AND	ResearchGoalsEntered = <cfqueryparam value="#arguments.ResearchGoalsEntered#" CFSQLType="cf_sql_longvarchar" />
		</cfif>
		<cfif structKeyExists(arguments,"ResearchGoalsMet") and len(arguments.ResearchGoalsMet)>
			AND	ResearchGoalsMet = <cfqueryparam value="#arguments.ResearchGoalsMet#" CFSQLType="cf_sql_longvarchar" />
		</cfif>
		<cfif structKeyExists(arguments,"DeansEvalResearch") and len(arguments.DeansEvalResearch)>
			AND	DeansEvalResearch = <cfqueryparam value="#arguments.DeansEvalResearch#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"CommentsResearch") and len(arguments.CommentsResearch)>
			AND	CommentsResearch = <cfqueryparam value="#arguments.CommentsResearch#" CFSQLType="cf_sql_longvarchar" />
		</cfif>
		<cfif structKeyExists(arguments,"ServiceReview") and len(arguments.ServiceReview)>
			AND	ServiceReview = <cfqueryparam value="#arguments.ServiceReview#" CFSQLType="cf_sql_longvarchar" />
		</cfif>
		<cfif structKeyExists(arguments,"ServiceGoalsEntered") and len(arguments.ServiceGoalsEntered)>
			AND	ServiceGoalsEntered = <cfqueryparam value="#arguments.ServiceGoalsEntered#" CFSQLType="cf_sql_longvarchar" />
		</cfif>
		<cfif structKeyExists(arguments,"ServiceGoalsMet") and len(arguments.ServiceGoalsMet)>
			AND	ServiceGoalsMet = <cfqueryparam value="#arguments.ServiceGoalsMet#" CFSQLType="cf_sql_longvarchar" />
		</cfif>
		<cfif structKeyExists(arguments,"DeansEvalService") and len(arguments.DeansEvalService)>
			AND	DeansEvalService = <cfqueryparam value="#arguments.DeansEvalService#" CFSQLType="cf_sql_longvarchar" />
		</cfif>
		<cfif structKeyExists(arguments,"CommentsService") and len(arguments.CommentsService)>
			AND	CommentsService = <cfqueryparam value="#arguments.CommentsService#" CFSQLType="cf_sql_longvarchar" />
		</cfif>
		<cfif structKeyExists(arguments,"SummaryComments") and len(arguments.SummaryComments)>
			AND	SummaryComments = <cfqueryparam value="#arguments.SummaryComments#" CFSQLType="cf_sql_longvarchar" />
		</cfif>
		<cfif structKeyExists(arguments,"NewInitiatives") and len(arguments.NewInitiatives)>
			AND	NewInitiatives = <cfqueryparam value="#arguments.NewInitiatives#" CFSQLType="cf_sql_longvarchar" />
		</cfif>
		<cfif structKeyExists(arguments,"ActivityDate") and len(arguments.ActivityDate)>
			AND	ActivityDate = <cfqueryparam value="#arguments.ActivityDate#" CFSQLType="cf_sql_timestamp" />
		</cfif>
		<cfif structKeyExists(arguments, "orderby") and len(arguments.orderBy)>
			ORDER BY #arguments.orderby#
		</cfif>
		</cfquery>
		
		<cfreturn qList />
	</cffunction>

	<cffunction name="getByAttributes" access="public" output="false" returntype="array">
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
		<cfargument name="orderby" type="string" required="false" />
		
		<cfset var qList = getByAttributesQuery(argumentCollection=arguments) />		
		<cfset var arrObjects = arrayNew(1) />
		<cfset var tmpObj = "" />
		<cfset var i = 0 />
		<cfloop from="1" to="#qList.recordCount#" index="i">
			<cfset tmpObj = createObject("component","departmentalPerformanceReview").init(argumentCollection=queryRowToStruct(qList,i)) />
			<cfset arrayAppend(arrObjects,tmpObj) />
		</cfloop>
				
		<cfreturn arrObjects />
	</cffunction>

	<cffunction name="queryRowToStruct" access="private" output="false" returntype="struct">
		<cfargument name="qry" type="query" required="true">
		
		<cfscript>
			/**
			 * Makes a row of a query into a structure.
			 * 
			 * @param query 	 The query to work with. 
			 * @param row 	 Row number to check. Defaults to row 1. 
			 * @return Returns a structure. 
			 * @author Nathan Dintenfass (nathan@changemedia.com) 
			 * @version 1, December 11, 2001 
			 */
			//by default, do this to the first row of the query
			var row = 1;
			//a var for looping
			var ii = 1;
			//the cols to loop over
			var cols = listToArray(qry.columnList);
			//the struct to return
			var stReturn = structnew();
			//if there is a second argument, use that for the row number
			if(arrayLen(arguments) GT 1)
				row = arguments[2];
			//loop over the cols and build the struct from the query row
			for(ii = 1; ii lte arraylen(cols); ii = ii + 1){
				stReturn[cols[ii]] = qry[cols[ii]][row];
			}		
			//return the struct
			return stReturn;
		</cfscript>
	</cffunction>

</cfcomponent>
