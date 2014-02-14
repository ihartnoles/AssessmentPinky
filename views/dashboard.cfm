<cfscript>
	qSchools = request.event.getArg('qSchools');	
</cfscript>

<div id="pjax">
		<div id="wrapper" data-adminica-nav-top="1" data-adminica-side-top="1">
					<div id="sidebar" class="sidebar pjax_links">
	<div class="cog">+</div>

	
	<a href="index.php" class="logo"><span>FAU</span></a>
	

	<div class="user_box dark_box clearfix">
		<img src="images/interface/profile.jpg" width="55" alt="Profile Pic" />
		<h2>Administrator</h2>
		<h3><a href="##">John Smith</a></h3>
		<ul>
			<!---
			<li><a href="##">settings</a><span class="divider">|</span></li>
			--->
			<li><a href="index.cfm?event=showLoginForm" class="pjax">Logout</a></li>
		</ul>
	</div><!--- ##user_box --->

	<ul class="side_accordion" id="nav_side"> <!-- add class 'open_multiple' to change to from accordion to toggles -->
		
		<!---
		<li><a href="##" class="dialog_button" data-dialog="dialog_welcome"><img src="images/icons/small/grey/speech_bubble.png"/>Adminica</a></li>
		--->
		<!---
		<li><a href="empty.php" class="pjax"><img src="images/icons/small/grey/document.png"/>Empty</a></li>
		--->
		
		<li><a href="##"><img src="images/icons/small/grey/mail.png"/>Mailbox<div class="alert badge alert_red">5</div></a>
			<ul class="drawer">
				<li><a href="##">Inbox</a></li>
				<li><a href="##">Sent Items</a></li>
				<li><a href="##">Drafts<div class="alert badge alert_grey">2</div></a></li>
				<li><a href="##">Trash<div class="alert badge alert_grey">3</div></a></li>
			</ul>
		</li>
		<li><a href="##"><img src="images/icons/small/grey/documents.png"/>Documents<div class="alert badge alert_black">2</div></a>
			<ul class="drawer">
				<li><a href="files.php" class="pjax">View All</a></li>
				<li><a href="files.php" class="pjax">Upload/Download<div class="alert badge alert_grey">2</div></a></li>
			</ul>
		</li>
		<li><a href="##"><img src="images/icons/small/grey/users.png"/>Members</a>
			<ul class="drawer">
				<li><a href="contacts.php" class="pjax">Add New</a></li>
				<li><a href="contacts.php" class="pjax">Edit/Delete</a></li>
				<li><a href="contacts.php" class="pjax">Search Profiles</a></li>
			</ul>
		</li>
		<li><a href="http://www.google.com"><img src="images/icons/small/grey/graph.png"/>Statistics</a></li>
		<li><a href="##"><img src="images/icons/small/grey/cog_2.png"/>Settings</a>
			<ul class="drawer">
				<li><a href="##">Account</a></li>
				<li><a href="##">System</a></li>
			</ul>
		</li>
	</ul>

	<div id="search_side" class="dark_box"><form><input class="" type="text" placeholder="Search Adminica..."></form></div>

	<ul id="side_links" class="side_links" style="margin-bottom:0;">
		<li><a href="##">Home</a>
		<li><a href="##">Quick</a></li>
		<li><a href="##">Reports</a></li>
		<li><a href="index.cfm?event=showLoginForm">Logout</a></li>
	</ul>
