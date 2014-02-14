<cfscript>
		qReportGrid = request.event.getArg('qReportGrid');
</cfscript>

<!--- 
<cfdump var="#qReportGrid#" abort="true" />
--->

<div class="box-content nopadding">
		<table class="table table-hover table-nomargin">
		<cfif qReportGrid.recordcount>
				<thead>
					<tr>
						<th>Plan Type</th>
						<th>Enter new plan</th>
						<th>Plan Submitted for Review</th>
						<th>Revise plan</th>
						<th>Collect data</th>
						<th>Enter report of results</th>
						<th>Report of results submitted for review</th>
						<th>Revise report of results</th>
						<th>Report Approved</th>
						
					</tr>
				</thead>
				<tbody>
					<cfoutput query="qReportGrid" group="plantypedescription">
							<tr>	
								<td>#qReportGrid.plantypedescription#</td>	
								
									<cfoutput group="workflowstep">	
										<td class="count">
											<cfif qReportGrid.cnt gt 0>
												<div class="showReportList" data-status="#qReportGrid.workflowstep#" data-type="#qReportGrid.plantype#">
													<strong>#qReportGrid.cnt#</strong>
												</div>
											<cfelse>
												#qReportGrid.cnt#
											</cfif>
											
										</td>

									</cfoutput>
							
							</tr>	
						
					</cfoutput>
				
				</tbody>
			<cfelse>
				<thead>
					<tr colspan="6">
						<div class="alert alert-error text-center">
						 <b><cfoutput>#qReportGrid.recordcount#</cfoutput> records found.</b><br> Please revise your search criteria!
						</div>
					</tr>
				</thead>
			</cfif>

			
		</table>

	<script type="text/javascript">
	$(function() {

		$(".showReportList").click(function(e) {
					e.preventDefault();
					//alert('BOOYAH');
					//alert($(this).data("item"));

				var superdivID   = $('#superdivisionID').val();
				var divisionID   = $('#divisionID').val();
				var departmentID = $("#departmentID").val();
				var planperiod   = $("#planperiod").val();
				var plantype     = $(this).data("type");
				var programdegreelevel = $("#programdegreelevel").val();
				var planstatus    = $(this).data("status");

				var postString = "index.cfm?event=getPlanGrid&";

				//alert( postString );

				jQuery.post(
					postString,
					{
						superdivisionID: $('#superdivisionID').val(),
						divisionID: $('#divisionID').val(),
						departmentID:$('#departmentID').val(),
						planperiod:$('#planperiod').val(),
						plantype:$(this).data("type"),
						programdegreelevel:$("#programdegreelevel").val(),
						planstatus:$(this).data("status")
					},
					//callback function
					function(data){
						//$('#grid').removeClass('hidden');
						//alert(data);
						//var content = $(data).find('#content');
						$('#grid').empty().append(data);
					}
				)


					

		});//end of button click

	});
	</script>