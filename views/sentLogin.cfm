<body class='login theme-darkblue'>
	<div class="wrapper">
		<h1><a href="index.cfm"><img src="img/FAU-logo-13.png" alt="" class='retina-ready' width="59" height="49">FAU Assessment</a></h1>
		
		<div class="span4 center-text">
			<div class="login-body">
					
			<h2>LOG IN INFORMATION</h2>

			
				<div class="alert alert-info dismissible">
					<cfoutput>
						<div class="alert alert-info dismissible">
							#request.event.getArg('layout_message')#<br>
							<!---
							 <cfdump var="#request.event.getArgs()#" />
							 --->
						</div>
					</cfoutput>
				</div>
			
			
				<div class="forget">
					<br>
				</div>
			</div>
		</div>
	</div>
</body>