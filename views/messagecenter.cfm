<cfscript>
title 				= "Message Center";
layout_message 		= len(trim(request.event.getArg('layout_message'))) ? request.event.getArg('layout_message') : "";
qSentMessages		= request.event.getArg('qSentMessages');
qInboxMessages		= request.event.getArg('qInboxMessages');
qDeletedMessages	= request.event.getArg('qDeletedMessages');
</cfscript>

<!--- 
<cfdump var="#qInboxMessages#" label="qInboxMessages" />
<cfdump var="#qSentMessages#" label="qSentMessages" />
--->


<div id="main" style="margin-left: 0px;">
				<div class="container-fluid">
					<cfinclude template="/Assessment/views/page_header.cfm">
					<div class="row-fluid">
						<div class="span12">

							<cfif len(trim(layout_message)) >
								<div class="alert alert-info text-center">
									<cfoutput>#layout_message#</cfoutput>
								</div>
							</cfif>

							<div class="box box-bordered box-color">
								<div class="box-title">
									<h3>
										<i class="icon-envelope"></i>
										My Messages
									</h3>
								</div>
								<div class="box-content nopadding">
								<ul class="tabs tabs-inline tabs-left">
									<li class='write hidden-480'>
										<a href="index.cfm?event=writemessage">Write message</a>
									</li>
									<li class='active'>
										<a href="#inbox" data-toggle="tab"><i class="icon-inbox"></i> Inbox <strong><cfoutput>(#qInboxMessages.recordcount#)</cfoutput></strong></a>
									</li>
									<li>
										<a href="#sent" data-toggle="tab"><i class="icon-share-alt"></i> Sent items</a>
									</li>
									<li>
										<a href="#trash" data-toggle="tab"><i class="icon-trash"></i> Trash</a>
									</li>
								</ul>
								<div class="tab-content tab-content-inline">
									<div class="tab-pane active" id="inbox">
										<div class="highlight-toolbar">
											<div class="pull-left">
												<div class="btn-toolbar">
													<h4>Inbox</h4>
													<div class="btn-group visible-480">
														<a href="" class="btn btn-danger">New</a>
													</div>
													
													<!---
													<cfif qInboxMessages.recordcount>
														<div class="btn-group">														
															<a href="#" class='btn' rel="tooltip" data-placement="bottom" title="Delete"><i class="icon-trash"></i></a>
														</div>
													</cfif>
													---->
												</div></div>
												<div class="pull-right">
													<cfif qInboxMessages.recordcount>
														<div class="btn-toolbar">
															<!---
															<div class="btn-group text hidden-768">
																<span><strong>1-25</strong> of <strong>348</strong></span>
															</div>
															<div class="btn-group">
																<a href="#" class="btn"><i class="icon-angle-left"></i></a>
																<a href="#" class="btn"><i class="icon-angle-right"></i></a>
															</div>
															---->
															
														</div>
													</cfif>
												</div>
											</div>
											<cfif qInboxMessages.recordcount>
												<table class="table table-striped table-nomargin table-mail">
													<thead>													
															<tr>
																<!---
																<th class='table-checkbox hidden-480'>
																	<input type="checkbox" class='sel-all'>
																</th>
																--->
																<th class='table-icon hidden-480'></th>
																<th>Sender</th>
																<th>Subject</th>
																
																<th>Date</th>
																<th></th>
															</tr>
													</thead>
													<tbody>
														
															<cfloop query="qInboxMessages">
																<cfoutput>
																	<tr>
																		<!---
																		<td class='table-checkbox hidden-480'>
																			<input type="checkbox" class='selectable'>
																		</td>
																		--->
																		<td class='table-icon hidden-480'>
																			<a href="##" class="sel-star active"><i class="icon-star"></i></a>
																		</td>
																		<td class='table-fixed-medium'>
																			#qInboxMessages.UserFName# #qInboxMessages.UserLName# 
																		</td>
																		<td>
																			#qInboxMessages.Subject#
																		</td>
																		
																		<td>
																			#DateFormat(qInboxMessages.CreatedOn,'mm/dd/yyyy')#
																		</td>
																		<td>
																			<a href="index.cfm?event=deleteMessage&messageID=#val(qInboxMessages.messageID)#"><i class="icon-trash"></i>Delete</a> | 
																			<a href="index.cfm?event=viewMessage&messageID=#val(qInboxMessages.messageID)#"><i class="icon-search"></i>View</a>
																		</td>
																	</tr>
																</cfoutput>
															</cfloop>	
														</tbody>
												</table>
											<cfelse>
												<div class="row-fluid">
													<div class="span12">
														<div class="alert alert-info text-center" style="height:200px;">
															<b>No messages in your inbox</b>
														</div>
													</div>
												</div>
											</cfif>
										</div>
										<div class="tab-pane" id="sent">
											<div class="highlight-toolbar">
												<div class="pull-left"><div class="btn-toolbar">													
													<h4>Sent Items</h4>
													<!---
													<div class="btn-group">													
														<a href="#" class='btn' rel="tooltip" data-placement="bottom" title="Delete"><i class="icon-trash"></i></a>
													</div>
													---->
													
												</div></div>
												<div class="pull-right">
													<div class="btn-toolbar">
														<!---
														<div class="btn-group text hidden-768">
															<span><strong>1-25</strong> of <strong>348</strong></span>
														</div>
														<div class="btn-group">
															<a href="#" class="btn" data-toggle="dropdown"><i class="icon-angle-left"></i></a>
															<a href="#" class="btn" data-toggle="dropdown"><i class="icon-angle-right"></i></a>
														</div>
														--->
														
													</div>
												</div>
											</div>
											<cfif qSentMessages.recordcount>
												<table class="table table-striped table-nomargin table-mail">
													<thead>
															<tr>
																	<!---
																	<th class='table-checkbox hidden-480'>
																		<input type="checkbox" class='sel-all'>
																	</th>
																	--->
																	<th class='table-icon hidden-480'></th>
																	<th>Sender</th>
																	<th>Subject</th>
																	
																	<th>Date</th>
																	<th></th>
																</tr>
													</thead>
													<tbody>

														<cfloop query="qSentMessages">
															<cfoutput>
																<tr>
																	<!---
																	<td class='table-checkbox hidden-480'>
																		<input type="checkbox" class='selectable'>
																	</td>
																	--->
																	<td class='table-icon hidden-480'>
																		<a href="##" class="sel-star active"><i class="icon-star"></i></a>
																	</td>
																	<td>
																		#qSentMessages.UserFName# #qSentMessages.UserLName# 
																	</td>
																	<td>
																		#qSentMessages.Subject#
																	</td>
																	
																	<td>
																		#DateFormat(qSentMessages.CreatedOn,'mm/dd/yyyy')#
																	</td>
																	<td>
																		<!---
																		<a href="index.cfm?event=deleteMessage&messageID=#qSentMessages.messageID#"><i class="icon-trash"></i>Delete</a> | 
																		--->
																		<a href="index.cfm?event=viewMessage&MessageID=#qSentMessages.messageID#"><i class="icon-search"></i>View</a>
																	</td>
																</tr>
															</cfoutput>
														</cfloop>

													</tbody>
												</table>
											<cfelse>
												<div class="row-fluid">
													<div class="span12">
														<div class="alert alert-info text-center" style="height:200px;">
															<b>No Messages Available</b>
														</div>
													</div>
												</div>
											</cfif>
										</div>
										<div class="tab-pane" id="trash">
											<div class="highlight-toolbar">
												<div class="pull-left"><div class="btn-toolbar">
													<h4>Trash</h4>
													<!---
													<div class="btn-group">
														<a href="#" class='btn' rel="tooltip" data-placement="bottom" title="Undo"><i class="icon-arrow-left"></i></a>
													</div>
													--->
												</div></div>
												<div class="pull-right">
													<div class="btn-toolbar">
														<!---
														<div class="btn-group text hidden-768">
															<span><strong>1-25</strong> of <strong>348</strong></span>
														</div>
														<div class="btn-group">
															<a href="#" class="btn" data-toggle="dropdown"><i class="icon-angle-left"></i></a>
															<a href="#" class="btn" data-toggle="dropdown"><i class="icon-angle-right"></i></a>
														</div>
														<div class="btn-group hidden-768">
															<div class="dropdown">
																<a href="#" class="btn" data-toggle="dropdown"><i class="icon-cog"></i><span class="caret"></span></a>
																<ul class="dropdown-menu pull-right">
																	<li><a href="#">Settings</a></li>
																	<li><a href="#">Account settings</a></li>
																	<li><a href="#">Email settings</a></li>
																	<li><a href="#">Themes</a></li>
																	<li><a href="#">Help &amp; FAQ</a></li>
																</ul>
															</div>
														</div>
														--->
													</div>
												</div>
											</div>
											<cfif qDeletedMessages.recordcount>
												<table class="table table-striped table-nomargin table-mail">
													<thead>
															<tr>
																	<!---
																	<th class='table-checkbox hidden-480'>
																		<input type="checkbox" class='sel-all'>
																	</th>
																	--->
																	<th class='table-icon hidden-480'></th>
																	<th>Sender</th>
																	<th>Subject</th>
																	
																	<th>Date</th>
																	<th></th>
																</tr>
													</thead>
													<tbody>

														<cfloop query="qDeletedMessages">
															<cfoutput>
																<tr>
																	<!---
																	<td class='table-checkbox hidden-480'>
																		<input type="checkbox" class='selectable'>
																	</td>
																	--->
																	<td class='table-icon hidden-480'>
																		<a href="##" class="sel-star active"><i class="icon-star"></i></a>
																	</td>
																	<td>
																		#qDeletedMessages.UserFName# #qDeletedMessages.UserLName# 
																	</td>
																	<td>
																		#qDeletedMessages.Subject#
																	</td>
																	
																	<td>
																		#DateFormat(qDeletedMessages.CreatedOn,'mm/dd/yyyy')#
																	</td>
																	<td>
																		<!---
																		<a href="index.cfm?event=deleteMessage&messageID=#qSentMessages.messageID#"><i class="icon-trash"></i>Delete</a> | 
																		--->
																		<a href="index.cfm?event=viewMessage&MessageID=#qDeletedMessages.messageID#"><i class="icon-search"></i>View</a>
																	</td>
																</tr>
															</cfoutput>
														</cfloop>

													</tbody>
												</table>
											<cfelse>
												<div class="row-fluid">
													<div class="span12">
														<div class="alert alert-info text-center" style="height:200px;">
															<b>You have not deleted any messages</b>
														</div>
													</div>
												</div>
											</cfif>
										</div>
									</div>
								</div>
							</div>
							</div>
						</div>
					</div>
					
				</div>
			</div></div>