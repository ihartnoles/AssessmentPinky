<cfscript>
title 					= "Add a new outcome" ;
qPlanDetails			= request.event.getArg('qPlanDetails');
qcountOutcomes    		= request.event.getArg('qcountOutcomes');
qALCCategories			= request.event.getArg('qALCCategories');
qPrimaryAuthors			= request.event.getArg('qPrimaryAuthors');
qGoalList				= request.event.getArg('qGoalList');
</cfscript>

<div id="main" style="margin-left: 0px;">
			<div class="container-fluid">

				<cfinclude template="/Assessment/views/page_header.cfm">
				<!---
				<cfdump var="#qPlanDetails#" />

				<cfdump var="#qcountOutcomes#" />

				<cfdump var="#qALCCategories#" />
				
				<cfdump var="#arguments#" />
				--->

			<div class="row-fluid">
					<div class="span12">
						<div class="box">
							<div class="box-content">
								<div class="row-fluid">
									<div class="box box-bordered">
										<!---<h4>booyah</h4>--->
										<div class="box-title">
												<h3><i class="icon-reorder"></i>Assessment Plan Summary</h3>
										</div>
										<div class="box-content nopadding">

										<cfinclude template="assessmentplansummary.cfm" />
							</div>
									</div>
									
								</div>
							
								<div class="row-fluid margin-top">
									<div class="span12">

										
										<div class="box box-bordered box-color">
											<div class="box-title">
												<h3><i class="icon-reorder"></i>New Outcome Details</h3>
											</div>
													<div class="box-content">
														
														<form action="index.cfm?event=saveOutcome" method="POST" class='form-vertical form-bordered'>
															<cfoutput>
																<input type="hidden" name="planID" value="#request.event.getArg('planID')#" />
																<input type="hidden" name="reportingUnitID" value="#request.event.getArg('reportingUnitID')#" />
															</cfoutput>

															<div class="control-group">
																<label for="textarea" class="control-label"><strong>Outcome Description</strong></label>
																<div class="controls">
																	<textarea name="outcomeDescription" id="textarea" rows="5" class="ckeditor input-block-level"></textarea>
																</div>
															</div>

															<!---
															<div class="control-group">
																<label class="control-label"><strong>Academic Learning Compact</strong></label>
																<div class="controls">
																	<label class='checkbox'>
																		<input type="checkbox" name="checkbox"> Lorem ipsum eiusmod
																	</strong></label>
																	<label class='checkbox'>
																		<input type="checkbox" name="checkbox"> ipsum eiusmod
																	</strong></label>
																</div>
															</div>
															--->

															<div class="control-group">
																	<div class="row-fluid">
																		<label class="control-label"><strong>Academic Learning Categories related to this outcome:</strong></label>
																	</div>

																	<div class="row-fluid">
																		<cfoutput query="qALCCategories" group="CategoryID" >
																			<div class="span3">																			
																					<div class="controls">
																						<cfoutput group="SubCategoryTitle">
																							<cfif qALCCategories.SubCategoryID EQ 10011 OR qALCCategories.SubCategoryID EQ 10012 OR qALCCategories.SubCategoryID EQ 10013>
																							   <div class="check-line">
																							<cfelse>
																							  <div class="check-line offset1">
																							</cfif>
																								<input type="checkbox" name="ALCSubCategory" value="#qALCCategories.SubCategoryID#"  class='icheck-me' data-skin="square" data-color="blue"> 
																								<label class='inline' for="c6">#qALCCategories.SubCategoryTitle#</label>
																							</div>																							
																						</cfoutput>
																					</div>
																			</div>
																		</cfoutput>
																	</div>
																</div>

															<!---
															<div class="control-group">
																<label class="control-label"><strong>Strategic Plan Goals</strong></label>
																<div class="controls">
																	<label class='checkbox'>
																		<input type="checkbox" name="checkbox"> Lorem ipsum eiusmod
																	</strong></label>
																	<label class='checkbox'>
																		<input type="checkbox" name="checkbox"> ipsum eiusmod
																	</strong></label>
																</div>
															</div>
															--->

															<div class="row-fluid">
																<div class="span12">
																	<div class="control-group">
																		<label class="control-label"><strong>Strategic Plan Goals</strong></label>
																		<div class="controls">

																			<!---
																			<select name="goalID" size="27" multiple style="width: 650px;">
																			<cfoutput query="qGoalList" group="goal">
																				<optgroup label="#qGoalList.goal#">
																					<cfoutput group="objective">
																						<option value="#qGoalList.id#">#qGoalList.objective#</option>
																					</cfoutput>
																				</optgroup>
																			</cfoutput>
																			</select>
																			--->

																							<cfoutput query="qGoalList" group="GoalTitle" >
																							 <div class="row-fluid">
																								<div class="span9">																			
																										<div class="controls">
																											<cfoutput group="objectivetitle">
																												<!---
																												<cfif qALCCategories.SubCategoryID EQ 10011 OR qALCCategories.SubCategoryID EQ 10012 OR qALCCategories.SubCategoryID EQ 10013>
																												   <div class="check-line">
																												<cfelse>
																												--->
																												<div class="check-line offset1">
																												<!--- </cfif> --->
													<input type="checkbox" name="goalID" value="#qGoalList.objectiveID#"  class='icheck-me' data-skin="square" data-color="blue" > 
																													<label class='inline' for="c6">
																														<cfif qGoalList.objectivetitle EQ 'All objectives'>
																															<b>Goal #qGoalList.GoalID# : #qGoalList.goaltitle#</b><br><br>																								
																														<cfelse>
																															<b>Objective #qGoalList.ObjectiveOrder# :</b> #qGoalList.objectivetitle#
																														</cfif>
																													</label>
																												</div>																							
																											</cfoutput>
																										</div>
																								</div>
																							</div> <br>
																							</cfoutput>
																		</div>
																	</div>

																	
																</div>
															</div>


															<div class="control-group">
																<label for="textarea" class="control-label"><strong>Implementing Strategy</strong></label>
																<div class="controls">
																	<textarea name="outcomeStrategy" id="textarea" rows="5" class="ckeditor input-block-level"></textarea>
																</div>
															</div>

															<div class="control-group">
																<label for="textarea" class="control-label"><strong>Assessment Method</strong></label>
																<div class="controls">
																	<textarea name="outcomeMethod" id="textarea" rows="5" class="ckeditor input-block-level"></textarea>
																</div>
															</div>

															<div class="control-group">
																<label for="textarea" class="control-label"><strong>Criterion for Success</strong></label>
																<div class="controls">
																	<textarea name="outcomeCriterion" id="textarea" rows="5" class="ckeditor input-block-level"></textarea>
																</div>
															</div>

															<div class="control-group">
																<label for="textarea" class="control-label"><strong>Data Summary: Analysis & Evaluation</strong></label>
																<div class="controls">
																	<textarea name="outcomeresults" id="textarea" rows="5" class="ckeditor input-block-level"></textarea>
																</div>
															</div>

															
															<div class="control-group">
																<label for="textarea" class="control-label"><strong>Program Improvement</strong></label>
																<div class="controls">
																	<textarea name="outcomeplanningimprovement" id="textarea" rows="5" class="ckeditor input-block-level"></textarea>
																</div>
															</div>


															<div class="form-actions">
																<button type="submit" class="btn btn-red">Save changes</button>
																<button type="button" class="btn">Cancel</button>
															</div>
														</form>
														
													</div><!--- end box-content --->
											</div>
										</div>
									</div>
								</div>
								


							</div>
						</div>
					</div>
				</div>


</div></div>
