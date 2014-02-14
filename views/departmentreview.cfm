<cfscript>
title 						= "Department Performance Review";
qReviewDetails				= request.event.getArg('qReviewDetails');
//variables.beanFactory	  	= variables.propertyManager.getProperty("serviceFactory");
//stringHelper    			= variables.beanFactory.getBean('stringHelper');
</cfscript>

<!--- 
<cfdump var="#qReviewDetails#" />
--->

<div id="main" style="margin-left: 0px;">
	<div class="container-fluid">
		<div class="box-content nopadding">
			
			<cfoutput query="qReviewDetails">
				 <div class="row-fluid">
					<div class="span12">
						<div class="box box-color box-bordered darkblue">
							<div class="box-title">
								<h3>Dept. Performance Review</h3>
							</div>

							<div class="box-content">
								<div class="row-fluid">
									<div class="text-center">
										<cfoutput>
										<strong>College:</strong> #qReviewDetails.divisionname#<br>
										<strong>Department:</strong> #qReviewDetails.deptname#<br>
										<strong>Review Year:</strong> #qReviewDetails.reviewperiod#<br>
										<strong>Last Updated:</strong> #qReviewDetails.activitydate#<br>
										</cfoutput>
									</div>
								</div>

								<form class="form-horizontal" method="POST" action="index.cfm?event=saveDeptReview">
									
									<input type="hidden" name="reviewID" value="#request.event.getArg('reviewID')#" />
									<input type="hidden" name="reportingUnitID" value="#request.event.getArg('reportingUnitID')#" />
									<input type="hidden" name="reviewperiod" value="#qReviewDetails.reviewperiod#" />



									<!---
									<div class="control-group">
										  <label class="control-label text-center" for="radios">Status of this Review:</label>
											  	<div class="controls text-center">
												  	<cfset count=0>
												  	<cfloop list="Complete,In Progress" index="idx" delimiters=",">	
			  											<label class="radio inline" for="radios-#count#">
												  		 <input type="radio" name="ReviewStatus" value="#idx#" <cfif #idx# EQ #qReviewDetails.ReviewStatus#>checked</cfif>>#idx#
												  		</label>
												  		<cfset count = count + 1/>
												  	</cfloop>
												</div>	
									</div>
									--->
									<div class="row-fluid">
										<div class="text-center">
										<strong>Status of this Review:</strong>										
												  	<cfset count=0>
												  	<cfloop list="Complete,In Progress" index="idx" delimiters=",">	
			  											<label class="radio inline" for="radios-#count#">
												  		 <input type="radio" name="ReviewStatus" value="#idx#" <cfif #idx# EQ #qReviewDetails.ReviewStatus#>checked</cfif>>#idx#
												  		</label>
												  		<cfset count = count + 1/>
												  	</cfloop>
												
										</div>
									</div>

									<hr>
									
									<div class="row-fluid">		
										<div class="text-center">										
									 		<strong>I have reviewed the Departmental Dashboard Indicator (DDI) data for this department:</strong>
									  									  	
										  	<cfset count=0>
										  	<cfloop list="Yes,No" index="idx" delimiters=",">	
	  											<label class="radio inline" for="radios-#count#">
										  		 <input type="radio" name="DeanReviewedDDI" value="#left(idx,1)#"  <cfif #qReviewDetails.DeanReviewedDDI# EQ #left(idx,1)#>checked</cfif>>#idx#
										  		</label>
										  		<cfset count = count + 1/>
										  	</cfloop>
										  	<p>Full DDI documents are available <a id="DDIDocsLink" href="http://www.fau.edu/iea/deptreview.php" target="_blank">here</a>.  DDI data relevant to each section of this review are also linked below.</p>	
										  </div>							
									</div>

									<div class="row-fluid">		
										<div class="text-center">											
									 		<strong>I have reviewed the most current assessment plans for the programs in this department:</strong>
									  									  	
										  	<cfset count=0>
										  	<cfloop list="Yes,No" index="idx" delimiters=",">	
	  											<label class="radio inline" for="radios-#count#">
										  		 <input type="radio" name="DeanReviewedAssessmentPlans" value="#left(idx,1)#" <cfif #qReviewDetails.DEANREVIEWEDASSESSMENTPLANS# EQ #left(idx,1)#>checked</cfif>>#idx#
										  		</label>
										  		<cfset count = count + 1/>
										  	</cfloop>
										  	<p>Assessment plans are available <a href="index.cfm?event=showreportingunits" target="_blank">here</a>.</p>
										  </div>								
									</div>
									
									
										<div class="row-fluid text-center">
											<button type="submit" class="btn btn-red">Save changes</button>
										</div>

								<hr>

								<div class="row-fluid">
									<div class="box-title">
										<h3>Part I. Instruction</h3>
									</div>

									
									<div class="box-content">
										<h4>Related Departmental Dashboard Indicator (DDI) data</h4>

										<div class="row-fluid">	
											Personnel:  

											<a title="Click to view DDI data" href="DDIDocuments/#qReviewDetails.reviewperiod#/PR_#qReviewDetails.reviewperiod#_#qReviewDetails.samasdeptid#.htm##personnel" target="_blank">B1</a> 

											 <a title="Click to view DDI data" href="DDIDocuments/#qReviewDetails.reviewperiod#/PR_#qReviewDetails.reviewperiod#_#qReviewDetails.samasdeptid#.htm##faculty" target="_blank">B2</a> 
										</div>

										<div class="row-fluid">	
											Courses taught: <a title="Click to view DDI data" href="DDIDocuments/#qReviewDetails.reviewperiod#/PR_#qReviewDetails.reviewperiod#_#qReviewDetails.samasdeptid#.htm##courses" target="_blank">B3</a>
										</div>

										<div class="row-fluid">	
											Student diversity: <a title="Click to view DDI data" href="DDIDocuments/#qReviewDetails.reviewperiod#/PR_#qReviewDetails.reviewperiod#_#qReviewDetails.samasdeptid#.htm##majors" target="_blank">B4</a>
										</div>

										<div class="row-fluid">	
											FTE Production: 
												  <a title="Click to view DDI data" href="DDIDocuments/#qReviewDetails.reviewperiod#/PR_#qReviewDetails.reviewperiod#_#qReviewDetails.samasdeptid#.htm##fte" target="_blank">C1</a>
												  <a title="Click to view DDI data" href="DDIDocuments/#qReviewDetails.reviewperiod#/PR_#qReviewDetails.reviewperiod#_#qReviewDetails.samasdeptid#.htm##fteinout" target="_blank">C2</a>
												  <a title="Click to view DDI data" href="DDIDocuments/#qReviewDetails.reviewperiod#/PR_#qReviewDetails.reviewperiod#_#qReviewDetails.samasdeptid#.htm##fteper" target="_blank">D1</a> 
										</div>

										<div class="row-fluid">	
											Degree Production: 
												
												<a title="Click to view DDI data" href="DDIDocuments/#qReviewDetails.reviewperiod#/PR_#qReviewDetails.reviewperiod#_#qReviewDetails.samasdeptid#.htm##degrees" target="_blank">C3</a>

												<a title="Click to view DDI data" href="DDIDocuments/#qReviewDetails.reviewperiod#/PR_#qReviewDetails.reviewperiod#_#qReviewDetails.samasdeptid#.htm##degreesper" target="_blank">D2</a>  
										</div>

										<div class="row-fluid">	
											Student Feedback: 
												<a title="Click to view DDI data" href="DDIDocuments/#qReviewDetails.reviewperiod#/PR_#qReviewDetails.reviewperiod#_#qReviewDetails.samasdeptid#.htm##spot" target="_blank">E1</a>
												<a title="Click to view DDI data" href="DDIDocuments/#qReviewDetails.reviewperiod#/PR_#qReviewDetails.reviewperiod#_#qReviewDetails.samasdeptid#.htm##stusat" target="_blank">E2</a>  
										</div>

										<div class="row-fluid">
											<h4>Dean's evaluation of department's performance in instruction</h4>
											<textarea id="CommentsInstruction" name="CommentsInstruction" class="ckeditor input-block-level">#qReviewDetails.commentsinstruction#</textarea>
										</div>

										<div class="row-fluid">
											<h4>Rating (optional)</h4>
										</div>

										<div class="row-fluid">
											<label class="radio inline" for="DeansEvalInstruction_0">
												<input id="DeansEvalInstruction_0" type="radio" name="DeansEvalInstruction" value="S+" <cfif qReviewDetails.DeansEvalInstruction EQ "S+">checked</cfif> />S+
											</label>
											<label class="radio inline" for="DeansEvalInstruction_1">
												<input id="DeansEvalInstruction_1" type="radio" name="DeansEvalInstruction" value="S" <cfif qReviewDetails.DeansEvalInstruction EQ "S">checked</cfif>/>S
											</label>
											<label class="radio inline" for="DeansEvalInstruction_2">
												<input id="DeansEvalInstruction_2" type="radio" name="DeansEvalInstruction" value="S-" <cfif qReviewDetails.DeansEvalInstruction EQ "S-">checked</cfif>/>S-
											</label>
											<label for="DeansEvalInstruction_3" class="radio inline">
												<input id="DeansEvalInstruction_3" type="radio" name="DeansEvalInstruction" value="U" <cfif qReviewDetails.DeansEvalInstruction EQ "U">checked</cfif>/>U
											</label>
										</div>

										<div class="row-fluid text-center">
											<button type="submit" class="btn btn-red">Save changes</button>
										</div>

									</div>
								</div>

								<hr>

								<div class="row-fluid">
									<div class="box-title">
										<h3>Part II. Research, Creative and Scholarly Activities</h3>
									</div>
									<div class="box-content">
										<div class="row-fluid">
											<h4>Related Departmental Dashboard Indicator (DDI) data</h4>
										</div>

										<div class="row-fluid">	
											Funded Research: 
												<a title="Click to view DDI data" href="DDIDocuments/#qReviewDetails.reviewperiod#/PR_#qReviewDetails.reviewperiod#_#qReviewDetails.samasdeptid#.htm##resact" target="_blank">B1</a>
												<a title="Click to view DDI data" href="DDIDocuments/#qReviewDetails.reviewperiod#/PR_#qReviewDetails.reviewperiod#_#qReviewDetails.samasdeptid#.htm##resprod" target="_blank">C7-9</a>  
												<a title="Click to view DDI data" href="DDIDocuments/#qReviewDetails.reviewperiod#/PR_#qReviewDetails.reviewperiod#_#qReviewDetails.samasdeptid#.htm##reseff" target="_blank">D7-9</a>  
												(efficiency)
										</div>

										<div class="row-fluid">
											<h4>Dean's evaluation of department's performance in research, creative and scholarly activity:</h4>
										</div>

										<div class="row-fluid">
											<textarea id="CommentsResearch" name="CommentsResearch" class="ckeditor input-block-level">#qReviewDetails.commentsresearch#</textarea>
										</div>

										<div class="row-fluid">
											<h4>Rating (optional)</h4>
										</div>

										<div class="row-fluid">
											<label class="radio inline" for="DeansEvalResearch_0">
													<input type="radio" value="S+" name="DeansEvalResearch" id="DeansEvalResearch_0" <cfif qReviewDetails.DeansEvalResearch EQ "S+">checked</cfif>>S+
											</label>
											<label  class="radio inline" for="DeansEvalResearch_1">
												<input type="radio" value="S" name="DeansEvalResearch" id="DeansEvalResearch_1" <cfif qReviewDetails.DeansEvalResearch EQ "S">checked</cfif>>S
											</label>
											<label class="radio inline" for="DeansEvalResearch_2">
												<input type="radio" value="S-" name="DeansEvalResearch" id="DeansEvalResearch_2" <cfif qReviewDetails.DeansEvalResearch EQ "S-">checked</cfif>>S-
											</label>
											<label class="radio inline" for="DeansEvalResearch_3">
												<input type="radio" value="U" name="DeansEvalResearch" id="DeansEvalResearch_3" <cfif qReviewDetails.DeansEvalResearch EQ "U">checked</cfif>>U
											</label>
										</div>
										
										<div class="row-fluid text-center">
											<button type="submit" class="btn btn-red">Save changes</button>
										</div>

									</div>
								</div>

								<hr>

								<div class="row-fluid">
									<div class="box-title">
										<h3>Part III. Service</h3>
									</div>
									<div class="box-content">
										<div class="row-fluid">
											<h4>Dean's evaluation of department's performance in providing service:</h4>
										</div>

										<div class="row-fluid">	
											Service productivity: 
												<a title="Click to view DDI data" href="DDIDocuments/#qReviewDetails.reviewperiod#/PR_#qReviewDetails.reviewperiod#_#qReviewDetails.samasdeptid#.htm##svcprod" target="_blank">B1-3</a>
												<a title="Click to view DDI data" href="DDIDocuments/#qReviewDetails.reviewperiod#/PR_#qReviewDetails.reviewperiod#_#qReviewDetails.samasdeptid#.htm##svceff" target="_blank">C1-3</a>						
												(efficiency)
										</div>

										<div class="row-fluid">
											<textarea id="CommentsService" name="CommentsService" class="ckeditor input-block-level">#qReviewDetails.commentsservice#</textarea>
										</div>

										<div class="row-fluid">
											<h4>Rating (optional)</h4>
										</div>

										<div class="row-fluid">
											<label class="radio inline" for="DeansEvalService_0">
												<input id="DeansEvalService_0" type="radio" value="S+" name="DeansEvalService" <cfif qReviewDetails.DeansEvalService EQ "S+">checked</cfif>>S+
											</label>

											<label class="radio inline" for="DeansEvalService_1">
												<input id="DeansEvalService_1" type="radio" value="S" name="DeansEvalService" <cfif qReviewDetails.DeansEvalService EQ "S">checked</cfif>>S
											</label>

											<label class="radio inline" for="DeansEvalService_2">
												<input id="DeansEvalService_2" type="radio" value="S-" name="DeansEvalService" <cfif qReviewDetails.DeansEvalService EQ "S-">checked</cfif>>S-
											</label>

											<label class="radio inline" for="DeansEvalService_3">
												<input id="DeansEvalService_3" type="radio" value="U" name="DeansEvalService" <cfif qReviewDetails.DeansEvalService EQ "U">checked</cfif>>U
											</label>
										</div>

										<div class="row-fluid text-center">
											<button type="submit" class="btn btn-red">Save changes</button>
										</div>

									</div>
								</div>

								

								<hr>

								<div class="row-fluid">
									<div class="box-title">
										<h3>Summary and Future Plans</h3>
									</div>
									<div class="box-content">
										<div class="row-fluid">
											<h4>Summary comments / Areas for improvement</h4>
										</div>
										<div class="row-fluid">
											<textarea id="SummaryComments" name="SummaryComments" class="ckeditor input-block-level">#qReviewDetails.SummaryComments#</textarea>
										</div>

										<div class="row-fluid">
											<h4>Planned new initiatives</h4>
										</div>

										<div class="row-fluid">
											<textarea id="NewInitiatives" name="NewInitiatives" class="ckeditor input-block-level">#qReviewDetails.NewInitiatives#</textarea>
										</div>
									
										<div class="row-fluid text-center">
											<br><button type="submit" class="btn btn-red">Save changes</button>
										</div>

									</div>
									
									

								</div>
								</form>
								
							</div>
						</div>	
					</div>
				</div>				
			</cfoutput>
			

					
		</div>
	</div>
</div>
