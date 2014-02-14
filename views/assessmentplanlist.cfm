<cfscript>
title 		 =  request.event.getArg('programname');
qPlanPeriods =  request.event.getArg('planperiods');
</cfscript>

 <!--- qPlanPeriods 
<cfdump var="#session.user#" label="session.user @ assesmentplanlist.cfm  - 8" />
--->
<!---
<cfdump var="#qPlanPeriods#" label="qPlanPeriods @ assesmentplanlist.cfm  - 9" />
--->

<div id="main" style="margin-left: 0px;">
			<div class="container-fluid">

				<cfinclude template="/Assessment/views/page_header.cfm">
	

				<div class="row-fluid">
					<div class="span12">
						<div class="box box-color box-bordered">
							<div class="box-title">
								<h3>
									<i class="icon-search"></i>
									Assessment Plan Periods
								</h3>

									<div class="actions">
									<a href="##" class='btn' rel="popover" data-trigger="hover" title="" data-placement="left" data-content="This is a list of the available plan periods Click on the plan-period to view the plan specifics." ><i class=" icon-question-sign"></i> Help</a>
								</div>
							</div>
							<div class="box-content nopadding">
								
								<div class="search-results">
									<ul>

										<!--- <cfloop list="2012-2013,2011-2012,2010-2011,2009-2010" index="idx"> --->
										<cfloop query="qPlanPeriods">									
											<cfoutput>		
												<li>
													<!---
													<div class="thumbnail"> 
														<img src="http://www.placehold.it/80" alt="">		
													</div>
													--->
													<div class="span12 search-info">
														<a href="index.cfm?event=showplan&reportingUnitID=#reportingUnitID#&PlanID=#planID#&ProgramID=#programID#&DeptID=#deptID#&DivisionID=#divisionid#" rel="tooltip" data-placement="right" title="View/Modify Plan">Plan Period: #qPlanPeriods.PlanPeriod#</a>
														<!--- <p class="url">www.loremasdasdd.com/</p> --->
														<br>Plan Reporter: 
														
														<cfif len(trim(#qPlanPeriods.PlanInitialReporter#))>
															<span class="text-info">#qPlanPeriods.PlanInitialReporter#</span>
														<cfelse>
															<span class="text-error">N/A</span>
														</cfif>
														
														

														<br>Status:
															<!---
															<cfset tmp = ListGetRandom("Approved (complete),Submitted for review,Collect data,Revise Plan") />

															<cfswitch expression="#tmp#">
																<cfcase value="Approved (complete)">
																	<cfset class = "text-success" />
																</cfcase>
																<cfcase value="Revise Plan">
																	<cfset class = "text-error" />
																</cfcase>
																<cfdefaultcase>
																	<cfset class = "text-info" />
																</cfdefaultcase>
															</cfswitch>
															--->
															<span class="text-success"> 
																#qPlanPeriods.WorkFlowStepDescription#
															</span>
														  <br>Last Updated: 
														  	<cfif len(trim(#qPlanPeriods.PlanLastChangeDate#))>
																<span class="text-info">#DateFormat(qPlanPeriods.PlanLastChangeDate,'mm-dd-yyyy')# @ #TimeFormat(qPlanPeriods.PlanLastChangeDate,'long')# </span>
															<cfelse>
																<span class="text-error">N/A</span>
															</cfif>

														  <br>Actions:<br>
														 
														  <cfif session.user.userroledescription eq 'Administrator' OR session.user.userroledescription eq 'Plan Reporter'>
														  		<cfif qPlanPeriods.PlanStatus NEQ 20>
														  			<a href="index.cfm?event=savestatus&planid=#qPlanPeriods.planid#&programname=#title#&planperiod=#qPlanPeriods.PlanPeriod#&reportingUnitID=#reportingUnitID#&ProgramID=#programID#&DeptID=#deptID#&DivisionID=#divisionid#&reporter=#qPlanPeriods.PlanInitialReporter#&planstatus=20" title="Submit for Review">Submit for Review</a> | 
														  		</cfif>														  		
														  </cfif>
														  
														  	
														  
														  <cfif session.user.userroledescription eq 'Administrator' OR session.user.userroledescription eq 'Plan Reviewer'>
														  	<a href="index.cfm?event=showStatus&planid=#qPlanPeriods.planid#&programname=#title#&planperiod=#qPlanPeriods.PlanPeriod#&reportingUnitID=#reportingUnitID#&ProgramID=#programID#&DeptID=#deptID#&DivisionID=#divisionid#" title="Update Plan Status">Update Status</a> 
														  	
														  </cfif>
														  
														   <cfif session.user.userroledescription eq 'Administrator' OR session.user.userroledescription eq 'Plan Reviewer' >
														  	 |	<a href="index.cfm?event=savestatus&planid=#qPlanPeriods.planid#&programname=#title#&planperiod=#qPlanPeriods.PlanPeriod#&reportingUnitID=#reportingUnitID#&ProgramID=#programID#&DeptID=#deptID#&DivisionID=#divisionid#&reporter=#qPlanPeriods.PlanInitialReporter#&planstatus=30" title="Request Revision">Request Revision </a> 
														  </cfif>

														  

														  <cfif session.user.userroledescription eq 'Administrator' OR session.user.userroledescription eq 'Plan Reviewer'>
														 	| <a href="index.cfm?event=savestatus&planid=#qPlanPeriods.planid#&programname=#title#&planperiod=#qPlanPeriods.PlanPeriod#&reportingUnitID=#reportingUnitID#&ProgramID=#programID#&DeptID=#deptID#&DivisionID=#divisionid#&reporter=#qPlanPeriods.PlanInitialReporter#&planstatus=40" title="Request Revision">Accept Plan</a>
														  </cfif>
														 
													</div>
												</li>
											</cfoutput>
										</cfloop>									
								</div>								
									
								</div>
							</div>
						</div>
					</div>
				</div>


</div></div>

<cfscript>
/**
 * Returns a random selection from a comma delimited list.
 * Modified by Raymond Camden
 * 
 * @param List 	 The list to grab a random element from. (Required)
 * @param Delimiter 	 The list delimiter. Defaults to a comma. (Optional)
 * @return Returns a random element from the list. 
 * @author Brad Breaux (&#98;&#98;&#114;&#101;&#97;&#117;&#120;&#64;&#98;&#108;&#105;&#112;&#122;&#46;&#99;&#111;&#109;) 
 * @version 2, March 12, 2004 
 */
function ListGetRandom(instring) {
	var delim = ",";
	var rnum = 0;
	var r = '';
 	if(ArrayLen(Arguments) GTE 2) delim = Arguments[2];
   	if(listlen(instring) gt 0) {
		rnum = randrange(1,listlen(instring,delim));
    		r = listgetat(instring,rnum,delim);
	}
	return r;
 }
</cfscript>