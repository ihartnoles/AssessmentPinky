<!---
<cfset variables.exception = request.event.getArg("exception") />
<cfset variables.stError = variables.exception.getCaughtException()>


<cfif variables.stError.type eq 'MachII.framework.EventHandlerNotDefined'>
	<cfset request.do404(arguments.event.getName())>
	<cfabort>
</cfif>


<h3>Exception</h3>


<cfset exception = request.event.getArg('exception') />

<cfoutput>
<table>
	<tr>
		<td valign="top"><b>Message</b></td>
		<td valign="top">#exception.getMessage()#</td>
	</tr>
	<tr>
		<td valign="top"><b>Detail</b></td>
		<td valign="top">#exception.getDetail()#</td>
	</tr>
	<tr>
		<td valign="top"><b>Extended Info</b></td>
		<td valign="top">#exception.getExtendedInfo()#</td>
	</tr>
	<tr>
		<td valign="top"><b>Tag Context</b></td>
		<td valign="top">
			<cfset tagCtxArr = exception.getTagContext() />
			<cfloop index="i" from="1" to="#ArrayLen(tagCtxArr)#">
				<cfset tagCtx = tagCtxArr[i] />
				#tagCtx['template']# (#tagCtx['line']#)<br>
			</cfloop>
		</td>
	</tr>
</table>
</cfoutput>
--->

<!--- uncomment in development to see production error messages --->
<!---<cfset application.servertype = "testing">--->

<cfset variables.exception = request.event.getArg("exception") />
<cfset variables.stError = variables.exception.getCaughtException()>

<!---
<cfsetting requesttimeout="#(GetRequestTimeout() + 5000)#" />
--->

<!--- check to see if this is an undefined mach II event and treat as 404 --->
<cfif variables.stError.type eq 'MachII.framework.EventHandlerNotDefined'>
	<cfset request.do404(arguments.event.getName())>
	<cfabort>
</cfif>


<cfset variables.subject = "">
<cfif structKeyExists(form, "event")>
	<cfset variables.subject = form.event & " | ">
<cfelseif structKeyExists(url, "event")>
	<cfset variables.subject = url.event & " | ">
</cfif>
<cfif structKeyExists(session, "fullname")>
	<cfset variables.subject &= session.fullname & " | ">
</cfif>
<cfset variables.subject &= variables.exception.getMessage()>

<!--- random quotes --->
<cfset arrQuotes=["This isn't supposed to happen." ,"Its looking like you may have taken a wrong turn. Don't worry ... it happens to the best of us.", "Don't get angry and don't cry. Let us take that burden." ,"It's not your fault. No, really listen to me. It's not your fault."]>


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

<cfmail from="ihartstein@fau.edu" to="ihartstein@fau.edu" subject="#inet.getHostName()#: #variables.subject# -- xxx">
<cfmailpart type="text/plain">
An error occurred.
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


<!--- session has expired! Must redirect  
<cfif NOT StructKeyExists(session,"USER.USERROLEID")>
		<cfset structClear(session) />
		<cfset session.message = "Sorry! Your session has expired. You must login again." />
		<cflocation url="index.cfm" addtoken="false" />
</cfif>
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
				
				<title>FAU Assessment - Error page</title>

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
				<div class="desc"><br>#arrQuotes[randrange(1,4)]#<!---Oops! This isn't supposed to happen.---></div>
				<div class="desc">We've logged this error and we're working to fix it as soon as possible.</div>
				<div class="desc">We're sorry for the inconvenience.</div>
			</div>
			<div class="buttons">
				<div class="pull-left"><a href="index.cfm" class="btn"><i class="icon-arrow-left"></i> Back</a></div>
			</div>

	</div>
		
<hr>

#variables.extraInfo#


</body>
</html>
</cfoutput>

<cffunction	name="GetRequestTimeout" access="public" returntype="numeric" output="false" hint="Returns the current request timeout for the current page page request.">
	<cfset var LOCAL = StructNew() />
 	<!--- Get the request monitor. --->
	<cfset LOCAL.RequestMonitor = CreateObject("java","coldfusion.runtime.RequestMonitor") />
	<!--- Return the current request timeout. --->
	<cfreturn LOCAL.RequestMonitor.GetRequestTimeout() />
</cffunction>
