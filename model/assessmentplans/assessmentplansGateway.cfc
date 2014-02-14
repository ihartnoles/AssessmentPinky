
<cfcomponent displayname="assessmentplansGateway" output="false">
	<cffunction name="init" access="public" output="false" returntype="assessmentplansGateway">
		<cfargument name="dsn" type="string" required="true" />
		<cfset variables.dsn = arguments.dsn />
		<cfreturn this />
	</cffunction>
	
	<cffunction name="getByAttributesQuery" access="public" output="false" returntype="query">
		<cfargument name="PlanID" type="numeric" required="false" />
		<cfargument name="ReportingUnitID" type="numeric" required="false" />
		<cfargument name="PlanPeriod" type="string" required="false" />
		<cfargument name="PlanType" type="numeric" required="false" />
		<cfargument name="PlanStatus" type="numeric" required="false" />
		<cfargument name="PlanInitialReporter" type="string" required="false" />
		<cfargument name="PlanLastChangeDate" type="date" required="false" />
		<cfargument name="PlanLockDate" type="date" required="false" />
		<cfargument name="orderby" type="string" required="false" />
		
		<cfset var qList = "" />		
		<cfquery name="qList" datasource="#variables.dsn#">
			SELECT
				PlanID,
				ReportingUnitID,
				PlanPeriod,
				PlanType,
				PlanStatus,
				PlanInitialReporter,
				PlanLastChangeDate,
				PlanLockDate
			FROM	AssessmentPlan
			WHERE	0=0
		
		<cfif structKeyExists(arguments,"PlanID") and len(arguments.PlanID)>
			AND	PlanID = <cfqueryparam value="#arguments.PlanID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"ReportingUnitID") and len(arguments.ReportingUnitID)>
			AND	ReportingUnitID = <cfqueryparam value="#arguments.ReportingUnitID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"PlanPeriod") and len(arguments.PlanPeriod)>
			AND	PlanPeriod = <cfqueryparam value="#arguments.PlanPeriod#" CFSQLType="cf_sql_char" />
		</cfif>
		<cfif structKeyExists(arguments,"PlanType") and len(arguments.PlanType)>
			AND	PlanType = <cfqueryparam value="#arguments.PlanType#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"PlanStatus") and len(arguments.PlanStatus)>
			AND	PlanStatus = <cfqueryparam value="#arguments.PlanStatus#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"PlanInitialReporter") and len(arguments.PlanInitialReporter)>
			AND	PlanInitialReporter = <cfqueryparam value="#arguments.PlanInitialReporter#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"PlanLastChangeDate") and len(arguments.PlanLastChangeDate)>
			AND	PlanLastChangeDate = <cfqueryparam value="#arguments.PlanLastChangeDate#" CFSQLType="cf_sql_timestamp" />
		</cfif>
		<cfif structKeyExists(arguments,"PlanLockDate") and len(arguments.PlanLockDate)>
			AND	PlanLockDate = <cfqueryparam value="#arguments.PlanLockDate#" CFSQLType="cf_sql_timestamp" />
		</cfif>
		<cfif structKeyExists(arguments, "orderby") and len(arguments.orderBy)>
			ORDER BY #arguments.orderby#
		</cfif>
		</cfquery>
		
		<cfreturn qList />
	</cffunction>


	<cffunction name="getAssessmentPlanPeriodsQuery" access="public" output="false" returntype="query">
		<cfargument name="ReportingUnitID" type="numeric" required="false" />
				
		<cfset var qList = "" />		
		
		<cfquery name="qList" datasource="#variables.dsn#">
			 SELECT p.*, 
			 		t.PlanType, 
			 		t.PlanTypeDescription, 
			 		w.WorkFlowStepDescription, 
			 		w.WorkFlowStepInstructions 
			 FROM AssessmentPlan p, AssessmentPlanType t, AssessmentPlanWorkflow w  
			 WHERE 0=0 
			
			<cfif structKeyExists(arguments,"ReportingUnitID") and len(arguments.ReportingUnitID)>
				AND	p.ReportingUnitID = <cfqueryparam value="#arguments.ReportingUnitID#" CFSQLType="cf_sql_integer" />
			</cfif>

			 AND p.PlanType=t.PlanType 
			 AND p.PlanType=w.PlanType 
			 AND p.PlanStatus=w.WorkFlowStep						
		
			

			ORDER BY PlanPeriod DESC
		</cfquery>
		
		<!--- <cfdump var=#qList# abort="true" label="@assessmentplansGateway" /> --->

		<cfreturn qList />
	</cffunction>

	<cffunction name="getPlanStatusByPlanID" access="public" output="false" returntype="query">
		<cfargument name="PlanID" type="numeric" required="false" />
				
		<cfset var qPlanStatus = "" />		
		
		<cfquery name="qPlanStatus" datasource="#variables.dsn#">
			 SELECT p.planstatus
			 		
			 FROM AssessmentPlan p, AssessmentPlanType t, AssessmentPlanWorkflow w  
			 WHERE 0=0 
			
			<cfif structKeyExists(arguments,"PlanID") and len(arguments.PlanID)>
				AND	p.PlanID = <cfqueryparam value="#arguments.PlanID#" CFSQLType="cf_sql_integer" />
			</cfif>

			 AND p.PlanType=t.PlanType 
			 AND p.PlanType=w.PlanType 
			 AND p.PlanStatus=w.WorkFlowStep						
		
			ORDER BY PlanPeriod DESC
		</cfquery>
		
	
		<cfreturn qPlanStatus />
	</cffunction>

	

	<cffunction name="getPlanPeriods" access="public" output="false" returntype="query">
		
				
		<cfset var qList = "" />		
		
		<cfquery name="qList" datasource="#variables.dsn#">
			SELECT distinct planperiod
			FROM AssessmentPlanPeriod
			ORDER BY PlanPeriod DESC
		</cfquery>
		
		<!--- <cfdump var=#qList# abort="true" label="@assessmentplansGateway" /> --->

		<cfreturn qList />
	</cffunction>

		
	<cffunction name="getLOPlanTotals" access="public" output="false" returntype="query">
		<cfargument name="PlanPeriod" type="string" required="true" />
				
		<cfset var qList = "" />		
		
		<cfquery name="qList" datasource="#variables.dsn#">
			select top 1 planID,

					(select count(*) 
						from assessmentplan
						where 0=0
						AND planType = 1
						AND planperiod = <cfqueryparam value="#arguments.PlanPeriod#" CFSQLType="cf_sql_varchar" />) as total,

					( select count(*) 
						from assessmentplan
						where 0=0
						AND planType = 1
						AND planperiod = <cfqueryparam value="#arguments.PlanPeriod#" CFSQLType="cf_sql_varchar" />
						AND planStatus = 10 ) as New,

					( select count(*) 
						from assessmentplan
						where 0=0
						AND planType = 1
						AND planperiod = <cfqueryparam value="#arguments.PlanPeriod#" CFSQLType="cf_sql_varchar" />
						AND planStatus = 20 ) as Review,
					
					( select count(*) 
						from assessmentplan
						where 0=0
						AND planType = 1
						AND planperiod = <cfqueryparam value="#arguments.PlanPeriod#" CFSQLType="cf_sql_varchar" />
						AND planStatus = 30 ) as RevisePlan,


					( select count(*) 
						from assessmentplan
						where 0=0
						AND planType = 1
						AND planperiod = <cfqueryparam value="#arguments.PlanPeriod#" CFSQLType="cf_sql_varchar" />
						AND planStatus = 40 ) as CollectData,

					( select count(*) 
						from assessmentplan
						where 0=0
						AND planType = 1
						AND planperiod = <cfqueryparam value="#arguments.PlanPeriod#" CFSQLType="cf_sql_varchar" />
						AND planStatus = 50 ) as EnterResults,

					( select count(*) 
						from assessmentplan
						where 0=0
						AND planType = 1
						AND planperiod = <cfqueryparam value="#arguments.PlanPeriod#" CFSQLType="cf_sql_varchar" />
						AND planStatus = 60 ) as ReportResults,

					( select count(*) 
						from assessmentplan
						where 0=0
						AND planType = 1
						AND planperiod = <cfqueryparam value="#arguments.PlanPeriod#" CFSQLType="cf_sql_varchar" />
						AND planStatus = 70 ) as ReviseReportResults,

					( select count(*) 
						from assessmentplan
						where 0=0
						AND planType = 1
						AND planperiod = <cfqueryparam value="#arguments.PlanPeriod#" CFSQLType="cf_sql_varchar" />
						AND planStatus = 80 ) as Approved

				

				from assessmentplan

		</cfquery>
		
		
		<cfreturn qList />
	</cffunction>
	
	<cffunction name="getResearchPlanTotals" access="public" output="false" returntype="query">
		<cfargument name="PlanPeriod" type="string" required="true" />
				
		<cfset var qList = "" />		
		
		<cfquery name="qList" datasource="#variables.dsn#">
			select top 1 planID,

					(select count(*) 
						from assessmentplan
						where 0=0
						AND planType = 2
						AND planperiod = <cfqueryparam value="#arguments.PlanPeriod#" CFSQLType="cf_sql_varchar" />) as total,

					( select count(*) 
						from assessmentplan
						where 0=0
						AND planType = 2
						AND planperiod = <cfqueryparam value="#arguments.PlanPeriod#" CFSQLType="cf_sql_varchar" />
						AND planStatus = 10 ) as New,

					( select count(*) 
						from assessmentplan
						where 0=0
						AND planType = 2
						AND planperiod = <cfqueryparam value="#arguments.PlanPeriod#" CFSQLType="cf_sql_varchar" />
						AND planStatus = 20 ) as Review,
					
					( select count(*) 
						from assessmentplan
						where 0=0
						AND planType = 2
						AND planperiod = <cfqueryparam value="#arguments.PlanPeriod#" CFSQLType="cf_sql_varchar" />
						AND planStatus = 30 ) as RevisePlan,


					( select count(*) 
						from assessmentplan
						where 0=0
						AND planType = 2
						AND planperiod = <cfqueryparam value="#arguments.PlanPeriod#" CFSQLType="cf_sql_varchar" />
						AND planStatus = 40 ) as CollectData,

					( select count(*) 
						from assessmentplan
						where 0=0
						AND planType = 2
						AND planperiod = <cfqueryparam value="#arguments.PlanPeriod#" CFSQLType="cf_sql_varchar" />
						AND planStatus = 50 ) as EnterResults,

					( select count(*) 
						from assessmentplan
						where 0=0
						AND planType = 2
						AND planperiod = <cfqueryparam value="#arguments.PlanPeriod#" CFSQLType="cf_sql_varchar" />
						AND planStatus = 60 ) as ReportResults,

					( select count(*) 
						from assessmentplan
						where 0=0
						AND planType = 2
						AND planperiod = <cfqueryparam value="#arguments.PlanPeriod#" CFSQLType="cf_sql_varchar" />
						AND planStatus = 70 ) as ReviseReportResults,

					( select count(*) 
						from assessmentplan
						where 0=0
						AND planType = 2
						AND planperiod = <cfqueryparam value="#arguments.PlanPeriod#" CFSQLType="cf_sql_varchar" />
						AND planStatus = 80 ) as Approved

				from assessmentplan

			</cfquery>
			<cfreturn qList />
		</cffunction>

		<cffunction name="getAdminPlanTotals" access="public" output="false" returntype="query">
			<cfargument name="PlanPeriod" type="string" required="true" />
					
			<cfset var qList = "" />		
			
			<cfquery name="qList" datasource="#variables.dsn#">
				select top 1 planID,

						(select count(*) 
							from assessmentplan
							where 0=0
							AND planType = 3
							AND planperiod = <cfqueryparam value="#arguments.PlanPeriod#" CFSQLType="cf_sql_varchar" />) as total,
						
						( select count(*) 
							from assessmentplan
							where 0=0
							AND planType = 3
							AND planperiod = <cfqueryparam value="#arguments.PlanPeriod#" CFSQLType="cf_sql_varchar" />
							AND planStatus = 10 ) as New,

						( select count(*) 
							from assessmentplan
							where 0=0
							AND planType = 3
							AND planperiod = <cfqueryparam value="#arguments.PlanPeriod#" CFSQLType="cf_sql_varchar" />
							AND planStatus = 20 ) as Review,
						
						( select count(*) 
							from assessmentplan
							where 0=0
							AND planType = 3
							AND planperiod = <cfqueryparam value="#arguments.PlanPeriod#" CFSQLType="cf_sql_varchar" />
							AND planStatus = 30 ) as RevisePlan,


						( select count(*) 
							from assessmentplan
							where 0=0
							AND planType = 3
							AND planperiod = <cfqueryparam value="#arguments.PlanPeriod#" CFSQLType="cf_sql_varchar" />
							AND planStatus = 40 ) as CollectData,

						( select count(*) 
							from assessmentplan
							where 0=0
							AND planType = 3
							AND planperiod = <cfqueryparam value="#arguments.PlanPeriod#" CFSQLType="cf_sql_varchar" />
							AND planStatus = 50 ) as EnterResults,

						( select count(*) 
							from assessmentplan
							where 0=0
							AND planType = 3
							AND planperiod = <cfqueryparam value="#arguments.PlanPeriod#" CFSQLType="cf_sql_varchar" />
							AND planStatus = 60 ) as ReportResults,

						( select count(*) 
							from assessmentplan
							where 0=0
							AND planType = 3
							AND planperiod = <cfqueryparam value="#arguments.PlanPeriod#" CFSQLType="cf_sql_varchar" />
							AND planStatus = 70 ) as ReviseReportResults,

						( select count(*) 
							from assessmentplan
							where 0=0
							AND planType = 3
							AND planperiod = <cfqueryparam value="#arguments.PlanPeriod#" CFSQLType="cf_sql_varchar" />
							AND planStatus = 80 ) as Approved

					from assessmentplan

					
			</cfquery>
		
		
		<cfreturn qList />
	</cffunction>

	<cffunction name="getServicePlanTotals" access="public" output="false" returntype="query">
			<cfargument name="PlanPeriod" type="string" required="true" />
					
			<cfset var qList = "" />		
			
			<cfquery name="qList" datasource="#variables.dsn#">
				select  top 1 planID,

						(select count(*) 
							from assessmentplan
							where 0=0
							AND planType = 4
							AND planperiod = <cfqueryparam value="#arguments.PlanPeriod#" CFSQLType="cf_sql_varchar" />) as total,
						
						( select count(*) 
							from assessmentplan
							where 0=0
							AND planType = 4
							AND planperiod = <cfqueryparam value="#arguments.PlanPeriod#" CFSQLType="cf_sql_varchar" />
							AND planStatus = 10 ) as New,

						( select count(*) 
							from assessmentplan
							where 0=0
							AND planType = 4
							AND planperiod = <cfqueryparam value="#arguments.PlanPeriod#" CFSQLType="cf_sql_varchar" />
							AND planStatus = 20 ) as Review,
						
						( select count(*) 
							from assessmentplan
							where 0=0
							AND planType = 4
							AND planperiod = <cfqueryparam value="#arguments.PlanPeriod#" CFSQLType="cf_sql_varchar" />
							AND planStatus = 30 ) as RevisePlan,


						( select count(*) 
							from assessmentplan
							where 0=0
							AND planType = 4
							AND planperiod = <cfqueryparam value="#arguments.PlanPeriod#" CFSQLType="cf_sql_varchar" />
							AND planStatus = 40 ) as CollectData,

						( select count(*) 
							from assessmentplan
							where 0=0
							AND planType = 4
							AND planperiod = <cfqueryparam value="#arguments.PlanPeriod#" CFSQLType="cf_sql_varchar" />
							AND planStatus = 50 ) as EnterResults,

						( select count(*) 
							from assessmentplan
							where 0=0
							AND planType = 4
							AND planperiod = <cfqueryparam value="#arguments.PlanPeriod#" CFSQLType="cf_sql_varchar" />
							AND planStatus = 60 ) as ReportResults,

						( select count(*) 
							from assessmentplan
							where 0=0
							AND planType = 4
							AND planperiod = <cfqueryparam value="#arguments.PlanPeriod#" CFSQLType="cf_sql_varchar" />
							AND planStatus = 70 ) as ReviseReportResults,

						( select count(*) 
							from assessmentplan
							where 0=0
							AND planType = 4
							AND planperiod = <cfqueryparam value="#arguments.PlanPeriod#" CFSQLType="cf_sql_varchar" />
							AND planStatus = 80 ) as Approved

					from assessmentplan


			</cfquery>
		
		
		<cfreturn qList />
	</cffunction>


	<cffunction name="getAssessmentPlanDetails" access="public" output="false" returntype="query">
		<cfargument name="ReportingUnitID" type="numeric" required="true" />
		<cfargument name="PlanID" type="numeric" required="true" />

		<cfset var qList = "" />		
		
		<cfquery name="qList" datasource="#variables.dsn#">
			SELECT ru.*, odpt.DeptName, osd.SuperDivisionName,op.ProgramName, od.DivisionName, od.DivisionAbv, o.OrganizationName, ap.PlanPeriod, ap.PlanType, ap.PlanStatus, ap.PlanInitialReporter, ap.PlanLastChangeDate, apt.PlanTypeDescription, apw.WorkflowStepDescription, apw.WorkflowStepInstructions 

			FROM ReportingUnit ru LEFT JOIN OrganizationProgram op ON ru.ProgramID =op.ProgramID 
			LEFT JOIN OrganizationDept odpt ON ru.DeptID = odpt.DeptID 
			LEFT JOIN OrganizationDivision od ON ru.DivisionID = od.DivisionID 
			LEFT JOIN OrganizationSuperDivision osd ON ru.SuperDivisionID = osd.SuperDivisionID AND od.SuperDivisionID = osd.SuperDivisionID 
			LEFT JOIN Organization o ON ru.OrganizationID = o.OrganizationID AND osd.OrganizationID = o.OrganizationID 
			LEFT JOIN AssessmentPlan ap ON ru.ReportingUnitID = ap.ReportingUnitID 
			LEFT JOIN AssessmentPlanType apt ON ap.PlanType = apt.PlanType 
			LEFT JOIN AssessmentPlanWorkflow apw ON apt.PlanType = apw.PlanType AND ap.planStatus = apw.WorkflowStep 

			WHERE 0=0 

			 <cfif structKeyExists(arguments,"ReportingUnitID") and len(arguments.ReportingUnitID)>
				AND	ap.ReportingUnitID = <cfqueryparam value="#arguments.ReportingUnitID#" CFSQLType="cf_sql_integer" />
 			 </cfif>
 			 <cfif structKeyExists(arguments,"PlanID") and len(arguments.PlanID)>
				AND	ap.PlanID = <cfqueryparam value="#arguments.PlanID#" CFSQLType="cf_sql_integer" />
 			 </cfif>
		</cfquery>
		
		<!--- <cfdump var=#qList# abort="true" label="@assessmentplansGateway" /> --->

		<cfreturn qList />
	</cffunction>

	

	<cffunction name="getPlanGrid" access="public" output="false" returntype="query">
		<cfargument name="SuperDivisionID" type="string" required="false" />
		<cfargument name="DivisionID" type="string" required="false" />
		<cfargument name="departmentID" type="string" required="false" />
		<cfargument name="planperiod" type="string" required="false" />
		<cfargument name="plantype" type="string" required="false" />
		<cfargument name="programdegreelevel" type="string" required="false" />
		<cfargument name="planstatus" type="string" required="false" />

		<!--- 
		<cfdump var="#arguments#" abort="true" label="@@assPlanGateway" />
		--->

		<cfset var qList = "" />		
		
		<cfquery name="qList" datasource="#variables.dsn#">
			SELECT p.*, SuperDivisionName, DivisionName, DeptName, ProgramName, apw.WorkFlowStepDescription, ru.OrganizationID, ru.SuperDivisionID, ru.DivisionID, ru.DeptID, ru.ProgramID, ProgramDegreeLevel, PlanTypeDescription      

			FROM AssessmentPlan p, AssessmentPlanWorkflow apw, ReportingUnit ru, OrganizationSuperDivision osd, OrganizationDivision od, OrganizationDept odt, OrganizationProgram op, AssessmentPlanType apt      

			WHERE 0=0

			AND p.ReportingUnitID=ru.ReportingUnitID AND ru.SuperDivisionID=osd.SuperDivisionID 
			AND ru.DivisionID=od.DivisionID 
			AND ru.DeptID=odt.DeptID 
			AND p.PlanType=apw.PlanType 
			AND p.PlanType=apt.PlanType 
			AND p.PlanStatus=apw.WorkFlowStep AND ru.ProgramID=op.ProgramID 

			 <cfif structKeyExists(arguments,"SuperDivisionID") and len(arguments.SuperDivisionID) AND arguments.SuperDivisionID NEQ 0>
				AND	ru.SuperDivisionID = <cfqueryparam value="#arguments.SuperDivisionID#" CFSQLType="cf_sql_integer" />
 			 </cfif>
 			 <cfif structKeyExists(arguments,"DivisionID") and len(arguments.DivisionID) AND arguments.DivisionID NEQ 0>
				AND	ru.DivisionID = <cfqueryparam value="#arguments.DivisionID#" CFSQLType="cf_sql_integer" />
 			 </cfif>
 			  <cfif structKeyExists(arguments,"departmentID") and len(arguments.departmentID) AND arguments.departmentID NEQ 0>
				AND	ru.DeptID = <cfqueryparam value="#arguments.departmentID#" CFSQLType="cf_sql_integer" />
 			 </cfif>
 			  <cfif structKeyExists(arguments,"planperiod") and len(arguments.planperiod)>
				AND	p.planperiod = <cfqueryparam value="#arguments.planperiod#" CFSQLType="cf_sql_varchar" />
 			 </cfif>
 			 <cfif structKeyExists(arguments,"plantype") and len(arguments.plantype)>
				AND	p.plantype = <cfqueryparam value="#arguments.plantype#" CFSQLType="cf_sql_varchar" />
 			 </cfif>
 			  <cfif structKeyExists(arguments,"programdegreelevel") and len(arguments.programdegreelevel)>
				AND	op.programdegreelevel = <cfqueryparam value="#arguments.programdegreelevel#" CFSQLType="cf_sql_varchar" />
 			 </cfif>
 			   <cfif structKeyExists(arguments,"planstatus") and len(arguments.planstatus)>
				AND	p.planstatus = <cfqueryparam value="#arguments.planstatus#" CFSQLType="cf_sql_integer" />
 			 </cfif>


		</cfquery>
		
		<!---
		  <cfdump var=#qList# abort="true" label="@assessmentplansGateway" /> 
		--->
		
		<cfreturn qList />
	</cffunction>


	<cffunction name="getByAttributes" access="public" output="false" returntype="array">
		<cfargument name="PlanID" type="numeric" required="false" />
		<cfargument name="ReportingUnitID" type="numeric" required="false" />
		<cfargument name="PlanPeriod" type="string" required="false" />
		<cfargument name="PlanType" type="numeric" required="false" />
		<cfargument name="PlanStatus" type="numeric" required="false" />
		<cfargument name="PlanInitialReporter" type="string" required="false" />
		<cfargument name="PlanLastChangeDate" type="date" required="false" />
		<cfargument name="PlanLockDate" type="date" required="false" />
		<cfargument name="orderby" type="string" required="false" />
		
		<cfset var qList = getByAttributesQuery(argumentCollection=arguments) />		
		<cfset var arrObjects = arrayNew(1) />
		<cfset var tmpObj = "" />
		<cfset var i = 0 />
		<cfloop from="1" to="#qList.recordCount#" index="i">
			<cfset tmpObj = createObject("component","assessmentplans").init(argumentCollection=queryRowToStruct(qList,i)) />
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
