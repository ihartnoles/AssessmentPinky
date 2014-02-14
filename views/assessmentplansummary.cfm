<!--- 
<cfdump var="#qPrimaryAuthors#" abort="false" label="assessmentplansummary.cfm" />
--->

<form action="#" method="POST" class='form-horizontal form-column form-bordered'>
								 <!---
								 <cfloop query="qPlanDetails">
								 	<cfoutput>
								 --->
									<div class="span6">
										<div class="control-group">
											<label for="textfield" class="control-label">College/Division</label>
											<div class="controls">
												<cfoutput>#qPlanDetails.DivisionName#</cfoutput>
											</div>
										</div>
										<div class="control-group">
											<label for="password" class="control-label">Department</label>
											<div class="controls">
												<cfoutput>#qPlanDetails.DeptName#</cfoutput>
											</div>
										</div>
										<div class="control-group">
											<label class="control-label">Program</label>
											<div class="controls">
												<cfoutput>#qPlanDetails.programname#</cfoutput>
											</div>
										</div>
										<!---
										<div class="control-group">
											<label for="textarea" class="control-label">Textarea</label>
											<div class="controls">
												<textarea name="textarea" id="textarea" rows="5" class="input-block-level">Lorem ipsum mollit minim fugiat tempor dolore sit officia ut dolore. </textarea>
											</div>
										</div>
										--->
									</div>
									<div class="span6">
										<div class="control-group">
											<label for="textfield" class="control-label">Plan Type</label>
											<div class="controls">
												 <cfoutput>#qPlanDetails.PlanTypeDescription#</cfoutput>
											</div>
										</div>
										<div class="control-group">
											<label for="password" class="control-label">Plan Status</label>
											<div class="controls">
												<cfoutput>#qPlanDetails.WorkFlowStepDescription#</cfoutput>
											</div>
										</div>
										<div class="control-group">
											<label class="control-label">Updated</label>
											<div class="controls">
												
												<cfif len(trim(qPlanDetails.PlanLastChangeDate))>
													<cfoutput>#DateFormat(qPlanDetails.PlanLastChangeDate,'mm/dd/yyyy')#</cfoutput>
												<cfelse>
													N/A
												</cfif>				
												
											</div>
										</div>
										<!---
										<div class="control-group">
											<label for="textarea" class="control-label">Textarea</label>
											<div class="controls">
												<textarea name="textarea" id="textarea" rows="5" class="input-block-level">Lorem ipsum mollit minim fugiat tempor dolore sit officia ut dolore. </textarea>
											</div>
										</div>
										--->
									</div>
									
									<!---
									<div class="span12">
										<div class="form-actions">
											<button type="submit" class="btn btn-primary">Save changes</button>
											<button type="button" class="btn">Cancel</button>
										</div>
									</div>
									--->
									<div class="span12 alert alert-info alert-nomargin">
										
										<div class="row-fluid text-center">
										
											<strong>Plan developed by:</strong><br>

											<cfif len(trim(qPlanDetails.PlanInitialReporter))>
												<cfoutput>#qPlanDetails.PlanInitialReporter#</cfoutput>
											<cfelse>
												N/A
											</cfif>
											<br><br>
										</div>

										<div class="span12 row-fluid text-center">
											<strong>Contact Person(s):</strong><br>
										</div>

										

										<div class="row-fluid text-center">
											<cfif qPrimaryAuthors.recordcount >													
												
												<cfoutput query="qPrimaryAuthors">
														<div class="text-center">
															<a href="index.cfm?event=writemessage&userid=#qPrimaryAuthors.userid#">#userfname# #userlname#</a>
														</div>
												</cfoutput>

											</cfif>
										</div>
										<!---
										<center>
											<table class="alert alert-info alert-nomargin">
												<tr>
													<td>Plan developed by:</td>
													<td>
														<cfif len(trim(qPlanDetails.PlanInitialReporter))>
															<cfoutput>#qPlanDetails.PlanInitialReporter#</cfoutput>
														<cfelse>
															N/A
														</cfif>
													</td>
												</tr>
												<tr>
													<td>Contact Person(s):</td>
													<td>
														<cfoutput query="qPrimaryAuthors">
															#userfname# #userlname#
														</cfoutput>
													</td>
												</tr>
											</table>										
										</center>
										--->
									</div>

									<!--- don't display this row on event=outcomedetails --->
									<cfif cgi.QUERY_STRING does not contain "outcomedetails" AND cgi.QUERY_STRING does not contain "editoutcome" >
										<div class="span12 alert alert-warning alert-nomargin">
											
											<div class="row-fluid text-center">
												<strong>This plan currently has <cfoutput>#qcountOutcomes.recordcount#</cfoutput> outcomes</strong><br>

												<cfoutput>#qPlanDetails.WorkflowStepInstructions#</cfoutput>
											</div>
											<!---
											<center>
												<table class="alert alert-warning alert-nomargin">
													<tr>
														<td>This plan currently has <cfoutput>#qcountOutcomes.recordcount#</cfoutput> outcomes.</td>													
													</tr>
													<tr>
														<td><cfoutput>#qPlanDetails.WorkflowStepInstructions#</cfoutput></td>
													</tr>											
												</table>										
											</center>
											--->
										</div>
								   </cfif>

								</form>
							<!---
								</cfoutput>
							</cfloop>
							--->