<cfscript>
qPlanDetails			= request.event.getArg('qPlanDetails');
qcountOutcomes    		= request.event.getArg('qcountOutcomes');
qALCCategories			= request.event.getArg('qALCCategories');
//qALCCategoriesSelected	= request.event.getArg('qALCCategoriesSelected');
title 					= "Plan Period: " &  #qPlanDetails.planperiod#;
qPlanDetails			= request.event.getArg('qPlanDetails');
title 					= "Plan Period: " &  #qPlanDetails.planperiod#;
qCheckListTypes			= request.event.getArg('qCheckListTypes');
qRatings				= request.event.getArg('qRatings');
qPrimaryAuthors			= request.event.getArg('qPrimaryAuthors');
qGoalList				= request.event.getArg('qGoalList');
</cfscript>







<div id="main" style="margin-left: 0px;">
			<div class="container-fluid">

				<cfinclude template="/Assessment/views/page_header.cfm">


		<!---	
		 	<cfdump var="#qCheckListTypes#" label="qChecklistTypes" />
			<cfdump var="#qRatings#" label="qRatings"/>
			<cfdump var="#session.user#" />	
			<cfdump var="#qcountOutcomes#" label="qCountOutcomes" />
			<cfdump var="#qPrimaryAuthors#" label="qPrimaryAuthors" />
			<cfdump var="#qPlanDetails#" />
			<cfdump var="#qALCCategories#" />
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

											<cfif session.user.userroleid lte 2>
												<div class="text-left">
													<cfoutput>
													<a href="index.cfm?event=addOutcome&reportingUnitID=#request.event.getArg('reportingUnitID')#&planID=#request.event.getArg('planID')#&programID=#request.event.getArg('programID')#&deptID=#request.event.getArg('deptID')#&divisionID=#request.event.getArg('divisionID')#" class="btn btn-red">
													<i class="icon-pencil"></i>									
													<span>Add New Outcome</span>
													</cfoutput>
												</a>
												</div>
											</cfif>

										<div class="box box-bordered ">
											<div class="box-title">
												<h3><i class="icon-reorder"></i>Assessment Plan Details</h3>
											</div>
												<div class="box-content nopadding">
													<ul class="tabs tabs-inline tabs-top">
														<!---
														<li class='active'>
															<a href="#first11" data-toggle='tab'><i class="icon-inbox"></i> Attachments</a>
														</li>
														--->
														<li class='active'>
															<a href="#second22" data-toggle='tab'><i class="icon-share-alt"></i> Outcomes & Measures</a>
														</li>
														<!---
														<li>
															<a href="#thirds3322" data-toggle='tab'><i class="icon-tag"></i> Lorem Ipsum</a>
														</li>
														--->
														<li>
															<a href="#checklist" data-toggle='tab'><i class="glyphicon-check"></i>Plan Checklist</a>
														</li>
													</ul>
													<div class="tab-content padding tab-content-inline tab-content-bottom">
														<div class="tab-pane" id="first11">
															<div class="span6">
															<div class="box box-color green box-bordered">
																<div class="box-title">
																	<h3>
																		<i class="icon-tint"></i>
																		Specific color
																	</h3>
																	<div class="actions">
																		<a href="#" class="btn btn-mini content-refresh"><i class="icon-refresh"></i></a>
																		<a href="#" class="btn btn-mini content-remove"><i class="icon-remove"></i></a>
																		<a href="#" class="btn btn-mini content-slideUp"><i class="icon-angle-down"></i></a>
																	</div>
																</div>
																<div class="box-content">
																	You can set the box to a specific color!
																</div>
															</div>
														</div>
														</div>
														<div class="tab-pane active" id="second22">
															
															<!--- 
															<cfdump var="#qALCCategories#" label="qALCCategories"/>
															--->															
														<div class="container-fluid sortable-box ui-sortable">
															

															<cfloop query="qcountOutcomes">
															
														
															
															
																<!--- <div class="span12"> --->
																<cfoutput>
																	<div class="box box-color box-bordered blue" id="#qcountOutcomes.outcomeID#">
																</cfoutput>	
																		
																		
																			<div class="box-title" >
																		
																				<h3>
																					<i class="icon-file"></i>
																					Outcome 
																					<cfoutput>
																						#qcountOutcomes.currentrow#

																						<cfif session.user.userroleid lte 2>																			
																							<button class="btn editOutcome" data-outcome="#qCountOutcomes.outcomeID#"><i class="icon-edit"></i>Edit</button>

																							<button class="btn deleteOutcome" data-outcome="#qCountOutcomes.outcomeID#"><i class="icon-trash"></i>Delete</button>
																						</cfif>
																						<!---
																						- [<a href="index.cfm?event=editOutcome&outcomeID=#qCountOutcomes.outcomeID#&reportingUnitID=#request.event.getArg('reportingUnitID')#&planID=#request.event.getArg('planID')#">edit</a>]
																						--->
																				    </cfoutput>
																				</h3>
																				<div class="actions">
																					<a href="##" class="btn btn-mini this-content-slideUp"><i class="icon-angle-down"></i></a>
																				</div>
																			</div>
																			<div class="box-content">
																				<h4>Description and Methodology</h4>
																				<p><strong>Outcome Description </strong><br>
																				<cfoutput>#paragraphFormat(qcountOutcomes.outcomedescription)#</cfoutput>
																				</p>

																				<HR>

																				<p><strong>Academic Learning Categories related to this outcome:</strong></p>
																				
																					<!--- let's play HACKY SACK! --->	
																				    <cfquery name="getSelectedALCCategories" datasource="#application.dsn#">
																				    		SELECT 
																									DISTINCT
																									outcomeID,
																									SubCategoryID
																							FROM 
																									AssessmentALCOutcomeCategories

																							WHERE outcomeID IN (#qCountOutcomes.outcomeID#)																							
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
																							    		<input type="checkbox"  class='icheck-me' data-skin="square" data-color="blue"  name="subcategoryID" <cfif ValueList(getSelectedALCCategories.subcategoryID) CONTAINS qALCCategories.subcategoryID >checked</cfif>> 
																							    		 <label class='inline' for="c6">#qALCCategories.CategoryTitle# (#qALCCategories.subcategoryID#)</label>																		
																								</div>
																								--->											
																							
																								<cfoutput group="SubCategoryTitle">
																									<!--- handle formatting of offset category --->
																									<cfif qALCCategories.SubCategoryID EQ 10011 OR qALCCategories.SubCategoryID EQ 10012 OR qALCCategories.SubCategoryID EQ 10013>
																									   <div class="check-line">
																									<cfelse>
																									  <div class="check-line offset1">
																									</cfif>

																										<input type="checkbox"  class='icheck-me' data-skin="square" data-color="blue"  name="subcategoryID" <cfif ValueList(getSelectedALCCategories.subcategoryID) CONTAINS qALCCategories.SubCategoryID >checked</cfif> disabled="disabled"> 
																										 <label class='inline' for="c6" >#qALCCategories.SubCategoryTitle#</label>
																									</div>																							
																								</cfoutput>
																								
																							</div>
																						</cfoutput>
																					</div>
																			

																				<HR>

																				 <div class="row-fluid">
																					<div class="span3">
																						<p><strong>QEP/URI Related</strong></p>

																						<div class="check-line">
																								<input type="radio"  name="qep_uri_related" value="1" class='icheck-me' data-skin="square" data-color="blue" <cfif qcountOutcomes.qep_uri_related eq 1>checked</cfif>  disabled='disabled' > <label class='inline' for="c6">Yes</label>


																							</div>

																						<div class="check-line">
																							<input type="radio"   name="qep_uri_related" value="0" class='icheck-me' data-skin="square" data-color="blue" <cfif qcountOutcomes.qep_uri_related eq 0>
																									checked
																								</cfif>  disabled='disabled'> <label class='inline' for="c6">No</label>
																						</div>
																					</div>

																					<div class="span3">
																							<p><strong>IFP Related</strong></p>

																							<div class="check-line">
																									<input type="radio"  name="ifp_related" value="1" class='icheck-me' data-skin="square" data-color="blue" <cfif qcountOutcomes.ifp_related eq 1>
																										checked
																									</cfif>  disabled='disabled'> <label class='inline' for="c6">Yes</label>
																							</div>

																							<div class="check-line">
																								<input type="radio"  name="ifp_related" value="0" class='icheck-me' data-skin="square" data-color="blue" <cfif qcountOutcomes.ifp_related eq 0>
																										checked
																									</cfif>  disabled='disabled'> <label class='inline' for="c6">No</label>
																							</div>

																						</div>

																					<div class="span3">
																						<p><strong>Data collected from online coursework?</strong></p>

																						<div class="check-line">
																							<input type="radio" name="online" value="1"  class='icheck-me' data-skin="square" data-color="blue" <cfif qcountOutcomes.online eq 1>
																								checked
																							</cfif>  disabled='disabled'> <label class='inline' for="c6">Yes</label>
																						</div>

																						<div class="check-line">
																							<input type="radio"  name="online" value="0" class='icheck-me' data-skin="square" data-color="blue" <cfif qcountOutcomes.online eq 0>
																								checked
																							</cfif>  disabled='disabled'> <label class='inline' for="c6">No</label>
																						</div>
																					</div>
																				</div>
																				
																				<HR>

																				<div class="row-fluid">
																					<div class="span12">

																						<p><strong>Relates to FAU Strategic Plan goals & objectives</strong></p>

																						<!--- let's play HACKY SACK! --->
																					    <cfquery name="qSelectedGoals" datasource="#application.dsn#">
																					    		SELECT a.OutcomeID, a.ObjectiveID, g.Goalid, g.GoalOrder, g.GoalTitle, g.GoalActive,  o.ObjectiveID, o.ObjectiveOrder, o.ObjectiveTitle, o.HelpColumnID, o.ObjectiveActive  
																								FROM AssessmentStrategicPlanLinks a, StrategicPlanGoals g, StrategicPlanObjectives o  
																							    WHERE a.ObjectiveID = o.ObjectiveID 
																								And o.GoalID = g.GoalID 
																								AND  a.OutcomeID IN (#qCountOutcomes.outcomeID#)
																								ORDER by g.Goalid, g.GoalOrder
																					     </cfquery>
																						

																						<!---
																						<cfdump var="#qSelectedGoals#" label="qSelectedGoals" />
																						
																						
																						<cfdump var="#qGoalList#" label="qGoalList" />
																						--->

																						<!---
																						<cfif qSelectedGoals.recordcount>
																							<cfoutput query="qSelectedGoals" group="goal" >
																								<strong>#qSelectedGoals.goal#</strong><br>
																									<cfoutput group="objective">
																										#qSelectedGoals.objective#<br>
																									</cfoutput>
																								<br>
																							</cfoutput>
																						<cfelse>
																							N/A
																						</cfif>
																						--->
																						<!---
																						<cfif qSelectedGoals.recordcount>
																							<cfoutput query="qSelectedGoals" group="goaltitle" >
																								<!---
																								<strong>#qSelectedGoals.goaltitle#</strong><br>
																									<cfoutput group="objectivetitle">
																										#qSelectedGoals.objectivetitle#<br>
																									</cfoutput>
																								<br>
																								--->

																								<!---
																								<cfif qSelectedGoals.objectivetitle EQ 'All objectives'>
																									Goal #qSelectedGoals.GoalID# : #qSelectedGoals.goaltitle#<br>											
																								<cfelse>
																									Objective #qSelectedGoals.ObjectiveOrder# : #qSelectedGoals.objectivetitle#<br>
																								</cfif>
																								--->
																								#qSelectedGoals.GoalID# : #qSelectedGoals.goaltitle#<br>	
																								Objective #qSelectedGoals.ObjectiveOrder# : #qSelectedGoals.objectivetitle#<br>
																								<hr>

																							</cfoutput>
																						<cfelse>
																							N/A
																						</cfif>
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

																					</div>
																				</div>


																					

																				<div class="row-fluid">
																					<div class="span12">
																						<br><br><br><br>
																						<div align="right">
																							<cfoutput>
																								<a href="index.cfm?event=outcomedetails&outcomeID=#qcountOutcomes.outcomeID#&reportingUnitID=#arguments.event.getArg('reportingUnitID')#&planID=#arguments.event.getArg('planID')#&ProgramID=#arguments.event.getArg('ProgramID')#&DeptID=#arguments.event.getArg('DeptID')#&DivisionID=#arguments.event.getArg('divisionID')#">See More ...</a>
																							</cfoutput>																							
																						</div>
																					</div>
																				</div>
																																								

																			</div>
																		
																		
																</div> 
																														
															</cfloop>
														</div>

														</div>
														<div class="tab-pane" id="checklist">
															<!---
															/********** IMPORTANT NOTE ***************/

															YOU WILL NEED TO POPULATE THE AssessmentPlanChecklistRating table
															with default NULL VALUES values for the ratings.

															1) Be sure to populate when a plan is created:
															
																	INSERT INTO AssessmentPlanChecklistRating
																		(
																		PlanID,
																		ReportingUnitID,
																		ChecklistTypeID,
																		Rating
																		)
																		VALUES
																		(
																		 14891,
																		 136001,
																		 11,
																		 NULL
																		)

															2) Do the same retroactively for existsing plans
															--->

															
																<!---
																		<cfoutput query="qCheckListTypes" group="category">
																			
																			<h4>#qCheckListTypes.category#</h4>
																			
																			<cfoutput group="subcategory">	
																				<cfloop query="#qRatings#">
																																										
																								
																					<cfif qCheckListTypes.checklisttypeID EQ qRatings.checklisttypeID >
																						<!--- #qratings.checklistratingID# YES --->

																						<p><strong>#qCheckListTypes.subcategory#</strong></p>

																					

																						  <div class="input select rating-b">								           
																						            <select id="tmp-#checklisttypeid#" name="rating-#checklisttypeid#">
																						                <option value="">N/A</option>
																						                <option value="Not Evident"<cfif qRatings.rating EQ "Not Evident">selected</cfif>>Not Evident</option>
																						                <option value="Developing" <cfif qRatings.rating EQ "Developing">selected</cfif>>Developing</option>
																						                <option value="Operational" <cfif qRatings.rating EQ "Operational">selected</cfif>>Operational</option>
																						                <option value="Exemplary" <cfif qRatings.rating EQ "Exemplary">selected</cfif>>Exemplary</option>
																						            </select>
																						 </div>
																					</cfif>
																					

																					
																				</cfloop> 
																			</cfoutput>
																			<hr>
																		</cfoutput>
																	--->



																		<form action="index.cfm?event=saveCheckList" method="post" id="mainform">
																				
																				<cfoutput>
																					<input type="hidden" name="planID" value="#request.event.getArg('planID')#" />
																					<input type="hidden" name="reportingUnitID" value="#request.event.getArg('reportingUnitID')#" />
																				</cfoutput>
														   		
																			
																				

																				<div class="row-fluid">
																					<div class="span12">
																					
																					
																						<table class="table table-hover table-nomargin table-bordered table-condensed">
																							<thead>
																								<tr>
																									<th class="span4">&nbsp;</th>
																									<th class="span4">&nbsp;</th>
																									<th class='hidden-350'>Content Knowledge</th>
																									<th class='hidden-1024'>Critical Thinking</th>
																									<th class='hidden-480'>Communication</th>
																									<th class='hidden-480'>Other Program Outcomes</th>
																									<th class='hidden-480'>Comments</th>
																								</tr>
																							</thead>
																							<tbody>



																							     <cfoutput query="qCheckListTypes" group="category">
																									

																									<tr>
																										<td colspan="7" style="background-color:##f8f8f8;"><h4>#qCheckListTypes.category#</h4></td>
																									</tr>

																															
																										
																										<cfoutput group="subcategory">

																											
																													<cfif len(trim(qCheckListTypes.subcategory))>	
																												

																														<tr>
																															<td colspan="2"><p><strong> #qCheckListTypes.subcategory#</strong></p></td>
																															<td>
																																	<!--- example
																																	<input type="checkbox"  class='icheck-me' data-skin="square" data-color="blue"  name="subcategoryID" <cfif ValueList(getSelectedALCCategories.subcategoryID) CONTAINS qALCCategories.SubCategoryID >checked</cfif> disabled="disabled"> 
																																	--->
																																
																																	<input type="checkbox"  class='icheck-me' data-skin="square" data-color="blue"  name="subcategoryID" value="#qCheckListTypes.checklisttypeid#@Content Knowlege" <cfif listFindNoCase(ValueList(qRatings.composite), "#qCheckListTypes.checklisttypeid#@Content Knowlege")>checked</cfif>> 


																																	<!---ValueList(qRatings.composite) CONTAINS #qCheckListTypes.checklisttypeid#@Content Knowlege --->
																															</td>
																															
																															<td>
																																
																																	<input type="checkbox"  class='icheck-me' data-skin="square" data-color="blue"  name="subcategoryID" value="#qCheckListTypes.checklisttypeid#@Critical Thinking" <cfif listFindNoCase(ValueList(qRatings.composite), "#qCheckListTypes.checklisttypeid#@Critical Thinking")>checked</cfif>>
																															</td>
																															<td>	
																																
																																	<input type="checkbox"  class='icheck-me' data-skin="square" data-color="blue"  name="subcategoryID" value="#qCheckListTypes.checklisttypeid#@Communication" <cfif  listFindNoCase(ValueList(qRatings.composite), "#qCheckListTypes.checklisttypeid#@Communication")>checked</cfif>>
																															</td>
																															<td>
																																
																																	<input type="checkbox"  class='icheck-me' data-skin="square" data-color="blue"  name="subcategoryID" value="#qCheckListTypes.checklisttypeid#@Other" <cfif  listFindNoCase(ValueList(qRatings.composite), "#qCheckListTypes.checklisttypeid#@Other")>checked</cfif>>
																															</td>
																															<td>
																																<div class="row-fluid">
																																	<a href="##x-modal-#qCheckListTypes.checklisttypeid#" role="button" class="btn btn-mini btn-darkblue" data-toggle="modal" data-checklistTypeid="#qCheckListTypes.checklisttypeid#" ><i class="icon-plus-sign"></i>
																																		Add a comment
																																	</a>

																																	<a href="index.cfm?event=getChecklistComments&reportingUnitID=#request.event.getArg('reportingUnitID')#&planID=#request.event.getArg('planID')#&checklistTypeID=#qCheckListTypes.checklisttypeid#" role="button" class="btn btn-mini btn-red popup">

																																		<i class="icon-search"></i>
																																		View comments</a>		
																																</div>		

																																<!--- Modal --->
																																<div id="x-modal-#qCheckListTypes.checklisttypeid#" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModal" aria-hidden="true">
																																				<div class="modal-header">				
																																					<h3 id="myModalLabel">#qCheckListTypes.category#</h3><br>
																																					<h4>#qCheckListTypes.subcategory#</h4>
																																				</div>
																																				
																																				
																																			<div class="grid text-center alert alert-success hidden">
																																				<button class="close" data-dismiss="alert" type="button">×</button>
																																			</div>

																																				<div class="modal-body">
																																					
																																					<input type="hidden" name="checklisttypeid" class="checklisttypeid" value="#qCheckListTypes.checklisttypeid#" />
																																
																																						<div class="control-group">
																																						<label for="textarea" class="control-label"><strong>Comment</strong></label>
																																							<div class="controls">
																																							<textarea name="comment" rows="5" class="input-block-level comment"></textarea>
																																							</div>
																																						</div>

																																					<div class="modal-footer">
																																						<button type="btn btn-primary" class="btn btn-red commentButton">Save Comment</button>
																																						<button class="btn btn-primary" data-dismiss="modal">Close</button>
																																					</div>

																																				</div>
																																	</div>
																															</td>
																															
																														</tr>
																													</cfif>

																													

																														<cfoutput group="lineitem">	
																															<cfif len(trim(qCheckListTypes.lineitem))>	
																															
																															<tr>
																																<td colspan="2"><p> #qCheckListTypes.lineitem#</p></td>
																																<td>
																																	
																																	<input type="checkbox"  class='icheck-me' data-skin="square" data-color="blue"  name="subcategoryID" value="#qCheckListTypes.checklisttypeid#@Content Knowlege"  <cfif listFindNoCase(ValueList(qRatings.composite), "#qCheckListTypes.checklisttypeid#@Content Knowlege")>checked</cfif>>  
																																</td>
																																<td>
																																	
																																	<input type="checkbox"  class='icheck-me' data-skin="square" data-color="blue"  name="subcategoryID" value="#qCheckListTypes.checklisttypeid#@Critical Thinking" <cfif listFindNoCase(ValueList(qRatings.composite), "#qCheckListTypes.checklisttypeid#@Critical Thinking")>checked</cfif>>
																																</td>
																																<td>
																																	
																																	<input type="checkbox"  class='icheck-me' data-skin="square" data-color="blue"  name="subcategoryID" value="#qCheckListTypes.checklisttypeid#@Communication" <cfif  listFindNoCase(ValueList(qRatings.composite), "#qCheckListTypes.checklisttypeid#@Communication")>checked</cfif>>
																																</td>
																																<td>
																																	
																																	<input type="checkbox"  class='icheck-me' data-skin="square" data-color="blue"  name="subcategoryID" value="#qCheckListTypes.checklisttypeid#@Other"  <cfif listFindNoCase(ValueList(qRatings.composite), "#qCheckListTypes.checklisttypeid#@Other")>checked</cfif>>
																																</td>
																																<td>
																																
																																<div class="row-fluid">
																																	<a href="##x-modal-#qCheckListTypes.checklisttypeid#" role="button" class="btn btn-mini btn-darkblue" data-toggle="modal" data-checklistTypeid="#qCheckListTypes.checklisttypeid#">
																																	<i class="icon-plus-sign"></i>
																																		Add a comment
																																	</a>

																																	<a href="index.cfm?event=getChecklistComments&reportingUnitID=#request.event.getArg('reportingUnitID')#&planID=#request.event.getArg('planID')#&checklistTypeID=#qCheckListTypes.checklisttypeid#" role="button" class="btn btn-mini btn-red popup">
																																		<i class="icon-search"></i>
																																		View comments</a>				
																																</div>		

																																<div id="x-modal-#qCheckListTypes.checklisttypeid#" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModal" aria-hidden="true">
																																			<div class="modal-header">				
																																				<h3 id="myModalLabel">#qCheckListTypes.category#</h3><br>
																																				<h3 id="myModalLabel">#qCheckListTypes.subcategory#</h3><br>
																																				<h4>#qCheckListTypes.lineitem#</h4>
																																			</div>

																																			<div class="grid text-center alert alert-success hidden">
																																				<button class="close" data-dismiss="alert" type="button">×</button>
																																			</div>

																																			<div class="modal-body">

																																				<input type="hidden" name="checklisttypeid" class="checklisttypeid" value="#qCheckListTypes.checklisttypeid#" />

																																					<div class="control-group">
																																					<label for="textarea" class="control-label"><strong>Comment</strong></label>
																																						<div class="controls">
																																						<textarea name="comment" rows="5" class="input-block-level comment"></textarea>
																																						</div>
																																					</div>

																																				<div class="modal-footer">
																																					<button type="btn btn-primary" class="btn btn-red commentButton">Save Comment</button>
																																					<button class="btn btn-primary" data-dismiss="modal">Close</button>
																																				</div>

																																			</div>

																																</div>
																																
																																</td>
																																
																															</tr>
																															
																														</cfif>
																														</cfoutput>
																										</cfoutput>

																										<!---
																											<div class="form-actions">
																												<cfif session.user.userroleid gt 2>
																													<button type="submit" class="btn btn-primary">Save "#listlast(qCheckListTypes.category,".")#" ratings</button>
																												</cfif>
																												<!--- <button type="button" class="btn">Cancel</button> --->
																											</div>
																										--->

																									</cfoutput>

																									
																							</tbody>
																						</table>

																					</div>
																					
																									 
																				</div>
																			<div class="form-actions">
																				<cfif session.user.userroleid EQ 1 OR session.user.userroleid EQ 3>				
																					<button type="submit" class="btn btn-red">Save Checklist</button>
																				</cfif>																					
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
       <cfoutput>
        $(function () {
           
                $('##tmp-1,##tmp-2,##tmp-3,##tmp-4,##tmp-5,##tmp-6,##tmp-7,##tmp-8,##tmp-9,##tmp-10,##tmp-11').barrating('show', {
                    showValues:false,
                    showSelectedRating:true
                });


                $(".editOutcome").click(function() {
					//alert('oh YEAHHHH!!!');
					var outcome    = $(this).data("outcome");
					//alert(outcome);
					window.location.href = "index.cfm?event=editOutcome&outcomeID=" + outcome + "&reportingUnitID=#request.event.getArg('reportingUnitID')#&planID=#request.event.getArg('planID')#&programID=#request.event.getArg('programID')#&DeptID=#request.event.getArg('DeptID')#&DivisionID=#request.event.getArg('DivisionID')#";
				});


                $(".deleteOutcome").click(function() {
					var outcome    = $(this).data("outcome");
					if ( confirm('Be careful! Once you delete this outcome it will be gone forever! \n Are you sure you want to delete this outcome?')) {
						window.location.href = "index.cfm?event=deleteOutcome&outcomeID=" + outcome + "&reportingUnitID=#request.event.getArg('reportingUnitID')#&planID=#request.event.getArg('planID')#&programID=#request.event.getArg('programID')#&DeptID=#request.event.getArg('DeptID')#&DivisionID=#request.event.getArg('DivisionID')#";
					}
					return false;
				});

                
				$('.ui-sortable').sortable({
				    update: function(event, ui) {
				            var newOrder = $(this).sortable('toArray').toString();
				            //alert(newOrder);
				            $.post('index.cfm?event=saveOutcomeOrder', {order:newOrder});
				            location.reload(true);
				        }
				});

				$('.popup').click(function(event) {
				    event.preventDefault();
				    window.open($(this).attr("href"), "popupWindow", "width=600,height=600,scrollbars=yes");
				});
				


				$(".btn-mini").click(function(e) {
					$('.grid').empty();
					$('.grid').addClass('hidden');
					
				});

				$(".commentButton").click(function(e) {
					e.preventDefault();
					
					//alert('BOOYAH');
										
					var reportingUnitID   = #request.event.getArg('reportingUnitID')#;
					var planID   		  = #request.event.getArg('planID')#;
					var checklisttypeid   = $(this).closest('tr').find('.checklisttypeid').val();
					var comment 		  = $(this).closest('tr').find('.comment').val();
					var created_by        = #session.user.userid#;
										
					var postString = "index.cfm?event=saveChecklistComment&";

					//alert( postString );

					jQuery.post(
						postString,
						{
							reportingUnitID: reportingUnitID,
							planID: planID,
							checklisttypeid : checklisttypeid,
							comment:comment,
							created_by:created_by
							
						},

						//callback function
						function(data){
							$('.grid').removeClass('hidden');
							$('.grid').empty().append('Comment Saved! Please click the \'CLOSE\' button to continue');
						}
					)


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