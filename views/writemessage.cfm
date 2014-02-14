<cfscript>
title 	=  "Write Message";
qUsers 	=	request.event.getArg('qUsers');
//qSpecificUser = request.event.getArg('qSpecificUser');

if (request.event.getArg('event') eq 'requestrevision' OR  request.event.getArg('event')  eq 'acceptplan' OR request.event.getArg('event')  eq 'submitforreview') 
{
	formaction = 'sendmessagewithstatusupdate';
} else {
	formaction = 'sendmessage';
}

</cfscript>
<!--- 
<cfdump var="#session.user.userid#" label="session.user.userid"/>
<cfdump var="#session#" label="session"/>
--->

<cfif request.event.getArg('event') eq 'requestrevision' OR request.event.getArg('event')  eq 'acceptplan' >
	<!--- Hacky SACK! --->
	<cfquery name="findUser" dbtype="query" >
		select userid
		from qUsers
		where userfname = '#ListGetAt(request.event.getArg("reporter"),1," ")#'
		AND userlname = '#ListGetAt(request.event.getArg("reporter"),2," ")#'
	</cfquery>

	<cfif finduser.recordcount >
		<cfset  sendtouser = finduser.userid />	
	<cfelse>
		<cfset sendtouser = "" />
	</cfif>
<cfelse>
		<cfset sendtouser = "" />
</cfif>

<!---
<cfdump var="#sendtouser#" label="sendtouser" abort="true" />
--->

<div id="main" style="margin-left: 0px;">
				<div class="container-fluid">
					<cfinclude template="/Assessment/views/page_header.cfm">
					<div class="row-fluid">
						<div class="span12">
							<div class="box box-bordered box-color">
								<div class="box-title">
									<h3>
										<i class="icon-envelope"></i>
										Write Message
									</h3>
								</div>
								<div class="box-content">
									<cfoutput>
									<form action="index.cfm?event=#formaction#" method="POST" class='form-vertical form-wysiwyg'>
										
										<!---BEGIN: will need to pass a hidden field to flip the plan status --->
										<!---
											<option value="10">Enter new plan</option>
											<option value="20">Plan submitted for review</option>
											<option value="30">Revise plan</option>
											<option value="40">Collect data</option>
											<option value="50">Enter report of results</option>
											<option value="60">Report of results submitted for review</option>
											<option value="70">Revise report of results</option>
											<option value="80">Report approved (complete)</option>
										--->
																						
											<cfif request.event.getArg('event') eq 'requestrevision' OR  request.event.getArg('event')  eq 'acceptplan' OR request.event.getArg('event')  eq 'submitforreview'>
												<input type="hidden" name="planstatus" value="#newplanstatus#" />
												<input type="hidden" name="planid" value="#request.event.getArg('planid')#" />
												<input type="hidden" name="reportingUnitID" value="#request.event.getArg('reportingUnitID')#" />
												<input type="hidden" name="programID" value="#request.event.getArg('programID')#" />
												<input type="hidden" name="deptID" value="#request.event.getArg('deptID')#" />
												<input type="hidden" name="divisionID" value="#request.event.getArg('divisionID')#" />
											</cfif>
										</cfoutput>
										<!---END: will need to pass a hidden field to flip the plan status --->

												<div class="control-group">
													<label for="sendToUserID"><strong>Send To:</strong></label>
													<div class="controls">
														<select name="sendToUserID" id="sendToUserID" class="input-large" style="width:300px">
															<cfloop query="qUsers">
																<cfoutput>
																	<option value="#qUsers.UserID#" 
																	<cfif len(trim(request.event.getArg('userid'))) AND request.event.getArg('userID') EQ #qUsers.UserID#  OR #sendtouser# EQ #qUsers.UserID#>
																		selected																	
																	</cfif>

																	<strong>#qUsers.UserFname# #qUsers.UserLname#</strong></option>
																</cfoutput>
															</cfloop>	
														</select>											
													</div>
												</div>
												
												<div class="control-group">
													<label for="subject"><strong>Subject:</strong></label>
													<div class="controls">
														<cfoutput>
															<input type="text" name="subject" id="subject" class="input-xlarge" style="width:300px" <cfif request.event.getArg('event') eq 'requestrevision'>
																value = "Revision Request for #request.event.getArg('programname')# - #request.event.getArg('planperiod')#"
															  <cfelseif request.event.getArg('event')  eq 'acceptplan'>
															  	value = "Notice of plan acceptance #request.event.getArg('programname')# - #request.event.getArg('planperiod')#"
															  </cfif>
															 >
														</cfoutput>
													</div>
												</div>
											
												
												<div class="control-group">
													<label><strong>Message:</strong></label>
													<div class="controls">
														<cfoutput>
															<textarea name="ck" class='ckeditor span12' rows="5">
																<cfif request.event.getArg('event')  eq 'requestrevision' OR  request.event.getArg('event')  eq 'acceptplan'>
																	Hi #request.event.getArg('reporter')#,<br>
																</cfif>

																	<cfif request.event.getArg('event')  eq 'requestrevision'>
																		Please revise your current plan for <b>#request.event.getArg('programname')# - #request.event.getArg('planperiod')#</b> for the following reasons:<br><br><em>[Enter your reasons here!]</em>
																	</cfif>
																	 <cfif request.event.getArg('event')  eq 'acceptplan'>
																	 	Your plan for <b>#request.event.getArg('programname')# - #request.event.getArg('planperiod')#</b> has been accepted!
																	</cfif>
															</textarea>
														</cfoutput>
													</div>
												</div>

										
										<div class="form-actions text-right">
											<input type="submit" id="sendMessage" value="Send Message" class="btn btn-red">
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
					
				</div>
			</div></div>