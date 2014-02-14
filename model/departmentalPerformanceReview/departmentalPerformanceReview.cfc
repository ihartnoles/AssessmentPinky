
<cfcomponent displayname="departmentalPerformanceReview" output="false">
		<cfproperty name="ReviewID" type="numeric" default="" />
		<cfproperty name="ReportingUnitID" type="numeric" default="" />
		<cfproperty name="ReviewPeriod" type="string" default="" />
		<cfproperty name="ReviewStatus" type="string" default="" />
		<cfproperty name="DeanReviewedDDI" type="string" default="" />
		<cfproperty name="DeanReviewedAssessmentPlans" type="string" default="" />
		<cfproperty name="FacultyReview" type="string" default="" />
		<cfproperty name="CoursesReview" type="string" default="" />
		<cfproperty name="StudentsReview" type="string" default="" />
		<cfproperty name="FTEDegreesReview" type="string" default="" />
		<cfproperty name="StudentFeedbackReview" type="string" default="" />
		<cfproperty name="ExaminedScorecard" type="string" default="" />
		<cfproperty name="AssessmentResultsEntered" type="string" default="" />
		<cfproperty name="ResultsForImprovement" type="string" default="" />
		<cfproperty name="DeansEvalInstruction" type="string" default="" />
		<cfproperty name="CommentsInstruction" type="string" default="" />
		<cfproperty name="FundedResearchReview" type="string" default="" />
		<cfproperty name="CreativeScholarlyReview" type="string" default="" />
		<cfproperty name="ResearchGoalsEntered" type="string" default="" />
		<cfproperty name="ResearchGoalsMet" type="string" default="" />
		<cfproperty name="DeansEvalResearch" type="string" default="" />
		<cfproperty name="CommentsResearch" type="string" default="" />
		<cfproperty name="ServiceReview" type="string" default="" />
		<cfproperty name="ServiceGoalsEntered" type="string" default="" />
		<cfproperty name="ServiceGoalsMet" type="string" default="" />
		<cfproperty name="DeansEvalService" type="string" default="" />
		<cfproperty name="CommentsService" type="string" default="" />
		<cfproperty name="SummaryComments" type="string" default="" />
		<cfproperty name="NewInitiatives" type="string" default="" />
		<cfproperty name="ActivityDate" type="date" default="" />
		
	<!---
	PROPERTIES
	--->
	<cfset variables.instance = StructNew() />

	<!---
	INITIALIZATION / CONFIGURATION
	--->
	<cffunction name="init" access="public" returntype="departmentalPerformanceReview" output="false">
		<cfargument name="ReviewID" type="string" required="false" default="" />
		<cfargument name="ReportingUnitID" type="string" required="false" default="" />
		<cfargument name="ReviewPeriod" type="string" required="false" default="" />
		<cfargument name="ReviewStatus" type="string" required="false" default="" />
		<cfargument name="DeanReviewedDDI" type="string" required="false" default="" />
		<cfargument name="DeanReviewedAssessmentPlans" type="string" required="false" default="" />
		<cfargument name="FacultyReview" type="string" required="false" default="" />
		<cfargument name="CoursesReview" type="string" required="false" default="" />
		<cfargument name="StudentsReview" type="string" required="false" default="" />
		<cfargument name="FTEDegreesReview" type="string" required="false" default="" />
		<cfargument name="StudentFeedbackReview" type="string" required="false" default="" />
		<cfargument name="ExaminedScorecard" type="string" required="false" default="" />
		<cfargument name="AssessmentResultsEntered" type="string" required="false" default="" />
		<cfargument name="ResultsForImprovement" type="string" required="false" default="" />
		<cfargument name="DeansEvalInstruction" type="string" required="false" default="" />
		<cfargument name="CommentsInstruction" type="string" required="false" default="" />
		<cfargument name="FundedResearchReview" type="string" required="false" default="" />
		<cfargument name="CreativeScholarlyReview" type="string" required="false" default="" />
		<cfargument name="ResearchGoalsEntered" type="string" required="false" default="" />
		<cfargument name="ResearchGoalsMet" type="string" required="false" default="" />
		<cfargument name="DeansEvalResearch" type="string" required="false" default="" />
		<cfargument name="CommentsResearch" type="string" required="false" default="" />
		<cfargument name="ServiceReview" type="string" required="false" default="" />
		<cfargument name="ServiceGoalsEntered" type="string" required="false" default="" />
		<cfargument name="ServiceGoalsMet" type="string" required="false" default="" />
		<cfargument name="DeansEvalService" type="string" required="false" default="" />
		<cfargument name="CommentsService" type="string" required="false" default="" />
		<cfargument name="SummaryComments" type="string" required="false" default="" />
		<cfargument name="NewInitiatives" type="string" required="false" default="" />
		<cfargument name="ActivityDate" type="string" required="false" default="" />
		
		<!--- run setters --->
		<cfset setReviewID(arguments.ReviewID) />
		<cfset setReportingUnitID(arguments.ReportingUnitID) />
		<cfset setReviewPeriod(arguments.ReviewPeriod) />
		<cfset setReviewStatus(arguments.ReviewStatus) />
		<cfset setDeanReviewedDDI(arguments.DeanReviewedDDI) />
		<cfset setDeanReviewedAssessmentPlans(arguments.DeanReviewedAssessmentPlans) />
		<cfset setFacultyReview(arguments.FacultyReview) />
		<cfset setCoursesReview(arguments.CoursesReview) />
		<cfset setStudentsReview(arguments.StudentsReview) />
		<cfset setFTEDegreesReview(arguments.FTEDegreesReview) />
		<cfset setStudentFeedbackReview(arguments.StudentFeedbackReview) />
		<cfset setExaminedScorecard(arguments.ExaminedScorecard) />
		<cfset setAssessmentResultsEntered(arguments.AssessmentResultsEntered) />
		<cfset setResultsForImprovement(arguments.ResultsForImprovement) />
		<cfset setDeansEvalInstruction(arguments.DeansEvalInstruction) />
		<cfset setCommentsInstruction(arguments.CommentsInstruction) />
		<cfset setFundedResearchReview(arguments.FundedResearchReview) />
		<cfset setCreativeScholarlyReview(arguments.CreativeScholarlyReview) />
		<cfset setResearchGoalsEntered(arguments.ResearchGoalsEntered) />
		<cfset setResearchGoalsMet(arguments.ResearchGoalsMet) />
		<cfset setDeansEvalResearch(arguments.DeansEvalResearch) />
		<cfset setCommentsResearch(arguments.CommentsResearch) />
		<cfset setServiceReview(arguments.ServiceReview) />
		<cfset setServiceGoalsEntered(arguments.ServiceGoalsEntered) />
		<cfset setServiceGoalsMet(arguments.ServiceGoalsMet) />
		<cfset setDeansEvalService(arguments.DeansEvalService) />
		<cfset setCommentsService(arguments.CommentsService) />
		<cfset setSummaryComments(arguments.SummaryComments) />
		<cfset setNewInitiatives(arguments.NewInitiatives) />
		<cfset setActivityDate(arguments.ActivityDate) />
		
		<cfreturn this />
 	</cffunction>

	<!---
	PUBLIC FUNCTIONS
	--->
	<cffunction name="setMemento" access="public" returntype="departmentalPerformanceReview" output="false">
		<cfargument name="memento" type="struct" required="yes"/>
		<cfset variables.instance = arguments.memento />
		<cfreturn this />
	</cffunction>
	<cffunction name="getMemento" access="public" returntype="struct" output="false" >
		<cfreturn variables.instance />
	</cffunction>

	<cffunction name="validate" access="public" returntype="array" output="false">
		<cfset var errors = arrayNew(1) />
		<cfset var thisError = structNew() />
		
		<!--- ReviewID --->
		<cfif (len(trim(getReviewID())) AND NOT isNumeric(trim(getReviewID())))>
			<cfset thisError.field = "ReviewID" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "ReviewID is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- ReportingUnitID --->
		<cfif (NOT len(trim(getReportingUnitID())))>
			<cfset thisError.field = "ReportingUnitID" />
			<cfset thisError.type = "required" />
			<cfset thisError.message = "ReportingUnitID is required" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getReportingUnitID())) AND NOT isNumeric(trim(getReportingUnitID())))>
			<cfset thisError.field = "ReportingUnitID" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "ReportingUnitID is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- ReviewPeriod --->
		<cfif (NOT len(trim(getReviewPeriod())))>
			<cfset thisError.field = "ReviewPeriod" />
			<cfset thisError.type = "required" />
			<cfset thisError.message = "ReviewPeriod is required" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getReviewPeriod())) AND NOT IsSimpleValue(trim(getReviewPeriod())))>
			<cfset thisError.field = "ReviewPeriod" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "ReviewPeriod is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getReviewPeriod())) GT 9)>
			<cfset thisError.field = "ReviewPeriod" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "ReviewPeriod is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- ReviewStatus --->
		<cfif (len(trim(getReviewStatus())) AND NOT IsSimpleValue(trim(getReviewStatus())))>
			<cfset thisError.field = "ReviewStatus" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "ReviewStatus is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getReviewStatus())) GT 20)>
			<cfset thisError.field = "ReviewStatus" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "ReviewStatus is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- DeanReviewedDDI --->
		<cfif (len(trim(getDeanReviewedDDI())) AND NOT IsSimpleValue(trim(getDeanReviewedDDI())))>
			<cfset thisError.field = "DeanReviewedDDI" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "DeanReviewedDDI is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getDeanReviewedDDI())) GT 1)>
			<cfset thisError.field = "DeanReviewedDDI" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "DeanReviewedDDI is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- DeanReviewedAssessmentPlans --->
		<cfif (len(trim(getDeanReviewedAssessmentPlans())) AND NOT IsSimpleValue(trim(getDeanReviewedAssessmentPlans())))>
			<cfset thisError.field = "DeanReviewedAssessmentPlans" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "DeanReviewedAssessmentPlans is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getDeanReviewedAssessmentPlans())) GT 1)>
			<cfset thisError.field = "DeanReviewedAssessmentPlans" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "DeanReviewedAssessmentPlans is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- FacultyReview --->
		<cfif (len(trim(getFacultyReview())) AND NOT IsSimpleValue(trim(getFacultyReview())))>
			<cfset thisError.field = "FacultyReview" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "FacultyReview is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getFacultyReview())) GT 2147483647)>
			<cfset thisError.field = "FacultyReview" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "FacultyReview is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- CoursesReview --->
		<cfif (len(trim(getCoursesReview())) AND NOT IsSimpleValue(trim(getCoursesReview())))>
			<cfset thisError.field = "CoursesReview" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "CoursesReview is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getCoursesReview())) GT 2147483647)>
			<cfset thisError.field = "CoursesReview" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "CoursesReview is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- StudentsReview --->
		<cfif (len(trim(getStudentsReview())) AND NOT IsSimpleValue(trim(getStudentsReview())))>
			<cfset thisError.field = "StudentsReview" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "StudentsReview is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getStudentsReview())) GT 2147483647)>
			<cfset thisError.field = "StudentsReview" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "StudentsReview is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- FTEDegreesReview --->
		<cfif (len(trim(getFTEDegreesReview())) AND NOT IsSimpleValue(trim(getFTEDegreesReview())))>
			<cfset thisError.field = "FTEDegreesReview" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "FTEDegreesReview is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getFTEDegreesReview())) GT 2147483647)>
			<cfset thisError.field = "FTEDegreesReview" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "FTEDegreesReview is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- StudentFeedbackReview --->
		<cfif (len(trim(getStudentFeedbackReview())) AND NOT IsSimpleValue(trim(getStudentFeedbackReview())))>
			<cfset thisError.field = "StudentFeedbackReview" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "StudentFeedbackReview is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getStudentFeedbackReview())) GT 2147483647)>
			<cfset thisError.field = "StudentFeedbackReview" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "StudentFeedbackReview is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- ExaminedScorecard --->
		<cfif (len(trim(getExaminedScorecard())) AND NOT IsSimpleValue(trim(getExaminedScorecard())))>
			<cfset thisError.field = "ExaminedScorecard" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "ExaminedScorecard is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getExaminedScorecard())) GT 2)>
			<cfset thisError.field = "ExaminedScorecard" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "ExaminedScorecard is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- AssessmentResultsEntered --->
		<cfif (len(trim(getAssessmentResultsEntered())) AND NOT IsSimpleValue(trim(getAssessmentResultsEntered())))>
			<cfset thisError.field = "AssessmentResultsEntered" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "AssessmentResultsEntered is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getAssessmentResultsEntered())) GT 2147483647)>
			<cfset thisError.field = "AssessmentResultsEntered" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "AssessmentResultsEntered is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- ResultsForImprovement --->
		<cfif (len(trim(getResultsForImprovement())) AND NOT IsSimpleValue(trim(getResultsForImprovement())))>
			<cfset thisError.field = "ResultsForImprovement" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "ResultsForImprovement is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getResultsForImprovement())) GT 2147483647)>
			<cfset thisError.field = "ResultsForImprovement" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "ResultsForImprovement is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- DeansEvalInstruction --->
		<cfif (len(trim(getDeansEvalInstruction())) AND NOT IsSimpleValue(trim(getDeansEvalInstruction())))>
			<cfset thisError.field = "DeansEvalInstruction" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "DeansEvalInstruction is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getDeansEvalInstruction())) GT 2)>
			<cfset thisError.field = "DeansEvalInstruction" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "DeansEvalInstruction is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- CommentsInstruction --->
		<cfif (len(trim(getCommentsInstruction())) AND NOT IsSimpleValue(trim(getCommentsInstruction())))>
			<cfset thisError.field = "CommentsInstruction" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "CommentsInstruction is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getCommentsInstruction())) GT 2147483647)>
			<cfset thisError.field = "CommentsInstruction" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "CommentsInstruction is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- FundedResearchReview --->
		<cfif (len(trim(getFundedResearchReview())) AND NOT IsSimpleValue(trim(getFundedResearchReview())))>
			<cfset thisError.field = "FundedResearchReview" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "FundedResearchReview is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getFundedResearchReview())) GT 2147483647)>
			<cfset thisError.field = "FundedResearchReview" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "FundedResearchReview is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- CreativeScholarlyReview --->
		<cfif (len(trim(getCreativeScholarlyReview())) AND NOT IsSimpleValue(trim(getCreativeScholarlyReview())))>
			<cfset thisError.field = "CreativeScholarlyReview" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "CreativeScholarlyReview is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getCreativeScholarlyReview())) GT 2147483647)>
			<cfset thisError.field = "CreativeScholarlyReview" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "CreativeScholarlyReview is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- ResearchGoalsEntered --->
		<cfif (len(trim(getResearchGoalsEntered())) AND NOT IsSimpleValue(trim(getResearchGoalsEntered())))>
			<cfset thisError.field = "ResearchGoalsEntered" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "ResearchGoalsEntered is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getResearchGoalsEntered())) GT 2147483647)>
			<cfset thisError.field = "ResearchGoalsEntered" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "ResearchGoalsEntered is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- ResearchGoalsMet --->
		<cfif (len(trim(getResearchGoalsMet())) AND NOT IsSimpleValue(trim(getResearchGoalsMet())))>
			<cfset thisError.field = "ResearchGoalsMet" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "ResearchGoalsMet is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getResearchGoalsMet())) GT 2147483647)>
			<cfset thisError.field = "ResearchGoalsMet" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "ResearchGoalsMet is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- DeansEvalResearch --->
		<cfif (len(trim(getDeansEvalResearch())) AND NOT IsSimpleValue(trim(getDeansEvalResearch())))>
			<cfset thisError.field = "DeansEvalResearch" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "DeansEvalResearch is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getDeansEvalResearch())) GT 2)>
			<cfset thisError.field = "DeansEvalResearch" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "DeansEvalResearch is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- CommentsResearch --->
		<cfif (len(trim(getCommentsResearch())) AND NOT IsSimpleValue(trim(getCommentsResearch())))>
			<cfset thisError.field = "CommentsResearch" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "CommentsResearch is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getCommentsResearch())) GT 2147483647)>
			<cfset thisError.field = "CommentsResearch" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "CommentsResearch is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- ServiceReview --->
		<cfif (len(trim(getServiceReview())) AND NOT IsSimpleValue(trim(getServiceReview())))>
			<cfset thisError.field = "ServiceReview" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "ServiceReview is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getServiceReview())) GT 2147483647)>
			<cfset thisError.field = "ServiceReview" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "ServiceReview is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- ServiceGoalsEntered --->
		<cfif (len(trim(getServiceGoalsEntered())) AND NOT IsSimpleValue(trim(getServiceGoalsEntered())))>
			<cfset thisError.field = "ServiceGoalsEntered" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "ServiceGoalsEntered is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getServiceGoalsEntered())) GT 2147483647)>
			<cfset thisError.field = "ServiceGoalsEntered" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "ServiceGoalsEntered is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- ServiceGoalsMet --->
		<cfif (len(trim(getServiceGoalsMet())) AND NOT IsSimpleValue(trim(getServiceGoalsMet())))>
			<cfset thisError.field = "ServiceGoalsMet" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "ServiceGoalsMet is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getServiceGoalsMet())) GT 2147483647)>
			<cfset thisError.field = "ServiceGoalsMet" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "ServiceGoalsMet is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- DeansEvalService --->
		<cfif (len(trim(getDeansEvalService())) AND NOT IsSimpleValue(trim(getDeansEvalService())))>
			<cfset thisError.field = "DeansEvalService" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "DeansEvalService is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getDeansEvalService())) GT 2147483647)>
			<cfset thisError.field = "DeansEvalService" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "DeansEvalService is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- CommentsService --->
		<cfif (len(trim(getCommentsService())) AND NOT IsSimpleValue(trim(getCommentsService())))>
			<cfset thisError.field = "CommentsService" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "CommentsService is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getCommentsService())) GT 2147483647)>
			<cfset thisError.field = "CommentsService" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "CommentsService is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- SummaryComments --->
		<cfif (len(trim(getSummaryComments())) AND NOT IsSimpleValue(trim(getSummaryComments())))>
			<cfset thisError.field = "SummaryComments" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "SummaryComments is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getSummaryComments())) GT 2147483647)>
			<cfset thisError.field = "SummaryComments" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "SummaryComments is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- NewInitiatives --->
		<cfif (len(trim(getNewInitiatives())) AND NOT IsSimpleValue(trim(getNewInitiatives())))>
			<cfset thisError.field = "NewInitiatives" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "NewInitiatives is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getNewInitiatives())) GT 2147483647)>
			<cfset thisError.field = "NewInitiatives" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "NewInitiatives is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- ActivityDate --->
		<cfif (len(trim(getActivityDate())) AND NOT isDate(trim(getActivityDate())))>
			<cfset thisError.field = "ActivityDate" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "ActivityDate is not a date" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<cfreturn errors />
	</cffunction>

	<!---
	ACCESSORS
	--->
	<cffunction name="setReviewID" access="public" returntype="void" output="false">
		<cfargument name="ReviewID" type="string" required="true" />
		<cfset variables.instance.ReviewID = arguments.ReviewID />
	</cffunction>
	<cffunction name="getReviewID" access="public" returntype="string" output="false">
		<cfreturn variables.instance.ReviewID />
	</cffunction>

	<cffunction name="setReportingUnitID" access="public" returntype="void" output="false">
		<cfargument name="ReportingUnitID" type="string" required="true" />
		<cfset variables.instance.ReportingUnitID = arguments.ReportingUnitID />
	</cffunction>
	<cffunction name="getReportingUnitID" access="public" returntype="string" output="false">
		<cfreturn variables.instance.ReportingUnitID />
	</cffunction>

	<cffunction name="setReviewPeriod" access="public" returntype="void" output="false">
		<cfargument name="ReviewPeriod" type="string" required="true" />
		<cfset variables.instance.ReviewPeriod = arguments.ReviewPeriod />
	</cffunction>
	<cffunction name="getReviewPeriod" access="public" returntype="string" output="false">
		<cfreturn variables.instance.ReviewPeriod />
	</cffunction>

	<cffunction name="setReviewStatus" access="public" returntype="void" output="false">
		<cfargument name="ReviewStatus" type="string" required="true" />
		<cfset variables.instance.ReviewStatus = arguments.ReviewStatus />
	</cffunction>
	<cffunction name="getReviewStatus" access="public" returntype="string" output="false">
		<cfreturn variables.instance.ReviewStatus />
	</cffunction>

	<cffunction name="setDeanReviewedDDI" access="public" returntype="void" output="false">
		<cfargument name="DeanReviewedDDI" type="string" required="true" />
		<cfset variables.instance.DeanReviewedDDI = arguments.DeanReviewedDDI />
	</cffunction>
	<cffunction name="getDeanReviewedDDI" access="public" returntype="string" output="false">
		<cfreturn variables.instance.DeanReviewedDDI />
	</cffunction>

	<cffunction name="setDeanReviewedAssessmentPlans" access="public" returntype="void" output="false">
		<cfargument name="DeanReviewedAssessmentPlans" type="string" required="true" />
		<cfset variables.instance.DeanReviewedAssessmentPlans = arguments.DeanReviewedAssessmentPlans />
	</cffunction>
	<cffunction name="getDeanReviewedAssessmentPlans" access="public" returntype="string" output="false">
		<cfreturn variables.instance.DeanReviewedAssessmentPlans />
	</cffunction>

	<cffunction name="setFacultyReview" access="public" returntype="void" output="false">
		<cfargument name="FacultyReview" type="string" required="true" />
		<cfset variables.instance.FacultyReview = arguments.FacultyReview />
	</cffunction>
	<cffunction name="getFacultyReview" access="public" returntype="string" output="false">
		<cfreturn variables.instance.FacultyReview />
	</cffunction>

	<cffunction name="setCoursesReview" access="public" returntype="void" output="false">
		<cfargument name="CoursesReview" type="string" required="true" />
		<cfset variables.instance.CoursesReview = arguments.CoursesReview />
	</cffunction>
	<cffunction name="getCoursesReview" access="public" returntype="string" output="false">
		<cfreturn variables.instance.CoursesReview />
	</cffunction>

	<cffunction name="setStudentsReview" access="public" returntype="void" output="false">
		<cfargument name="StudentsReview" type="string" required="true" />
		<cfset variables.instance.StudentsReview = arguments.StudentsReview />
	</cffunction>
	<cffunction name="getStudentsReview" access="public" returntype="string" output="false">
		<cfreturn variables.instance.StudentsReview />
	</cffunction>

	<cffunction name="setFTEDegreesReview" access="public" returntype="void" output="false">
		<cfargument name="FTEDegreesReview" type="string" required="true" />
		<cfset variables.instance.FTEDegreesReview = arguments.FTEDegreesReview />
	</cffunction>
	<cffunction name="getFTEDegreesReview" access="public" returntype="string" output="false">
		<cfreturn variables.instance.FTEDegreesReview />
	</cffunction>

	<cffunction name="setStudentFeedbackReview" access="public" returntype="void" output="false">
		<cfargument name="StudentFeedbackReview" type="string" required="true" />
		<cfset variables.instance.StudentFeedbackReview = arguments.StudentFeedbackReview />
	</cffunction>
	<cffunction name="getStudentFeedbackReview" access="public" returntype="string" output="false">
		<cfreturn variables.instance.StudentFeedbackReview />
	</cffunction>

	<cffunction name="setExaminedScorecard" access="public" returntype="void" output="false">
		<cfargument name="ExaminedScorecard" type="string" required="true" />
		<cfset variables.instance.ExaminedScorecard = arguments.ExaminedScorecard />
	</cffunction>
	<cffunction name="getExaminedScorecard" access="public" returntype="string" output="false">
		<cfreturn variables.instance.ExaminedScorecard />
	</cffunction>

	<cffunction name="setAssessmentResultsEntered" access="public" returntype="void" output="false">
		<cfargument name="AssessmentResultsEntered" type="string" required="true" />
		<cfset variables.instance.AssessmentResultsEntered = arguments.AssessmentResultsEntered />
	</cffunction>
	<cffunction name="getAssessmentResultsEntered" access="public" returntype="string" output="false">
		<cfreturn variables.instance.AssessmentResultsEntered />
	</cffunction>

	<cffunction name="setResultsForImprovement" access="public" returntype="void" output="false">
		<cfargument name="ResultsForImprovement" type="string" required="true" />
		<cfset variables.instance.ResultsForImprovement = arguments.ResultsForImprovement />
	</cffunction>
	<cffunction name="getResultsForImprovement" access="public" returntype="string" output="false">
		<cfreturn variables.instance.ResultsForImprovement />
	</cffunction>

	<cffunction name="setDeansEvalInstruction" access="public" returntype="void" output="false">
		<cfargument name="DeansEvalInstruction" type="string" required="true" />
		<cfset variables.instance.DeansEvalInstruction = arguments.DeansEvalInstruction />
	</cffunction>
	<cffunction name="getDeansEvalInstruction" access="public" returntype="string" output="false">
		<cfreturn variables.instance.DeansEvalInstruction />
	</cffunction>

	<cffunction name="setCommentsInstruction" access="public" returntype="void" output="false">
		<cfargument name="CommentsInstruction" type="string" required="true" />
		<cfset variables.instance.CommentsInstruction = arguments.CommentsInstruction />
	</cffunction>
	<cffunction name="getCommentsInstruction" access="public" returntype="string" output="false">
		<cfreturn variables.instance.CommentsInstruction />
	</cffunction>

	<cffunction name="setFundedResearchReview" access="public" returntype="void" output="false">
		<cfargument name="FundedResearchReview" type="string" required="true" />
		<cfset variables.instance.FundedResearchReview = arguments.FundedResearchReview />
	</cffunction>
	<cffunction name="getFundedResearchReview" access="public" returntype="string" output="false">
		<cfreturn variables.instance.FundedResearchReview />
	</cffunction>

	<cffunction name="setCreativeScholarlyReview" access="public" returntype="void" output="false">
		<cfargument name="CreativeScholarlyReview" type="string" required="true" />
		<cfset variables.instance.CreativeScholarlyReview = arguments.CreativeScholarlyReview />
	</cffunction>
	<cffunction name="getCreativeScholarlyReview" access="public" returntype="string" output="false">
		<cfreturn variables.instance.CreativeScholarlyReview />
	</cffunction>

	<cffunction name="setResearchGoalsEntered" access="public" returntype="void" output="false">
		<cfargument name="ResearchGoalsEntered" type="string" required="true" />
		<cfset variables.instance.ResearchGoalsEntered = arguments.ResearchGoalsEntered />
	</cffunction>
	<cffunction name="getResearchGoalsEntered" access="public" returntype="string" output="false">
		<cfreturn variables.instance.ResearchGoalsEntered />
	</cffunction>

	<cffunction name="setResearchGoalsMet" access="public" returntype="void" output="false">
		<cfargument name="ResearchGoalsMet" type="string" required="true" />
		<cfset variables.instance.ResearchGoalsMet = arguments.ResearchGoalsMet />
	</cffunction>
	<cffunction name="getResearchGoalsMet" access="public" returntype="string" output="false">
		<cfreturn variables.instance.ResearchGoalsMet />
	</cffunction>

	<cffunction name="setDeansEvalResearch" access="public" returntype="void" output="false">
		<cfargument name="DeansEvalResearch" type="string" required="true" />
		<cfset variables.instance.DeansEvalResearch = arguments.DeansEvalResearch />
	</cffunction>
	<cffunction name="getDeansEvalResearch" access="public" returntype="string" output="false">
		<cfreturn variables.instance.DeansEvalResearch />
	</cffunction>

	<cffunction name="setCommentsResearch" access="public" returntype="void" output="false">
		<cfargument name="CommentsResearch" type="string" required="true" />
		<cfset variables.instance.CommentsResearch = arguments.CommentsResearch />
	</cffunction>
	<cffunction name="getCommentsResearch" access="public" returntype="string" output="false">
		<cfreturn variables.instance.CommentsResearch />
	</cffunction>

	<cffunction name="setServiceReview" access="public" returntype="void" output="false">
		<cfargument name="ServiceReview" type="string" required="true" />
		<cfset variables.instance.ServiceReview = arguments.ServiceReview />
	</cffunction>
	<cffunction name="getServiceReview" access="public" returntype="string" output="false">
		<cfreturn variables.instance.ServiceReview />
	</cffunction>

	<cffunction name="setServiceGoalsEntered" access="public" returntype="void" output="false">
		<cfargument name="ServiceGoalsEntered" type="string" required="true" />
		<cfset variables.instance.ServiceGoalsEntered = arguments.ServiceGoalsEntered />
	</cffunction>
	<cffunction name="getServiceGoalsEntered" access="public" returntype="string" output="false">
		<cfreturn variables.instance.ServiceGoalsEntered />
	</cffunction>

	<cffunction name="setServiceGoalsMet" access="public" returntype="void" output="false">
		<cfargument name="ServiceGoalsMet" type="string" required="true" />
		<cfset variables.instance.ServiceGoalsMet = arguments.ServiceGoalsMet />
	</cffunction>
	<cffunction name="getServiceGoalsMet" access="public" returntype="string" output="false">
		<cfreturn variables.instance.ServiceGoalsMet />
	</cffunction>

	<cffunction name="setDeansEvalService" access="public" returntype="void" output="false">
		<cfargument name="DeansEvalService" type="string" required="true" />
		<cfset variables.instance.DeansEvalService = arguments.DeansEvalService />
	</cffunction>
	<cffunction name="getDeansEvalService" access="public" returntype="string" output="false">
		<cfreturn variables.instance.DeansEvalService />
	</cffunction>

	<cffunction name="setCommentsService" access="public" returntype="void" output="false">
		<cfargument name="CommentsService" type="string" required="true" />
		<cfset variables.instance.CommentsService = arguments.CommentsService />
	</cffunction>
	<cffunction name="getCommentsService" access="public" returntype="string" output="false">
		<cfreturn variables.instance.CommentsService />
	</cffunction>

	<cffunction name="setSummaryComments" access="public" returntype="void" output="false">
		<cfargument name="SummaryComments" type="string" required="true" />
		<cfset variables.instance.SummaryComments = arguments.SummaryComments />
	</cffunction>
	<cffunction name="getSummaryComments" access="public" returntype="string" output="false">
		<cfreturn variables.instance.SummaryComments />
	</cffunction>

	<cffunction name="setNewInitiatives" access="public" returntype="void" output="false">
		<cfargument name="NewInitiatives" type="string" required="true" />
		<cfset variables.instance.NewInitiatives = arguments.NewInitiatives />
	</cffunction>
	<cffunction name="getNewInitiatives" access="public" returntype="string" output="false">
		<cfreturn variables.instance.NewInitiatives />
	</cffunction>

	<cffunction name="setActivityDate" access="public" returntype="void" output="false">
		<cfargument name="ActivityDate" type="string" required="true" />
		<cfset variables.instance.ActivityDate = arguments.ActivityDate />
	</cffunction>
	<cffunction name="getActivityDate" access="public" returntype="string" output="false">
		<cfreturn variables.instance.ActivityDate />
	</cffunction>


	<!---
	DUMP
	--->
	<cffunction name="dump" access="public" output="true" return="void">
		<cfargument name="abort" type="boolean" default="false" />
		<cfdump var="#variables.instance#" />
		<cfif arguments.abort>
			<cfabort />
		</cfif>
	</cffunction>

</cfcomponent>
