<cfscript>
qPlanDetails		= request.event.getArg('qPlanDetails');
qOutcomeDetail    	= request.event.getArg('qOutcomeDetail');
qALCCategories		= request.event.getArg('qALCCategories');
title 				= "Plan Period: " &  #qPlanDetails.planperiod#;
qSupportingDocs		= request.event.getArg('qSupportingDocs');
qCodesList			= request.event.getArg('qCodesList');
qSelectedProgImpCodes = request.event.getArg('qSelectedProgImpCodes');
qSelectedGoals		= request.event.getArg('qSelectedGoals');
qPrimaryAuthors			= request.event.getArg('qPrimaryAuthors');
qGoalList				= request.event.getArg('qGoalList');
</cfscript>

<div id="main" style="margin-left: 0px;">
			<div class="container-fluid">

				<cfinclude template="/Assessment/views/page_header.cfm">
				<!---			
				<cfdump var="#qOutcomeDetail#" label="qoutcomedetail" />
				
				<cfdump var="#qCodesList#" label="qCodesList"/>

				<cfdump var="#qSelectedProgImpCodes#" label="qSelectedProgImpCodes"/>

				
				
				<cfdump var="#qPlanDetails#" />
			
				<cfdump var="#qSupportingDocs#" />
				--->

			<div class="row-fluid">
					<div class="span12">
						<div class="box">
							
									<div class="box-content">
								<div class="row-fluid">
									<div class="box box-bordered">
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
										<div class="box box-bordered ">
											<div class="box-title">
												<h3>
													<cfoutput>
														<i class="icon-reorder"></i>Learning Outcome #qOutcomeDetail.outcomeorder# Details
													</cfoutput>
												</h3>
											</div>
												<div class="box-content nopadding">
													<ul class="tabs tabs-inline tabs-top">
														
														<li class="active">
															<a href="#descript1" data-toggle='tab'><i class="icon-share-alt"></i> Description and Methodology</a>
														</li>					
														
														<li>
															<a href="#results3" data-toggle='tab'><i class="icon-bar-chart"></i>Results</a>
														</li>
														
														<li>
															<a href="#docs2" data-toggle='tab'><i class="icon-inbox"></i> Supporting Docs</a>
														</li>													
													</ul>
													<div class="tab-content padding tab-content-inline tab-content-bottom">
														<div class="tab-pane active" id="descript1">
															<div class="row-fluid sortable-box">
																<div class="span12">
																	<div class="box box-color box-bordered blue">
																			<div class="box-title">
																				
																				<h3>
																					<i class="icon-file"></i>
																					<cfoutput>
																					Description and Methodology 
																					<!---
																					[<a href="index.cfm?event=editOutcome&outcomeID=#qOutcomeDetail.outcomeID#&reportingUnitID=#request.event.getArg('reportingUnitID')#&planID=#request.event.getArg('planID')#">edit</a>]
																					--->
																					<cfif session.user.userroleid lte 2>	
																						<button class="btn editOutcome"><i class="icon-edit"></i>Edit</button>
																					</cfif>

																					</cfoutput>
																				</h3>
																			
																				<div class="actions">
																					<a href="#" class="btn btn-mini this-content-slideUp"><i class="icon-angle-down"></i></a>
																				</div>
																			</div>
																			<div class="box-content">
																				<!--- <h4>Description and Methodology</h4> --->
																				<p><strong>Outcome Description </strong><br>
																				<cfoutput>
																					#qOutcomeDetail.outcomedescription# 
																				</cfoutput></p>

																				<HR>

																				<p><strong>Academic Learning Categories related to this outcome:</strong></p>
																				
																				<!--- let's play HACKY SACK! query to find the selected ALC Category Checkboxes--->	
																				 <cfquery name="getSelectedALCCategories" datasource="#application.dsn#">
																		    		SELECT 
																							recordId,
																							outcomeID,
																							SubCategoryID
																					FROM 
																							AssessmentALCOutcomeCategories

																					WHERE outcomeID = #request.event.getArg('outcomeID')# 																							
																				 </cfquery>

																				 <!---   
																				 <cfdump var="#getSelectedALCCategories#" label="getSelectedALCCategories">
																					

																				 <cfoutput>#ValueList(getSelectedALCCategories.subcategoryID)#</cfoutput>
																				 --->

																				<div class="row-fluid sortable-box">
																						<cfoutput query="qALCCategories" group="CategoryID" >
																							<div class="span3">
																							<!--- <strong><em>Content Knowledge</em></strong> --->
																							    <br><br> 
																							    
																							    <!---
																							    	Dynamic ALC Checkboxes

																									1) Need to be able to check the boxes and save to DB
																									2) Need to compare results in db and be "checked" where applicable
																							    --->
																							    <!---
																							     <div class="check-line">
																									<input type="checkbox"  class='icheck-me' data-skin="square" data-color="blue" checked> <label class='inline' for="c6">#qALCCategories.CategoryTitle#</label>
																								</div>
																								--->

																								<cfoutput group="SubCategoryTitle">
																									<cfif qALCCategories.SubCategoryID EQ 10011 OR qALCCategories.SubCategoryID EQ 10012 OR qALCCategories.SubCategoryID EQ 10013>
																									   <div class="check-line">
																									<cfelse>
																									  <div class="check-line offset1">
																									</cfif>
																										<input type="checkbox"  class='icheck-me' data-skin="square" data-color="blue" <cfif ValueList(getSelectedALCCategories.subcategoryID) CONTAINS qALCCategories.SubCategoryID >checked</cfif> disabled="disabled"> 
																										<label class='inline' for="c6">#qALCCategories.SubCategoryTitle#</label>
																									</div>																							
																								</cfoutput>
																								
																							</div>
																						</cfoutput>
																				</div>
																			

																				<HR>

																					 <div class="row-fluid">
																						<div class="span3">
																							<p><strong>QEP / URI Related</strong></p>

																							<div class="check-line">
																								<input type="radio"  name="qep_uri_related" value="1" class='icheck-me' data-skin="square" data-color="blue" <cfif qOutcomeDetail.qep_uri_related eq 1>checked</cfif>  disabled='disabled' > <label class='inline' for="c6">Yes</label>


																							</div>

																						<div class="check-line">
																							<input type="radio"   name="qep_uri_related" value="0" class='icheck-me' data-skin="square" data-color="blue" <cfif qOutcomeDetail.qep_uri_related eq 0>
																									checked
																								</cfif>  disabled='disabled'> <label class='inline' for="c6">No</label>
																						</div>

																						</div>

																						<div class="span3">
																							<p><strong>IFP Related</strong></p>

																							<div class="check-line">
																									<input type="radio"  name="ifp_related" value="1" class='icheck-me' data-skin="square" data-color="blue" <cfif qOutcomeDetail.ifp_related eq 1>
																										checked
																									</cfif>  disabled='disabled'> <label class='inline' for="c6">Yes</label>
																							</div>

																							<div class="check-line">
																								<input type="radio"  name="ifp_related" value="0" class='icheck-me' data-skin="square" data-color="blue" <cfif qOutcomeDetail.ifp_related eq 0>
																										checked
																									</cfif>  disabled='disabled'> <label class='inline' for="c6">No</label>
																							</div>
																						</div>

																					<div class="span3">
																						<p><strong>Data collected from online coursework?</strong></p>

																						<div class="check-line">
																							<input type="radio" name="online" value="1"  class='icheck-me' data-skin="square" data-color="blue" <cfif qOutcomeDetail.online eq 1>
																								checked
																							</cfif> disabled='disabled'> <label class='inline' for="c6">Yes</label>
																						</div>

																						<div class="check-line">
																							<input type="radio"  name="online" value="0" class='icheck-me' data-skin="square" data-color="blue" <cfif qOutcomeDetail.online eq 0>
																								checked
																							</cfif> disabled='disabled'> <label class='inline' for="c6">No</label>
																						</div>
																					</div>


																					<!---
																					<div class="span3">
																						<p><strong>Relates to FAU Strategic Plan Goals & Objectives</strong></p>

																						<div class="control-group">
																							
																							<div class="controls">
																								<div class="input-xlarge"><select name="select" id="select" class='chosen-select'>
																									<option value="1">Option-1</option>
																									<option value="2">Option-2</option>
																									<option value="3">Option-3</option>
																									<option value="4">Option-4</option>
																									<option value="5">Option-5</option>
																									<option value="6">Option-6</option>
																									<option value="7">Option-7</option>
																									<option value="8">Option-8</option>
																									<option value="9">Option-9</option>
																								</select></div>
																							</div>
																						</div>
																						
																					</div>
																					--->
																					</div>

																				<br>

																				<HR>

																				<p><strong>FAU Strategic Plan related goals & objectives:</strong></p>
																				
																				<!---
																				<cfdump var="#qSelectedGoals#" label="qSelectedGoals - outcomedetails.cfm - 248" />
																				--->

																					<cfif qSelectedGoals.recordcount>
																							<cfoutput query="qGoalList" group="GoalTitle" >
																								<cfif listfind(ValueList(qSelectedGoals.goalID), qGoalList.goalID, ',') >
																									<b>Goal #qGoalList.GoalID# : #qGoalList.goaltitle#</b><br><br>
																								</cfif>
																									
																								<cfoutput group="objectivetitle">

																										<cfif listfind(ValueList(qSelectedGoals.objectiveID), qGoalList.objectiveID, ',')>
																											<cfif qGoalList.objectivetitle NEQ 'All objectives' >
																												<b>Objective #qGoalList.ObjectiveOrder# :</b> #qGoalList.objectivetitle#<br><br>
																											</cfif>
																											<!---
																											<cfif qGoalList.objectivetitle EQ 'All objectives' >
																												<b>Goal #qGoalList.GoalID# : #qGoalList.goaltitle#</b><br><br>	
																											<cfelse>
																												<b>Objective #qGoalList.ObjectiveOrder# :</b> #qGoalList.objectivetitle#<br><br>	
																											</cfif>
																											--->

																										</cfif>
																								</cfoutput>
																							</cfoutput>

																						<cfelse>
																							N/A
																						</cfif>

																				<br>


																														

																			<cfloop query="qOutcomeDetail">
																				<cfoutput>

																					<p><strong>Implementing Strategy :</strong></p>
																					<p>#qOutcomeDetail.outcomestrategy#</P>


																					<p><strong>Assessment Method :</strong></p>
																					<p>#qOutcomeDetail.outcomemethod#</p>

																					<p><strong>Criterion for success </strong></p>
																					<p>#qOutcomeDetail.outcomecriterion#</p>
																				</cfoutput>
																			</cfloop>		
																				

																			</div>
																		</div>
																		
																	</div>
																</div>
														</div>

														<div class="tab-pane" id="results3">
															<div class="span12">
																<div class="box box-color box-bordered blue">
																				<div class="box-title">
																					<h3>
																						<i class="icon-file"></i>
																						Results

																							<cfif session.user.userroleid lte 2>
																								<button class="btn editOutcome"><i class="icon-edit"></i>Edit</button>
																							</cfif>
																					</h3>
																					<div class="actions">
																						<a href="#" class="btn btn-mini this-content-slideUp"><i class="icon-angle-down"></i></a>
																					</div>
																				</div>
																				<div class="box-content">
																					<p><strong>Data Summary </strong></p>
																					
																					<cfloop query="qOutcomeDetail">
																						<cfoutput>
																						<p>#qOutcomeDetail.OutcomeResults#</p>																						
																					<HR>

																					<p><strong>Program Improvement</strong></p>
																					
																					<p>#HTMLEditFormat(qOutcomeDetail.OutcomePlanningImprovement)#</p>

																					</cfoutput>
																					</cfloop>

																					<hr>

																					<p><strong>Program Improvement Codes</strong></p>
																					
																					<cfloop query="qCodesList">
																						<cfoutput>

																							<cfif qCodesList.currentrow EQ 1 OR qCodesList.currentrow EQ 4 OR qCodesList.currentrow EQ 7 >
																								<div class="span3">
																							</cfif>
																								 <div class="check-line">
																										<input type="checkbox" id="c5" name="programImprovmentCode" class='icheck-me' data-skin="square" data-color="blue" value="#qCodesList.programImprovementCodeID#" 
																										<cfif ValueList(qSelectedProgImpCodes.programImprovementCodeID) CONTAINS qCodesList.programImprovementCodeID >checked</cfif>
																										disabled="true"> <label class='inline'>#qCodesList.item_number# #qCodesList.label#
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


																					
																					<!---
																					    <div class="check-line">
																							<input type="checkbox" id="c5" class='icheck-me' data-skin="square" data-color="blue"> <label class='inline'>1. Curricular Change
																							<!---
																							<a href="##" class="btn" rel="popover" data-trigger="hover" data-placement="right" data-content="Vivamus sagittis lacus vel augue laoreet rutrum faucibus." title="Curricular Change">[explain]</a>
																							--->

																							<a href="#modal-curricular" role="button" class="btn btn-mini" data-toggle="modal">?</a>
																						</label>

																							<!--- Modal to Explain Curricular Change --->
																							<div id="modal-curricular" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
																								<div class="modal-header">
																									
																									<h3 id="myModalLabel">Curricular Change</h3>
																								</div>
																								<div class="modal-body">
																									<p>Curricular change to degree program (add a course or other requirement; change sequence or courses).</p>
																								</div>
																								<div class="modal-footer">
																									<button class="btn btn-primary" data-dismiss="modal">Ok</button>
																								</div>
																							</div>
																						</div>

																						<div class="check-line">
																							<input type="checkbox"  class='icheck-me' data-skin="square" data-color="blue"> <label class='inline'>2. Course Revision 
																							<a href="#modal-course" role="button" class="btn btn-mini" data-toggle="modal">?</a>
																						</label>
																							
																							<!--- Modal to Explain Course Revision --->
																							<div id="modal-course" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
																								<div class="modal-header">
																									
																									<h3 id="myModalLabel">Course Revision</h3>
																								</div>
																								<div class="modal-body">
																									<p>Revise existing course or courses; add assignment; modify assisgnment; modify content of course, change textbook, etc.</p>
																								</div>
																								<div class="modal-footer">
																									<button class="btn btn-primary" data-dismiss="modal">Ok</button>
																								</div>
																							</div>
																						</div>

																						<div class="check-line">
																							<input type="checkbox"  class='icheck-me' data-skin="square" data-color="blue"> <label class='inline' for="c6">3. Pedagogy</label>
																							<a href="#modal-pedagogy" role="button" class="btn btn-mini" data-toggle="modal">?</a>

																								<div id="modal-pedagogy" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
																									<div class="modal-header">																										
																										<h3 id="myModalLabel">Pedagogy</h3>
																									</div>
																									<div class="modal-body">
																											<p>Revise methodology of delivering course material (less lecture, more student)</p>
																									</div>
																									<div class="modal-footer">
																										<button class="btn btn-primary" data-dismiss="modal">Ok</button>
																									</div>
																								</div>
																						</div>
																					</div>

																					
																					<div class="span3">
																					    <div class="check-line">																
																							<input type="checkbox"  class='icheck-me' data-skin="square" data-color="blue"> <label class='inline' for="c6">4. Instructional Assignment Change</label>
																						</div>

																						<div class="check-line">
																							<input type="checkbox"  class='icheck-me' data-skin="square" data-color="blue"> <label class='inline' for="c6">5. Assessment Plan Change</label>
																						</div>

																						<div class="check-line">
																							<input type="checkbox"  class='icheck-me' data-skin="square" data-color="blue"> <label class='inline' for="c6">6. Reallocation of Resources</label>
																						</div>
																					</div>

																					<div class="span3">
																					    <div class="check-line">																
																							<input type="checkbox"  class='icheck-me' data-skin="square" data-color="blue"> <label class='inline' for="c6">7. Improve Advising</label>
																						</div>

																						<div class="check-line">
																							<input type="checkbox"  class='icheck-me' data-skin="square" data-color="blue"> <label class='inline' for="c6">8. Faculty Development/Training</label>
																						</div>

																						<div class="check-line">
																							<input type="checkbox"  class='icheck-me' data-skin="square" data-color="blue"> <label class='inline' for="c6">9. Other</label>
																						</div>
																					</div>
																				--->
																				</div>

																</div>
															</div>
														</div>

														<div class="tab-pane" id="docs2">
															<div class="span12">
																<div class="box">
																	<div class="box-title">
																		<h3><i class=" icon-paper-clip"></i> Supporting Documents</h3>
																	</div>
																	<div class="box-content nopadding">
																			<table class="table table-hover table-nomargin table-condensed">
																				<cfif qSupportingDocs.recordcount>
																					<thead>
																						<th>File Name</th>
																						<th>Uploaded By</th>
																						<th>Uploaded On</th>
																						<th>Action</th>
																					</thead>
																					<tbody>																						
																						<cfloop query="qSupportingDocs">
																							<cfoutput>
																							<tr>
																								<td>#qSupportingDocs.FileNameUploaded#</td>
																								<td>#qSupportingDocs.UserFname# #qSupportingDocs.UserLname#</td>
																								<td>#DateFormat(qSupportingDocs.DateInserted,'mm/dd/yyy')# #TimeFormat(qSupportingDocs.DateInserted,'h:mm  tt')#</td>
																								<td><a href="index.cfm?event=downloadDocument&recordID=#qSupportingDocs.recordID#&outcomeID=#request.event.getArg('outcomeID')#&reportingUnitID=#request.event.getArg('reportingUnitID')#&planID=#request.event.getArg('planID')#&doctype=support"><i class="icon-download"></i></a> | <a href="index.cfm?event=deleteDocument&recordID=#qSupportingDocs.recordID#&outcomeID=#request.event.getArg('outcomeID')#&reportingUnitID=#request.event.getArg('reportingUnitID')#&planID=#request.event.getArg('planID')#&doctype=support"><i class="icon-trash"></i></a></d>
																							</tr>
																							</cfoutput>
																						</cfloop>
																						
																					

																				<cfelse>
																					<tr>
																						<td colspan="4">
																							No documents uploaded
																						</td>
																					</tr>
																				</cfif>
																				</tbody>
																			</table>
																	</div>
																</div>
																
																<cfif session.user.userroleid lte 2>
																	<div class="box">
																		<div class="box-title">
																			<h3><i class="icon-upload"></i> Upload Supporting Documents</h3>
																		</div>
																		<div class="box-content nopadding">
																			<div class="plupload"></div>
																		</div>
																	</div>
																</cfif>

															</div>
														</div>
														
														
														<div class="tab-pane" id="checklist">
															<form id="form1">
																	<div class="Clear">
																	    <h4>Student Learning Outcomes</h4>
																	    <p><strong>A. Student learning outcomes are clear, specific and oriented to the student</strong></p>
																	    <input class="star" type="radio" name="test-1-rating-1" value="Not Evident" title="Not Evident"/>
																	    <input class="star" type="radio" name="test-1-rating-1" value="Developing" title="Developing"/>
																	    <input class="star" type="radio" name="test-1-rating-1" value="Operational" title="Operational"/>
																	    <input class="star" type="radio" name="test-1-rating-1" value="Exemplary" title="Exemplary"/>
																   </div>
																   <br><br>
																   <div class="Clear">
																	    <h4>Assessment Method</h4>
																	    <p><strong>A. The plan assesses improvements that were made based on an analysis of previous results</strong></p>
																	    <input class="star" type="radio" name="test-1-rating-2" value="Not Evident" title="Not Evident"/>
																	    <input class="star" type="radio" name="test-1-rating-2" value="Developing" title="Developing"/>
																	    <input class="star" type="radio" name="test-1-rating-2" value="Operational" title="Operational"/>
																	    <input class="star" type="radio" name="test-1-rating-2" value="Exemplary" title="Exemplary"/>
																   </div>
																    <br>
																    <div class="Clear">																	   
																	    <p><strong>B.  Methods are appropriate to assess the specific outcomes</strong></p>
																	    <input class="star" type="radio" name="test-1-rating-3" value="Not Evident" title="Not Evident"/>
																	    <input class="star" type="radio" name="test-1-rating-3" value="Developing" title="Developing"/>
																	    <input class="star" type="radio" name="test-1-rating-3" value="Operational" title="Operational"/>
																	    <input class="star" type="radio" name="test-1-rating-3" value="Exemplary" title="Exemplary"/>
																   </div>
																   <br>
																    <div class="Clear">																	   
																	    <p><strong>C. Types of Measures</strong></p>
																	    <input class="star" type="radio" name="test-1-rating-4" value="Not Evident" title="Not Evident"/>
																	    <input class="star" type="radio" name="test-1-rating-4" value="Developing" title="Developing"/>
																	    <input class="star" type="radio" name="test-1-rating-4" value="Operational" title="Operational"/>
																	    <input class="star" type="radio" name="test-1-rating-4" value="Exemplary" title="Exemplary"/>
																   </div>
																   <br>
																    <div class="Clear">																	   
																	    <p><strong>D.  Specification of desired results for outcomes
