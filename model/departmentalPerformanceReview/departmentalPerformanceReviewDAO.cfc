
<cfcomponent displayname="departmentalPerformanceReviewDAO" hint="table ID column = ReviewID">

	<cffunction name="init" access="public" output="false" returntype="departmentalPerformanceReviewDAO">
		<cfargument name="dsn" type="string" required="true">
		<cfset variables.dsn = arguments.dsn>
		<cfreturn this>
	</cffunction>
	
	<cffunction name="create" access="public" output="false" returntype="boolean">
		<cfargument name="departmentalPerformanceReview" type="departmentalPerformanceReview" required="true" />

		<cfset var qCreate = "" />
		<cftry>
			<cfquery name="qCreate" datasource="#variables.dsn#">
				INSERT INTO DepartmentalPerformanceReview
					(
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
					)
				VALUES
					(
					<cfqueryparam value="#arguments.departmentalPerformanceReview.getReportingUnitID()#" CFSQLType="cf_sql_integer" />,
					<cfqueryparam value="#arguments.departmentalPerformanceReview.getReviewPeriod()#" CFSQLType="cf_sql_varchar" />,
					<cfqueryparam value="#arguments.departmentalPerformanceReview.getReviewStatus()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.departmentalPerformanceReview.getReviewStatus())#" />,
					<cfqueryparam value="#arguments.departmentalPerformanceReview.getDeanReviewedDDI()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.departmentalPerformanceReview.getDeanReviewedDDI())#" />,
					<cfqueryparam value="#arguments.departmentalPerformanceReview.getDeanReviewedAssessmentPlans()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.departmentalPerformanceReview.getDeanReviewedAssessmentPlans())#" />,
					<cfqueryparam value="#arguments.departmentalPerformanceReview.getFacultyReview()#" CFSQLType="cf_sql_longvarchar" null="#not len(arguments.departmentalPerformanceReview.getFacultyReview())#" />,
					<cfqueryparam value="#arguments.departmentalPerformanceReview.getCoursesReview()#" CFSQLType="cf_sql_longvarchar" null="#not len(arguments.departmentalPerformanceReview.getCoursesReview())#" />,
					<cfqueryparam value="#arguments.departmentalPerformanceReview.getStudentsReview()#" CFSQLType="cf_sql_longvarchar" null="#not len(arguments.departmentalPerformanceReview.getStudentsReview())#" />,
					<cfqueryparam value="#arguments.departmentalPerformanceReview.getFTEDegreesReview()#" CFSQLType="cf_sql_longvarchar" null="#not len(arguments.departmentalPerformanceReview.getFTEDegreesReview())#" />,
					<cfqueryparam value="#arguments.departmentalPerformanceReview.getStudentFeedbackReview()#" CFSQLType="cf_sql_longvarchar" null="#not len(arguments.departmentalPerformanceReview.getStudentFeedbackReview())#" />,
					<cfqueryparam value="#arguments.departmentalPerformanceReview.getExaminedScorecard()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.departmentalPerformanceReview.getExaminedScorecard())#" />,
					<cfqueryparam value="#arguments.departmentalPerformanceReview.getAssessmentResultsEntered()#" CFSQLType="cf_sql_longvarchar" null="#not len(arguments.departmentalPerformanceReview.getAssessmentResultsEntered())#" />,
					<cfqueryparam value="#arguments.departmentalPerformanceReview.getResultsForImprovement()#" CFSQLType="cf_sql_longvarchar" null="#not len(arguments.departmentalPerformanceReview.getResultsForImprovement())#" />,
					<cfqueryparam value="#arguments.departmentalPerformanceReview.getDeansEvalInstruction()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.departmentalPerformanceReview.getDeansEvalInstruction())#" />,
					<cfqueryparam value="#arguments.departmentalPerformanceReview.getCommentsInstruction()#" CFSQLType="cf_sql_longvarchar" null="#not len(arguments.departmentalPerformanceReview.getCommentsInstruction())#" />,
					<cfqueryparam value="#arguments.departmentalPerformanceReview.getFundedResearchReview()#" CFSQLType="cf_sql_longvarchar" null="#not len(arguments.departmentalPerformanceReview.getFundedResearchReview())#" />,
					<cfqueryparam value="#arguments.departmentalPerformanceReview.getCreativeScholarlyReview()#" CFSQLType="cf_sql_longvarchar" null="#not len(arguments.departmentalPerformanceReview.getCreativeScholarlyReview())#" />,
					<cfqueryparam value="#arguments.departmentalPerformanceReview.getResearchGoalsEntered()#" CFSQLType="cf_sql_longvarchar" null="#not len(arguments.departmentalPerformanceReview.getResearchGoalsEntered())#" />,
					<cfqueryparam value="#arguments.departmentalPerformanceReview.getResearchGoalsMet()#" CFSQLType="cf_sql_longvarchar" null="#not len(arguments.departmentalPerformanceReview.getResearchGoalsMet())#" />,
					<cfqueryparam value="#arguments.departmentalPerformanceReview.getDeansEvalResearch()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.departmentalPerformanceReview.getDeansEvalResearch())#" />,
					<cfqueryparam value="#arguments.departmentalPerformanceReview.getCommentsResearch()#" CFSQLType="cf_sql_longvarchar" null="#not len(arguments.departmentalPerformanceReview.getCommentsResearch())#" />,
					<cfqueryparam value="#arguments.departmentalPerformanceReview.getServiceReview()#" CFSQLType="cf_sql_longvarchar" null="#not len(arguments.departmentalPerformanceReview.getServiceReview())#" />,
					<cfqueryparam value="#arguments.departmentalPerformanceReview.getServiceGoalsEntered()#" CFSQLType="cf_sql_longvarchar" null="#not len(arguments.departmentalPerformanceReview.getServiceGoalsEntered())#" />,
					<cfqueryparam value="#arguments.departmentalPerformanceReview.getServiceGoalsMet()#" CFSQLType="cf_sql_longvarchar" null="#not len(arguments.departmentalPerformanceReview.getServiceGoalsMet())#" />,
					<cfqueryparam value="#arguments.departmentalPerformanceReview.getDeansEvalService()#" CFSQLType="cf_sql_longvarchar" null="#not len(arguments.departmentalPerformanceReview.getDeansEvalService())#" />,
					<cfqueryparam value="#arguments.departmentalPerformanceReview.getCommentsService()#" CFSQLType="cf_sql_longvarchar" null="#not len(arguments.departmentalPerformanceReview.getCommentsService())#" />,
					<cfqueryparam value="#arguments.departmentalPerformanceReview.getSummaryComments()#" CFSQLType="cf_sql_longvarchar" null="#not len(arguments.departmentalPerformanceReview.getSummaryComments())#" />,
					<cfqueryparam value="#arguments.departmentalPerformanceReview.getNewInitiatives()#" CFSQLType="cf_sql_longvarchar" null="#not len(arguments.departmentalPerformanceReview.getNewInitiatives())#" />,
					<cfqueryparam value="#arguments.departmentalPerformanceReview.getActivityDate()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.departmentalPerformanceReview.getActivityDate())#" />
					)
			</cfquery>
			<cfcatch type="database">
				<cfreturn false />
			</cfcatch>
		</cftry>
		<cfreturn true />
	</cffunction>

	<cffunction name="read" access="public" output="false" returntype="void">
		<cfargument name="departmentalPerformanceReview" type="departmentalPerformanceReview" required="true" />

		<cfset var qRead = "" />
		<cfset var strReturn = structNew() />
		<cftry>
			<cfquery name="qRead" datasource="#variables.dsn#">
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
				WHERE	ReviewID = <cfqueryparam value="#arguments.departmentalPerformanceReview.getReviewID()#" CFSQLType="cf_sql_integer" />
			</cfquery>
			<cfcatch type="database">
				<!--- leave the bean as is and set an empty query for the conditional logic below --->
				<cfset qRead = queryNew("id") />
			</cfcatch>
		</cftry>
		<cfif qRead.recordCount>
			<cfset strReturn = queryRowToStruct(qRead)>
			<cfset arguments.departmentalPerformanceReview.init(argumentCollection=strReturn)>
		</cfif>
	</cffunction>

	<cffunction name="update" access="public" output="false" returntype="boolean">
		<cfargument name="departmentalPerformanceReview" type="departmentalPerformanceReview" required="true" />

		<cfset var qUpdate = "" />
		<!--- <cftry>--->
			<cfquery name="qUpdate" datasource="#variables.dsn#">
				UPDATE	DepartmentalPerformanceReview
				SET
					ReportingUnitID = <cfqueryparam value="#arguments.departmentalPerformanceReview.getReportingUnitID()#" CFSQLType="cf_sql_integer" />,
					ReviewPeriod = <cfqueryparam value="#arguments.departmentalPerformanceReview.getReviewPeriod()#" CFSQLType="cf_sql_varchar" />,
					ReviewStatus = <cfqueryparam value="#arguments.departmentalPerformanceReview.getReviewStatus()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.departmentalPerformanceReview.getReviewStatus())#" />,
					DeanReviewedDDI = <cfqueryparam value="#arguments.departmentalPerformanceReview.getDeanReviewedDDI()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.departmentalPerformanceReview.getDeanReviewedDDI())#" />,
					DeanReviewedAssessmentPlans = <cfqueryparam value="#arguments.departmentalPerformanceReview.getDeanReviewedAssessmentPlans()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.departmentalPerformanceReview.getDeanReviewedAssessmentPlans())#" />,
					FacultyReview = <cfqueryparam value="#arguments.departmentalPerformanceReview.getFacultyReview()#" CFSQLType="cf_sql_longvarchar" null="#not len(arguments.departmentalPerformanceReview.getFacultyReview())#" />,
					CoursesReview = <cfqueryparam value="#arguments.departmentalPerformanceReview.getCoursesReview()#" CFSQLType="cf_sql_longvarchar" null="#not len(arguments.departmentalPerformanceReview.getCoursesReview())#" />,
					StudentsReview = <cfqueryparam value="#arguments.departmentalPerformanceReview.getStudentsReview()#" CFSQLType="cf_sql_longvarchar" null="#not len(arguments.departmentalPerformanceReview.getStudentsReview())#" />,
					FTEDegreesReview = <cfqueryparam value="#arguments.departmentalPerformanceReview.getFTEDegreesReview()#" CFSQLType="cf_sql_longvarchar" null="#not len(arguments.departmentalPerformanceReview.getFTEDegreesReview())#" />,
					StudentFeedbackReview = <cfqueryparam value="#arguments.departmentalPerformanceReview.getStudentFeedbackReview()#" CFSQLType="cf_sql_longvarchar" null="#not len(arguments.departmentalPerformanceReview.getStudentFeedbackReview())#" />,
					ExaminedScorecard = <cfqueryparam value="#arguments.departmentalPerformanceReview.getExaminedScorecard()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.departmentalPerformanceReview.getExaminedScorecard())#" />,
					AssessmentResultsEntered = <cfqueryparam value="#arguments.departmentalPerformanceReview.getAssessmentResultsEntered()#" CFSQLType="cf_sql_longvarchar" null="#not len(arguments.departmentalPerformanceReview.getAssessmentResultsEntered())#" />,
					ResultsForImprovement = <cfqueryparam value="#arguments.departmentalPerformanceReview.getResultsForImprovement()#" CFSQLType="cf_sql_longvarchar" null="#not len(arguments.departmentalPerformanceReview.getResultsForImprovement())#" />,
					DeansEvalInstruction = <cfqueryparam value="#arguments.departmentalPerformanceReview.getDeansEvalInstruction()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.departmentalPerformanceReview.getDeansEvalInstruction())#" />,
					CommentsInstruction = <cfqueryparam value="#arguments.departmentalPerformanceReview.getCommentsInstruction()#" CFSQLType="cf_sql_longvarchar" null="#not len(arguments.departmentalPerformanceReview.getCommentsInstruction())#" />,
					FundedResearchReview = <cfqueryparam value="#arguments.departmentalPerformanceReview.getFundedResearchReview()#" CFSQLType="cf_sql_longvarchar" null="#not len(arguments.departmentalPerformanceReview.getFundedResearchReview())#" />,
					CreativeScholarlyReview = <cfqueryparam value="#arguments.departmentalPerformanceReview.getCreativeScholarlyReview()#" CFSQLType="cf_sql_longvarchar" null="#not len(arguments.departmentalPerformanceReview.getCreativeScholarlyReview())#" />,
					ResearchGoalsEntered = <cfqueryparam value="#arguments.departmentalPerformanceReview.getResearchGoalsEntered()#" CFSQLType="cf_sql_longvarchar" null="#not len(arguments.departmentalPerformanceReview.getResearchGoalsEntered())#" />,
					ResearchGoalsMet = <cfqueryparam value="#arguments.departmentalPerformanceReview.getResearchGoalsMet()#" CFSQLType="cf_sql_longvarchar" null="#not len(arguments.departmentalPerformanceReview.getResearchGoalsMet())#" />,
					DeansEvalResearch = <cfqueryparam value="#arguments.departmentalPerformanceReview.getDeansEvalResearch()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.departmentalPerformanceReview.getDeansEvalResearch())#" />,
					CommentsResearch = <cfqueryparam value="#arguments.departmentalPerformanceReview.getCommentsResearch()#" CFSQLType="cf_sql_longvarchar" null="#not len(arguments.departmentalPerformanceReview.getCommentsResearch())#" />,
					ServiceReview = <cfqueryparam value="#arguments.departmentalPerformanceReview.getServiceReview()#" CFSQLType="cf_sql_longvarchar" null="#not len(arguments.departmentalPerformanceReview.getServiceReview())#" />,
					ServiceGoalsEntered = <cfqueryparam value="#arguments.departmentalPerformanceReview.getServiceGoalsEntered()#" CFSQLType="cf_sql_longvarchar" null="#not len(arguments.departmentalPerformanceReview.getServiceGoalsEntered())#" />,
					ServiceGoalsMet = <cfqueryparam value="#arguments.departmentalPerformanceReview.getServiceGoalsMet()#" CFSQLType="cf_sql_longvarchar" null="#not len(arguments.departmentalPerformanceReview.getServiceGoalsMet())#" />,
					DeansEvalService = <cfqueryparam value="#arguments.departmentalPerformanceReview.getDeansEvalService()#" CFSQLType="cf_sql_longvarchar" null="#not len(arguments.departmentalPerformanceReview.getDeansEvalService())#" />,
					CommentsService = <cfqueryparam value="#arguments.departmentalPerformanceReview.getCommentsService()#" CFSQLType="cf_sql_longvarchar" null="#not len(arguments.departmentalPerformanceReview.getCommentsService())#" />,
					SummaryComments = <cfqueryparam value="#arguments.departmentalPerformanceReview.getSummaryComments()#" CFSQLType="cf_sql_longvarchar" null="#not len(arguments.departmentalPerformanceReview.getSummaryComments())#" />,
					NewInitiatives = <cfqueryparam value="#arguments.departmentalPerformanceReview.getNewInitiatives()#" CFSQLType="cf_sql_longvarchar" null="#not len(arguments.departmentalPerformanceReview.getNewInitiatives())#" />,
					ActivityDate = <cfqueryparam value="#arguments.departmentalPerformanceReview.getActivityDate()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.departmentalPerformanceReview.getActivityDate())#" />
				WHERE	ReviewID = <cfqueryparam value="#arguments.departmentalPerformanceReview.getReviewID()#" CFSQLType="cf_sql_integer" />
			</cfquery>
			<!--- 
			<cfcatch type="database">
				<cfreturn false />
			</cfcatch>
		</cftry>--->
		<cfreturn true />
	</cffunction>

	<cffunction name="delete" access="public" output="false" returntype="boolean">
		<cfargument name="departmentalPerformanceReview" type="departmentalPerformanceReview" required="true" />

		<cfset var qDelete = "">
		<cftry>
			<cfquery name="qDelete" datasource="#variables.dsn#">
				DELETE FROM	DepartmentalPerformanceReview 
				WHERE	ReviewID = <cfqueryparam value="#arguments.departmentalPerformanceReview.getReviewID()#" CFSQLType="cf_sql_integer" />
			</cfquery>
			<cfcatch type="database">
				<cfreturn false />
			</cfcatch>
		</cftry>
		<cfreturn true />
	</cffunction>

	<cffunction name="exists" access="public" output="false" returntype="boolean">
		<cfargument name="departmentalPerformanceReview" type="departmentalPerformanceReview" required="true" />

		<cfset var qExists = "">
		<cfquery name="qExists" datasource="#variables.dsn#" maxrows="1">
			SELECT count(1) as idexists
			FROM	DepartmentalPerformanceReview
			WHERE	ReviewID = <cfqueryparam value="#arguments.departmentalPerformanceReview.getReviewID()#" CFSQLType="cf_sql_integer" />
		</cfquery>

		<cfif qExists.idexists>
			<cfreturn true />
		<cfelse>
			<cfreturn false />
		</cfif>
	</cffunction>

	<cffunction name="save" access="public" output="false" returntype="boolean">
		<cfargument name="departmentalPerformanceReview" type="departmentalPerformanceReview" required="true" />
		
		<cfset var success = false />
		<cfif exists(arguments.departmentalPerformanceReview)>
			<cfset success = update(arguments.departmentalPerformanceReview) />
		<cfelse>
			<cfset success = create(arguments.departmentalPerformanceReview) />
		</cfif>
		
		<cfreturn success />
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
