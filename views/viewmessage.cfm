<cfscript>
title 	=  "View Message";
qViewMessage 	=	request.event.getArg('qViewMessage');
variables.beanFactory	  	  = variables.propertyManager.getProperty("serviceFactory");
stringHelper    			  = variables.beanFactory.getBean('stringHelper');
</cfscript>


<div id="main" style="margin-left: 0px;">
				<div class="container-fluid">
					<cfinclude template="/Assessment/views/page_header.cfm">
					<div class="row-fluid">
						<div class="span12">
							<div class="box box-bordered box-color">
								<div class="box-title">
									<h3>
										<i class="icon-envelope"></i>
										View Message
									</h3>
								</div>
								<div class="box-content">
									<form action="##" method="POST" class='form-vertical form-wysiwyg'>
										
												<cfloop query="qViewMessage">
													<cfoutput>
													<div class="control-group">
														<label for="sendToUserID"><strong>Sent To:</strong></label>
														<div class="controls">
															#qViewMessage.UserFname# #qViewMessage.UserLname#							
														</div>
													</div>
													
													<div class="control-group">
														<label for="subject"><strong>Subject:</strong></label>
														<div class="controls">
															#qViewMessage.subject#
														</div>
													</div>
												
													
													<div class="control-group">
														<label><strong>Message:</strong></label>
														<div class="controls">
															#htmlCodeFormat(stringHelper.stripHTML(qViewMessage.message))#

														</div>
													</div>
													</cfoutput>
												</cfloop>
												
										
									
									</form>
								</div>
							</div>
						</div>
					</div>
					
				</div>
			</div></div>