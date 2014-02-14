<cfscript>
title 			= "My Account Settings";
qUserDetails 	= request.event.getArg('qUserDetails');
qUserRoles		= request.event.getArg('qUserRoles');
qCampuses		= request.event.getArg('qCampuses');
qAllRoles		= request.event.getArg('qAllRoles');
</cfscript>

<!---
<cfdump var="#qAllRoles#" label="qAllRoles" />
<cfdump var="#qUserDetails#" label="qUserDetails" />
<cfdump var="#qUserRoles#" label="qUserRoles" abort="false" />
--->

<div id="main" style="margin-left: 0px;">
			<div class="container-fluid">
				<cfinclude template="/Assessment/views/page_header.cfm">
				<div class="row-fluid">
				<div class="span12">

					<cfif structKeyExists(session,"notification") and len(session.notification)>
					<div class="alert">
						<button type="button" class="close" data-dismiss="alert">×</button>
						<cfoutput>
								<strong>#session.notification#</strong> 
						</cfoutput>

					</div>
					</cfif>

					<div class="box box-color box-bordered">
						<div class="box-title">
							<h3>
								<i class="icon-user"></i>
								Edit user profile
							</h3>
						</div>
						<div class="box-content nopadding">
							<ul class="tabs tabs-inline tabs-top">
								<li class='active'>
									<a href="#profile" data-toggle='tab'><i class="icon-user"></i> Profile</a>
								</li>
								<li>
									<a href="#notifications" data-toggle='tab'><i class="icon-bullhorn"></i> User Roles</a>
								</li>
								<!---
								<li>
									<a href="#security" data-toggle='tab'><i class="icon-lock"></i> Change Password</a>
								</li>
								--->
							</ul>
							<div class="tab-content padding tab-content-inline tab-content-bottom">
								<div class="tab-pane active" id="profile">

									<form action="index.cfm?event=updateContactInfo" method="post" class="form-horizontal">
									<cfloop query="qUserDetails">
									<cfoutput>
										<div class="row-fluid">
											<div class="span2">
												
											</div>
											<div class="span10">
												<div class="control-group">
													<label for="name" class="control-label right">Name:</label>
													<div class="controls">
														<input type="text" name="name" class='input-xlarge' value="#qUserDetails.UserFname# #qUserDetails.UserLname#" readonly>
													</div>
												</div>												
												
												<div class="control-group">
													<label for="UserAddress" class="control-label right">Address:</label>
													<div class="controls">
														<div class="span12"><input type="text" name="UserAddress" id="textfield" class="tagsinput" value="#qUserDetails.UserAddress#"></div>
													</div>
												</div>
												<!--- campus needs to be changed to a drop-down --->
												<div class="control-group">
													<label for="UserCampus" class="control-label right">Campus:</label>
													<div class="controls">
														<!---
														<div class="span12"><input type="text" name="UserCampus" id="textfield" class="tagsinput" value="#qUserDetails.campusdescription#"></div>
														--->

														
															<select name="UserCampus" id="s2" class='select2-me input-xlarge'>
																<cfloop query="qCampuses">
																	<cfoutput>
																		<option value="#qCampuses.Campus#" <cfif qUserDetails.UserCampus EQ qCampuses.Campus>selected</cfif>>#qCampuses.CampusDescription#</option>
																	</cfoutput>																
																</cfloop>														
															</select>
														
													</div>
												</div>
												<div class="control-group">
													<label for="phone" class="control-label right">Phone:</label>
													<div class="controls">
														<div class="span12">
															
																<input type="text" name="UserPhoneAcode" id="phone" class="input-small" value="#qUserDetails.UserPhoneAcode#" length="3" maxlength="3">
														
																<input type="text" name="UserPhoneNumber" id="phone" class="input-medium" value="#qUserDetails.UserPhoneNumber#" length="7" maxlength="7">
															
														</div>
													</div>
												</div>
												<div class="control-group">
													<label for="email" class="control-label right">Email:</label>
													<div class="controls">
														<input type="text" name="email" class='input-xlarge' value="#qUserDetails.UserEmail#" readonly>
														<!---
														<div class="form-button">
															<a href="#" class="btn btn-grey-4 change-input">Change</a>
														</div>
														--->
													</div>
												</div>
												
												<div class="form-actions">
													<input type="submit" class='btn btn-primary' value="Save">
													<input type="reset" class='btn' value="Discard changes">
												</div>
											</div>
										</div>
									</cfoutput>
									</cfloop>
									</form>
								</div>
								<div class="tab-pane" id="notifications">
									
									<form action="index.cfm?event=updateUserRole" method="post" class="form-horizontal">
										<div class="control-group">
											<label for="asdf" class="control-label">Roles</label>
											<div class="controls">
												
												
												<cfoutput query="qUserRoles">
													<label class="radio"><input type="radio" name="roleID" id="#qUserRoles.AssessmentRoleDescription#" value="#qUserRoles.RecordID#@#qUserRoles.RoleID#" <cfif session.user.userroleid EQ qUserRoles.roleID>
														checked
													</cfif>/>#qUserRoles.AssessmentRoleDescription# <cfif qUserRoles.defaultrole > [default] </cfif></label>
												</cfoutput>				
												

												<!---
												<cfoutput>
												<cfloop query="qAllRoles">
													<cfloop query="qUserRoles">
														
														<cfif qUserRoles.roleID EQ  qAllRoles.roleID>
															
																<label class="radio"><input type="radio" name="roleID" id="#qUserRoles.AssessmentRoleDescription#" value="#qUserRoles.RecordID#@#qUserRoles.RoleID#" <cfif session.user.userroleid EQ qUserRoles.roleID>
																	checked
																</cfif>/>#qUserRoles.AssessmentRoleDescription# <cfif qUserRoles.defaultrole > [default] </cfif></label>
															</cfoutput>	

														</cfif>
														
													</cfloop>
												</cfloop>		
												</cfoutput>		
												--->
												
											</div>
										</div>
										<div class="form-actions">
											<input type="submit" class='btn btn-primary' value="Save">										
										</div>
									</form>
										
								</div>
								<div class="tab-pane" id="security">
									<form action="index.cfm?event=updatepassword" method="post" class="form-horizontal form-validate" id="updatepassword">
										<div class="control-group">
											<label for="UserPassword_1" class="control-label">Enter new password:</label>
											<div class="controls">
														<input type="password" name="UserPassword_1" class='input-xlarge' id="UserPassword_1" data-rule-required="true">
														<!---
														<div class="form-button">
															<a href="#" class="btn btn-grey-4 change-input">Change</a>
														</div>
														--->
													</div>
											
										</div>
										<div class="control-group">
											<label for="UserPassword_2" class="control-label">Confirm password:</label>
											<div class="controls">
														<input type="password" name="UserPassword_2" id="confirmfield" class='input-xlarge' data-rule-equalTo="#UserPassword_1" data-rule-required="true">
														<!---
														<div class="form-button">
															<a href="#" class="btn btn-grey-4 change-input">Change</a>
														</div>
														--->
													</div>
											
										</div>
										
										<div class="form-actions">
											<input type="submit" class='btn btn-primary' value="Save">
											<input type="reset" class='btn' value="Discard changes">
										</div>
									</form>



								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			</div><!--- end of container-fluid --->
</div><!--- end of main --->

