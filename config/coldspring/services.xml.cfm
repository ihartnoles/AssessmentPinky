<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE beans PUBLIC "-//SPRING//DTD BEAN//EN"  "http://www.springframework.org/dtd/spring-beans.dtd">
<beans default-autowire="byName">
	
	<!--
	<import resource="/intfroot/config/coldspring/aicServices.xml.cfm" />
 	<import resource="/intfroot/config/coldspring/surveyServices.xml.cfm" />
	<import resource="/intfroot/config/coldspring/showcaseServices.xml.cfm" />
	<import resource="/intfroot/config/coldspring/receiverServices.xml.cfm" />
	<import resource="/intfroot/config/coldspring/apiServices.xml.cfm" />
	<import resource="/intfroot/config/coldspring/customFormServices.xml.cfm" />
	<import resource="/intfroot/config/coldspring/superServices.xml.cfm" />
	<import resource="/intfroot/portfolio/config/services.xml.cfm" />
	-->

	<!-- helpers -->
	<bean id="stringHelper" class="Assessment.utility.model.dataHelpers.stringHelper" />
	<bean id="fileHelper"   class="Assessment.utility.model.dataHelpers.fileHelper" />

    <!-- users -->
	<bean id="usersDAO" class="Assessment.model.users.usersDAO">
		<constructor-arg name="dsn"><value>${dsn}</value></constructor-arg>
	</bean>
	<bean id="usersGateway" class="Assessment.model.users.usersGateway">
		<constructor-arg name="dsn"><value>${dsn}</value></constructor-arg>
	</bean>
	<bean id="usersService" class="Assessment.model.users.usersService">
		<constructor-arg name="usersDAO">
			<ref bean="usersDAO"/>
		</constructor-arg>
		<constructor-arg name="usersGateway">
			<ref bean="usersGateway"/>
		</constructor-arg>
	</bean>

	<!-- user roles -->
	<bean id="userrolesDAO" class="Assessment.model.userroles.userrolesDAO">
		<constructor-arg name="dsn"><value>${dsn}</value></constructor-arg>
	</bean>
	<bean id="userrolesGateway" class="Assessment.model.userroles.userrolesGateway">
		<constructor-arg name="dsn"><value>${dsn}</value></constructor-arg>
	</bean>
	<bean id="userrolesService" class="Assessment.model.userroles.userrolesService">
		<constructor-arg name="userrolesDAO">
			<ref bean="userrolesDAO"/>
		</constructor-arg>
		<constructor-arg name="userrolesGateway">
			<ref bean="userrolesGateway"/>
		</constructor-arg>
	</bean>

	<!-- user role access -->
	<bean id="userRoleAccessDAO" class="Assessment.model.userRoleAccess.userRoleAccessDAO">
		<constructor-arg name="dsn"><value>${dsn}</value></constructor-arg>
	</bean>
	<bean id="userRoleAccessGateway" class="Assessment.model.userRoleAccess.userRoleAccessGateway">
		<constructor-arg name="dsn"><value>${dsn}</value></constructor-arg>
	</bean>
	<bean id="userRoleAccessService" class="Assessment.model.userRoleAccess.userRoleAccessService">
		<constructor-arg name="userRoleAccessDAO">
			<ref bean="userRoleAccessDAO"/>
		</constructor-arg>
		<constructor-arg name="userRoleAccessGateway">
			<ref bean="userRoleAccessGateway"/>
		</constructor-arg>
	</bean>
	
	<!-- reporting units -->
	<bean id="reportingunitsDAO" class="Assessment.model.reportingunits.reportingunitsDAO">
		<constructor-arg name="dsn"><value>${dsn}</value></constructor-arg>
	</bean>
	<bean id="reportingunitsGateway" class="Assessment.model.reportingunits.reportingunitsGateway">
		<constructor-arg name="dsn"><value>${dsn}</value></constructor-arg>
	</bean>
	<bean id="reportingunitsService" class="Assessment.model.reportingunits.reportingunitsService">
		<constructor-arg name="reportingunitsDAO">
			<ref bean="reportingunitsDAO"/>
		</constructor-arg>
		<constructor-arg name="reportingunitsGateway">
			<ref bean="reportingunitsGateway"/>
		</constructor-arg>
	</bean>

	<!-- assessment plans -->
	<bean id="assessmentplansDAO" class="Assessment.model.assessmentplans.assessmentplansDAO">
		<constructor-arg name="dsn"><value>${dsn}</value></constructor-arg>
	</bean>
	<bean id="assessmentplansGateway" class="Assessment.model.assessmentplans.assessmentplansGateway">
		<constructor-arg name="dsn"><value>${dsn}</value></constructor-arg>
	</bean>
	<bean id="assessmentplansService" class="Assessment.model.assessmentplans.assessmentplansService">
		<constructor-arg name="assessmentplansDAO">
			<ref bean="assessmentplansDAO"/>
		</constructor-arg>
		<constructor-arg name="assessmentplansGateway">
			<ref bean="assessmentplansGateway"/>
		</constructor-arg>
	</bean>
	
	<!-- assessment plan outcomes -->
	<bean id="assessmentPlanOutcomesDAO" class="Assessment.model.assessmentPlanOutcomes.assessmentPlanOutcomesDAO">
		<constructor-arg name="dsn"><value>${dsn}</value></constructor-arg>
	</bean>
	<bean id="assessmentPlanOutcomesGateway" class="Assessment.model.assessmentPlanOutcomes.assessmentPlanOutcomesGateway">
		<constructor-arg name="dsn"><value>${dsn}</value></constructor-arg>
	</bean>
	<bean id="assessmentPlanOutcomesService" class="Assessment.model.assessmentPlanOutcomes.assessmentPlanOutcomesService">
		<constructor-arg name="assessmentPlanOutcomesDAO">
			<ref bean="assessmentPlanOutcomesDAO"/>
		</constructor-arg>
		<constructor-arg name="assessmentPlanOutcomesGateway">
			<ref bean="assessmentPlanOutcomesGateway"/>
		</constructor-arg>
	</bean>


	<!-- ALC Categories -->
	<bean id="ALCCategoriesDAO" class="Assessment.model.ALCCategories.ALCCategoriesDAO">
		<constructor-arg name="dsn"><value>${dsn}</value></constructor-arg>
	</bean>
	<bean id="ALCCategoriesGateway" class="Assessment.model.ALCCategories.ALCCategoriesGateway">
		<constructor-arg name="dsn"><value>${dsn}</value></constructor-arg>
	</bean>
	<bean id="ALCCategoriesService" class="Assessment.model.ALCCategories.ALCCategoriesService">
		<constructor-arg name="ALCCategoriesDAO">
			<ref bean="ALCCategoriesDAO"/>
		</constructor-arg>
		<constructor-arg name="ALCCategoriesGateway">
			<ref bean="ALCCategoriesGateway"/>
		</constructor-arg>
	</bean>

	<!-- assessment plan supporting documents -->
	<bean id="assessmentPlanSupportingDocumentsDAO" class="Assessment.model.assessmentPlanSupportingDocuments.assessmentPlanSupportingDocumentsDAO">
		<constructor-arg name="dsn"><value>${dsn}</value></constructor-arg>
	</bean>
	<bean id="assessmentPlanSupportingDocumentsGateway" class="Assessment.model.assessmentPlanSupportingDocuments.assessmentPlanSupportingDocumentsGateway">
		<constructor-arg name="dsn"><value>${dsn}</value></constructor-arg>
	</bean>
	<bean id="assessmentPlanSupportingDocumentsService" class="Assessment.model.assessmentPlanSupportingDocuments.assessmentPlanSupportingDocumentsService">
		<constructor-arg name="assessmentPlanSupportingDocumentsDAO">
			<ref bean="assessmentPlanSupportingDocumentsDAO"/>
		</constructor-arg>
		<constructor-arg name="assessmentPlanSupportingDocumentsGateway">
			<ref bean="assessmentPlanSupportingDocumentsGateway"/>
		</constructor-arg>
	</bean>

	<!-- campus -->
	<bean id="campusDAO" class="Assessment.model.campuses.campusDAO">
		<constructor-arg name="dsn"><value>${dsn}</value></constructor-arg>
	</bean>
	<bean id="campusGateway" class="Assessment.model.campuses.campusGateway">
		<constructor-arg name="dsn"><value>${dsn}</value></constructor-arg>
	</bean>	
	<bean id="campusService" class="Assessment.model.campuses.campusService">
		<constructor-arg name="campusDAO">
			<ref bean="campusDAO"/>
		</constructor-arg>
		<constructor-arg name="campusGateway">
			<ref bean="campusGateway"/>
		</constructor-arg>
	</bean>
	
	<!-- roles -->
	<bean id="rolesDAO" class="Assessment.model.roles.rolesDAO">
		<constructor-arg name="dsn"><value>${dsn}</value></constructor-arg>
	</bean>
	<bean id="rolesGateway" class="Assessment.model.roles.rolesGateway">
		<constructor-arg name="dsn"><value>${dsn}</value></constructor-arg>
	</bean>
	<bean id="rolesService" class="Assessment.model.roles.rolesService">
		<constructor-arg name="rolesDAO">
			<ref bean="rolesDAO"/>
		</constructor-arg>
		<constructor-arg name="rolesGateway">
			<ref bean="rolesGateway"/>
		</constructor-arg>
	</bean>

	<!-- organization super divisions -->
	<bean id="organizationSuperDivisionDAO" class="Assessment.model.organizationSuperDivision.organizationSuperDivisionDAO">
		<constructor-arg name="dsn"><value>${dsn}</value></constructor-arg>
	</bean>
	<bean id="organizationSuperDivisionGateway" class="Assessment.model.organizationSuperDivision.organizationSuperDivisionGateway">
		<constructor-arg name="dsn"><value>${dsn}</value></constructor-arg>
	</bean>
	<bean id="organizationSuperDivisionService" class="Assessment.model.organizationSuperDivision.organizationSuperDivisionService">
		<constructor-arg name="organizationSuperDivisionDAO">
			<ref bean="organizationSuperDivisionDAO"/>
		</constructor-arg>
		<constructor-arg name="organizationSuperDivisionGateway">
			<ref bean="organizationSuperDivisionGateway"/>
		</constructor-arg>
	</bean>

	<!-- organization divisions -->
	<bean id="organizationDivisionDAO" class="Assessment.model.organizationDivision.organizationDivisionDAO">
		<constructor-arg name="dsn"><value>${dsn}</value></constructor-arg>
	</bean>
	<bean id="organizationDivisionGateway" class="Assessment.model.organizationDivision.organizationDivisionGateway">
		<constructor-arg name="dsn"><value>${dsn}</value></constructor-arg>
	</bean>
	<bean id="organizationDivisionService" class="Assessment.model.organizationDivision.organizationDivisionService">
		<constructor-arg name="organizationDivisionDAO">
			<ref bean="organizationDivisionDAO"/>
		</constructor-arg>
		<constructor-arg name="organizationDivisionGateway">
			<ref bean="organizationDivisionGateway"/>
		</constructor-arg>
	</bean>

	<bean id="organizationDeptDAO" class="Assessment.model.organizationDept.organizationDeptDAO">
		<constructor-arg name="dsn"><value>${dsn}</value></constructor-arg>
	</bean>
	<bean id="organizationDeptGateway" class="Assessment.model.organizationDept.organizationDeptGateway">
		<constructor-arg name="dsn"><value>${dsn}</value></constructor-arg>
	</bean>
	<bean id="organizationDeptService" class="Assessment.model.organizationDept.organizationDeptService">
		<constructor-arg name="organizationDeptDAO">
			<ref bean="organizationDeptDAO"/>
		</constructor-arg>
		<constructor-arg name="organizationDeptGateway">
			<ref bean="organizationDeptGateway"/>
		</constructor-arg>
	</bean>

	<!-- messages -->
	<bean id="messagesDAO" class="Assessment.model.messages.messagesDAO">
		<constructor-arg name="dsn"><value>${dsn}</value></constructor-arg>
	</bean>
	<bean id="messagesGateway" class="Assessment.model.messages.messagesGateway">
		<constructor-arg name="dsn"><value>${dsn}</value></constructor-arg>
	</bean>
	<bean id="messagesService" class="Assessment.model.messages.messagesService">
		<constructor-arg name="messagesDAO">
			<ref bean="messagesDAO"/>
		</constructor-arg>
		<constructor-arg name="messagesGateway">
			<ref bean="messagesGateway"/>
		</constructor-arg>
	</bean>

	<!-- assessment plan types -->
	<bean id="assessmentPlanTypesDAO" class="Assessment.model.assessmentPlanTypes.assessmentPlanTypesDAO">
		<constructor-arg name="dsn"><value>${dsn}</value></constructor-arg>
	</bean>
	<bean id="assessmentPlanTypesGateway" class="Assessment.model.assessmentPlanTypes.assessmentPlanTypesGateway">
		<constructor-arg name="dsn"><value>${dsn}</value></constructor-arg>
	</bean>
	<bean id="assessmentPlanTypesService" class="Assessment.model.assessmentPlanTypes.assessmentPlanTypesService">
		<constructor-arg name="assessmentPlanTypesDAO">
			<ref bean="assessmentPlanTypesDAO"/>
		</constructor-arg>
		<constructor-arg name="assessmentPlanTypesGateway">
			<ref bean="assessmentPlanTypesGateway"/>
		</constructor-arg>
	</bean>

	<!-- ALC documents-->
	<bean id="ALCDocumentsDAO" class="Assessment.model.ALCDocuments.ALCDocumentsDAO">
		<constructor-arg name="dsn"><value>${dsn}</value></constructor-arg>
	</bean>
	<bean id="ALCDocumentsGateway" class="Assessment.model.ALCDocuments.ALCDocumentsGateway">
		<constructor-arg name="dsn"><value>${dsn}</value></constructor-arg>
	</bean>
	<bean id="ALCDocumentsService" class="Assessment.model.ALCDocuments.ALCDocumentsService">
		<constructor-arg name="ALCDocumentsDAO">
			<ref bean="ALCDocumentsDAO"/>
		</constructor-arg>
		<constructor-arg name="ALCDocumentsGateway">
			<ref bean="ALCDocumentsGateway"/>
		</constructor-arg>
	</bean>

	<!-- Assessment Plan Checklist Types -->
	<bean id="AssessmentPlanChecklistTypeDAO" class="Assessment.model.AssessmentPlanChecklistTypes.AssessmentPlanChecklistTypeDAO">
		<constructor-arg name="dsn"><value>${dsn}</value></constructor-arg>
	</bean>
	<bean id="AssessmentPlanChecklistTypeGateway" class="Assessment.model.AssessmentPlanChecklistTypes.AssessmentPlanChecklistTypeGateway">
		<constructor-arg name="dsn"><value>${dsn}</value></constructor-arg>
	</bean>
	<bean id="AssessmentPlanChecklistTypeService" class="Assessment.model.AssessmentPlanChecklistTypes.AssessmentPlanChecklistTypeService">
		<constructor-arg name="AssessmentPlanChecklistTypeDAO">
			<ref bean="AssessmentPlanChecklistTypeDAO"/>
		</constructor-arg>
		<constructor-arg name="AssessmentPlanChecklistTypeGateway">
			<ref bean="AssessmentPlanChecklistTypeGateway"/>
		</constructor-arg>
	</bean>

	<!-- Assessment Plan Checklist Ratings -->
	<bean id="AssessmentPlanChecklistRatingsDAO" class="Assessment.model.AssessmentPlanChecklistRatings.AssessmentPlanChecklistRatingsDAO">
		<constructor-arg name="dsn"><value>${dsn}</value></constructor-arg>
	</bean>
	<bean id="AssessmentPlanChecklistRatingsGateway" class="Assessment.model.AssessmentPlanChecklistRatings.AssessmentPlanChecklistRatingsGateway">
		<constructor-arg name="dsn"><value>${dsn}</value></constructor-arg>
	</bean>
	<bean id="AssessmentPlanChecklistRatingsService" class="Assessment.model.AssessmentPlanChecklistRatings.AssessmentPlanChecklistRatingsService">
		<constructor-arg name="AssessmentPlanChecklistRatingsDAO">
			<ref bean="AssessmentPlanChecklistRatingsDAO"/>
		</constructor-arg>
		<constructor-arg name="AssessmentPlanChecklistRatingsGateway">
			<ref bean="AssessmentPlanChecklistRatingsGateway"/>
		</constructor-arg>
	</bean>

	<!-- dept. performance review -->
	<bean id="departmentalPerformanceReviewDAO" class="Assessment.model.departmentalPerformanceReview.departmentalPerformanceReviewDAO">
		<constructor-arg name="dsn"><value>${dsn}</value></constructor-arg>
	</bean>
	<bean id="departmentalPerformanceReviewGateway" class="Assessment.model.departmentalPerformanceReview.departmentalPerformanceReviewGateway">
		<constructor-arg name="dsn"><value>${dsn}</value></constructor-arg>
	</bean>
	<bean id="departmentalPerformanceReviewService" class="Assessment.model.departmentalPerformanceReview.departmentalPerformanceReviewService">
		<constructor-arg name="departmentalPerformanceReviewDAO">
			<ref bean="departmentalPerformanceReviewDAO"/>
		</constructor-arg>
		<constructor-arg name="departmentalPerformanceReviewGateway">
			<ref bean="departmentalPerformanceReviewGateway"/>
		</constructor-arg>
	</bean>

	<!-- assessment plan  workflow -->
	<bean id="assessmentPlanWorkflowDAO" class="Assessment.model.assessmentPlanWorkflow.assessmentPlanWorkflowDAO">
		<constructor-arg name="dsn"><value>${dsn}</value></constructor-arg>
	</bean>
	<bean id="assessmentPlanWorkflowGateway" class="Assessment.model.assessmentPlanWorkflow.assessmentPlanWorkflowGateway">
		<constructor-arg name="dsn"><value>${dsn}</value></constructor-arg>
	</bean>
	<bean id="assessmentPlanWorkflowService" class="Assessment.model.assessmentPlanWorkflow.assessmentPlanWorkflowService">
		<constructor-arg name="assessmentPlanWorkflowDAO">
			<ref bean="assessmentPlanWorkflowDAO"/>
		</constructor-arg>
		<constructor-arg name="assessmentPlanWorkflowGateway">
			<ref bean="assessmentPlanWorkflowGateway"/>
		</constructor-arg>
	</bean>

	<!-- program improvement codes-->
	<bean id="ProgramImprovementCodesDAO" class="Assessment.model.ProgramImprovementCodes.ProgramImprovementCodesDAO">
		<constructor-arg name="dsn"><value>${dsn}</value></constructor-arg>
	</bean>
	<bean id="ProgramImprovementCodesGateway" class="Assessment.model.ProgramImprovementCodes.ProgramImprovementCodesGateway">
		<constructor-arg name="dsn"><value>${dsn}</value></constructor-arg>
	</bean>
	<bean id="ProgramImprovementCodesService" class="Assessment.model.ProgramImprovementCodes.ProgramImprovementCodesService">
		<constructor-arg name="ProgramImprovementCodesDAO">
			<ref bean="ProgramImprovementCodesDAO"/>
		</constructor-arg>
		<constructor-arg name="ProgramImprovementCodesGateway">
			<ref bean="ProgramImprovementCodesGateway"/>
		</constructor-arg>
	</bean>

	<bean id="AssessmentALCOutcomeCategoriesDAO" class="Assessment.model.AssessmentALCOutcomeCategories.AssessmentALCOutcomeCategoriesDAO">
		<constructor-arg name="dsn"><value>${dsn}</value></constructor-arg>
	</bean>
	<bean id="AssessmentALCOutcomeCategoriesGateway" class="Assessment.model.AssessmentALCOutcomeCategories.AssessmentALCOutcomeCategoriesGateway">
		<constructor-arg name="dsn"><value>${dsn}</value></constructor-arg>
	</bean>
	<bean id="AssessmentALCOutcomeCategoriesService" class="Assessment.model.AssessmentALCOutcomeCategories.AssessmentALCOutcomeCategoriesService">
		<constructor-arg name="AssessmentALCOutcomeCategoriesDAO">
			<ref bean="AssessmentALCOutcomeCategoriesDAO"/>
		</constructor-arg>
		<constructor-arg name="AssessmentALCOutcomeCategoriesGateway">
			<ref bean="AssessmentALCOutcomeCategoriesGateway"/>
		</constructor-arg>
	</bean>


	<bean id="programImprovementCodesAssessmentOutcomesDAO" class="Assessment.model.programImprovementCodesAssessmentOutcomes.programImprovementCodesAssessmentOutcomesDAO">
		<constructor-arg name="dsn"><value>${dsn}</value></constructor-arg>
	</bean>
	<bean id="programImprovementCodesAssessmentOutcomesGateway" class="Assessment.model.programImprovementCodesAssessmentOutcomes.programImprovementCodesAssessmentOutcomesGateway">
		<constructor-arg name="dsn"><value>${dsn}</value></constructor-arg>
	</bean>
	<bean id="programImprovementCodesAssessmentOutcomesService" class="Assessment.model.programImprovementCodesAssessmentOutcomes.programImprovementCodesAssessmentOutcomesService">
		<constructor-arg name="programImprovementCodesAssessmentOutcomesDAO">
			<ref bean="programImprovementCodesAssessmentOutcomesDAO"/>
		</constructor-arg>
		<constructor-arg name="programImprovementCodesAssessmentOutcomesGateway">
			<ref bean="programImprovementCodesAssessmentOutcomesGateway"/>
		</constructor-arg>
	</bean>

	<bean id="tasksDAO" class="Assessment.model.tasks.tasksDAO">
		<constructor-arg name="dsn"><value>${dsn}</value></constructor-arg>
	</bean>
	<bean id="tasksGateway" class="Assessment.model.tasks.tasksGateway">
		<constructor-arg name="dsn"><value>${dsn}</value></constructor-arg>o
	</bean>
	<bean id="tasksService" class="Assessment.model.tasks.tasksService">
		<constructor-arg name="tasksDAO">
			<ref bean="tasksDAO"/>
		</constructor-arg>
		<constructor-arg name="tasksGateway">
			<ref bean="tasksGateway"/>
		</constructor-arg>
	</bean>
	
	<bean id="strategicPlanGoalsDAO" class="Assessment.model.strategicPlanGoals.strategicPlanGoalsDAO">
		<constructor-arg name="dsn"><value>${dsn}</value></constructor-arg>
	</bean>
	<bean id="strategicPlanGoalsGateway" class="Assessment.model.strategicPlanGoals.strategicPlanGoalsGateway">
		<constructor-arg name="dsn"><value>${dsn}</value></constructor-arg>
	</bean>
	<bean id="strategicPlanGoalsService" class="Assessment.model.strategicPlanGoals.strategicPlanGoalsService">
		<constructor-arg name="strategicPlanGoalsDAO">
			<ref bean="strategicPlanGoalsDAO"/>
		</constructor-arg>
		<constructor-arg name="strategicPlanGoalsGateway">
			<ref bean="strategicPlanGoalsGateway"/>
		</constructor-arg>
	</bean>

	<bean id="outcomeStrategicPlanGoalsDAO" class="Assessment.model.outcomeStrategicPlanGoals.outcomeStrategicPlanGoalsDAO">
		<constructor-arg name="dsn"><value>${dsn}</value></constructor-arg>
	</bean>
	<bean id="outcomeStrategicPlanGoalsGateway" class="Assessment.model.outcomeStrategicPlanGoals.outcomeStrategicPlanGoalsGateway">
		<constructor-arg name="dsn"><value>${dsn}</value></constructor-arg>
	</bean>
	<bean id="outcomeStrategicPlanGoalsService" class="Assessment.model.outcomeStrategicPlanGoals.outcomeStrategicPlanGoalsService">
		<constructor-arg name="outcomeStrategicPlanGoalsDAO">
			<ref bean="outcomeStrategicPlanGoalsDAO"/>
		</constructor-arg>
		<constructor-arg name="outcomeStrategicPlanGoalsGateway">
			<ref bean="outcomeStrategicPlanGoalsGateway"/>
		</constructor-arg>
	</bean>

	<!-- assessment plan checklist comments -->
	<bean id="ChecklistCommentsDAO" class="Assessment.model.ChecklistComments.ChecklistCommentsDAO">
		<constructor-arg name="dsn"><value>${dsn}</value></constructor-arg>
	</bean>
	<bean id="ChecklistCommentsGateway" class="Assessment.model.ChecklistComments.ChecklistCommentsGateway">
		<constructor-arg name="dsn"><value>${dsn}</value></constructor-arg>
	</bean>
	<bean id="ChecklistCommentsService" class="Assessment.model.ChecklistComments.ChecklistCommentsService">
		<constructor-arg name="ChecklistCommentsDAO">
			<ref bean="ChecklistCommentsDAO"/>
		</constructor-arg>
		<constructor-arg name="ChecklistCommentsGateway">
			<ref bean="ChecklistCommentsGateway"/>
		</constructor-arg>
	</bean>

	<!-- AssessmentStrategicPlanLink -->
	<bean id="AssessmentStrategicPlanLinksDAO" class="Assessment.model.AssessmentStrategicPlanLinks.AssessmentStrategicPlanLinksDAO">
			<constructor-arg name="dsn"><value>${dsn}</value></constructor-arg>
	</bean>
	<bean id="AssessmentStrategicPlanLinksGateway" class="Assessment.model.AssessmentStrategicPlanLinks.AssessmentStrategicPlanLinksGateway">
		<constructor-arg name="dsn"><value>${dsn}</value></constructor-arg>
	</bean>
	<bean id="AssessmentStrategicPlanLinksService" class="Assessment.model.AssessmentStrategicPlanLinks.AssessmentStrategicPlanLinksService">
		<constructor-arg name="AssessmentStrategicPlanLinksDAO">
			<ref bean="AssessmentStrategicPlanLinksDAO"/>
		</constructor-arg>
		<constructor-arg name="AssessmentStrategicPlanLinksGateway">
			<ref bean="AssessmentStrategicPlanLinksGateway"/>
		</constructor-arg>
	</bean>

</beans>