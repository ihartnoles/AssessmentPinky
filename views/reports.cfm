<cfscript>
title 			= "Reporting/Statistics";
qSuperDivisions = request.event.getArg('qSuperDivisions');
qPlanPeriods	= request.event.getArg('qPlanPeriods');
qPlanTypes		= request.event.getArg('qPlanTypes');
qPlanStatuses	= request.event.getArg('qPlanStatuses');
superdivisionID = '';
divisionID 		= '';
departmentID	= '';
planStatus      = '';
</cfscript>

<!--- 
<cfdump var="#qPlanTypes#" abort="true" />
--->

<div id="main" style="margin-left: 0px;">
				<div class="container-fluid">
					<cfinclude template="/Assessment/views/page_header.cfm">		

				<div class="row-fluid">
					<div class="box box-color">
						<div class="box-title">
							<h3>Assessment Plan Search</h3>
						</div>

						<div class="box-content">
					<form action="##" method="post" class="form">
						<div class="row-fluid">
							<div class="span3">
								<div class="control-group">
									<label class="control-group">Super-Division:</label>
										<div class="controls controls-row">					
											<select id="superdivisionID" name="superdivisionID">
												<option value="0" <cfif superdivisionid eq false>selected</cfif>>-- Choose One --</option>
												<cfloop query="qSuperDivisions">
													<cfoutput>
														<option value="#qSuperDivisions.SuperDivisionID#">#qSuperDivisions.SuperDivisionName#</option>
													</cfoutput>
												</cfloop>
											</select>
										</div>
									</div>
							</div>
							
							<div class="span3">
								<div class="control-group">
									<label class="control-group">Division:</label>
										<div class="controls controls-row">	
											<select id="divisionID" name="divisionID">
											  <option value="0"  <cfif divisionid eq false>selected</cfif>>--</option>
											</select>
										</div>
								</div>
							</div>

							<div class="span3">
								<div class="control-group">	
									<label class="control-group">Department:</label>
									<div class="controls controls-row">	
										<select id="departmentID" name="departmentID">
										  <option value="0" <cfif departmentid eq false>selected</cfif>>--</option>   
										</select>
									</div>
								</div>
							</div>
						</div>


						<div class="row-fluid">
							<div class="span3">
								<div class="control-group">
									<label class="control-group">Plan Period:</label>
									<div class="controls controls-row">
										<select id="planperiod" name="planperiod">
											<option value="">-- Choose One --</option>
											<cfloop query="qPlanPeriods">
												<cfoutput>
													<option value="#qPlanPeriods.planperiod#">#qPlanPeriods.planperiod#</option>
												</cfoutput>
											</cfloop>
										</select>
									</div>
								</div>
							</div>

							<div class="span3">
								<div class="control-group">
									<label class="control-group">Plan Type:</label>
									<div class="controls controls-row">
										<select id="plantype" name="plantype">
											<option value="">-- Choose One --</option>
											<cfloop query="qPlanTypes">
												<cfoutput>
													<option value="#qPlanTypes.plantype#">#qPlanTypes.planTypeDescription#</option>
												</cfoutput>
											</cfloop>
										</select>
									</div>
								</div>
							</div>

							<div class="span3">
								<div class="control-group">
										<label class="control-group">Degree Level:</label>
										<div class="controls controls-row">
											<select id="programdegreelevel" name="programdegreelevel">
												<option value="">-- Choose One --</option>
												<cfloop list="Bachelors,Masters,Specialist,Doctoral,Certificate,N/A" index="idx">
													<cfoutput>
														<option value="#left(idx,1)#">#idx#</option>
													</cfoutput>
												</cfloop>
												<!--- <option value="999999">All levels</option> --->
											</select>
										</div>
								</div>
							</div>

						</div>

						<!--- --->
						<div class="row-fluid">
							<div class="span3">
									<div class="control-group">
										<label class="control-group">Plan Status:</label>
											<select id="planstatus" name="planstatus">
												<option value="">-- Choose One --</option>
												<cfloop query="qPlanStatuses">
													<cfoutput>
														<option value="#qPlanStatuses.workflowstep#">#qPlanStatuses.workflowstepdescription#</option>
													</cfoutput>
												</cfloop>
											</select>							
										</div>
									</div>
							</div>	
						</div>					
					<br>

						<input type="submit" id="assBut" value="List Assessment Plans" class="btn btn-orange">
						-or-
						<input type="submit" id="assReport" value="Generate Report" class="btn btn-orange">
					<br>
					</form>
			
					<div class="row-fluid">
						<div id="grid" class="no box">
							
						</div>
					</div>

				</div>
					</div>
				</div>

				

				<hr>
