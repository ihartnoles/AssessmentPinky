
<cfapplication name="Assessment" sessionmanagement="yes" />

<cfsetting requesttimeout="120" showDebugOutput = "yes"/>

<!--- Set the path to the application's mach-ii.xml file. --->
<cfset MACHII_CONFIG_PATH = ExpandPath("./config/mach-ii.xml") />
<!--- Set the configuration mode (when to reload): -1=never, 0=dynamic, 1=always --->
<cfset MACHII_CONFIG_MODE = 0 />
<!--- Set the app key for sub-applications within a single cf-application. --->
<!--- <cfset MACHII_APP_KEY = GetFileFromPath(ExpandPath(".")) /> --->
<cfset MACHII_APP_KEY = 'DEV' />
<!--- Include the mach-ii.cfm file included with the core code. --->
<cfset MACHII_DTD_PATH     = ExpandPath("/Mach-II/mach-ii_1_1_1.dtd") />

<cfset MACHII_VALIDATE_XML = false />

<!---
<cfset application.wbroot = 'C:\inetpub\wwwroot\Assessment' />
--->

<cfset application.devEmails = 'ihartstein@fau.edu' />

<cfset application.defaultProperties.dsn = "RW_Assessment_PROD">
<cfset application.devEmail = "ihartstein@fau.edu">
<!--- --->
<cfset application.serviceDefinitionLocation = expandPath('../') & "\Assessment\config\coldspring\services.xml.cfm" />
<cfset application.serviceFactory = createObject('component','\coldspring.beans.DefaultXmlBeanFactory').init(structnew(),application.defaultProperties) />
<cfset application.serviceFactory.loadBeansFromXmlFile(application.serviceDefinitionLocation) />



<!---
<cfdump var="#application#" abort="true" />
--->

<cfif StructKeyExists(url, "reinit")>
			<cfsetting requesttimeout="120"/>
			<cfset MACHII_CONFIG_MODE = 1 />
</cfif>

<cfset request.do404 = do404>

<cffunction name="do404" access="private" output="true" returntype="boolean" hint="I display a 404 error">
	<cfargument name="targetPage" type="string" required="true">
	<cfset var private = {}>

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
				<!-- jQuery UI -->
				<link rel="stylesheet" href="css/plugins/jquery-ui/smoothness/jquery-ui.css">
				<link rel="stylesheet" href="css/plugins/jquery-ui/smoothness/jquery.ui.theme.css">
				<!-- PageGuide -->
				<link rel="stylesheet" href="css/plugins/pageguide/pageguide.css">
				<!-- Fullcalendar -->
				<link rel="stylesheet" href="css/plugins/fullcalendar/fullcalendar.css">
				<link rel="stylesheet" href="css/plugins/fullcalendar/fullcalendar.print.css" media="print">
				<!-- chosen -->
				<link rel="stylesheet" href="css/plugins/chosen/chosen.css">
				<!-- select2 -->
				<link rel="stylesheet" href="css/plugins/select2/select2.css">
				<!-- icheck -->
				<link rel="stylesheet" href="css/plugins/icheck/all.css">
				<!-- Theme CSS -->
				<link rel="stylesheet" href="css/style.css">
				<!-- Color CSS -->
				<link rel="stylesheet" href="css/themes.css">

				<!-- rating CSS -->
				<link rel="stylesheet" href="css/jquery.rating.css">

				<!-- Plupload -->
				<link rel="stylesheet" href="css/plugins/plupload/jquery.plupload.queue.css">

				<!-- jQuery -->
				<script src="js/jquery.min.js"></script>


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

			<body class='error theme-darkblue'>
				<div class="wrapper">
					<div class="code"><span>404</span><i class="icon-warning-sign"></i></div>
					<div class="desc">Oops! Sorry, that page couldn't be found.</div>
					
					<div class="buttons">
						<div class="pull-left"><a href="index.cfm" class="btn"><i class="icon-arrow-left"></i> Back</a></div>
					</div>
				</div>
				
			</body>

		</html>
		
	<cfreturn true>
</cffunction>
