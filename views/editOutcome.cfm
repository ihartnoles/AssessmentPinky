<cfscript>
//index.cfm?event=editOutcome&outcomeID=???&reportingUnitID=131101&planID=14883
qPlanDetails			= request.event.getArg('qPlanDetails');
qcountOutcomes    		= request.event.getArg('qcountOutcomes');
qALCCategories			= request.event.getArg('qALCCategories');
qSelectedALCCategories	= request.event.getArg('qSelectedALCCategories');
qCodesList				= request.event.getArg('qCodesList');
qSelectedProgImpCodes 	= request.event.getArg('qSelectedProgImpCodes');
qGoalList				= request.event.getArg('qGoalList');
qSelectedGoals			= request.event.getArg('qSelectedGoals');

if ( cgi.query_string CONTAINS "editOutcome"){
	title = "Edit outcome" ;
} else {
	title = "Add a new outcome" ;
}

qPrimaryAuthors			= request.event.getArg('qPrimaryAuthors');
</cfscript>

<div id="main" style="margin-left: 0px;">
			<div class="container-fluid">

				<cfinclude template="/Assessment/views/page_header.cfm">
				
				<!---
				<cfdump var="#qPrimaryAuthors#" label="qPrimaryAuthors" abort="true" />
				
				<cfdump var="#qGoalList#" label="qGoalList" />
				<cfdump var="#qSelectedGoals#" label="qSelectedGoals" />
				<cfdump var="#qcountOutcomes#" />
				<cfdump var="#qSelectedALCCategories#" />
				<cfdump var="#qPlanDetails#" />
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
												<h3><i class="icon-reorder"></i>Edit Outcome Details</h3>
											</div>
													<div class="box-content">
														<!--- <cfloop query="qcountOutcomes"> 
														<cfoutput>
															--->
														<form action="index.cfm?event=saveOutcome" method="POST" class='form-vertical form-bordered'>
															
															<cfoutput>
																<input type="hidden" name="outcomeID" value="#qcountOutcomes.outcomeID#" />
																<input type="hidden" name="outcomeOrder" value="#qcountOutcomes.outcomeOrder#" />
																<input type="hidden" name="planID" value="#request.event.getArg('planID')#" />
																<input type="hidden" name="reportingUnitID" value="#request.event.getArg('reportingUnitID')#" />
															
																<div class="control-group">
																	<label for="textarea" class="control-label"><strong>Outcome Description</strong></label>
																	<div class="controls">
																		<textarea name="outcomeDescription" id="textarea" rows="5" class="ckeditor input-block-level">#trim(paragraphformat(qcountOutcomes.outcomeDescription))#</textarea>
																	</div>
																</div>
															</cfoutput>

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

															<!--- --->
														
																
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
																								<input type="checkbox" name="ALCSubCategory" value="#qALCCategories.SubCategoryID#"  class='icheck-me' data-skin="square" data-color="blue" <cfif ValueList(qSelectedALCCategories.subcategoryID) CONTAINS qALCCategories.SubCategoryID >checked</cfif>> 
																								<label class='inline' for="c6">#qALCCategories.SubCategoryTitle#</label>
																							</div>																							
																						</cfoutput>
																					</div>
																			</div>
																		</cfoutput>
																	</div>
																</div>
																	
																	<div class="control-group">
																		<div class="row-fluid">
																			<div class="span3">
																				<p><strong>QEP / URI Related</strong></p>

																				<div class="check-line">
																						<input type="radio"  name="qep_uri_related" value="1" class='icheck-me' data-skin="square" data-color="blue" <cfif qcountOutcomes.qep_uri_related eq 1>
																							checked
																						</cfif> > <label class='inline' for="c6">Yes</label>

																				</div>

																				<div class="check-line">
																					<input type="radio"   name="qep_uri_related" value="0" class='icheck-me' data-skin="square" data-color="blue" <cfif qcountOutcomes.qep_uri_related eq 0>
																							checked
																						</cfif>> <label class='inline' for="c6">No</label>
																				</div>

																			</div>

																			<div class="span3">
																				<p><strong>IFP Related</strong></p>

																				<div class="check-line">
																						<input type="radio"  name="ifp_related" value="1" class='icheck-me' data-skin="square" data-color="blue" <cfif qcountOutcomes.ifp_related eq 1>
																							checked
																						</cfif>> <label class='inline' for="c6">Yes</label>
																				</div>

																				<div class="check-line">
																					<input type="radio"  name="ifp_related" value="0" class='icheck-me' data-skin="square" data-color="blue" <cfif qcountOutcomes.ifp_related eq 0>
																							checked
																						</cfif>> <label class='inline' for="c6">No</label>
																				</div>
																			</div>

																			<div class="span3">
																				<p><strong>Data collected from online coursework?</strong></p>

																				    <div class="check-line">
																						<input type="radio" name="online" value="1"  class='icheck-me' data-skin="square" data-color="blue" <cfif qcountOutcomes.online eq 1>
																							checked
																						</cfif>> <label class='inline' for="c6">Yes</label>
																					</div>

																					<div class="check-line">
																						<input type="radio"  name="online" value="0" class='icheck-me' data-skin="square" data-color="blue" <cfif qcountOutcomes.online eq 0>
																							checked
																						</cfif>> <label class='inline' for="c6">No</label>
																					</div>
																				</div>
																			</div>
																		</div>
														

																		<!---
																		<cfdump var="#qSelectedGoals#" label="qSelectedGoals - EDITOUTCOME.cfm - 181" />
																		<cfdump var="#qGoalList#" label="qGoalList - EDITOUTCOME.cfm - 182" />
																		--->

																		<div class="row-fluid">
																			<div class="span12">
																				<div class="control-group">
																					<label class="control-label"><strong>Strategic Plan Goals</strong></label>
																					<div class="controls">


																				<!---
  																				   <cfoutput>#ValueList(qSelectedGoals.objectiveID)#</cfoutput>
																				--->

																					<!--- MULTI-SELECT
																						<select name="goalID" size="27" multiple style="width: 650px;">
																							<cfoutput query="qGoalList" group="GoalTitle">
																								<optgroup label="Goal #qGoalList.GoalID# : #qGoalList.GoalTitle#">
																									<cfoutput group="objectivetitle">
																										<cfif #qGoalList.objectivetitle# NEQ "All Objectives">
																											<option value="#qGoalList.objectiveID#"  <cfif listfind(ValueList(qSelectedGoals.objectiveID), qGoalList.objectiveID, ',')> selected</cfif>>#qGoalList.objectivetitle#</option>
																										</cfif>																										
																									 </cfoutput>	
																								</optgroup>
																							</cfoutput>
																						</select>

																						<hr>
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
													<input type="checkbox" name="goalID" value="#qGoalList.objectiveID#"  class='icheck-me' data-skin="square" data-color="blue" <cfif listfind(ValueList(qSelectedGoals.objectiveID), qGoalList.objectiveID, ',')>
														checked </cfif>> 
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
																						

																						<!--- LIST
																						<hr>

																						<cfoutput query="qGoalList" group="GoalTitle">
																							<h4>Goal #qGoalList.GoalID# : #qGoalList.GoalTitle#</h4>
																							    <cfoutput group="objectivetitle">
																							    	
																									   #qGoalList.objectivetitle#  (#qGoalList.objectiveID#)

																									   <cfif listfind(ValueList(qSelectedGoals.objectiveID), qGoalList.objectiveID, ',')>
																									   		<strong>MAYBE</strong>
																							    		</cfif>
																									<br>

																								</cfoutput>										  																								
																						</cfoutput>
																						--->
																					</div>
																				</div>

																				
																			</div>
																		</div>

															<cfoutput>

																<div class="control-group">
																	<label for="textarea" class="control-label"><strong>Implementing Strategy</strong></label>
																	<div class="controls">
																		<textarea name="outcomeStrategy" id="textarea" rows="5" class="ckeditor input-block-level">#trim(paragraphformat(qcountOutcomes.outcomeStrategy))#</textarea>
																	</div>
																</div>

																<div class="control-group">
																	<label for="textarea" class="control-label"><strong>Assessment Method</strong></label>
																	<div class="controls">
																		<textarea name="outcomeMethod" id="textarea" rows="5" class="ckeditor input-block-level">#trim(paragraphformat(qcountOutcomes.outcomeMethod))#</textarea>
																	</div>
																</div>

																<div class="control-group">
																	<label for="textarea" class="control-label"><strong>Criterion for Success</strong></label>
																	<div class="controls">
																		<textarea name="outcomeCriterion" id="textarea" rows="5" class="ckeditor input-block-level">#trim(paragraphformat(qcountOutcomes.outcomeCriterion))#</textarea>
																	</div>
																</div>

																<div class="control-group">
																	<label for="textarea" class="control-label"><strong>Data Summary: Analysis & Evaluation</strong></label>
																	<div class="controls">
																		<textarea name="outcomeresults" id="textarea" rows="5" class="ckeditor input-block-level">#trim(paragraphformat(qcountOutcomes.outcomeresults))#</textarea>
																	</div>
																</div>

																
																<div class="control-group">
																	<label for="textarea" class="control-label"><strong>Program Improvement</strong></label>
																	<div class="controls">
																		<textarea name="outcomeplanningimprovement" id="textarea" rows="5" class="ckeditor input-block-level">#trim(paragraphformat(qcountOutcomes.outcomeplanningimprovement))#</textarea>
																	</div>
																</div>

																
																			
																				<div class="control-group">
																					<div class="row-fluid">
																						<label for="programImprovmentCode" class="control-label"><strong>Program Improvement Codes</strong></label>
																						<div class="controls">
																							<cfloop query="qCodesList">
																											<cfoutput>

																												<cfif qCodesList.currentrow EQ 1 OR qCodesList.currentrow EQ 4 OR qCodesList.currentrow EQ 7 >
																													<div class="span3">
																												</cfif>
																													 <div class="check-line">
																															<input type="checkbox" id="c5" name="programImprovementCode" class='icheck-me' data-skin="square" data-color="blue" value="#qCodesList.programImprovementCodeID#" 
																															<cfif ValueList(qSelectedProgImpCodes.programImprovementCodeID) CONTAINS qCodesList.programImprovementCodeID >checked</cfif>
																															> <label class='inline'>#qCodesList.item_number# #qCodesList.label#
																															<a href="##modal-#qCodesList.currentrow#" role="button" class="btn btn-mini" data-toggle="modal">?</a></label>

																															<!--- Modal to Explain Curricular Change --->
																															<div id="modal-#qCodesList.currentrow#" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
																																<div class="modal-header">																										
																																	<h3 id="myModalLabel">#qCodesList.label#</h3>
																																</div>
																																<div class="modal-body">
																																	<p>#qCodesList.description#</p>
																																</div>
																																<div class="modal-footer">
																																	<button class="btn btn-primary" data-dismiss="modal">Ok</button>
																																</div>
																															</div>
																														</div>
																												<cfif qCodesList.currentrow EQ 3 OR qCodesList.currentrow EQ 6 OR qCodesList.currentrow EQ 9 >
																													</div>
																												</cfif>

																											</cfoutput>
																										</cfloop>
																						</div>
																					</div>
																				</div>
																			
																	

															</cfoutput>
															<div class="row-fluid">
																<div class="form-actions">
																	<button type="submit" class="btn btn-red">Save changes</button>
																	<button type="button" class="btn" id="cancel" onclick="javascript:window.history.back(-1);return false;">Cancel</button>																
																</div>
															</div>
														</form>
														<!--- 
														</cfoutput>
														</cfloop> --->
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