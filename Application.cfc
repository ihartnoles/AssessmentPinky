<cfcomponent extends="MachII.mach-ii" output="false">

	<cfscript>		
		this.Name = "AssessmentPRODFAUEDU";
		this.loginStorage 		= "session";
		this.sessionManagement 	= true;
		this.clientManagement   = false;
		this.setClientCookies 	= true;
		this.setDomainCookies 	= false;
		this.applicationTimeOut = CreateTimeSpan(0,2,0,0);
		//this.sessionTimeOut = CreateTimeSpan(0,0,40,0);
		
		
		/* BEGIN: CAS Authentication in PROD */
		//if(cgi.HTTP_HOST contains "assessment") {
			/**/

			this.mappings = {
				"/coldspring" 	    = "E:/sites/shared-libs/AssessmentResources/coldspring-1.2",
				"/SharedComponents" = "E:/sites/shared-libs/components",
				"/WhoAmI" 	    = "E:/sites/shared-libs/WhoAmI"
			};
			
		


			//this.mappings = instance.mappings;

			variables.resetFrameworkKey = "Z0mb1c1d3";
			variables.securedPaths = [
				"/"
			];

			variables.requiresCAS = false; //app requires CAS authentication?

			variables.CASArguments	= {
									cas_server = "https://sso.fau.edu",
									approot = IIF((CGI.HTTPS eq "off"), DE("http://"), DE("https://")) & CGI.HTTP_HOST,
									direct_forwarding = true
								};

		//}
		/* END: CAS Authentication in PROD */	
		
		MACHII_CONFIG_PATH 	= ExpandPath("./config/mach-ii.xml");
		// Config Mode -1=never, 0=dynamic, 1=always
		
		if (StructKeyExists(url, "reinit")){
			MACHII_CONFIG_MODE  = 1;
		} else {
			MACHII_CONFIG_MODE  = 0;
		}

			
		MACHII_APP_KEY 		= this.Name ;
		MACHII_DTD_PATH     = ExpandPath("/MachII/mach-ii_1_8_1.dtd");
		MACHII_VALIDATE_XML = false;
	</cfscript>

	<cfsetting
		showdebugoutput="true"
		enablecfoutputonly="false"
		/>

	<cffunction
		name="OnApplicationStart"
		access="public"
		returntype="boolean"
		output="false"
		hint="Fires when the application is first created.">
 		
		<cfset var offset = Replace(cgi.script_name,listLast(cgi.script_name,"/"),"")>
		<cfset application.rootOffset   = offset>
		<cfset offset 					= Replace(offset,"/","","one")>

		<!--- 
		<cfdump var="#application#" label="application" abort="false" /><br>		
		
		<cfdump var="#this.mappings#" abort="false" label="ExpandPath - mach-ii.xml Application.cfc - 91" /><br>
		<cfdump var="#ExpandPath("./config/mach-ii.xml")#" abort="false" label="ExpandPath - mach-ii.xml Application.cfc - 72" /><br>
		
		<cfdump var="#ExpandPath("/MachII/mach-ii_1_8_1.dtd")#" label="mach-ii_1_8_1.dtd" abort="false" /><br>
        <cfdump var="#offset#" label="offset" abort="true" />
		--->

		<cfif cgi.server_name eq "assessment.fau.edu">
			<cfset application.dsn = 'RW_Assessment_PROD' />
		<cfelse>
			<cfset application.dsn = 'RW_Assessment_DEV' />
		</cfif>
		
 		
				
		<!--- toggle impersonation here --->
		<cfset application.impersonate = false />

		<cfif cgi.server_name contains "localhost">
 			<cfset application.ALCDocDirectory = "C:\inetpub\wwwroot\Assessment\ALCDocuments\" />
 			<cfset application.SupportDocDirectory = "C:\inetpub\wwwroot\Assessment\resultsDocuments\" />
 		<cfelse>
 			<cfset application.ALCDocDirectory = "E:\sites\Assessment\ALCDocuments\" />
 			<cfset application.SupportDocDirectory = "E:\sites\Assessment\resultsDocuments\" />
 			<!---
 			<cfset application.ALCDocDirectory = "E:\sites\dyndev\Web\Assessment\ALCDocuments\" />
 			<cfset application.SupportDocDirectory = "E:\sites\dyndev\Web\Assessment\resultsDocuments\" />
 			--->
 		</cfif>
 		
 		
 		
 		<!--- resetAppFramework is for AUTHENTICATION PURPOSES--->
 		<cfscript>
 			resetAppFramework();
 			super.onApplicationStart();
 		</cfscript>
		
		<!---
 		<cfset LoadFramework() />
		--->

 		<!--- Return out. --->
		<cfreturn true />
	</cffunction>
 
 
	<cffunction
		name="OnSessionStart"
		access="public"
		returntype="void"
		output="false"
		hint="Fires when the session is first created.">
 		
 		
		<cfscript>
			//Initialize User as Guest
			Session.CASUser = CreateObject("Component", "SharedComponents.Authentication.User").init();

			//Initialize CAS
			Session.CAS = CreateObject("Component", "SharedComponents.Authentication.CAS").init(variables.CASArguments);

			super.onSessionStart();
		</cfscript>
		
	</cffunction>
 
 
	<cffunction
		name="OnRequestStart"
		access="public"
		returntype="void"
		output="true"
		hint="Fires at first part of page processing.">
 
		<!--- Define arguments. --->
		<cfargument
			name="TargetPage"
			type="string"
			required="true"
			/>

		<!--- Request Scope Variable Defaults --->
		<cfset request.self = "index.cfm">

		<cfif (structKeyExists(url,"reapp") && url.reapp eq "glassdoor")>
			<!--- if its the live server, the command must come from the office IP --->
			<cfset onApplicationStart()>
		</cfif>

		<!--- Temporarily override the default config mode
			Set the configuration mode (when to reinit): -1=never, 0=dynamic, 1=always --->
		<cfif StructKeyExists(url, "reinit")>
			<cfsetting requesttimeout="120" />
			<cfset MACHII_CONFIG_MODE = 1 />
			<cfset applicationStop()>
		</cfif>
		
						
		<cfset request.do404 = do404>
 		
 		<!--- Handle the request. Make sure we only process Mach-II requests.--->
		<cfset handleRequestSecurity(arguments.targetpage) /> 
		
		<!--- 
		<cfscript>
			super.onRequestStart(arguments.targetPage);
		</cfscript>
		--->
		 
		<!--- Handle Mach-II request 
		<cfif FindNoCase("index.cfm", arguments.targetPage)>
			<cfset handleRequest() />
		<cfelse>
			<cfabort>
		</cfif>
		 --->

		<!--- Return out. 
		<cfreturn true />--->
	</cffunction>
 