</strong></p>
																	    <input class="star" type="radio" name="test-1-rating-5" value="Not Evident" title="Not Evident"/>
																	    <input class="star" type="radio" name="test-1-rating-5" value="Developing" title="Developing"/>
																	    <input class="star" type="radio" name="test-1-rating-5" value="Operational" title="Operational"/>
																	    <input class="star" type="radio" name="test-1-rating-5" value="Exemplary" title="Exemplary"/>
																   </div>
																    <br>
																    <div class="Clear">																	   
																	    <p><strong>E.   Data collection & reliability
</strong></p>
																	    <input class="star" type="radio" name="test-1-rating-6" value="Not Evident" title="Not Evident"/>
																	    <input class="star" type="radio" name="test-1-rating-6" value="Developing" title="Developing"/>
																	    <input class="star" type="radio" name="test-1-rating-6" value="Operational" title="Operational"/>
																	    <input class="star" type="radio" name="test-1-rating-6" value="Exemplary" title="Exemplary"/>
																   </div>
																   <br><br>
																   <div class="Clear">
																	    <h4>Results of program assessment</h4>
																	    <p><strong>A. Presentation of results</strong></p>
																	    <input class="star" type="radio" name="test-1-rating-7" value="Not Evident" title="Not Evident"/>
																	    <input class="star" type="radio" name="test-1-rating-7" value="Developing" title="Developing"/>
																	    <input class="star" type="radio" name="test-1-rating-7" value="Operational" title="Operational"/>
																	    <input class="star" type="radio" name="test-1-rating-7" value="Exemplary" title="Exemplary"/>
																   </div>
																    <br>
																    <div class="Clear">																	   
																	    <p><strong>B. History of results</strong></p>
																	    <input class="star" type="radio" name="test-1-rating-8" value="Not Evident" title="Not Evident"/>
																	    <input class="star" type="radio" name="test-1-rating-8" value="Developing" title="Developing"/>
																	    <input class="star" type="radio" name="test-1-rating-8" value="Operational" title="Operational"/>
																	    <input class="star" type="radio" name="test-1-rating-8" value="Exemplary" title="Exemplary"/>
																   </div>
																   <br>
																    <div class="Clear">																	   
																	    <p><strong>C. Interpreation of Results</strong></p>
																	    <input class="star" type="radio" name="test-1-rating-9" value="Not Evident" title="Not Evident"/>
																	    <input class="star" type="radio" name="test-1-rating-9" value="Developing" title="Developing"/>
																	    <input class="star" type="radio" name="test-1-rating-9" value="Operational" title="Operational"/>
																	    <input class="star" type="radio" name="test-1-rating-9" value="Exemplary" title="Exemplary"/>
																   </div>
																   <br>
																    <div class="Clear">																	   
																	    <p><strong>D. Communication of Results with faculty/stakeholders
