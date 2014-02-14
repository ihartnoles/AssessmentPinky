<cfscript>
title = "My Dashboard";
qLearningOutcomes 	= request.event.getArg('qLearningOutcomes');
qResearchPlans		= request.event.getArg('qResearchPlans');
qAdminPlans			= request.event.getArg('qAdminPlans');
qServicePlans		= request.event.getArg('qServicePlans');
session.user.inboxcount = request.event.getArg('qInboxMessages').recordcount;
qTasks					= request.event.getArg('qTasks');
</cfscript>

<!---
<cfdump var="#cookie#" label="cookie" />
<cfdump var="#session#" label="session - z" />
 --->

	<div id="new-task" class="modal hide" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true"> x </button>
			<h3 id="myModalLabel">Add new task</h3>
		</div>
		<form action="##" class='new-task-form form-horizontal form-bordered'>
			<div class="modal-body nopadding">
				
				<div class="control-group">
					<label for="task-name" class="control-label">Task</label>
					<div class="controls">
						<input type="text" name="task-name" id="task-name" class="input-xlarge">
					</div>
				</div>
				
			</div>
			<div class="modal-footer">
				<input type="submit" class="btn btn-primary" value="Add task">
			</div>
		</form>

	</div>
		
	<div class="container-fluid" id="content">
		<div id="left nav_hidden"  style="display: none;">
			<form action="search-results.html" method="GET" class='search-form'>
				<div class="search-pane">
					<input type="text" name="search" placeholder="Search here...">
					<button type="submit"><i class="icon-search"></i></button>
				</div>
			</form>
			
			
			
			<div class="subnav subnav-hidden">
				<div class="subnav-title">
					<a href="#" class='toggle-subnav'><i class="icon-angle-right"></i><span>Default hidden</span></a>
				</div>
				<ul class="subnav-menu">
					<li>
						<a href="#">Menu</a>
					</li>
					<li class='dropdown'>
						<a href="#" data-toggle="dropdown">With submenu</a>
						<ul class="dropdown-menu">
							<li>
								<a href="#">Action #1</a>
							</li>
							<li>
								<a href="#">Antoher Link</a>
							</li>
							<li class='dropdown-submenu'>
								<a href="#" data-toggle="dropdown" class='dropdown-toggle'>More stuff</a>
								<ul class="dropdown-menu">
									<li>
										<a href="#">This is level 3</a>
									</li>
									<li>
										<a href="#">Easy to use</a>
									</li>
								</ul>
							</li>
						</ul>
					</li>
					<li>
						<a href="#">Security settings</a>
					</li>
				</ul>
			</div>
		</div>
		<div id="main" style="margin-left: 0px;">
			<div class="container-fluid">
				
				<div class="page-header">
					<div class="pull-left">
						<cfoutput>
							<h1>#title#</h1>
						</cfoutput>						
					</div>
					<div class="pull-right">
						
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
				
				<cfif len(trim(request.event.getArg('message')))>					
					<div class="row-fluid text-center">
						<div class="span12 alert alert-error text-center">
							<cfoutput>#message#</cfoutput>
							<button class="close" data-dismiss="alert" type="button"> x </button>
						</div>
					</div>
				</cfif>


				<div class="row-fluid">
					<div class="span12">
						<div class="box box-color">
							<div class="box-title">
								<h3>
									Quick Links    

								</h3>
								<div class="actions">
									<a href="##" class='btn' rel="popover" data-trigger="hover" title="" data-placement="left" data-content="These are your quick links. You can click on a tile to quickly access a specific area in the system." ><i class=" icon-question-sign"></i> Help</a>
								</div>

							</div>
							<div class="box-content">
								<ul class="tiles tiles-center nomargin">
									<li class="red">
										<!--- <span class="label label-info">17</span> --->
										<a href="index.cfm?event=showreportingunits" rel="tooltip" data-placement="bottom" title="View Reporting Units"><span><i class="icon-pencil"></i></span><span class='name'>Reporting Units</span></a>
									</li>
									<li class="blue">
										<!--- <span class="label label-important">444</span> --->
										<a href="index.cfm?event=reports" rel="tooltip" data-placement="bottom" title="View/Create Reports"><span><i class="icon-bar-chart"></i></span><span class='name'>Reports</span></a>
									</li>
									<li class="green">
										<!--- <span class="label label-important">444</span> --->
										<a id="calendar_button" href="#" rel="tooltip" data-placement="bottom" title="View Calendar"><span><i class="icon-calendar"></i></span><span class='name'>My Calendar</span></a>
									</li>
									<li class="orange">
										<cfif structkeyexists(session.user, "inboxcount") AND session.user.inboxcount GT 0>
											<span class="label label-inverse"><cfoutput>#session.user.inboxcount#</cfoutput></span>
										</cfif>
											
										<a href="index.cfm?event=messagecenter" rel="tooltip" data-placement="bottom" title="View/Send Messages"><span><i class="icon-envelope"></i></span><span class='name'>My Messages</span></a>
									</li>
									<li class="satblue">
										<a href="index.cfm?event=faq" rel="tooltip" data-placement="bottom" title="Frequently Asked Questions"><span><i class=" icon-question-sign"></i></span><span class='name'>F.A.Q.</span></a>
									</li>
										<li class="lightgrey">
										<a href="http://www.fau.edu/iea/assessment/resource.php" rel="tooltip" data-placement="bottom" title="Assessment Resources" target="_blank"><span><i class="icon-book" ></i></span><span class='name'>Assessment Resources</span></a>
									</li>
								</ul>								
							</div>
						</div>
					</div>
				</div>

				<!--- TASKS TEMPLATE
				<div class="row-fluid">
					<div class="span12">
						<div class="box box-color box-bordered lightgrey">
							<div class="box-title">
								<h3><i class="icon-ok"></i>My Tasks</h3>
								<div class="actions">
									<a href="#new-task" data-toggle="modal" class='btn'><i class="icon-plus-sign"></i> Add Task</a>  <a href="##" class='btn' rel="popover" data-trigger="hover" title="" data-placement="left" data-content="This is your personalized task list.  It allows you to keep track of what you need to do in the system." ><i class=" icon-question-sign"></i> Help</a>
								</div>								
							</div>
							<div class="box-content nopadding">
								<ul class="tasklist">
									<li class='bookmarked'>
										<div class="check">
											<input type="checkbox" class='icheck-me' data-skin="square" data-color="blue">
										</div>
										<span class="task"><i class="icon-ok"></i><span>Approve new users</span></span>
										<span class="task-actions">
											<a href="#" class='task-delete' rel="tooltip" title="Delete that task"><i class="icon-remove"></i></a>
											<a href="#" class='task-bookmark' rel="tooltip" title="Mark as important"><i class="icon-bookmark-empty"></i></a>
										</span>
									</li>
									<li>
										<div class="check">
											<input type="checkbox" class='icheck-me' data-skin="square" data-color="blue">
										</div>
										<span class="task"><i class="icon-bar-chart"></i><span>Check statistics</span></span>
										<span class="task-actions">
											<a href="#" class='task-delete' rel="tooltip" title="Delete that task"><i class="icon-remove"></i></a>
											<a href="#" class='task-bookmark' rel="tooltip" title="Mark as important"><i class="icon-bookmark-empty"></i></a>
										</span>
									</li>
									<li class='done'>
										<div class="check">
											<input type="checkbox" class='icheck-me' data-skin="square" data-color="blue" checked>
										</div>
										<span class="task"><i class="icon-envelope"></i><span>Check for new mails</span></span>
										<span class="task-actions">
											<a href="#" class='task-delete' rel="tooltip" title="Delete that task"><i class="icon-remove"></i></a>
											<a href="#" class='task-bookmark' rel="tooltip" title="Mark as important"><i class="icon-bookmark-empty"></i></a>
										</span>
									</li>
									<li>
										<div class="check">
											<input type="checkbox" class='icheck-me' data-skin="square" data-color="blue">
										</div>
										<span class="task"><i class="icon-comment"></i><span>Chat with John Doe</span></span>
										<span class="task-actions">
											<a href="#" class='task-delete' rel="tooltip" title="Delete that task"><i class="icon-remove"></i></a>
											<a href="#" class='task-bookmark' rel="tooltip" title="Mark as important"><i class="icon-bookmark-empty"></i></a>
										</span>
									</li>
									<li>
										<div class="check">
											<input type="checkbox" class='icheck-me' data-skin="square" data-color="blue">
										</div>
										<span class="task"><i class="icon-retweet"></i><span>Go and tweet some stuff</span></span>
										<span class="task-actions">
											<a href="#" class='task-delete' rel="tooltip" title="Delete that task"><i class="icon-remove"></i></a>
											<a href="#" class='task-bookmark' rel="tooltip" title="Mark as important"><i class="icon-bookmark-empty"></i></a>
										</span>
									</li>
									<li>
										<div class="check">
											<input type="checkbox" class='icheck-me' data-skin="square" data-color="blue">
										</div>
										<span class="task"><i class="icon-edit"></i><span>Write an article</span></span>
										<span class="task-actions">
											<a href="#" class='task-delete' rel="tooltip" title="Delete that task"><i class="icon-remove"></i></a>
											<a href="#" class='task-bookmark' rel="tooltip" title="Mark as important"><i class="icon-bookmark-empty"></i></a>
										</span>
									</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				--->

				<div class="row-fluid">
					<div class="span12">
						<div class="box box-color box-bordered lightgrey">
							<div class="box-title">
								<h3><i class="icon-ok"></i>My Tasks</h3>
								<div class="actions">
									<a href="#new-task" data-toggle="modal" class='btn'><i class="icon-plus-sign"></i> Add Task</a>  <a href="##" class='btn' rel="popover" data-trigger="hover" title="" data-placement="left" data-content="This is your personalized task list.  It allows you to keep track of what you need to do in the system." ><i class=" icon-question-sign"></i> Help</a>
								</div>								
							</div>
							<div class="box-content nopadding">
								<ul class="tasklist">
									<!---
									<li class='bookmarked'>
										<div class="check">
											<input type="checkbox" name="done"  class='icheck-me' data-skin="square" data-color="blue" >
										</div>
										<span class="task"><i class="icon-ok"></i><span>Approve new users</span></span>
										<span class="task-actions">
											<a href="#" class='task-delete' rel="tooltip" title="Delete that task"><i class="icon-remove"></i></a>
											<!--- <a href="#" class='task-bookmark' rel="tooltip" title="Mark as important"><i class="icon-bookmark-empty"></i></a> --->
										</span>
									</li>
									--->

									<cfloop query="qTasks">
										<cfoutput>
											<cfif qTasks.bookmarked eq 1 >
												<li class='bookmarked'>
											<cfelseif qTasks.done eq 1>
												<li class='bookmarked done'>
											<cfelse>
												<li class=''>
											</cfif>
												<div class="check">
													<input type="checkbox" class='icheck-me' data-skin="square" data-color="blue" data-taskid="#qTasks.taskid#">
												</div>
												<span class="task"><span>#qTasks.task_text#</span></span>
												<span class="task-actions">
													<a href="##" class='task-delete' rel="tooltip" title="Delete this task" data-taskid="#qTasks.taskid#" data-placement="left"><i class="icon-remove"></i></a>
													<!--- <a href="##" class='task-bookmark' rel="tooltip" title="Mark as important"><i class="icon-bookmark-empty"></i></a> --->
												</span>
											</li>
										</cfoutput>
									</cfloop>
									
								</ul>
							</div>
						</div>
					</div>
				</div>
	<!--- <hr> --->
				<div class="row-fluid">
					<div class="span6">
						<div class="box box-color box-bordered">
							
							<div class="box-title" id="calendar">
								<h3><i class="icon-calendar"></i>My calendar</h3>

							</div>
							
							<div class="box-content nopadding">
								 <div class="calendar"></div> 
							</div>
							
						</div>
					</div>
				
						<div class="span6">
							<div class="box box-color box-bordered">
								<div class="box-title">
									<h3>
										2013-2014 Quick Stats
									</h3>

									<div class="actions">
									<a href="##" class='btn' rel="popover" data-trigger="hover" title="" data-placement="left" data-content="These are quick statistics of the plans in the system. Click on a tile for more information in the system." ><i class=" icon-question-sign"></i> Help</a>
									</div>
								</div>
								<div class="box-content">
									<ul class="tiles tiles-center nomargin">
											
											<h4>Learning Outcome Plans (<cfoutput>#qLearningOutcomes.total#</cfoutput> total)</h4><br>

											
											<cfif qLearningOutcomes.recordcount >
												<cfoutput query="qLearningOutcomes">

												<cfset LOpercentNew 	= ((qLearningOutcomes.new / qLearningOutcomes.total) *100) />
												<cfset LOReview 		= ((qLearningOutcomes.review / qLearningOutcomes.total) *100) />
												<cfset LOreviseplan 	= ((qLearningOutcomes.reviseplan / qLearningOutcomes.total) *100) />
												<cfset LOCollect 		= ((qLearningOutcomes.collectdata / qLearningOutcomes.total) *100) />
												<cfset LOEnterResults	= ((qLearningOutcomes.enterresults / qLearningOutcomes.total) *100) />
												<cfset LOReportResults	= ((qLearningOutcomes.reportresults / qLearningOutcomes.total) *100) />
												<cfset LOReviseResults	= ((qLearningOutcomes.revisereportresults / qLearningOutcomes.total) *100) />
												<cfset LOApproved		= ((qLearningOutcomes.approved / qLearningOutcomes.total) *100) />

												<li class="lightgrey has-chart">
													<a href="index.cfm?event=reports&superdivisionID=0&divisionID=0&departmentID=0&planperiod=2013-2014&plantype=1&programdegreelevel=&planstatus=10&redirect=true"><span><div class="chart" data-percent="#left(LOpercentNew,4)#" data-color="##ffffff" data-trackcolor="##333333">#left(LOpercentNew,4)#%</div></span><span class='name'>New Plans</span></a>
												</li>
												<li class="orange has-chart">
													<a href="index.cfm?event=reports&superdivisionID=0&divisionID=0&departmentID=0&planperiod=2013-2014&plantype=1&programdegreelevel=&planstatus=20&redirect=true"><span><div class="chart" data-percent="#left(LOReview,4)#" data-color="##ffffff" data-trackcolor="##f96d6d">#left(LOReview,4)#%</div></span><span class='name'>Review</span></a>
												</li>
												<li class="lightred has-chart">
													<a href="index.cfm?event=reports&superdivisionID=0&divisionID=0&departmentID=0&planperiod=2013-2014&plantype=1&programdegreelevel=&planstatus=30&redirect=true"><span><div class="chart" data-percent="#left(LOreviseplan,4)#" data-color="##ffffff" data-trackcolor="##5facf3">#left(LOreviseplan,4)#%</div></span><span class='name'>Revise plan</span></a>
												</li>
												<li class="darkblue has-chart">
													<a href="index.cfm?event=reports&superdivisionID=0&divisionID=0&departmentID=0&planperiod=2013-2014&plantype=1&programdegreelevel=&planstatus=40&redirect=true"><span><div class="chart" data-percent="#left(LOCollect,4)#" data-color="##ffffff" data-trackcolor="##5facf3">#left(LOCollect,4)#%</div></span><span class='name'>Collect data</span></a>
												</li>
												<br>
												<li class="blue has-chart">
													<a href="index.cfm?event=reports&superdivisionID=0&divisionID=0&departmentID=0&planperiod=2013-2014&plantype=1&programdegreelevel=&planstatus=50&redirect=true"><span><div class="chart" data-percent="#left(LOEnterResults,4)#" data-color="##ffffff" data-trackcolor="##5facf3">#left(LOEnterResults,4)#%</div></span><span class='name'>Enter Report</span></a>
												</li>
												<li class="grey has-chart">
													<a href="index.cfm?event=reports&superdivisionID=0&divisionID=0&departmentID=0&planperiod=2013-2014&plantype=1&programdegreelevel=&planstatus=60&redirect=true"><span><div class="chart" data-percent="#left(LOReportResults,4)#" data-color="##ffffff" data-trackcolor="##5facf3">#left(LOReportResults,4)#%</div></span><span class='name'>Report Results</span></a>
												</li>
												<li class="lightred has-chart">
													<a href="index.cfm?event=reports&superdivisionID=0&divisionID=0&departmentID=0&planperiod=2013-2014&plantype=1&programdegreelevel=&planstatus=70&redirect=true"><span><div class="chart" data-percent="#left(LOReviseResults,4)#" data-color="##ffffff" data-trackcolor="##5facf3">#left(LOReviseResults,4)#%</div></span><span class='name'>Revise Results</span></a>
												</li>

												<li class="green has-chart">
													<a href="index.cfm?event=reports&superdivisionID=0&divisionID=0&departmentID=0&planperiod=2013-2014&plantype=1&programdegreelevel=&planstatus=80&redirect=true"><span><div class="chart" data-percent="#left(LOApproved,4)#" data-color="##ffffff" data-trackcolor="##5facf3">#left(LOApproved,4)#%</div></span><span class='name'>Approved</span></a>
												</li>

												
												</cfoutput>
											<cfelse>
												Learning Outcome Stats Currently Unavailable
											</cfif>

										
											<br><br>
											<hr>

											

											<h4>Research Plans (<cfoutput>#qResearchPlans.total#</cfoutput> total):</h4><br>

											<cfif qResearchPlans.recordcount >

												<cfoutput query="qResearchPlans">

													<cfset ResearchpercentNew 	= ((qResearchPlans.new / qResearchPlans.total) *100) />
													<cfset ResearchReview 		= ((qResearchPlans.review / qResearchPlans.total) *100) />
													<cfset Researchreviseplan 	= ((qResearchPlans.reviseplan / qResearchPlans.total) *100) />
													<cfset ResearchCollect 		= ((qResearchPlans.collectdata / qResearchPlans.total) *100) />
													<cfset ResearchEnterResults	= ((qResearchPlans.enterresults / qResearchPlans.total) *100) />
													<cfset ResearchReportResults	= ((qResearchPlans.reportresults / qResearchPlans.total) *100) />
													<cfset ResearchReviseResults	= ((qResearchPlans.revisereportresults / qResearchPlans.total) *100) />
													<cfset ResearchApproved		= ((qResearchPlans.approved / qResearchPlans.total) *100) />

													<li class="lightgrey has-chart">
														<a href="index.cfm?event=reports&superdivisionID=0&divisionID=0&departmentID=0&planperiod=2013-2014&plantype=2&programdegreelevel=&planstatus=10&redirect=true"><span><div class="chart" data-percent="#left(ResearchpercentNew,4)#" data-color="##ffffff" data-trackcolor="##333333">#left(ResearchpercentNew,4)#%</div></span><span class='name'>New Plans</span></a>
													</li>
													<li class="orange has-chart">
														<a href="index.cfm?event=reports&superdivisionID=0&divisionID=0&departmentID=0&planperiod=2013-2014&plantype=2&programdegreelevel=&planstatus=20&redirect=true"><span><div class="chart" data-percent="#left(ResearchReview,4)#" data-color="##ffffff" data-trackcolor="##f96d6d">#left(ResearchReview,4)#%</div></span><span class='name'>Review</span></a>
													</li>
													<li class="lightred has-chart">
														<a href="index.cfm?event=reports&superdivisionID=0&divisionID=0&departmentID=0&planperiod=2013-2014&plantype=2&programdegreelevel=&planstatus=30&redirect=true"><span><div class="chart" data-percent="#left(Researchreviseplan,4)#" data-color="##ffffff" data-trackcolor="##5facf3">#left(Researchreviseplan,4)#%</div></span><span class='name'>Revise plan</span></a>
													</li>
													<li class="darkblue has-chart">
														<a href="index.cfm?event=reports&superdivisionID=0&divisionID=0&departmentID=0&planperiod=2013-2014&plantype=2&programdegreelevel=&planstatus=40&redirect=true"><span><div class="chart" data-percent="#left(ResearchCollect,4)#" data-color="##ffffff" data-trackcolor="##5facf3">#left(ResearchCollect,4)#%</div></span><span class='name'>Collect data</span></a>
													</li>
													<br>
													<li class="blue has-chart">
														<a href="index.cfm?event=reports&superdivisionID=0&divisionID=0&departmentID=0&planperiod=2013-2014&plantype=2&programdegreelevel=&planstatus=50&redirect=true"><span><div class="chart" data-percent="#left(ResearchEnterResults,4)#" data-color="##ffffff" data-trackcolor="##5facf3">#left(ResearchEnterResults,4)#%</div></span><span class='name'>Enter Report</span></a>
													</li>
													<li class="grey has-chart">
														<a href="index.cfm?event=reports&superdivisionID=0&divisionID=0&departmentID=0&planperiod=2013-2014&plantype=2&programdegreelevel=&planstatus=60&redirect=true"><span><div class="chart" data-percent="#left(ResearchReportResults,4)#" data-color="##ffffff" data-trackcolor="##5facf3">#left(ResearchReportResults,4)#%</div></span><span class='name'>Report Results</span></a>
													</li>
													<li class="lightred has-chart">
														<a href="index.cfm?event=reports&superdivisionID=0&divisionID=0&departmentID=0&planperiod=2013-2014&plantype=2&programdegreelevel=&planstatus=70&redirect=true"><span><div class="chart" data-percent="#left(ResearchReviseResults,4)#" data-color="##ffffff" data-trackcolor="##5facf3">#left(ResearchReviseResults,4)#%</div></span><span class='name'>Revise Results</span></a>
													</li>

													<li class="green has-chart">
														<a href="index.cfm?event=reports&superdivisionID=0&divisionID=0&departmentID=0&planperiod=2013-2014&plantype=2&programdegreelevel=&planstatus=80&redirect=true"><span><div class="chart" data-percent="#left(ResearchApproved,4)#" data-color="##ffffff" data-trackcolor="##5facf3">#left(ResearchApproved,4)#%</div></span><span class='name'>Approved</span></a>
													</li>

												</cfoutput>		
											<cfelse>
												Research Plan Stats Currently Unavailable
											</cfif>	
											
											<br><br>
											<hr>
											
											
											<h4>Administrative Support Plans (<cfoutput>#qAdminPlans.total#</cfoutput> total):</h4><br>

											<cfif qAdminPlans.recordcount >
												<cfoutput query="qAdminPlans">

													<cfset adminpercentNew 	= ((qAdminPlans.new / qAdminPlans.total) *100) />
													<cfset adminReview 		= ((qAdminPlans.review / qAdminPlans.total) *100) />
													<cfset adminreviseplan 	= ((qAdminPlans.reviseplan / qAdminPlans.total) *100) />
													<cfset adminCollect 		= ((qAdminPlans.collectdata / qAdminPlans.total) *100) />
													<cfset adminEnterResults	= ((qAdminPlans.enterresults / qAdminPlans.total) *100) />
													<cfset adminReportResults	= ((qAdminPlans.reportresults / qAdminPlans.total) *100) />
													<cfset adminReviseResults	= ((qAdminPlans.revisereportresults / qAdminPlans.total) *100) />
													<cfset adminApproved		= ((qAdminPlans.approved / qAdminPlans.total) *100) />

													<li class="lightgrey has-chart">
														<a href="index.cfm?event=reports&superdivisionID=0&divisionID=0&departmentID=0&planperiod=2013-2014&plantype=3&programdegreelevel=&planstatus=10&redirect=true"><span><div class="chart" data-percent="#left(adminpercentNew,4)#" data-color="##ffffff" data-trackcolor="##333333">#left(adminpercentNew,4)#%</div></span><span class='name'>New Plans</span></a>
													</li>
													<li class="orange has-chart">
														<a href="index.cfm?event=reports&superdivisionID=0&divisionID=0&departmentID=0&planperiod=2013-2014&plantype=3&programdegreelevel=&planstatus=20&redirect=true"><span><div class="chart" data-percent="#left(adminReview,4)#" data-color="##ffffff" data-trackcolor="##f96d6d">#left(adminReview,4)#%</div></span><span class='name'>Review</span></a>
													</li>
													<li class="lightred has-chart">
														<a href="index.cfm?event=reports&superdivisionID=0&divisionID=0&departmentID=0&planperiod=2013-2014&plantype=3&programdegreelevel=&planstatus=30&redirect=true"><span><div class="chart" data-percent="#left(adminreviseplan,4)#" data-color="##ffffff" data-trackcolor="##5facf3">#left(adminreviseplan,4)#%</div></span><span class='name'>Revise plan</span></a>
													</li>
													<li class="darkblue has-chart">
														<a href="index.cfm?event=reports&superdivisionID=0&divisionID=0&departmentID=0&planperiod=2013-2014&plantype=3&programdegreelevel=&planstatus=40&redirect=true"><span><div class="chart" data-percent="#left(adminCollect,4)#" data-color="##ffffff" data-trackcolor="##5facf3">#left(adminCollect,4)#%</div></span><span class='name'>Collect data</span></a>
													</li>
													<br>
													<li class="blue has-chart">
														<a href="index.cfm?event=reports&superdivisionID=0&divisionID=0&departmentID=0&planperiod=2013-2014&plantype=3&programdegreelevel=&planstatus=50&redirect=true"><span><div class="chart" data-percent="#left(adminEnterResults,4)#" data-color="##ffffff" data-trackcolor="##5facf3">#left(adminEnterResults,4)#%</div></span><span class='name'>Enter Report</span></a>
													</li>
													<li class="grey has-chart">
														<a href="index.cfm?event=reports&superdivisionID=0&divisionID=0&departmentID=0&planperiod=2013-2014&plantype=3&programdegreelevel=&planstatus=60&redirect=true"><span><div class="chart" data-percent="#left(adminReportResults,4)#" data-color="##ffffff" data-trackcolor="##5facf3">#left(adminReportResults,4)#%</div></span><span class='name'>Report Results</span></a>
													</li>
													<li class="lightred has-chart">
														<a href="index.cfm?event=reports&superdivisionID=0&divisionID=0&departmentID=0&planperiod=2013-2014&plantype=3&programdegreelevel=&planstatus=70&redirect=true"><span><div class="chart" data-percent="#left(adminReviseResults,4)#" data-color="##ffffff" data-trackcolor="##5facf3">#left(adminReviseResults,4)#%</div></span><span class='name'>Revise Results</span></a>
													</li>

													<li class="green has-chart">
														<a href="index.cfm?event=reports&superdivisionID=0&divisionID=0&departmentID=0&planperiod=2013-2014&plantype=3&programdegreelevel=&planstatus=80&redirect=true"><span><div class="chart" data-percent="#left(adminApproved,4)#" data-color="##ffffff" data-trackcolor="##5facf3">#left(adminApproved,4)#%</div></span><span class='name'>Approved</span></a>
													</li>

												</cfoutput>		
											<cfelse>
												Administrative Support Stats Currently Unavailable
											</cfif>

											<br><br>
											<hr>

											
											<h4>Service Plans (<cfoutput>#qServicePlans.total#</cfoutput> total):</h4><br>

											<cfif qServicePlans.recordcount >
											<cfoutput query="qServicePlans">

												<cfset servicepercentNew 	= ((qServicePlans.new / qServicePlans.total) *100) />
												<cfset serviceReview 		= ((qServicePlans.review / qServicePlans.total) *100) />
												<cfset servicereviseplan 	= ((qServicePlans.reviseplan / qServicePlans.total) *100) />
												<cfset serviceCollect 		= ((qServicePlans.collectdata / qServicePlans.total) *100) />
												<cfset serviceEnterResults	= ((qServicePlans.enterresults / qServicePlans.total) *100) />
												<cfset serviceReportResults	= ((qServicePlans.reportresults / qServicePlans.total) *100) />
												<cfset serviceReviseResults	= ((qServicePlans.revisereportresults / qServicePlans.total) *100) />
												<cfset serviceApproved		= ((qServicePlans.approved / qServicePlans.total) *100) />

												<li class="lightgrey has-chart">
													<a href="index.cfm?event=reports&superdivisionID=0&divisionID=0&departmentID=0&planperiod=2013-2014&plantype=4&programdegreelevel=&planstatus=10&redirect=true"><span><div class="chart" data-percent="#left(servicepercentNew,4)#" data-color="##ffffff" data-trackcolor="##333333">#left(servicepercentNew,4)#%</div></span><span class='name'>New Plans</span></a>
												</li>
												<li class="orange has-chart">
													<a href="index.cfm?event=reports&superdivisionID=0&divisionID=0&departmentID=0&planperiod=2013-2014&plantype=4&programdegreelevel=&planstatus=20&redirect=true"><span><div class="chart" data-percent="#left(serviceReview,4)#" data-color="##ffffff" data-trackcolor="##f96d6d">#left(serviceReview,4)#%</div></span><span class='name'>Review</span></a>
												</li>
												<li class="lightred has-chart">
													<a href="index.cfm?event=reports&superdivisionID=0&divisionID=0&departmentID=0&planperiod=2013-2014&plantype=4&programdegreelevel=&planstatus=30&redirect=true"><span><div class="chart" data-percent="#left(servicereviseplan,4)#" data-color="##ffffff" data-trackcolor="##5facf3">#left(servicereviseplan,4)#%</div></span><span class='name'>Revise plan</span></a>
												</li>
												<li class="darkblue has-chart">
													<a href="index.cfm?event=reports&superdivisionID=0&divisionID=0&departmentID=0&planperiod=2013-2014&plantype=4&programdegreelevel=&planstatus=40&redirect=true"><span><div class="chart" data-percent="#left(serviceCollect,4)#" data-color="##ffffff" data-trackcolor="##5facf3">#left(serviceCollect,4)#%</div></span><span class='name'>Collect data</span></a>
												</li>
												<br>
												<li class="blue has-chart">
													<a href="index.cfm?event=reports&superdivisionID=0&divisionID=0&departmentID=0&planperiod=2013-2014&plantype=4&programdegreelevel=&planstatus=50&redirect=true"><span><div class="chart" data-percent="#left(serviceEnterResults,4)#" data-color="##ffffff" data-trackcolor="##5facf3">#left(serviceEnterResults,4)#%</div></span><span class='name'>Enter Report</span></a>
												</li>
												<li class="grey has-chart">
													<a href="index.cfm?event=reports&superdivisionID=0&divisionID=0&departmentID=0&planperiod=2013-2014&plantype=4&programdegreelevel=&planstatus=60&redirect=true"><span><div class="chart" data-percent="#left(serviceReportResults,4)#" data-color="##ffffff" data-trackcolor="##5facf3">#left(serviceReportResults,4)#%</div></span><span class='name'>Report Results</span></a>
												</li>
												<li class="lightred has-chart">
													<a href="index.cfm?event=reports&superdivisionID=0&divisionID=0&departmentID=0&planperiod=2013-2014&plantype=4&programdegreelevel=&planstatus=70&redirect=true"><span><div class="chart" data-percent="#left(serviceReviseResults,4)#" data-color="##ffffff" data-trackcolor="##5facf3">#left(serviceReviseResults,4)#%</div></span><span class='name'>Revise Results</span></a>
												</li>

												<li class="green has-chart">
													<a href="index.cfm?event=reports&superdivisionID=0&divisionID=0&departmentID=0&planperiod=2013-2014&plantype=4&programdegreelevel=&planstatus=80&redirect=true"><span><div class="chart" data-percent="#left(serviceApproved,4)#" data-color="##ffffff" data-trackcolor="##5facf3">#left(serviceApproved,4)#%</div></span><span class='name'>Approved</span></a>
												</li>

											</cfoutput>		
										<cfelse>
												Service Plan Stats Currently Unavailable
										</cfif>
									</ul>
								</div>
							</div>
						</div>
				
					
					
				</div>




			</div>


		</div></div>


 <script>
	$("#calendar_button").click(function (){
            //$(this).animate(function(){
                $('html, body').animate({
                    scrollTop: $("#calendar").offset().top
                     }, 2000);
            //});
        });

/*
	$(".task-delete").click(function(){
		//alert('radio retaliation!');
		$taskid  = $(this).data("taskid");
		alert('taskid ' + $taskid);

		jQuery.post(
                    "index.cfm?event=deleteTask&",
                    {
                        taskid: $taskid
                    }

                    //,callback function
                    //function(data){
                    //	alert('kool');
                    //}
        )

	});

*/

	$(".icheck-me").click(function(){
		//alert('CHECK-A');
		if ($('.icheck-me').is(':checked')) {
		   var $doneVal = 1;
		} else {
		   var $doneVal = 0;
		}

		//alert('doneVal ' + $doneVal);

		$taskid  = $(this).data("taskid");

		//alert('taskid ' + $taskid);
		
		jQuery.post(
                    "index.cfm?event=updateTask&",
                    {
                        done: $doneVal,
                        taskid: $taskid
                    }

                    //,callback function
                    //function(data){
                    //	alert('kool');
                    //}
        )
		

	});

	$(".new-task-form").submit(function(e){
    e.preventDefault();
    $("#new-task").modal("hide");
    var $form = $(this),
    $tasklist = $(".tasklist");
    var $icon = $form.find("select[name=icons]"),
    //$name = $("#task-name").val();
    $bookmark = $form.find("input[name=task-bookmarked]");
    if($("#task-name").val() != ""){
        var elementToAdd = "";

        var postString = "index.cfm?event=addTask&";

        //alert($name);

        jQuery.post(
                    "index.cfm?event=addTask&",
                    {
                        task_text: $("#task-name").val()
                       
                    },
                    //callback function
                    function(data){

                        //alert("Data Loaded: " + data);

                        var taskidVal = data;

                        ($bookmark.is(":checked")) ? elementToAdd += "<li class='bookmarked'>" : elementToAdd += "<li>";

                        
                        elementToAdd += '<div class="check"><input type="checkbox" name="done" data-taskid="'+ taskidVal +'" class="icheck-me" data-skin="square" data-color="blue"></div><span class="task"><span>' + $("#task-name").val() + '</span></span><span class="task-actions"><a href="#" class="task-delete" data-taskid="'+ taskidVal +'"  rel="tooltip" title="Delete this task"><i class="icon-remove"></i></a>';
						

	                        if($tasklist.find(".bookmarked").length > 0){
	                            if($bookmark.is(":checked")){
	                                $tasklist.find(".bookmarked").first().before(elementToAdd);
	                            } else {
	                                $tasklist.find(".bookmarked").last().after(elementToAdd);
	                            }
	                        } else {
	                            $tasklist.prepend(elementToAdd);
	                        }  

                        icheck();
                        $tasklist.find("[rel=tooltip]").tooltip();

                        $icon.select2("val", 'icon-adjust');
                        $("#task-name").val("");
                        $bookmark.prop("checked", false);


                    }
                )
    }

      


});

</script>