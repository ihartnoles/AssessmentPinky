<cfscript>
title 		 	=  "Add a plan";
qPlanTypes 		=  request.event.getArg('qPlanTypes');
qPrimaryAuthors	=  request.event.getArg('qPrimaryAuthors');
qPlanPeriods	=  request.event.getArg('qPlanPeriods');
</cfscript>

<!---
<cfdump var="#qPrimaryAuthors#" />
--->

<div id="main" style="margin-left: 0px;">
			<div class="container-fluid">

				<cfinclude template="/Assessment/views/page_header.cfm">

				<cfif structkeyexists(session, "layout_message")>
					<div class="row-fluid">
						<div class="text-center">
							<cfoutput>

								<cfif session.layout_message contains "Sorry">
									<div class="alert alert-error">
								<cfelse>
									<div class="alert alert-info">
								</cfif>
								
									
									<button class="close" data-dismiss="alert" type="button" id="closemessage"> x </button>
									#session.layout_message#

								</div>
							</cfoutput>	
						</div>
					</div>
				</cfif>

<div class="row-fluid">
					<div class="span12">
						<div class="box box-color box-bordered">
							<div class="box-title">
								<h3>
									<i class="icon-magic"></i>
									Add a new Assessment Plan 
								</h3>
							</div>
							<div class="box-content nopadding">
								<form action="index.cfm?event=createPlan" method="POST" class='form-horizontal form-wizard' id="ss">

									<cfoutput>
										<input type="hidden" name="reportingUnitID" value="#request.event.getArg('reportingUnitID')#" />
										<input type="hidden" name="programID" value="#request.event.getArg('programID')#" />
										<input type="hidden" name="deptID" value="#request.event.getArg('deptID')#" />
										<input type="hidden" name="divisionID" value="#request.event.getArg('divisionID')#" />
									</cfoutput>
									


									<div class="step" id="firstStep">
										<ul class="wizard-steps steps-4">
											<li class='active'>
												<div class="single-step">
													<span class="title">
														1</span>
													<span class="circle">
														<span class="active"></span>
													</span>
													<span class="description">
														Who is the author of this plan?
													</span>
												</div>
											</li>
											<li>
												<div class="single-step">
													<span class="title">
														2</span>
													<span class="circle">
													</span>
													<span class="description">
														Please select the Plan Period and Plan Type.
													</span>
												</div>
											</li>
											
											<!---
											<li>
												<div class="single-step">
													<span class="title">
														3</span>
													<span class="circle">
													</span>
													<span class="description">
														Additional information
													</span>
												</div>
											</li>
											<li>
												<div class="single-step">
													<span class="title">
														4</span>
													<span class="circle">
													</span>
													<span class="description">
														Check again
													</span>
												</div>
											</li>
											--->

										</ul>
										<div class="step-forms">

											<div class="row-fluid">
												<div class="span6">
													<span class="help-inline">Before you work on this assessment plan, please indicate who is the primary author of the plan.  Select a name from the list below OR select "Enter a name not listed above" and type in the person's name in the box provided.</span>
												</div>
											</div>

											<div class="row-fluid">
												<div class="span4">
													<!---
													<div class="control-group">
														<label for="planAuthor" class="control-label">Plan Author</label>
														<div class="controls">
															<textarea name="planAuthor" id="planAuthor" class="input-block-level" data-rule-required="true" cols="10">Lorem ipsum mollit minim fugiat tempor dolore sit officia ut dolore. </textarea>
														</div>
													</div>
													--->
													<div class="control-group">
														<label for="PlanInitialReporter" class="control-label">Plan Author</label>
														<div class="controls">
															<cfoutput>
															<select name="PlanInitialReporter" id="PlanInitialReporter" size="#qPrimaryAuthors.recordcount#" data-rule-required="true">
																<cfloop query="qPrimaryAuthors">
																	<cfoutput>
																		<option value="#qPrimaryAuthors.UserFName# #qPrimaryAuthors.UserLName#">#qPrimaryAuthors.UserFName# #qPrimaryAuthors.UserLName#</option>
																	</cfoutput>
																</cfloop>																
															</select>
															</cfoutput>
														</div>
													</div>
												</div>
											</div>
											

											<!---
											<div class="control-group">
												<label for="firstname" class="control-label">First name</label>
												<div class="controls">
													<input type="text" name="firstname" id="firstname" class="input-xlarge" data-rule-required="true">
												</div>
											</div>
											<div class="control-group">
												<label for="anotherelem" class="control-label">Last name</label>
												<div class="controls">
													<input type="text" name="anotherelem" id="anotherelem" class="input-xlarge" data-rule-required="true">
												</div>
											</div>
											<div class="control-group">
												<label for="additionalfield" class="control-label">Additional information</label>
												<div class="controls">
													<input type="text" name="additionalfield" id="additionalfield" class="input-xlarge" data-rule-required="true" data-rule-minlength="10">
												</div>
											</div>
											--->
										</div>
									</div>
									<div class="step" id="secondStep">
										<ul class="wizard-steps steps-4">
											<li>
												<div class="single-step">
													<span class="title">
														1</span>
													<span class="circle">
														
													</span>
													<span class="description">
														Who is the author of this plan?
													</span>
												</div>
											</li>
											<li class='active'>
												<div class="single-step">
													<span class="title">
														2</span>
													<span class="circle">
														<span class="active"></span>
													</span>
													<span class="description">
														Please select the Plan Period and Plan Type.
													</span>
												</div>
											</li>
											<!---
											<li>
												<div class="single-step">
													<span class="title">
														3</span>
													<span class="circle">
													</span>
													<span class="description">
														Additional information
													</span>
												</div>
											</li>
											<li>
												<div class="single-step">
													<span class="title">
														4</span>
													<span class="circle">
													</span>
													<span class="description">
														Check again
													</span>
												</div>
											</li>
											--->
										</ul>
										<div class="control-group">
											<label for="text" class="control-label">Plan Period</label>
											<div class="controls">
												<select name="planPeriod" id="planPeriod" data-rule-required="true">
													<option value="">-- Chose one --</option>
													<cfloop query="qPlanPeriods">
														<cfoutput>
															<option value="#qPlanPeriods.PlanPeriod#">#qPlanPeriods.PlanPeriod#</option>
														</cfoutput>
													</cfloop>											
												</select>
											</div>
										</div>			

										<div class="control-group">
											<label for="text" class="control-label">Plan Type</label>
											<div class="controls">
												<select name="planType" id="planType" data-rule-required="true">
													<option value="">-- Chose one --</option>
													<cfloop query="qPlanTypes">
														<cfoutput>
															<option value="#qPlanTypes.PlanType#">#qPlanTypes.PlanTypeDescription#</option>
														</cfoutput>
													</cfloop>											
												</select>
											</div>
										</div>											
									</div>
									<!---
									<div class="step" id="thirdStep">
										<ul class="wizard-steps steps-4">
											<li>
												<div class="single-step">
													<span class="title">
														1</span>
													<span class="circle">
														
													</span>
													<span class="description">
														Basic information
													</span>
												</div>
											</li>
											<li>
												<div class="single-step">
													<span class="title">
														2</span>
													<span class="circle">
														
													</span>
													<span class="description">
														Advanced information
													</span>
												</div>
											</li>
											<li class='active'>
												<div class="single-step">
													<span class="title">
														3</span>
													<span class="circle">
														<span class="active"></span>
													</span>
													<span class="description">
														Additional information
													</span>
												</div>
											</li>
											<li>
												<div class="single-step">
													<span class="title">
														4</span>
													<span class="circle">
													</span>
													<span class="description">
														Check again
													</span>
												</div>
											</li>
										</ul>
										<div class="control-group">
											<label for="text" class="control-label">Additional information</label>
											<div class="controls">
												<textarea name="textare" id="tt333" class="span12" rows="7" placeholder="You can provide additional information in here..."></textarea>
											</div>
										</div>
									</div>
									--->
									<!---
									<div class="step" id="fourthstep">
										<ul class="wizard-steps steps-4">
											<li>
												<div class="single-step">
													<span class="title">
														1</span>
													<span class="circle">
														
													</span>
													<span class="description">
														Basic information
													</span>
												</div>
											</li>
											<li>
												<div class="single-step">
													<span class="title">
														2</span>
													<span class="circle">
														
													</span>
													<span class="description">
														Advanced information
													</span>
												</div>
											</li>
											<li>
												<div class="single-step">
													<span class="title">
														3</span>
													<span class="circle">
													</span>
													<span class="description">
														Additional information
													</span>
												</div>
											</li>
											<li class='active'>
												<div class="single-step">
													<span class="title">
														4</span>
													<span class="circle">
														<span class="active"></span>
													</span>
													<span class="description">
														Check again
													</span>
												</div>
											</li>
										</ul>
										<div class="control-group">
											<label for="text" class="control-label">Check again</label>
											<div class="controls">
												<label class="checkbox"><input type="checkbox" name="policy" value="agree" data-rule-required="true"> Everything is ok. Submit</label>
											</div>
										</div>
									</div>--->
									<div class="form-actions">
										<input type="reset" class="btn" value="Back" id="back">
										<input type="submit" class="btn btn-primary" value="Submit" id="next">
									</div>
									
								</form>
							</div>
						</div>
					</div>
				</div>

</div></div>