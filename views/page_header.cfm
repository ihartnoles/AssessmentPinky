<div class="page-header">
					<div class="pull-left">

						<cfif cgi.QUERY_STRING does not contain "validateLogin">
							<h1><cfoutput>#title#</cfoutput></h1>
						</cfif>
						
						<cfif cgi.QUERY_STRING contains "showAssessmentPlanList">
							<div class="row-fluid">
								<div class="span12">
									
									<cfoutput>
										<cfif session.user.userroleid lte 2>
											<a href="index.cfm?event=addPlan&reportingUnitID=#request.event.getArg('reportingUnitID')#&ProgramID=#request.event.getArg('ProgramID')#&DeptID=#request.event.getArg('DeptID')#&DivisionID=#request.event.getArg('DivisionID')#" class="btn btn-red">
												<i class="icon-pencil"></i>									
												<span>Add Assessment Plan</span>
											</a>
										</cfif>
											
										<a href="index.cfm?event=viewALC&reportingUnitID=#request.event.getArg('reportingUnitID')#" class="btn btn-red">
											<i class="icon-book"></i>									
											<span>Academic Learning Compact</span>
										</a>
									</cfoutput>


								</div>
							</div>
						</cfif>

						<cfif cgi.QUERY_STRING contains "showDepartmentPlanList">
								
								<!--- set the layoutmessage --->
								<cfset layout_message = structKeyExists(session, "layout_message") ? session.layout_message : "" />

								<div class="span12">
									

									<div class="row-fluid">
										<cfoutput>
											<form action="index.cfm?event=addNewReviewPlan&reportingUnitID=#request.event.getArg('reportingUnitID')#" method="post" name="addReviewPlanForm">
											
												<div class="span2">
													<select name="reviewPeriod" class="input-medium">
														<cfloop query="qReviewPlanPeriods">
															<option value="#qReviewPlanPeriods.reviewPeriod#">#qReviewPlanPeriods.reviewPeriod#</option>
														</cfloop>
													</select>
												</div>

												<div class="span10 pull-left">
													<!---
													<a href="index.cfm?event=addReviewPlan&reportingUnitID=#request.event.getArg('reportingUnitID')#&ProgramID=#request.event.getArg('ProgramID')#&DeptID=#request.event.getArg('DeptID')#&DivisionID=#request.event.getArg('DivisionID')#" class="btn btn-red">
														<i class="icon-pencil"></i>									
														<span>Add Dept. Performance Review Plan</span>
													</a>			
													--->
													<button type="submit" class="btn btn-red">Add Dept. Performance Review Plan</button>
												</div>										
											</form>
										</cfoutput>
									</div>

									

							</div>
						</cfif>


					</div>


					<cfif cgi.QUERY_STRING does not contain "validateLogin">

						<div class="pull-right">
							<!--- 
							<ul class="minitiles">
								<li class='grey'>
									<a href="#"><i class="icon-cogs"></i></a>
								</li>							
							</ul>
							--->
							<ul class="stats">
								
								<li class='lightred'>
									<i class="icon-calendar"></i>
									<div class="details">
										<span class="big"><cfoutput>#DateFormat(now(),"long")#</cfoutput></span>
										<span>
											<cfoutput>#DateFormat(now(),"dddd")#, #TimeFormat(now(), "hh:mm tt")# </cfoutput>
										</span>
									</div>
								</li>
							</ul>
						</div>

					</cfif>
				</div>
				<!---
				<div class="breadcrumbs">
					<ul>
						<li>
							<a href="more-login.html">Home</a>
							<i class="icon-angle-right"></i>
						</li>
						<li>
							<a href="more-files.html">Pages</a>
							<i class="icon-angle-right"></i>
						</li>
						<li>
							<a href="more-blank.html">Blank page</a>
						</li>
					</ul>
					<div class="close-bread">
						<a href="#"><i class="icon-remove"></i></a>
					</div>
				</div>
				--->