<!---
	<cffunction
		name="OnRequest"
		access="public"
		returntype="void"
		output="true"
		hint="Fires after pre page processing is complete.">
 
		<!--- Define arguments. --->
		<cfargument
			name="TargetPage"
			type="string"
			required="true"
			/>
 		
 		<cfif StructKeyExists(url, "reinit")>
			<cfsetting requesttimeout="120"/>
			<cfset MACHII_CONFIG_MODE = 1 />
		</cfif>


		
		<!--- Include the requested page. --->
		<cfinclude template="#ARGUMENTS.TargetPage#" />
 
		<!--- Return out. --->
		<cfreturn />
	</cffunction>
--->
 
 <!---
	<cffunction
		name="OnRequestEnd"
		access="public"
		returntype="void"
		output="true"
		hint="Fires after the page processing is complete.">
 
		<!--- Return out. --->
		<cfreturn />
	</cffunction>
  --->

  <!---
 
	<cffunction
		name="OnSessionEnd"
		access="public"
		returntype="void"
		output="false"
		hint="Fires when the session is terminated.">
 
		<!--- Define arguments. --->
		<cfargument
			name="SessionScope"
			type="struct"
			required="true"
			/>
 	
 		<!---
		<cfargument
			name="ApplicationScope"
			type="struct"
			required="false"
			default="#StructNew()#"
			/>
 
		 Return out.
		<cfreturn /> --->
		<cfscript>
			super.onSessionEnd(arguments.sessionScope, arguments.applicationScope);
		</cfscript>
	</cffunction>
 
 --->

 	<!---
	<cffunction
		name="OnApplicationEnd"
		access="public"
		returntype="void"
		output="false"
		hint="Fires when the application is terminated.">
 
		<!--- Define arguments. --->
		<cfargument
			name="ApplicationScope"
			type="struct"
			required="false"
			default="#StructNew()#"
			/>
 
		<!--- Return out. --->
		<cfreturn />
	</cffunction>
    --->
 
	<!---	
	<cffunction name="onError">
		<cfargument name="Exception" required=true/>
		<cfargument type="String" name="EventName" required=true/>

		<!---
		<cfsetting requesttimeout="#(GetRequestTimeout() + 5000)#" />
		--->
			<!--- Log all errors. --->
			<cflog file="#This.Name#" type="error" text="Event Name: #Arguments.Eventname#" >
			<cflog file="#This.Name#" type="error" text="Message: #Arguments.Exception.message#">
			<cflog file="#This.Name#" type="error" text="Root Cause Message: #Arguments.Exception.detail#">

			<!--- Display an error message if there is a page context. --->
			<cfif NOT (Arguments.EventName IS "onSessionEnd") OR 	(Arguments.EventName IS "onApplicationEnd")> 
				<cfoutput>
				<h2>An unexpected error occurred.</h2>
				<p>Please provide the following information to technical support:</p>
				<p>Error Event: #Arguments.EventName#</p>
				<p>Error details:<br>
				<cfdump var=#Arguments.Exception#></p>
				</cfoutput>
			</cfif>
		

	</cffunction>
	--->

	<cffunction name="onError">
		<cfargument name="error">

		<cfset local.errorMessage = structKeyExists(arguments.error,"cause") ? arguments.error.cause.message : arguments.error.message />
		
		<cfif findNoCase("The request has exceeded the allowable time limit",local.errorMessage)>
			<cfset private.subject = "Request timeout: " />
			<cfif structKeyExists(request,"event") && isObject(request.event)>
				<cfset private.subject &= "event=" & request.event.getname() />
			<cfelse>
				<cfset private.subject &= replaceNoCase(cgi.script_name,"/","") />
			</cfif>
		<cfelse>
			<cfset private.subject = "OnError: #local.errorMessage#" />
		</cfif>


			<!---
			<cfoutput><h3>#private.subject#</h3></cfoutput>
			--->

			<cfdump var="#arguments.error#" label="error">
			<cfdump var="#form#" label="form">
			<cfdump var="#url#" label="url">
			<cfdump var="#cgi#" label="cgi">
			<cfif IsDefined("session")>
				<cfdump var="#session#" label="session">
			</cfif>
			<Cfabort>
	</cffunction>

	<cffunction name="onMissingTemplate"> 
		<cfset do404(arguments.targetPage)>
		<cfreturn true>
	</cffunction>
	


	<cffunction name="do404" access="private" output="true" returntype="boolean" hint="I display a 404 error">
	<cfargument name="targetPage" type="string" required="true">
	<cfset var private = {}>

		<!doctype html class="no-js">
		<html>
			<head>
				<meta charset="utf-8">
				<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
				<!--- Apple devices fullscreen --->
				<meta name="apple-mobile-web-app-capable" content="yes" />
				<!--- Apple devices fullscreen --->
				<meta names="apple-mobile-web-app-status-bar-style" content="black-translucent" />
				
				<title>FAU Assessment - Error page</title>

				<!--- Bootstrap --->
				<link rel="stylesheet" href="css/bootstrap.min.css">
				<!--- Bootstrap responsive --->
				<link rel="stylesheet" href="css/bootstrap-responsive.min.css">
				<!--- jQuery UI --->
				<link rel="stylesheet" href="css/plugins/jquery-ui/smoothness/jquery-ui.css">
				<link rel="stylesheet" href="css/plugins/jquery-ui/smoothness/jquery.ui.theme.css">
				<!--- PageGuide --->
				<link rel="stylesheet" href="css/plugins/pageguide/pageguide.css">
				<!--- Fullcalendar --->
				<link rel="stylesheet" href="css/plugins/fullcalendar/fullcalendar.css">
				<link rel="stylesheet" href="css/plugins/fullcalendar/fullcalendar.print.css" media="print">
				<!--- chosen --->
				<link rel="stylesheet" href="css/plugins/chosen/chosen.css">
				<!--- select2 --->
				<link rel="stylesheet" href="css/plugins/select2/select2.css">
				<!--- icheck --->
				<link rel="stylesheet" href="css/plugins/icheck/all.css">
				<!--- Theme CSS --->
				<link rel="stylesheet" href="css/style.css">
				<!--- Color CSS --->
				<link rel="stylesheet" href="css/themes.css">

				<!--- rating CSS --->
				<link rel="stylesheet" href="css/jquery.rating.css">

				<!--- Plupload --->
				<link rel="stylesheet" href="css/plugins/plupload/jquery.plupload.queue.css">

				<!--- jQuery --->
				<script src="js/jquery.min.js"></script>


				<!--[if lte IE 9]>
					<script src="js/plugins/placeholder/jquery.placeholder.min.js"></script>
					<script>
						$(document).ready(function() {
							$('input, textarea').placeholder();
						});
					</script>
				<![endif]-->
				

				<!--- Favicon --->
				<link rel="shortcut icon" href="img/favicon.ico" />
				<!--- Apple devices Homescreen icon --->
				<link rel="apple-touch-icon-precomposed" href="img/apple-touch-icon-precomposed.png" />

			</head>

			<body class='error' style="background-color: ##204e81;">
				<div class="wrapper">
					<div class="code"><span>404</span><i class="icon-warning-sign"></i></div>
					<div class="desc">Oops! Sorry, that page couldn't be found.</div>
					<div class="desc">Maybe the page was moved or deleted or perhaps you mistyped the address. It happens.</div>
					
					<div class="buttons">
						<div class="pull-left"><a href="index.cfm" class="btn"><i class="icon-arrow-left"></i> Back</a></div>
					</div>
				</div>
				
			</body>

		</html>
		
	<cfreturn true>
