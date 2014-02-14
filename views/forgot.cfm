<body class='login theme-darkblue'>
	<div class="wrapper">
		<h1><a href="index.cfm"><img src="img/FAU-logo-13.png" alt="" class='retina-ready' width="59" height="49">FAU Assessment</a></h1>
		<div class="login-body">
			
			<cfoutput>
				<cfif  structKeyExists(session, "message") AND len(trim(session.message))>
					<div class="alert dismissible alert_red">
						#session.message#										
					</div>
				</cfif>
			</cfoutput>	
			
			<h2>LOG IN RECOVERY</h2>

			<form action="index.cfm?event=sendlogin" method='post' class='form-validate' id="loginform">
				<div class="control-group">
					<div class="controls">
						<input type="text" name="username" placeholder="Enter your FAU email address" class='input-block-level' data-rule-required="true">

						<span class="help-block">Enter your fau email address then click "Get Login Information".  Your Username and Password will be sent to your inbox.</span>
					</div>
				</div>
				<div class="submit">
					<input type="submit" value="Send Login Information" class='btn btn-primary'>
				</div>
			</form>
			<div class="forget">
				<br>
			</div>
		</div>
	</div>
</body>