<!---
				<hr>

				<div class="row-fluid">
					<div class="box box-color box-bordered">
							<div class="box-title">
								<h3>
									<i class="icon-bar-chart"></i>
									Student Learning Outcomes - BA Anthropology (2011 - 2012)
								</h3>
								<div class="actions">
									<a href="#" class="btn btn-mini content-refresh"><i class="icon-refresh"></i></a>
									<a href="#" class="btn btn-mini content-remove"><i class="icon-remove"></i></a>
									<a href="#" class="btn btn-mini content-slideUp"><i class="icon-angle-down"></i></a>
								</div>
							</div>
							<div class="box-content">
								<div id="flot-2" class='flot'></div>
							</div>
						</div>
				</div>	
				<div class="row-fluid">
					<div class="span12">
						<div class="box">
							<div class="box-title">
								<h3>
									<i class="icon-bar-chart"></i>
									Bar charts
								</h3>
							</div>
							<div class="box-content">
								<div class="btn-toolbar" style="margin-top:0;">
									<div class="btn-group stackControls">
										<input type="button" value="With stacking" class='btn'>
										<input type="button" value="Without stacking" class='btn'>
									</div>
									<div class="btn-group graphControls">
										<input type="button" value="Bars" class='btn'>
										<input type="button" value="Lines" class='btn'>
										<input type="button" value="Lines with steps" class='btn'>
									</div>
								</div>
								<div id="flot-4" class='flot'></div>
							</div>
						</div>
					</div>
				</div>
				<div class="row-fluid">
					<div class="span6">
						<div class="box">
							<div class="box-title">
								<h3>
									<i class="icon-bar-chart"></i>
									Pie with legend
								</h3>
							</div>
							<div class="box-content">
								<div id="flot-5" class='flot'></div>
							</div>
						</div>
					</div>
					<div class="span6">
						<div class="box">
							<div class="box-title">
								<h3>
									<i class="icon-bar-chart"></i>
									Pie without legend
								</h3>
							</div>
							<div class="box-content">
								<div id="flot-6" class='flot'></div>
							</div>
						</div>
					</div>
				</div>
				<div class="row-fluid">
					<div class="span6">
						<div class="box">
							<div class="box-title">
								<h3>
									<i class="icon-bar-chart"></i>
									Labels within pie
								</h3>
							</div>
							<div class="box-content">
								<div id="flot-7" class='flot'></div>
							</div>
						</div>
					</div>
					<div class="span6">
						<div class="box">
							<div class="box-title">
								<h3>
									<i class="icon-bar-chart"></i>
									Donut
								</h3>
							</div>
							<div class="box-content">
								<div id="flot-8" class='flot'></div>
							</div>
						</div>
					</div>
				</div>



					
				</div>
			</div>

			</div>
--->


<script type="text/javascript">
	$(function() {

		$("#divisionID").remoteChained("#superdivisionID", "index.cfm?event=getDivisionjson" );
		$("#departmentID").remoteChained("#superdivisionID ,#divisionID", "index.cfm?event=getDeptjson");
		//$("#engine").remoteChained("#series, #model", "index.cfm?event=json");

		
		<cfif cgi.query_string CONTAINS "redirect">
			//departmentID=1410&divisionID=14&planperiod=2011-2012&planstatus=10&plantype=&programdegreelevel=&superdivisionID=1
			
			var postString = "index.cfm?event=getPlanGrid&";


			doPost(postString);
		</cfif>
		//List Assessment Plans
		$("#assBut").click(function(e) {
			e.preventDefault();
			//alert('MAMBO JAMBO!');
			//alert( $("#superdivisionID").val() );
			//alert( $("#divisionID").val() );
			//alert( $("#departmentID").val() );

			var superdivID   = $('#superdivisionID').val();
			var divisionID   = $('#divisionID').val();
			var departmentID = $("#departmentID").val();
			var planperiod   = $("#planperiod").val();
			var plantype     = $("#plantype").val();
			var programdegreelevel = $("#programdegreelevel").val();
			var planstatus     = $("#planstatus").val();

			var postString = "index.cfm?event=getPlanGrid&";

			doPost(postString);


			});//end of button click
		
		
			//Generate Report
			$("#assReport").click(function(e) {
				e.preventDefault();
				//alert('MAMBO JAMBO!');
				//alert( $("#superdivisionID").val() );
				//alert( $("#divisionID").val() );
				//alert( $("#departmentID").val() );

				var superdivID   = $('#superdivisionID').val();
				var divisionID   = $('#divisionID').val();
				var departmentID = $("#departmentID").val();
				var planperiod   = $("#planperiod").val();
				var plantype     = $("#plantype").val();
				var programdegreelevel = $("#programdegreelevel").val();
				var planstatus     = $("#planstatus").val();

				var postString = "index.cfm?event=getReportGrid&";


				doPost(postString);
			

				});//end of button click		

			
			function doPost(posturl){
				
				jQuery.post(
					posturl,


					<cfif cgi.query_string CONTAINS "redirect">
					{
						<cfoutput>
						superdivisionID   : 0,
						divisionID   : 0,
						departmentID : 0,
						planperiod   : '#request.event.getArg('planperiod')#',
						plantype     : '#request.event.getArg('plantype')#',
						programdegreelevel : '',
						planstatus     :  #request.event.getArg('planstatus')#,
						redirect	: 1
						</cfoutput>
					},
					<cfelse>
					{
						superdivisionID: $('#superdivisionID').val(),
						divisionID: $('#divisionID').val(),
						departmentID:$('#departmentID').val(),
						planperiod:$('#planperiod').val(),
						plantype:$('#plantype').val(),
						programdegreelevel:$("#programdegreelevel").val(),
						planstatus:$('#planstatus').val()
					},
					</cfif>
					//callback function
					function(data){
						//$('#grid').removeClass('hidden');
						//alert(data);
						//var content = $(data).find('#content');
						$('#grid').empty().append(data);
					}
				)
			}

	});
</script>