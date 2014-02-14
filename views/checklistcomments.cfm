<!doctype html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
	<!-- Apple devices fullscreen -->
	<meta name="apple-mobile-web-app-capable" content="yes" />
	<!-- Apple devices fullscreen -->
	<meta names="apple-mobile-web-app-status-bar-style" content="black-translucent" />
	
	<title>Assessment Database</title>

	<!-- Bootstrap -->
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<!-- Bootstrap responsive -->
	<link rel="stylesheet" href="css/bootstrap-responsive.min.css">
	<!-- icheck -->
	<link rel="stylesheet" href="css/plugins/icheck/all.css">
	<!-- Theme CSS -->
	<link rel="stylesheet" href="css/style.css">
	<!-- Color CSS -->
	<link rel="stylesheet" href="css/themes.css">

	<!-- rating CSS -->
	<link rel="stylesheet" href="css/jquery.rating.css">

	<!-- Tagsinput -->
	<link rel="stylesheet" href="css/plugins/tagsinput/jquery.tagsinput.css">

	<!-- jQuery -->
	<script src="js/jquery.min.js"></script>
	
	<!-- Nice Scroll -->
	<script src="js/plugins/nicescroll/jquery.nicescroll.min.js"></script>
	<!-- Validation -->
	<script src="js/plugins/validation/jquery.validate.min.js"></script>
	<script src="js/plugins/validation/additional-methods.min.js"></script>
	<!-- icheck -->
	<script src="js/plugins/icheck/jquery.icheck.min.js"></script>
	<!-- Bootstrap -->
	<script src="js/bootstrap.min.js"></script>
	<script src="js/eakroko.js"></script>

	

	<!--[if lte IE 9]>
		<script src="js/plugins/placeholder/jquery.placeholder.min.js"></script>
		<script>
			$(document).ready(function() {
				$('input, textarea').placeholder();
			});
		</script>
	<![endif]-->
	

	<!-- Favicon -->
	<link rel="shortcut icon" href="img/favicon.ico" />
	<!-- Apple devices Homescreen icon -->
	<link rel="apple-touch-icon-precomposed" href="img/apple-touch-icon-precomposed.png" />

</head>

<cfscript>
	qChecklistComments = request.event.getArg('qChecklistcomments');
	//writedump(var= qChecklistcomments );

	qChecklistCommentDetails	= request.event.getArg('qChecklistCommentDetails');
	//writedump(var= qChecklistCommentDetails );
</cfscript>

<div class="row-fluid">
		<div class="span12">
			<div class="box">
				<div class="box-content">

					<cfif qChecklistCommentDetails.recordcount >
						<cfoutput query="qChecklistCommentDetails" group="category">
							<h3>#qChecklistCommentDetails.category#</h3>
							<h4>#qChecklistCommentDetails.subcategory#</h4>
							
							<div class="row-fluid">
								<hr>
								<cfoutput group="comment">
									<strong>#qChecklistCommentDetails.comment#</strong>
									<br>
									<br> Comment added on #DateFormat(qChecklistcommentDetails.created_on, 'mm/dd/yyyy')#
									<hr>
								</cfoutput>


							</div>

						</cfoutput>
					<cfelse>
						<div class="row-fluid">
							<h3>Sorry! No comments are available.</h3>
						</div>
					</cfif>

					<button class="btn btn-primary btn-darkblue close-button" data-dismiss="modal">Close This Window</button>
				</div>
			</div>
		</div>
</div>

<script type="text/javascript">
  $(function () {
		$(".close-button").click(function(e) {
			 window.close();
		});
    });
</script>

</html>
