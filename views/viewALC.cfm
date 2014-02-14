<cfscript>
title 		 	=  "Academic Learning Compact Documents";
//qPlanTypes 		=  request.event.getArg('qPlanTypes');
//qPrimaryAuthors	=  request.event.getArg('qPrimaryAuthors');
//qPlanPeriods	=  request.event.getArg('qPlanPeriods');
qALCdocs		=  request.event.getArg('qALCdocs');
</cfscript>

<!--- 
<cfdump var="#qALCdocs#" />
--->

<div id="main" style="margin-left: 0px;">
			<div class="container-fluid">

				<cfinclude template="/Assessment/views/page_header.cfm">

				<div class="row-fluid">
					<div class="span12">
						<div class="box box-color box-bordered">
							<div class="box-title">
								<h3>
									<i class="icon-paper-clip"></i>
									<cfoutput>#title#</cfoutput>
								</h3>
							</div>
							<div class="box-content nopadding">
								<table class="table table-hover table-nomargin">
									<thead>
										<tr>
											<th>DocumentID</th>
											<th>Filename</th>
											<th class='hidden-350'>Uploaded Filename</th>
											<th class='hidden-1024'>Uploaded by</th>
											<th class='hidden-480'>Date Uploaded</th>
											<th>Action</th>
										</tr>
									</thead>
									<tbody>
										<cfloop query="qALCdocs">
											<cfoutput>
													<tr>
														<td>#qALCDocs.DocumentID#</td>
														<td>#qALCDocs.DocumentName#</td>
														<td class='hidden-350'>#qALCDocs.uploadedDocumentName#</td>
														<td class='hidden-1024'>#qALCDocs.UserName#</td>
														<td class='hidden-480'>#DateFormat(qALCDocs.uploadDate,'mm/dd/yyyy')#  #TimeFormat(qALCDocs.uploadDate,'hh:mm tt')#</td>
														<td><a href="index.cfm?event=downloadALCDocument&documentID=#qALCDocs.DocumentID#&reportingUnitID=#request.event.getArg('reportingUnitID')#"><i class="icon-download"></i></a> | <a href="index.cfm?event=deleteALCDocument&documentID=#qALCDocs.DocumentID#&reportingUnitID=#request.event.getArg('reportingUnitID')#"><i class="icon-trash"></i></a></d>
													</tr>
											</cfoutput>
										</cfloop>										
									</tbody>
								</table>


								
						</div>

						<!---
						<div class="box">
							<div class="box-title">
								<h3><i class=" icon-paper-clip"></i> Supporting Documents</h3>
							</div>
							<div class="box-content nopadding">
									<table class="table table-hover table-nomargin table-condensed">
										<!--- <cfif qSupportingDocs.recordcount> --->
											<thead>
												<th>File Name</th>
												<th>Uploaded By</th>
												<th>Uploaded On</th>
												<th>Action</th>
											</thead>
											<tbody>																						
												<!--- <cfloop query="qSupportingDocs"> --->
													<cfoutput>
													<tr>
														<td></td>
														<td></td>
														<td></td>
														<td><i class="icon-download"></i> | <i class="icon-trash"></i></d>
													</tr>
													</cfoutput>
												<!--- </cfloop> --->
												
											
										<!---		
										<cfelse>
											<tr>
												<td colspan="4">
													No documents uploaded
												</td>
											</tr>
										</cfif>
										--->
										</tbody>
									</table>
							</div>
						</div>
						--->

							<cfif session.user.userroleid lte 2>
								<div class="box">
									<div class="box-title">
										<h3><i class="icon-upload"></i> Upload Academic Learning Compact</h3>
									</div>
									<div class="box-content nopadding">
										<div class="plupload"></div>
									</div>
								</div>
							</cfif>

						</div>
							
					</div>
				</div>

</div></div>

<script type="text/javascript">
// Convert divs to queue widgets when the DOM is ready
<cfoutput>
$(function() {
	if($('.plupload').length > 0){
		$(".plupload").each(function(){
			var $el = $(this);
			$el.pluploadQueue({
				runtimes : 'html5,gears,flash,silverlight,browserplus',
				url : 'index.cfm?event=uploadALCdocument&reportingUnitID=#request.event.getArg("reportingUnitID")#&doctype=alc' ,
				max_file_size : '10mb',
				chunk_size : '1mb',
				unique_names : false,
				resize : {width : 320, height : 240, quality : 90},
				filters : [
				{title : "Document files", extensions : "txt,pdf,doc,docx"},
				{title : "Zip files", extensions : "zip"}
				],
				flash_swf_url : 'js/plupload/plupload.flash.swf',
				silverlight_xap_url : 'js/plupload/plupload.silverlight.xap'
			});
			$(".plupload_header").remove();
			var upload = $el.pluploadQueue();
			if($el.hasClass("pl-sidebar")){
				$(".plupload_filelist_header,.plupload_progress_bar,.plupload_start").remove();
				$(".plupload_droptext").html("<span>Drop files to upload</span>");
				$(".plupload_progress").remove();
				$(".plupload_add").text("Or click here...");
				upload.bind('FilesAdded', function(up, files) {
					setTimeout(function () { 
						up.start(); 
					}, 500);
				});
				upload.bind("QueueChanged", function(up){
					$(".plupload_droptext").html("<span>Drop files to upload</span>");
				});
				upload.bind("StateChanged", function(up){
					$(".plupload_upload_status").remove();
					$(".plupload_buttons").show();
				});
			} else {
				$(".plupload_progress_container").addClass("progress").addClass('progress-striped');
				$(".plupload_progress_bar").addClass("bar");
				$(".plupload_button").each(function(){
					if($(this).hasClass("plupload_add")){
						$(this).attr("class", 'btn pl_add btn-primary').html("<i class='icon-plus-sign'></i> "+$(this).html());
					} else {
						$(this).attr("class", 'btn pl_start btn-success').html("<i class='icon-cloud-upload'></i> "+$(this).html());
					}
				});
			}
		});

	}

	
	$(".pl_start").click(function() {
            //alert('Item selected');
            setTimeout( function () {         
            	//location.reload(true);
            	window.location.replace("index.cfm?event=viewALC&reportingUnitID=#request.event.getArg("reportingUnitID")#");
	          	}, 3000);
       });
	
   


});
</cfoutput>
</script>