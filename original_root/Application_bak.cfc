/**
* @output false
**/
component{
	/*
	* Application Variables Reference Page:
	* http://help.adobe.com/en_US/ColdFusion/10.0/CFMLRef/WSc3ff6d0ea77859461172e0811cbec22c24-750b.html
	*/

	//Application Variables
	this.name = "Assessment_00001";
	this.applicationTimeout = createTimeSpan(0, 0, 2, 0);
//	this.authcookie.disableupdate = false;
//	this.authcookie.timeout = -1;
//	this.chartStyleDirectory = "";
//	this.clientManagement = true;
//	this.clientStorage = "cookie";
	this.loginStorage = "Session";
//	this.loginStorage = "cookie";
	this.mappings = {
		"/SharedComponents" = "E:/sites/shared-libs/components/",
		"/WhoAmI" = "E:/sites/shared-libs/WhoAmI/"
	};
//	this.sessioncookie.httponly = true;
//	this.sessioncookie.secure = false;
//	this.sessioncookie.domain = "";
//	this.sessioncookie.timeout = 30years
//	this.sessioncookie.disableupdate = false;
//	this.serverSideFormValidation = true;
	this.sessionManagement = true;
	this.sessionTimeout = createTimeSpan(0, 0, 2, 0);
	this.setClientCookies = true;
//	this.setDomainCookies = false;
//	this.scriptProtect = true;
//	this.secureJSON = true;
//	this.secureJSONPrefix = true;
//	this.welcomeFileList = "";
//	this.smtpServersettings = { server="", username="", password="" };
//	this.timeout = "";
//	this.debuggingIPAddresses = "";
//	this.enablerobustexception = false;

	//Private Members

	variables.resetFrameworkKey = "Z0mb1c1d3"; //TODO: Move this into file somewhere, not in source
	variables.securedPaths = [
		"/"
	];

	//ExtJS Override Default Settings
	/*
	* defaults:
	* 	variables.ExtJSSettings = {
	*		jsNamespace = "Ext.app",
	*		jsDesc = "REMOTING_API",
	*		routingURL = "/ExtDirect/Router.cfm",
	*		allowFullAPI = false,
	*		debugInfo = false
	*	};
	*/
//	variables.ExtJSSettings = {
//		routingURL = "/ExtDirect/Router.cfm",
//		serializedComponentFilename = "GradeManagerRegistry.json",
//		serializedServiceFileName = "GradeManagerRegistry.json"
//	};

	//CAS Settings
//	variables.isSecureSite = false; //secure https site?
	variables.requiresCAS = true; //app requires CAS authentication?

	variables.CASArguments	= {
								cas_server = "https://sso.fau.edu",
								approot = IIF((CGI.HTTPS eq "off"), DE("http://"), DE("https://")) & CGI.HTTP_HOST,
								direct_forwarding = true
							};

	/*
	* Application Method Reference page:
	* http://help.adobe.com/en_US/ColdFusion/10.0/CFMLRef/WSc3ff6d0ea77859461172e0811cbec22c24-606e.html
	*/

	/**
	*  Fires when when you execute the tag cfabort
	*
	* @output false
 	**/
	public boolean function onAbort( required string targetPage ){

		return true;
	}

	/**
	* Fires when the application ends: the application times out, or the server is stopped
	*
	* @output false
 	**/
	public void function onApplicationEnd(){

	}

	/**
	* Function onApplicationStart
	* Fires when the application first starts: the first request for a page is processed
	* or the first CFC method is invoked by an event gateway instance, or a web services or Flash Remoting CFC
	*
	* @output false
	**/
	public boolean function onApplicationStart(){

		initAppScope();

		return true;
	}

	/**
	* Intercepts any HTTP or AMF calls to an application based on CFC request.
	*
	* @output false
	**/
	public void function onCfcRequest( string cfcname, string method, string args ){

	}

	/**
	* Fires when a request specifies a non-existent CFML page
	*
	* @output false
	**/
	public boolean function onMissingTemplate( required string targetPage ){

		return true;
	}

	/**
	* Fires at end of request
	*
	* @output false
	**/
	public void function onRequestEnd(){

		return;
	}

	/**
	* Fires at start of request
	*
	* @output false
	**/
	public boolean function onRequestStart( required string targetpage ){

		handleRequestSecurity(Arguments.targetpage);

		return true;
	}

	/**
	* Fires at expiration of a session
	*
	* @output false
	**/
	public void function onSessionEnd(required struct SessionScope, struct ApplicationScope={}){
		//Initialize User as Guest
		Session.User = CreateObject("Component", "SharedComponents.Authentication.User").init();

		//Initialize CAS
		Session.CAS = CreateObject("Component", "SharedComponents.Authentication.CAS").init(variables.CASArguments);

	}

	/**
	* Fires at start of a session
	*
	* @output false
	**/
	public void function onSessionStart(){
		//Initialize User as Guest
		Session.User = CreateObject("Component", "SharedComponents.Authentication.User").init();

		//Initialize CAS
		Session.CAS = CreateObject("Component", "SharedComponents.Authentication.CAS").init(variables.CASArguments);

		return;
	}

	/**
	* Reset Framework app variables
	*
	* @output false
	**/
	public void function resetFramework( required string appkey ){

	}

	/**
	* @output false
	**/
	private boolean function handleRequestSecurity( required string targetpage ){

		if(application.Authentication.Security.requiresCAS(Arguments.targetpage)){
			lock scope="session" type="exclusive" timeout="30" throwOnTimeout="no"
			{//Make sure CAS is Initialized
				if(Not StructkeyExists(Session, 'CAS') or Not IsInstanceOf(Session.CAS, "SharedComponents.Authentication.CAS"))
				{//Forwhatever reason, Session.CAS is no longer there, perhaps expired or lost?
					onSessionStart(); //restart session
				}

				Session.CAS.validate(Arguments.targetpage);

				Session.User = CreateObject("Component", "SharedComponents.Authentication.User").Init(Session.Cas.getUsername());
			}
		}

		if(StructKeyExists(Session, "CAS") and Not StructKeyExists(Session, "User"))
		{//Session Expired
			Session.User = CreateObject("Component", "SharedComponents.Authentication.User").Init(Session.Cas.getUsername());
		}

		return true;
	}

	/**
	* @output false
	**/
	private void function initAppScope(){

		resetAppFramework();
	}

	/**
	* @output false
	**/
	private void function resetAppFramework(){
		application.SSV = CreateObject("Component", "SharedComponents.SSV.SSV").Init();

		application.Authentication = StructNew();
		application.Authentication.Security = CreateObject("Component", "SharedComponents.Authentication.Security").Init(variables.securedPaths);
	}
}