</div><!--- ##sidebar --->
			<div id="stackbar" class="stackbar">	<div class="user_box dark_box clearfix">
		<img src="images/interface/profile.jpg" width="55" alt="Profile Pic" />
		<h2>Administrator</h2>
		<h3><a href="##">John Smith</a></h3>
		<ul>
			<li><a href="##">settings</a><span class="divider">|</span></li>
			<li><a href="login_slide.php" class="dialog_button" data-dialog="dialog_logout">Logout</a></li>
		</ul>
	</div>
	<ul class="">
		<li>
			<a href="##"><img src="images/icons/large/grey/computer_imac.png"/><span>Dashboard</span></a>
			<ul>
				<li><a href="index.php" class="pjax">Dashboard</a></li>
				<li><a href="layout.php" class="pjax">Layout</a></li>
				<li><a href="text.php" class="pjax">Typography</a></li>
				<li><a href="isolated_wizard.php" class="pjax">Isolated</a></li>
				<li><a href="logout_button.php" class="pjax">Logout</a></li>
			</ul>
		</li>
		<li>
			<a href="##"><img src="images/icons/large/grey/mail.png"/><span>Widgets</span><div class="alert badge alert_green">1</div></a>
			<ul>
				<li><a href="##">Widgets</a></li>
				<li><a href="tabs.php" class="pjax">Tabs</a></li>
				<li><a href="accordions.php" class="pjax">Accordions</a></li>
				<li><a href="wizard.php" class="pjax">Wizard</a></li>
				<li><a href="code.php" class="pjax">Code View</a></li>
				<li><a href="editor.php" class="pjax">Text Editor</a></li>
				<li><a href="dialog.php" class="pjax">Dialogs</a></li>
			</ul>
		</li>
		<li>
			<a href="##"><img src="images/icons/large/grey/users.png"/><span>Contacts</span><div class="alert badge alert_blue">2</div></a>
			<ul>
				<li><a href="##">Contacts</a></li>
				<li><a href="contacts.php" class="pjax">Profiles</a></li>
				<li><a href="contacts.php" class="pjax">Manage</a></li>
				<li><a href="##" class="dialog_button" data-dialog="dialog_register">Add</a></li>
			</ul>
		</li>
		<li>
			<a href="##"><img src="images/icons/large/grey/graph.png"/><span>Reports</span></a>
			<ul>
				<li><a href="##" class="pjax">Reports</a></li>
				<li><a href="charts.php" class="pjax">Graphs</a></li>
				<li><a href="graphs.php" class="pjax">Charts</a></li>
			</ul>
		</li>
	</ul>

</div><!--- Closing Div for Stack Nav, you can boxes under the stack before this --->

			<div id="main_container" class="main_container container_16 clearfix">
				<div id="nav_top" class="dropdown_menu clearfix round_top">
	

	<div id="mobile_nav">
		<div class="main"></div>
		<div class="side"></div>
	</div>