</cffunction>

<cffunction	name="GetRequestTimeout" access="public" returntype="numeric" output="false" hint="Returns the current request timeout for the current page page request.">
	<cfset local.RequestMonitor = CreateObject("java","coldfusion.runtime.RequestMonitor")>
	<cfreturn local.RequestMonitor.GetRequestTimeout()>
</cffunction>


<cffunction	name="resetAppFramework" access="private" returntype="void" output="false">
	<cfscript>
		application.SSV = CreateObject("Component", "SharedComponents.SSV.SSV").Init();

		application.Authentication = StructNew();
		application.Authentication.Security = CreateObject("Component", "SharedComponents.Authentication.Security").Init(variables.securedPaths);
	</cfscript>
</cffunction>

<cffunction	name="handleRequestSecurity" access="private" returntype="void" output="false">

	<!--- Define arguments. --->
		<cfargument
			name="TargetPage"
			type="string"
			required="true"
			/>

	<cfscript>
		if(application.Authentication.Security.requiresCAS(Arguments.targetpage)){
			lock scope="session" type="exclusive" timeout="30" throwOnTimeout="no"
			{//Make sure CAS is Initialized
				if(Not StructkeyExists(Session, 'CAS') or Not IsInstanceOf(Session.CAS, "SharedComponents.Authentication.CAS"))
				{//Forwhatever reason, Session.CAS is no longer there, perhaps expired or lost?
					onSessionStart(); //restart session
				}

				Session.CAS.validate(Arguments.targetpage);

				Session.CASUser = CreateObject("Component", "SharedComponents.Authentication.User").Init(Session.Cas.getUsername());
			}
		}

		if(StructKeyExists(Session, "CAS") and Not StructKeyExists(Session, "User"))
		{//Session Expired
			Session.CASUser = CreateObject("Component", "SharedComponents.Authentication.User").Init(Session.Cas.getUsername());
		}

		//return true;		
	</cfscript>

</cffunction>

</cfcomponent>