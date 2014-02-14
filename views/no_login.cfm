<!---
<cfset variables.subject = "">
<cfif structKeyExists(form, "event")>
	<cfset variables.subject = form.event & " | ">
<cfelseif structKeyExists(url, "event")>
	<cfset variables.subject = url.event & " | ">
</cfif>
<cfif structKeyExists(session, "fullname")>
	<cfset variables.subject &= session.fullname & " | ">
</cfif>
<cfset variables.subject >
--->

<!--- random quotes --->
<cfset arrQuotes=["Looks like you don't have access to the Assessment system!"]>


<!---
<cftry>
<cfset inet = CreateObject("java", "java.net.InetAddress")>
<cfset inet = inet.getLocalHost()>

<cfsavecontent variable="variables.ExtraInfo">
	<cfdump var="#variables.stError#" label="Exception" format="text" />
	<cfdump var="#inet.getHostName()#" label="HostName" format="text">
	<cfdump var="#form#" label="form" format="text">
	<cfdump var="#url#" label="url" format="text">
	<cfdump var="#cgi#" label="cgi" format="text">
	<cfdump var="#session#" label="session" format="text">
</cfsavecontent>

<cfmail from="ihartstein@fau.edu" to="ihartstein@fau.edu" subject="#inet.getHostName()#: User Access">
<cfmailpart type="text/plain">
This user is not in the assessment database!
</cfmailpart>
<cfmailpart type="text/html">
<cfoutput><html>
<head>
	<title>Error</title>
</head>
<body>#variables.extraInfo#</body>
</html></cfoutput>
</cfmailpart>
</cfmail>
	<cfcatch type="any">
	<cfoutput><!-- <cfdump var="#cfcatch#" format="text"> --></cfoutput>
	</cfcatch>
</cftry>
--->

<cfoutput>
<!doctype html class="no-js">
<html>
	<head>
				<meta charset="utf-8">
				<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
				<!-- Apple devices fullscreen -->
				<meta name="apple-mobile-web-app-capable" content="yes" />
				<!-- Apple devices fullscreen -->
				<meta names="apple-mobile-web-app-status-bar-style" content="black-translucent" />
				
				<title>FAU Assessment</title>

				<!-- Bootstrap -->
				<link rel="stylesheet" href="css/bootstrap.min.css">
				<!-- Bootstrap responsive -->
				<link rel="stylesheet" href="css/bootstrap-responsive.min.css">
				

				<!-- Theme CSS -->
				<link rel="stylesheet" href="css/style.css">
				<!-- Color CSS -->
				<link rel="stylesheet" href="css/themes.css">
			
		

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
	<body class='error' style="background-color: ##204e81;">

	
	<!--- page body --->
		
	<div class="wrapper" >
			<div class="row-fluid">
				<div class="code"><span>Oops!</span></div><br>
			</div>
			<div class="row-fluid">
				<div class="desc"><br>#arrQuotes[randrange(1,1)]#<!---Oops! This isn't supposed to happen.---></div>
				<div class="desc">We've been notified of this issue and will work to resolve it! Sit tight. We'll be in touch soon.</div>
				<div class="desc">Sorry for the inconvenience.</div>
			</div>
	</div>
	
<!---	
	<cfdump var="#session#" />
	

	<cfdump var="#session.casuser" />

	<h1>test</h1>
--->

	<!--- physically mail out the message
		<cfmail to="ihartstein@fau.edu"
				from="noreply@fau.edu"
				subject="PROD Assessment No Login Notification"
				type="text/html">
					<cfoutput>
						<!---#htmlEditFormat(request.event.getArg('CK'))#--->
						<cfdump var="#session.casuser#" />
					</cfoutput>
		</cfmail> 
--->
</body>
</html>
</cfoutput>