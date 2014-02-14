<cfscript>
	//writeDump(var=cookie, label="cookie @@ loginForm");
	//writeDump(application);

	if (structKeyExists(cookie,"assessment_username") && len(cookie.assessment_username)){
		usernameVal = cookie.assessment_username;
	} else {
		usernameVal = "";
	}

	if (structKeyExists(cookie,"assessment_password") && len(cookie.assessment_password)){
		passwordVal = cookie.assessment_password;
	} else {
		passwordVal = "";
	}
</cfscript>

<body class='login theme-darkblue' >
	<div class="wrapper">
		<h1><a href="index.cfm"><img src="img/FAU-logo-13.png" alt="" class='retina-ready' width="99" height="89">FAU Assessment</a></h1>
		<div class="login-body">
			
			<cfoutput>
				<cfif  structKeyExists(session, "message") AND len(trim(session.message))>
					<div class="alert dismissible alert_red">
						<!--- #session.message#<br> --->
						Please close your browser to end your session. Thank you!									
					</div>
				</cfif>
			</cfoutput>	
			<!---
			<h2>SIGN IN</h2>
			<form action="index.cfm?event=validateLogin" method='post' class='form-validate' id="loginform">
				<cfoutput>
					<div class="control-group">
						<div class="controls">
							<input type="text" name="username" value="#usernameVal#" placeholder="Username" class='input-block-level' data-rule-required="true">
						</div>
					</div>
					<div class="control-group">
						<div class="pw controls">
							<input type="password" name="password" value="#passwordVal#" placeholder="Password"  class='input-block-level' data-rule-required="true">
						</div>
					</div>
					<div class="submit">
						<div class="remember">
							<input type="checkbox" name="remember" class='icheck-me' data-skin="square" data-color="blue" id="remember" <cfif len(trim(usernameVal)) AND len(trim(passwordVal))> checked </cfif>> <label for="remember">Remember me</label>
						</div>
						<input type="submit" value="Sign me in" class='btn btn-primary'>
					</div>
				</cfoutput>
			</form>
			<div class="forget">
				<a href="index.cfm?event=forgot"><span>Forgot password?</span></a>
			</div>
			--->
		</div>
	</div>
</body>