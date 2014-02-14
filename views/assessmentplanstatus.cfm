<cfscript>
title = request.event.getArg('programname') & " - Update Plan Status";
qPlanStatuses = request.event.getArg('qPlanStatuses');
selectedplanstatus = request.event.getArg('selectedplanstatus');
</cfscript>

<!---
<cfdump var="#selectedplanstatus#" label="selectedplanstatus" />
<cfdump var="#qPlanStatuses#" label="qPlanStatuses" />
--->

<div id="main" style="margin-left: 0px;">
				<div class="container-fluid">
					<cfinclude template="/Assessment/views/page_header.cfm">
					<div class="row-fluid">
						<div class="span12">
							<div class="box box-color box-bordered">
								
								<div class="box-title">
									<h3>
										<i class="icon-reorder"></i>
										<cfoutput>
											#request.event.getArg('planperiod')# - Plan Status
										</cfoutput>										
									</h3>
								</div>
								
								<div class="box-content">
									<form action="index.cfm?event=saveStatus" method="POST" class='form-vertical form-bordered'>

									<cfoutput>
										<input type="hidden" name="reportingUnitID" value="#request.event.getArg('reportingUnitID')#" />
										<input type="hidden" name="planID" value="#request.event.getArg('planID')#" />
										<input type="hidden" name="ProgramID" value="#request.event.getArg('ProgramID')#" />
										<input type="hidden" name="DeptID" value="#request.event.getArg('deptID')#" />
										<input type="hidden" name="DivisionID" value="#request.event.getArg('DivisionID')#" />
									</cfoutput>

									<select name="planstatus" style="width: 650px;">
										<cfoutput query="qPlanStatuses">											
											
												<option value="#qPlanStatuses.workflowstep#"  <cfif qPlanStatuses.workflowstep EQ selectedplanstatus.planstatus> selected</cfif>>#qPlanStatuses.workflowstepdescription#</option>
																																			
										</cfoutput>
									</select>

									<div class="row-fluid">
										<div class="form-actions">
											<button type="submit" class="btn btn-red">Save changes</button>
											<button type="button" class="btn" id="cancel" onclick="javascript:window.history.back(-1);return false;">Cancel</button>																
										</div>
									</div>

									</form>

								</div>
							</div>
						</div>
					</div>
					
				</div>
			</div></div>