</strong></p>
																	    <input class="star" type="radio" name="test-1-rating-10" value="Not Evident" title="Not Evident"/>
																	    <input class="star" type="radio" name="test-1-rating-10" value="Developing" title="Developing"/>
																	    <input class="star" type="radio" name="test-1-rating-10"value="Operational" title="Operational"/>
																	    <input class="star" type="radio" name="test-1-rating-10" value="Exemplary" title="Exemplary"/>
																   </div>
																    <br><br>
																    <div class="Clear">
																	    <h4>Use of results for improvement</h4>
																	    <p><strong>A. Improvement of programs regarding student learning and development</strong></p>
																	    <input class="star" type="radio" name="test-1-rating-11" value="Not Evident" title="Not Evident"/>
																	    <input class="star" type="radio" name="test-1-rating-11" value="Developing" title="Developing"/>
																	    <input class="star" type="radio" name="test-1-rating-11" value="Operational" title="Operational"/>
																	    <input class="star" type="radio" name="test-1-rating-11" value="Exemplary" title="Exemplary"/>
																   </div>
																   
															</form>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								

							</div>
						</div>
					</div>
				</div>


</div></div>


<script type="text/javascript">
// Convert divs to queue widgets when the DOM is ready
<cfoutput>
$(function() {

	$(".editOutcome").click(function() {
		//alert('oh YEAHHHH!!!');

		//window.location.href = "index.cfm?event=editOutcome&outcomeID=#qOutcomeDetail.outcomeID#&reportingUnitID=#request.event.getArg('reportingUnitID')#&planID=#request.event.getArg('planID')#";

		window.location.href = "index.cfm?event=editOutcome&outcomeID=#qOutcomeDetail.outcomeID#&reportingUnitID=#request.event.getArg('reportingUnitID')#&planID=#request.event.getArg('planID')#&programID=#request.event.getArg('programID')#&DeptID=#request.event.getArg('DeptID')#&DivisionID=#request.event.getArg('DivisionID')#";
	});


	if($('.plupload').length > 0){
		$(".plupload").each(function(){
			var $el = $(this);
			$el.pluploadQueue({
				runtimes : 'html5,gears,flash,silverlight,browserplus',
				url : 'index.cfm?event=uploaddocument&outcomeID=#request.event.getArg("outcomeID")#&reportingUnitID=#request.event.getArg("reportingUnitID")#&planID=#request.event.getArg("planID")#&programID=#request.event.getArg('programID')#&DeptID=#request.event.getArg('DeptID')#&DivisionID=#request.event.getArg('DivisionID')#&doctype=support' ,
				max_file_size : '10mb',
				chunk_size : '1mb',
				unique_names : false,
				resize : {width : 320, height : 240, quality : 90},
				filters : [
					{title : "Document files", extensions : "txt,pdf,doc,docx"}
				],
				flash_swf_url : 'js/plupload/plupload.flash.swf',
				silverlight_xap_url : 'js/plupload/plupload.silverlight.xap'
			});
			$(".plupload_header").remove();
			var upload = $el.pluploadQueue();
			if($el.hasClass("pl-sidebar")){
				$(".plupload_filelist_header,.plupload_progress_bar,.plupload_start").remove();
				$(".plupload_droptext").html("<span>Drop files to upload</span>");
				$(".plupload_progress").remove();
				$(".plupload_add").text("Or click here...");
				upload.bind('FilesAdded', function(up, files) {
					setTimeout(function () { 
						up.start(); 
					}, 500);
				});
				upload.bind("QueueChanged", function(up){
					$(".plupload_droptext").html("<span>Drop files to upload</span>");
				});
				upload.bind("StateChanged", function(up){
					$(".plupload_upload_status").remove();
					$(".plupload_buttons").show();
				});
			} else {
				$(".plupload_progress_container").addClass("progress").addClass('progress-striped');
				$(".plupload_progress_bar").addClass("bar");
				$(".plupload_button").each(function(){
					if($(this).hasClass("plupload_add")){
						$(this).attr("class", 'btn pl_add btn-primary').html("<i class='icon-plus-sign'></i> "+$(this).html());
					} else {
						$(this).attr("class", 'btn pl_start btn-success').html("<i class='icon-cloud-upload'></i> "+$(this).html());
					}
				});
			}
		});

	}

	
	$(".pl_start").click(function() {
            //alert('Item selected');
            setTimeout( function () {         
            	location.reload(true);
            	
            	/*window.location.replace("index.cfm?event=outcomeetails&outcomeID=#request.event.getArg('outcomeID')#&reportingUnitID=#request.event.getArg('reportingUnitID')#&planID=#request.event.getArg('planID')#&ProgramID=#request.event.getArg('programID')#");*/
            	
            	 
            	

	          	}, 2000);
       });
	
});
</cfoutput>
</script>



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

<script type="text/javascript" language="javascript">
$(function(){ 
 $('#form1 :radio.star').rating(); 
 	//$('#form2 :radio.star').rating({cancel: 'Cancel', cancelValue: '0'}); 
 });
</script>