</div><!--- ##nav_top --->
				<div class="grid_16">
					<h2>Dashboard
						<small>- Welcome to Wizard</small>
						
					</h2>
				
					<div class="isotope_holder indented_area">
						<ul class="gallery feature_tiles clearfix">

						<cfloop query="#qSchools#">
							<cfoutput>					
								<li class="all">
									<a href="styles/theme/switcher2.php?style=../header_top.css" class="features">
										
										<span class="name sort_1">#qSchools.description#</span>
										<span class="update sort_2">0</span>
									</a>
								</li>			
							</cfoutput>
						</cfloop>
					</div>					
				</div>

		 <!--- loadingOverlay --->
	     <cfinclude template="../../Wizard/views/loadingOverlay.cfm">

				<!---
				<div class="box grid_16 tabs">
					<ul class="tab_header clearfix">
						<li><a href="##tabs-1">System Stats</a></li>
						<li><a href="##tabs-2">Server Stats</a></li>
					</ul>
					<div class="controls">
						<a href="##" class="grabber"></a>
						<a href="##" class="toggle"></a>
						<a href="##" class="show_all_tabs"></a>
					</div>
					<div class="toggle_container">
						<div id="tabs-1" class="block lines">
							<div class="columns">
								<div class="col_20 no_border_top">
									<div class="info_box">
										<div class="value_tag"><span>+453 today</span></div>
										<div class="split one">
											<div class="chart">
												<span class="spark_bar large random_number_5"></span>
											</div>
										</div>
										<label>Leads per hour</label>
									</div>
								</div>
								<div class="col_20 no_border_top">
									<div class="info_box">
										<div class="value_tag"><span>estimated</span></div>
										<div class="split one">
											<div class="chart">
												<span class="spark_line large random_number_5"></span>
											</div>
										</div>
										<label>Daily Hits</label>
									</div>
								</div>
								<div class="col_20 no_border_top">
									<div class="info_box">
										<div class="split one">
											<div class="big_letter green">Good</div>
										</div>
										<label>Remote Status</label>
									</div>
								</div>
								<div class="col_20 no_border_top">
									<div class="info_box">
										<div class="split one">
											<div class="chart">
												<span class="spark_pie large random_number_3">
												26, 74, 105</span>
											</div>
										</div>
										<label>Resources</label>
									</div>
								</div>
								<div class="col_20 no_border_top no_border_right">
									<div class="info_box">
										<div class="split two">3,122 <small>ext</small></div>
										<div class="split two red">253 <small>int</small></div>
										<label>Connections</label>
									</div>
								</div>
							</div>
						</div>
						<div id="tabs-2" class="block lines ui-tabs-hide">
							<div class="columns">
								<div class="col_20 no_border_top">
									<div class="info_box">
										<div class="value_tag"><span>+453 today</span></div>
										<div class="split one">
											<div class="chart">
												<span class="spark_bar large random_number_5"></span>
											</div>
										</div>
										<label>Leads per hour<div class="comment icon_small chat_black"><a href="##"></a></div></label>
									</div>
								</div>
								<div class="col_20 no_border_top">
									<div class="info_box">
										<div class="value_tag"><span>estimated</span></div>
										<div class="split one">
											<div class="chart">
												<span class="spark_line large random_number_5"></span>
											</div>
										</div>
										<label>Daily Hits</label>
									</div>
								</div>
								<div class="col_20 no_border_top">
									<div class="info_box">
										<div class="split one">
											<div class="big_letter yellow">Fair</div>
										</div>
										<label>Remote Status</label>
									</div>
								</div>
								<div class="col_20 no_border_top">
									<div class="info_box">
										<div class="split one">
											<div class="chart">
												<span class="spark_pie large random_number_3">
												26, 74, 105</span>
											</div>
										</div>
										<label>Resources</label>
									</div>
								</div>
								<div class="col_20 no_border_top no_border_right">
									<div class="info_box">
										<div class="split two">3,122 <small>ext</small></div>
										<div class="split two red">253 <small>int</small></div>
										<label>Connections</label>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			--->
			<!---
			<div class="main_container glass clearfix">
				<div style="padding:0;">
					<div class="columns lines">
						<div class="col_20 no_border_top">
							<div class="info_box">
								<div class="split one">
									<a href="##"><img src="images/icons/large/white/alert.png" width="36" height="36" /></a>
								</div>
								<label>View Alerts</label>
							</div>
						</div>
						<div class="col_20 no_border_top">
							<div class="info_box">
								<div class="split three green">US</div>
								<div class="split three orange">Asia</div>
								<div class="split three red">Europe</div>
								<label>Global</label>
							</div>
						</div>
						<div class="col_20 no_border_top">
							<div class="info_box">
								<div class="split one"><span class="spark_bar large random_number_5">0,5,1,4,2,3</span></div>
								<label>Trends</label>
							</div>
						</div>
						<div class="col_20 no_border_top">
							<div class="info_box">
								<div class="split one">
									<div class="big_letter red">30%</div>
								</div>
								<label>Server Health</label>
							</div>
						</div>
						<div class="col_20 no_border_right no_border_top">
							<div class="info_box">
								<div class="split one">
									<div class="chart">
										<span class="spark_bar large random_number_5">0,5,1,4,2,3</span>
									</div>
								</div>
								<label>User Stats</label>
							</div>
						</div>
					</div>
				</div>
			</div>
			--->
			<!---
			<div class="main_container container_16 clearfix">
				<div class="box grid_8 tabs">
					<ul class="tab_header clearfix">
						<li><a href="##tabs-1">Quicklinks</a></li>
						<li><a href="##tabs-2">Content</a></li>
					</ul>
					<div class="controls">
						<a href="##" class="grabber"></a>
						<a href="##" class="toggle"></a>
						<a href="##" class="show_all_tabs"></a>
					</div>
					<div class="toggle_container">
						<div id="tabs-1" class="block">
							<ul class="flat medium">
								<li><span class="spark_bar small random_number_5 spark_inline"></span> Aenean tempor ullamcorper</li>
								<li><span class="spark_line small random_number_5 spark_inline"></span>Rutrum commodo, vehicula tempus</li>
								<li><span class="spark_bar small random_number_5 spark_inline"></span><a href="##">Curabitur nec arcu</a></li>
								<li><span class="spark_bar small random_number_5 spark_inline"></span> Aenean tempor ullamcorper</li>
								<li><span class="spark_line small random_number_5 spark_inline"></span>Rutrum commodo, vehicula tempus</li>
								<li><span class="spark_line small random_number_5 spark_inline"></span>Rutrum commodo, vehicula tempus</li>
							</ul>
						</div>
						<div id="tabs-2" class="block">
							<div class="section">
								<h1>Primary Heading</h1>
								<p>Lorem Ipsum is simply dummy text of the <a href="##" title="This is a tooltip">printing industry</a>. Lorem Ipsum has been the industry’s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</p>
								<h2>Secondary Heading</h2>
								<p>Lorem Ipsum is simply dummy text of the printing industry. Lorem Ipsum has been the industry’s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</p>
							</div>
						</div>
					</div>
				</div>
				<div class="box grid_8">
					<div class="block compressed">
						<form class="validate_form">
						<fieldset class="label_side top">
							<label>Support Issue</label>
							<div>
								<input type="text">
							</div>
						</fieldset>
						<fieldset class="label_side">
							<label>Description</label>
							<div>
								<textarea style="height:79px;" placeholder="Please provide as much information as possible"></textarea>
							</div>
						</fieldset>
						<fieldset class="label_side">
							<label>Priority</label>
							<div>
								<div class="jqui_radios">
									<input type="radio" name="answer5" id="yes5"/><label for="yes5">Regular</label>
									<input type="radio" name="answer5" id="no5"/><label for="no5">Urgent</label>																												</div>
							</div>
						</fieldset>
						<div class="button_bar clearfix">
							<button class="small dark" type="submit">
								<img src="images/icons/small/white/speech_bubble.png">
								<span>Contact</span>
							</button>
							<button class="small light send_right" type="reset">
								<div class="ui-icon ui-icon-circle-close"></div>
								<span>Cancel</span>
							</button>
						</div>
						</form>
					</div>
				</div>
				<div class="box grid_16">
					<ul class="block content_accordion ">
						<li>
							<h3 class="bar">Adminica Description</h3>
							<div class="content">
								<div class="columns">
									<div class="col_50">
										<p class="section"><strong>Adminica</strong> is a cleanly coded, beautifully styled, easily customisable, cross-browser compatible <strong>Admin Template</strong> and <strong>Web Application Interface</strong>.</p>
									</div>
									<div class="col_50">
										<p class="section"><strong>Adminica</strong> is packed full of features, allowing you <strong>unlimited combinations</strong> of layouts, controls and styles to ensure you have a trully unique app. </p>
									</div>
								</div>
							</div>
						</li>
					</ul>
				</div>
			</div>
		--->
		

	<!---
   <div class="main_container container_16 clearfix">
			<div class="grid_16">
					<div class="isotope_holder indented_area">
						<ul class="gallery feature_tiles clearfix">

						<cfloop query="##qSchools##">
							<cfoutput>					
								<li class="all">
									<a href="styles/theme/switcher2.php?style=../header_top.css" class="features">
										
										<span class="name sort_1">##qSchools.description##</span>
										<span class="update sort_2">0</span>
									</a>
								</li>			
							</cfoutput>
						</cfloop>


	<li class="cool">
		<a href="styles/theme/switcher2.php?style=switcher.css" class="features">
				<img src="images/icons/large/grey/frames.png">
				<span class="name sort_1">Side Nav</span>
			<span class="update sort_2">0</span>
		<div class="starred"></div>
		</a>
	</li>

	<li class="new">
		<a href="styles/theme/switcher2.php?style=../header_slideout.css" class="features">
			<img src="images/icons/large/grey/go_back_from_screen_top.png">
			<span class="name sort_1">Slide Nav</span>
			<span class="update sort_2">1</span>
		<div class="starred blue"></div>
		</a>
	</li>

	<li class="all">
		<a href="styles/theme/switcher2.php?style=../header_top.css" class="features">
			<img src="images/icons/large/grey/go_back_from_screen.png">
			<span class="name sort_1">Full Width</span>
			<span class="update sort_2">0</span>
		</a>
	</li>							
		
	<li class="all">
		<a href="layout.php" class="features">
			<img src="images/icons/large/grey/expose.png">
			<span class="name sort_1">Drag, Sort & Toggle</span>
			<span class="update sort_2">0</span>
		</a>
	</li>
				
	<li class="new">
		<a href="charts.php" class="features">
			<img src="images/icons/large/grey/chart_8.png">
			<span class="name sort_1">Graphs & Charts</span>
			<span class="update sort_2">2</span>
		<div class="starred green"></div></a>
	</li>
		
	<li class="new">
		<a href="calendar.php" class="features">
			<img src="images/icons/large/grey/alarm_bell.png">
			<span class="name sort_1">Events Calendar</span>
			<span class="update sort_2">2</span>
		<div class="starred green"></div></a>
	</li>
	
	<li class="new">
		<a href="wizard.php" class="features">
			<img src="images/icons/large/grey/power.png">
			<span class="name sort_1">Step by Step Wizard</span>
			<span class="update sort_2">2</span>
		<div class="starred green"></div></a>
	</li>
							
	<li class="new">
		<a href="tables_static.php" class="features">
			<img src="images/icons/large/grey/table.png">
			<span class="name sort_1">Table Styles</span>
			<span class="update sort_2">2</span>
		<div class="starred green"></div></a>
	</li>
				
	<li class="cool">
		<a href="accordions.php" class="features">
			<img src="images/icons/large/grey/list.png">
			<span class="name sort_1">Sortable Accordions</span>
			<span class="update sort_2">0</span>
		<div class="starred"></div></a>
	</li>
		
	<li class="cool">
		<a href="styles/theme/switcher1.php?style=switcher.css" class="features">
			<img src="images/icons/large/grey/monitor.png">
			<span class="name sort_1">Fluid Width</span>
			<span class="update sort_2">0</span>
		<div class="starred"></div>
		</a>
	</li>

	<li class="cool">
		<a href="styles/theme/switcher1.php?style=../layout_fixed.css" class="features">
			<img src="images/icons/large/grey/go_full_screen.png">
			<span class="name sort_1">Fixed Width</span>
			<span class="update sort_2">0</span>
		<div class="starred"></div>
		</a>
	</li>
	<li class="all">
		<a href="##" class="features">
			<img src="images/icons/large/grey/map.png">
			<span class="name sort_1">Unique Navigation</span>
			<span class="update sort_2">0</span>
		</a>
	</li>
		
	<li class="cool">
		<a href="styles/theme/switcher1.php?style=switcher.css" class="features">
			<img src="images/icons/large/grey/iphone_4.png">
			<span class="name sort_1">iOS/Android Ready</span>
			<span class="update sort_2">0</span>
		<div class="starred"></div></a>
	</li>
		
	<li class="cool">
		<a href="##" class="features">
			<img src="images/icons/large/grey/paint_brush.png">
			<span class="name sort_1">14 Themes</span>
			<span class="update sort_2">0</span>
		<div class="starred"></div></a>
	</li>

	<li class="new">
		<a href="##" class="features">
			<img src="images/icons/large/grey/repeat.png">
			<span class="name sort_1">Theme Switcher</span>
			<span class="update sort_2">1</span>
		<div class="starred blue"></div>
		</a>
	</li>
		
	<li class="cool">
		<a href="contacts.php" class="features">
			<img src="images/icons/large/grey/coverflow.png">
			<span class="name sort_1">Unique Slider Lists</span>
			<span class="update sort_2">0</span>
		<div class="starred"></div></a>
	</li>
		
	<li class="all">
		<a href="buttons.php" class="features">
			<img src="images/icons/large/grey/chemical.png">
			<span class="name sort_1">400+ Icons</span>
			<span class="update sort_2">0</span>
		</a>
	</li>
		
	<li class="all">
		<a href="code.php" class="features">
			<img src="images/icons/large/grey/pencil.png">
			<span class="name sort_1">Syntax Highlighting</span>
			<span class="update sort_2">0</span>
		</a>
	</li>
		
	<li class="cool">
		<a href="buttons.php" class="features">
			<img src="images/icons/large/grey/record.png">
			<span class="name sort_1">290+ CSS3 Buttons</span>
			<span class="update sort_2">0</span>
		<div class="starred"></div></a>
	</li>
		
	<li class="all">
		<a href="forms.php" class="features">
			<img src="images/icons/large/grey/create_write.png">
			<span class="name sort_1">Fully Styled Forms</span>
			<span class="update sort_2">0</span>
		</a>
	</li>
		
	<li class="all">
		<a href="forms.php##date_picker_anchor" class="features">
			<img src="images/icons/large/grey/day_calendar.png">
			<span class="name sort_1">Date Picker</span>
			<span class="update sort_2">0</span>
		</a>
	</li>

	<li class="new">
		<a href="forms.php##alerts_anchor" class="features">
			<img src="images/icons/large/grey/alert.png">
			<span class="name sort_1">Alert Boxes</span>
			<span class="update sort_2">1</span>
		<div class="starred blue"></div>
		</a>
	</li>
		
	<li class="all">
		<a href="layout.php" class="features">
			<img src="images/icons/large/grey/blocks_images.png">
			<span class="name sort_1">960.gs Framework</span>
			<span class="update sort_2">0</span>
		</a>
	</li>
	
	<li class="all">
		<a href="text.php" class="features">
			<img src="images/icons/large/grey/fountain_pen.png">
			<span class="name sort_1">Typography & Text</span>
			<span class="update sort_2">0</span>
		</a>
	</li>
	
	<li class="all">
		<a href="editor.php" class="features">
			<img src="images/icons/large/grey/word_document.png">
			<span class="name sort_1">Rich Text Editor</span>
			<span class="update sort_2">0</span>
		</a>
	</li>
	
	<li class="cool">
		<a href="gallery.php" class="features">
			<img src="images/icons/large/grey/images.png">
			<span class="name sort_1">Sortable Gallery</span>
			<span class="update sort_2">0</span>
		<div class="starred"></div>
		</a>
	</li>
	
	<li class="cool">
		<a href="gallery.php" class="features">
			<img src="images/icons/large/grey/image_2.png">
			<span class="name sort_1">Fancybox Viewer</span>
			<span class="update sort_2">0</span>
		<div class="starred"></div>
		</a>
	</li>
	
	<li class="cool">
		<a href="tables.php" class="features">
			<img src="images/icons/large/grey/table.png">
			<span class="name sort_1">Dynamic Tables</span>
			<span class="update sort_2">0</span>
		<div class="starred"></div>
		</a>
	</li>
	
	<li class="cool">
		<a href="files.php" class="features">
			<img src="images/icons/large/grey/file_cabinet.png">
			<span class="name sort_1">File Browser</span>
			<span class="update sort_2">0</span>
		<div class="starred"></div>
		</a>
	</li>
	
	<li class="all">
		<a href="login.php" class="features">
			<img src="images/icons/large/grey/locked_2.png">
			<span class="name sort_1">Login Box</span>
			<span class="update sort_2">0</span>
		</a>
	</li>
	
	<li class="all">
		<a href="##" class="features">
			<img src="images/icons/large/grey/shuffle.png">
			<span class="name sort_1">CSS3 enhanced</span>
			<span class="update sort_2">0</span>
		</a>
	</li>
	
	<li class="all">
		<a href="##" class="features">
			<img src="images/icons/large/grey/chrome.png">
			<span class="name sort_1">Cross Browser (IE7+)</span>
			<span class="update sort_2">0</span>
		</a>
	</li>

	<li class="new">
		<a href="##" class="features" onclick="$('##toTop').trigger('click');">
			<img src="images/icons/large/grey/bended_arrow_up.png">
			<span class="name sort_1">Scroll Top</span>
			<span class="update sort_2">1</span>
		<div class="starred blue"></div>
		</a>
	</li>

</ul>					</div>
				</div>
			</div>
	
				



		<!--- </div> --->