<cfscript>
		qPlanGrid = request.event.getArg('qPlanGrid');
</cfscript>

<!--- 
<cfdump var="#qPlanGrid#" abort="false" />
<cfdump var="#request.event.getArgs()#" abort="false" />
--->
<div class="box-content nopadding">
		<table class="table table-hover table-nomargin">
			<cfif qPlanGrid.recordcount>
				<thead>
					<tr>
						<th>Super-Division</th>
						<th>Division</th>
						<th class='hidden-350'>Department</th>
						<th class='hidden-1024'>Program</th>
						<th class='hidden-480'>Plan Type</th>
						<!--- <th class='hidden-480'>Plan Status</th> --->
						<th class='hidden-1024'>Plan Year</th>
					</tr>
				</thead>
				<tbody>
					
					
						
						<cfif request.event.isArgDefined('redirect')>
							<!--- this accomodates clicks from dashboard quick stat tiles --->
							<cfoutput query="qPlanGrid">
								<tr>
									<td>#qPlanGrid.SuperDivisionName#</td>
									<td>#qPlanGrid.DivisionName#</td>
									<td class='hidden-350'>#qPlanGrid.DeptName#</td>
									<td class='hidden-1024'>#qPlanGrid.programname#</td>
									<td class='hidden-480'>#qPlanGrid.PlanTypeDescription#</td>
									<!--- <td class='hidden-480'>#qPlanGrid.WorkFlowStepDescription#</td> --->
									<td class='hidden-1024'>
										<cfoutput group="PlanPeriod">
											<a href="index.cfm?event=showplan&reportingunitID=#qPlanGrid.reportingUnitID#&planid=#qPlanGrid.planID#&programID=#qPlanGrid.programID#&deptID=#qPlanGrid.deptID#&divisionID=#qPlanGrid.divisionID#">#qPlanGrid.PlanPeriod#</a>
										</cfoutput>

										
									</td>
								</tr>
							</cfoutput>
						<cfelse>
							<!--- this will display results from search (report) UI --->
							<cfoutput query="qPlanGrid" group="programname">
								<cfoutput group="PlanTypeDescription"> 
								<tr>
									<td>#qPlanGrid.SuperDivisionName#</td>
									<td>#qPlanGrid.DivisionName#</td>
									<td class='hidden-350'>#qPlanGrid.DeptName#</td>
									<td class='hidden-1024'>#qPlanGrid.programname#</td>
									<td class='hidden-480'>#qPlanGrid.PlanTypeDescription#</td>
									<!--- <td class='hidden-480'>#qPlanGrid.WorkFlowStepDescription#</td> --->
									<td class='hidden-1024'>
										<cfoutput group="PlanPeriod">
											<a href="index.cfm?event=showplan&reportingunitID=#qPlanGrid.reportingUnitID#&planid=#qPlanGrid.planID#&programID=#qPlanGrid.programID#&deptID=#qPlanGrid.deptID#&divisionID=#qPlanGrid.divisionID#">#qPlanGrid.PlanPeriod#</a>
										</cfoutput>

										
									</td>
								</tr>
								</cfoutput>
							</cfoutput>
						</cfif>

					
					

					<!---
					<cfloop query="qPlanGrid">
						<cfoutput>
							<tr>
								<td colspan="6">#qPlanGrid.SuperDivisionName#</td>
							</tr>
						</cfoutput>
					</cfloop>
					--->
				
				</tbody>
			<cfelse>
				<thead>
					<tr colspan="6">
						<div class="alert alert-error text-center">
						 <b><cfoutput>#qPlanGrid.recordcount#</cfoutput> records found.</b><br> Please revise your search criteria!
						</div>
					</tr>
				</thead>
			</cfif>

			
		</table>
</div>