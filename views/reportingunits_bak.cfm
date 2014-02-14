<cfscript>
title = "Reporting Units";
</cfscript>

<div id="main" style="margin-left: 0px;">
			<div class="container-fluid">
				<cfinclude template="/Assessment/views/page_header.cfm">
				<!---
				<div class="page-header">
					<div class="pull-left">
						<h1>Reporting Units</h1>
					</div>
					<div class="pull-right">
						<ul class="minitiles">
							<li class='grey'>
								<a href="#"><i class="icon-cogs"></i></a>
							</li>							
						</ul>
						<ul class="stats">
							
							<li class='lightred'>
								<i class="icon-calendar"></i>
								<div class="details">
									<span class="big">February 22, 2013</span>
									<span>Wednesday, 13:56</span>
								</div>
							</li>
						</ul>
					</div>
				</div>
				<div class="breadcrumbs">
					<ul>
						<li>
							<a href="more-login.html">Home</a>
							<i class="icon-angle-right"></i>
						</li>
						<li>
							<a href="more-files.html">Pages</a>
							<i class="icon-angle-right"></i>
						</li>
						<li>
							<a href="more-blank.html">Blank page</a>
						</li>
					</ul>
					<div class="close-bread">
						<a href="#"><i class="icon-remove"></i></a>
					</div>
				</div>
				--->
				<div class="row-fluid">
					<div class="span12">
						<div class="box">
							<div class="box box-color">
								<div class="box-title">
									<h3>									
										My Reporting Units
									</h3>

									<ul class="tabs">
										<li class="active">
											<a href="#t1" data-toggle="tab">Academic Units</a>
										</li>
										<li>
											<a href="#t2" data-toggle="tab">Administrative/Support Units</a>
										</li>
										
									</ul>

								</div>

							<div class="box-content">
								<div class="tab-content">
									
									<span class="help-block">The reporting units available to you are listed below</span>
									
									<div class="tab-pane active" id="t1">
										<div class="box box-color box-bordered green">
											<div class="box-title">
												<h3>
													<i class="icon-reorder"></i>
													Academic Units
												</h3>
											</div>
								<div class="box-content nopadding">
										<div class="tabs-container">
											<ul class="tabs tabs-inline tabs-left">
												<li class='active'>
													<a href="#first" data-toggle='tab'> Arts & Letters</a>
												</li>
												<li>
													<a href="#second" data-toggle='tab'> Business</a>
												</li>
												<li>
													<a href="#thirds" data-toggle='tab'> Social</a>
												</li>
											</ul>
										</div>
										<div class="tab-content padding tab-content-inline">
											<div class="tab-pane active" id="first">
												<div class="accordion" id="accordion3">
													<!---
													<div class="accordion-group">
														<div class="accordion-heading">
															<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion3" href="#collapseOne2">
																Anim pariatur cliche...Lorem  ???
															</a>
														</div>
														<div id="collapseOne2" class="accordion-body collapse in">
															<div class="accordion-inner">
																Anim pariatur cliche...Lorem ipsum dolore dolor occaecat dolore elit deserunt incididunt ex sed nostrud aute aliquip ut elit sed nisi. 
															</div>
														</div>
													</div>
													--->
													<div class="accordion-group">
														<div class="accordion-heading">
																<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion3" href="#collapseTwo2">
																	Anthropology
																</a>																
														</div>

																												
														<div id="collapseTwo2" class="accordion-body collapse">
															<div class="accordion-inner">
																<div class="span4"> 
																	<p><a href="index.cfm?event=showAssessmentPlanList">BA Anthropology</a></p>
																    <p><a href="##">MA and MAT Anthroplogy</a></p>					    
																</div>
																
																<div class="span4">
																	<div class="pull-right">
																		<a href="#">Dept. level reporting</a>
																	</div>
																</div>																
															</div>
														</div>
													
													</div>


													<div class="accordion-group">
														<div class="accordion-heading">
															<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion3" href="#collapseThree2">
																English
															</a>
														</div>
														<div id="collapseThree2" class="accordion-body collapse">
															<div class="accordion-inner">
																<div class="span4">
																	<p><a href="##">BA English</a></p>
																	<p><a href="##">MA English</a></p>
																	<p><a href="##">MAT English</a></p>
																</div>

																<div class="span4">
																	<div class="pull-right">
																		<a href="#">Dept. level reporting</a>
																	</div>
																</div>			
															</div>
														</div>
													</div>
													<div class="accordion-group">
														<div class="accordion-heading">
															<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion3" href="#collapseFour2">
																History
															</a>
														</div>
														<div id="collapseFour2" class="accordion-body collapse">
															<div class="accordion-inner">
																<p><a href="##">BA History</a></p>
																<p><a href="##">MA History</a></p>
															</div>
														</div>
													</div>
												</div>
											</div>
											<div class="tab-pane" id="second">
												<div class="accordion" id="accordion4">
													<div class="accordion-group">
														<div class="accordion-heading">
															<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion4" href="#collapseOne3">
																Anim pariatur cliche...Lorem  ???
															</a>
														</div>
														<div id="collapseOne3" class="accordion-body collapse in">
															<div class="accordion-inner">
																Anim pariatur cliche...Lorem ipsum dolore dolor occaecat dolore elit deserunt incididunt ex sed nostrud aute aliquip ut elit sed nisi. 
															</div>
														</div>
													</div>
													<div class="accordion-group">
														<div class="accordion-heading">
															<a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion4" href="#collapseTwo3">
																Sed laboris ut adipisicing ut et aute occaecat aute enim occaecat?
															</a>
														</div>
														<div id="collapseTwo3" class="accordion-body collapse">
															<div class="accordion-inner">
																Anim pariatur cliche...Lorem ipsum Duis occaecat Excepteur est magna tempor ex ea enim sunt mollit proident. Lorem ipsum sed laboris ut adipisicing ut et aute occaecat aute enim occaecat. 
															</div>
														</div>
													</div>
												</div>
											</div>
											<div class="tab-pane" id="thirds">
												<div class="accordion" id="accordion5">
													<div class="accordion-group">
														<div class="accordion-heading">
															<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion5" href="#collapseOne4">
																Lorem ipsum dolor sit amet, consectetur adipisicing?
															</a>
														</div>
														<div id="collapseOne4" class="accordion-body collapse in">
															<div class="accordion-inner">
																Anim pariatur cliche...Lorem ipsum dolore dolor occaecat dolore elit deserunt incididunt ex sed nostrud aute aliquip ut elit sed nisi. 
															</div>
														</div>
													</div>
												</div>
											</div>
									</div>
								</div>
							</div>
									</div>
									<div class="tab-pane" id="t2"><!--- begin #t2 --->
										<div class="box box-bordered box-color orange">
											<div class="box-title">
												<h3>
													<i class="icon-reorder"></i>
													Administrative/Support Units
												</h3>
											</div>
											<div class="box-content nopadding">
												<div class="tabs-container">
													<ul class="tabs tabs-inline tabs-left">
														<li class='active'>
															<a href="#supportfirst" data-toggle='tab'> Academic Affairs</a>
														</li>
														<li>
															<a href="#supportsecond" data-toggle='tab'> Comm. Engagement</a>
														</li>
														
													</ul>
												</div>
												<div class="tab-content padding tab-content-inline" >
													<div class="tab-pane active" id="supportfirst">
														<div class="accordion" id="supportaccordion3">
															<div class="accordion-group">
																<div class="accordion-heading">
																	<a class="accordion-toggle" data-toggle="collapse" data-parent="#supportaccordion3" href="#collapse22">
																		Undergraduate Studies
																	</a>
																</div>
																<div id="collapse22" class="accordion-body collapse in">
																	<div class="accordion-inner">
																		<p><a href="#">Test 1</a></p>
																		<p><a href="#">Test 2</a></p>
																	</div>
																</div>
															</div>
															<div class="accordion-group">
																<div class="accordion-heading">
																	<a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#supportaccordion3" href="#collapseThree3">
																		University Libraries
																	</a>
																</div>
																<div id="collapseThree3" class="accordion-body collapse">
																	<div class="accordion-inner">
																			<p><a href="#">Test 1</a></p>
																			<p><a href="#">Test 2</a></p>
																	</div>
																</div>
															</div>
															<div class="accordion-group">
																<div class="accordion-heading">
																	<a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#supportaccordion3" href="#collapseFour4">
																		Question #3 Culpa Adiposisisng?
																	</a>
																</div>
																<div id="collapseFour4" class="accordion-body collapse">
																	<div class="accordion-inner">
																		Anim pariatur cliche...Lorem ipsum do culpa adipisicing quis non nisi ullamco. Lorem ipsum velit dolore qui Excepteur fugiat et dolor proident reprehenderit magna aliqua enim consectetur nisi. Lorem ipsum sit laborum est magna veniam ex ut velit do aliqua amet dolore enim minim eu. Lorem ipsum adipisicing officia occaecat deserunt enim minim veniam sint amet sed consectetur nisi quis. 
																	</div>
																</div>
															</div>
														</div>
													</div>
													<div class="tab-pane" id="supportsecond">
														<div class="accordion" id="supportaccordion4">
															<div class="accordion-group">
																<div class="accordion-heading">
																	<a class="accordion-toggle" data-toggle="collapse" data-parent="#supportaccordion4" href="#collapseFive5">
																		Advancement/Development
																	</a>
																</div>
																<div id="collapseFive5" class="accordion-body collapse in">
																	<div class="accordion-inner">
																		<p><a href="#">Test 1</a></p>
																		<p><a href="#">Test 2</a></p>
																	</div>
																</div>
															</div>
															<div class="accordion-group">
																<div class="accordion-heading">
																	<a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#supportaccordion4" href="#collapseSix6">
																		Creative Services & Marketing
																	</a>
																</div>
																<div id="collapseSix6" class="accordion-body collapse">
																	<div class="accordion-inner">
																		Anim pariatur cliche...Lorem ipsum Duis occaecat Excepteur est magna tempor ex ea enim sunt mollit proident. Lorem ipsum sed laboris ut adipisicing ut et aute occaecat aute enim occaecat. 
																	</div>
																</div>
															</div>
														</div>
													</div>
													
												</div>
											</div>
										</div>
									</div><!--- end of #t2 --->
						</div>
					</div>
				</div>
			</div>
		</div></div>

