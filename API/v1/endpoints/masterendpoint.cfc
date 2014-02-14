<cfcomponent extends="MachII.endpoints.rest.BaseEndpoint" output="false" hint="I am the father of all Interfolio internal API endpoints">
	
	<cffunction name="configure" access="public" returntype="void" output="false">
		<cfscript>
			super.configure();
			sf = getProperty('serviceFactory');
			
			variables.jsonHelper                   = createObject("component", "Assessment.utility.model.dataHelpers.jsonHelper").init();	
			//variables.stringHelper                 = createObject("component", "Assessment.utility.model.dataHelpers.stringHelper");	
			//variables.personsService               = sf.getbean('personsService');
			//variables.personInstitutionsService    = sf.getBean('personInstitutionsService');
			//variables.permissionsService           = sf.getBean('permissionsService');
			//variables.portfolioBasicService        = sf.getBean('portfolioBasicService');
			//variables.portfolioSchemaLookupService = sf.getBean('portfolioSchemaLookupService');

			//variables.imageBucket		= "interfolioportfolio" & application.servertype eq "dev" ? "dev" : "";
			//variables.publicEndpoints	= "portfoliobasics,portfoliobasicpage";
		</cfscript>
	</cffunction>

	
	<cffunction name="preProcess" access="public" returntype="void" output="true" 
		hint="I am step 1/3 of the API call cycle. I am followed by handleRequest()">  
	     <cfargument name="event" type="MachII.framework.Event" required="true" />
	     <cfscript> 
	     	super.preProcess(arguments.event);
		 	setResponseFormat(arguments.event);
		 	//checkProtocol();
		 	//checkCredentials(arguments.event);
	     </cfscript>
	</cffunction>
	 
	 
	<!--- 
	<cffunction name="handleRequest" access="public" returntype="void" output="true"
		hint="I am step 2/3 of the API call cycle. I am preceded by preProcess() and followed by postProcess(). I call the defined REST Endpoint function and render the response.">
		<cfargument name="event" type="MachII.framework.Event" required="true" /> 
		
		<!--- <cfif arguments.event.getArg('status',false) EQ true> --->
			<cfset local.pathinfo   = arguments.event.getArg("pathInfo", "") />
			<cfset local.httpMethod = arguments.event.getArg("httpMethod", "") />
			<cfset local.restUri    = variables.restUris.findRestUri(local.pathinfo, local.httpMethod) />
			<cfset local.userinfo 	= arguments.event.getArg('userinfo') />

			<!---<cfdump var="#local#" abort="true" />--->

			<cfif IsObject(local.restUri)>
				<cfset local.restResponseBody = callEndpointFunction(local.restUri, event) />
				<cfset addContentTypeHeaderFromFormat(event.getArg("format", "")) />
				<cfset arguments.event.setArg("_responseBody", local.restResponseBody) />
				<cfsetting enablecfoutputonly="false" /><cfoutput>#local.restResponseBody#</cfoutput><cfsetting enablecfoutputonly="true" />	
			<cfelse>
				<cfthrow type    = "404"
					     message = "No URI Found"
					     detail  = "No REST URI was found for '#local.pathinfo#', httpMethod='#local.httpMethod#'" />
			</cfif>
		<!--- </cfif> --->
	</cffunction>
	--->
	

	<cffunction name="postProcess" access="public" output="false"
		hint="I am step 3/3 of the API call cycle. I am preceded by handleRequest() and I tie loose end before shipping back the generated response.">     
     	<cfargument name="event" type="MachII.framework.Event" required="true" />   
		<cfscript>	
		 	local.uri        = arguments.event.getArg('uri', arguments.event.getArg('pathInfo'));
		    //local.version    = listGetAt(listGetAt(local.uri,1,"/"),1,"."); 
		 	//local.location   = listSetAt(local.uri,1,local.version,"/");
		 	local.location  = "test";
		 	local.rHeaders   = arguments.event.getArg('responseHeaders',[]);
		 	local.statusCode = arguments.event.getArg('statusCode','');
		 	local.status     = arguments.event.getArg('status',false);
		 	local.response   = (event.isArgDefined("_responseBody")) ? event.getArg('_responseBody') : '';
		 	local.event      = arguments.event;
		 	local.utcNow     = dateConvert("local2Utc",now());
		 	local.rightNow   = dateFormat(local.utcNow,"ddd, DD mmm YYYY") & " " & timeFormat(local.utcNow,"HH:MM:ss") & " GMT";
		 	
		 	writedump(var=local, abort="true");

		 	// set static headers
		 	setResponseHeader("Location","#local.location#",true); 
		 	setResponseHeader("Content-Size","#getPageContext().getCFOutput().getBuffer().size()#",true);
			setResponseHeader("Cache-Control","private,no-store,no-cache,must-revalidate",true); 		 	
		 	setResponseHeader("Expires","#local.rightNow#",true); 
		 	
		 	// set dynamic headers by looping over event.responseHeaders
		 	if( arraylen(local.rHeaders) GTE 1){
		 		local.it = local.rHeaders.iterator();                 
                 
            	while(local.it.hasNext()){                 
                 	local.rhi = it.next();  
                 	setResponseHeader(headerName  = local.rhi.headerName,
                 					  headerValue = local.rhi.headerValue);               
                }
		 	}
		 	
		 	if(len(local.statusCode)){
		 		getpagecontext().getresponse().setstatus(local.statusCode);
		 	}
		</cfscript>     
	</cffunction>

	
		<cffunction name="onException" access="public" returntype="void" output="false" 
		hint="Override abstract onException() to report exceptions in our private API">
		<cfargument name="event"      type="MachII.framework.Event" required="true">
		<cfargument name="in_cfcatch" type="any"                    required="true" hint="The in_cfcatch object generated by an exception.">

		<cfset local.stcHeaders    = StructNew() />
		<cfset local.strHeaderName = "" />
		<cfset local.key           = event.getArg("key", "") />
		<cfset local.type          = (arguments.in_cfcatch.getType() EQ "") ? "unknown" : arguments.in_cfcatch.getType()>
		<cfset local.message       = arguments.in_cfcatch.getMessage()>
		<cfset local.detail        = arguments.in_cfcatch.getDetail()>
		<cfset local.context       = arguments.in_cfcatch.getTagContext()>
		<cfset local.rHeaders      = arguments.event.getArg('responseHeaders',[])>
		<cfset local.dump          = arguments.event.getArg('dump') IS true && application.serverType EQ "dev" ? true : false>
		
		<!--- clear out existing response headers --->
		<cfset arguments.event.setArg('responseHeaders',[])>
		
		<cfif listFind('400,401,403,404,505',local.type)>
			<cfheader statuscode="#local.type#" statustext="#local.message#" />
			<cfset local.stcHeaders["X-Error-Message"] = "#local.message#" />
			<cfset local.stcHeaders["X-Error-Detail"]  = "#local.detail#" />
		<cfelse>
			<cfheader statusCode="500" statusText="Server Error" />
			<cftry>
				<cfset local.stcHeaders["X-Error-Message"] = "Server Error" />
				
			    <cfif application.serverType EQ "dev">
					<cfset local.stcHeaders["X-Error-Detail"] = "#arguments.in_cfcatch.getMessage()#" />
					
					<cfloop list="1,2,3" index="iErrorLine" >
						<!---for intf developers eyes only!!!--->
						<cfset local.stcHeaders["X-Error-Detail"] = local.stcHeaders["X-Error-Detail"] & " Template: #local.context[iErrorLine].template# (Line:#local.context[iErrorLine].line#)" />
					</cfloop>
				<cfelse>
					<cfset local.stcHeaders["X-Error-Detail"] = "Unhandled server error on #getGMTDateTime()#." />
				</cfif>
			    
			    <cfcatch type="any">
			        <cfset local.stcHeaders["X-Error-Detail"] = "Unhandled server error on #getGMTDateTime()#. Contact us for more info" />
			    </cfcatch>
			</cftry>

			<!--- Email Tech Team API Error Alert --->
			<cfmail to      = "#application.devEmails#" 
					from    = "help@interfolio.com" 
					subject = "Private API Error" 
					type    = "html">
						<cfdump var="#local.stcHeaders#" label="response headers">
                        <cfdump label="Private API Error Info" var="#arguments.in_cfcatch.getCaughtException()#" metainfo="true">
			</cfmail>
		</cfif>
				       
		<!--- Email Tech Team API Error Alert --->
		
            <cfdump label    ="Private API Error Info" 
                    var      ="#arguments.in_cfcatch.getCaughtException()#" 
                    metainfo ="true" 
                    abort    ="true">
	
				
		<!--- Create cfheader entries for each header in the struct, and add them to the log. --->
		<cfloop collection="#local.stcHeaders#" item="local.strHeaderName">
			<cfheader name="#local.strHeaderName#" value="#local.stcHeaders[local.strHeaderName]#" />	
		</cfloop>	
	</cffunction>
	
	
	
	<cffunction name="setResponseFormat" access="private" output="true" returntype="void"
		hint="I set the response format based on the file extension passed in the request or I assign the default: JSON">     
     	<cfargument name="event" type="MachII.framework.Event" required="true" />
     	<cfset arguments.event.setArg('format','json')>
	 </cffunction>
    
    
    <cffunction name="getGMTDateTime" access="public" output="false" returntype="string">    
    	<cfargument name="date" type="any" default="">    
    	<cfscript>
			local.timeZoneInfo = GetTimeZoneInfo();
			local.inDateTime   = (arguments.date EQ "" OR !isDate(arguments.date)) ? now() : arguments.date;	
			local.inDateTime2  = dateAdd("h",local.timeZoneInfo.utcHourOffset,local.inDateTime); // offset to GMT based on DST
			local.outDate      = dateFormat(local.inDateTime2,"YYYYMMDD");
			local.outTime      = timeFormat(local.inDateTime2,"HH:mm:ss");
			
			return local.outDate & " " & local.outTime & " GMT"; 
    	</cfscript>    
    </cffunction>
    
     
    <cffunction name="setResponseHeader" access="private" output="false" returntype="void">    
    	<cfargument name="headerName"  type="string" required="true">   
		<cfargument name="headerValue" type="string" required="true"> 
		<cfargument name="final"       type="boolean" 	default="false" 
		hint="Only set to true when you want to set the header directly as opposed to storing it in the event for later processing">
		<cfscript>
			// based on this list of response headers (Trust me the w3 spec is too much of a pain to read): 
			// en.wikipedia.org/wiki/List_of_HTTP_header_fields
			local.standardHeaders = "Accept,Age,Allow,Cache-Control,Connection,Content,Date,ETag,Expires,Last-Modified,Link,Location,
			P3P,Pragma,Proxy-Authenticate,Refresh,Retry-After,Server,Set-Cookie,Strict,Trailer,Transfer-Encoding,Vary,Warning,WWW-Authenticate";
			
			local.response = getpagecontext().getresponse();
			
            if(arguments.final is true){
				// create header FOR REAL - be warned that headers might collide with each others unless you create all of them at the same time 
				// For now, unless you are using this function in POSTPROCESS(), only pass in the first 2 attributes or set this to FALSE
				try{
					if(listFind(local.standardHeaders,arguments.headerName) GT 0){
						// Regular HTTP Header
						local.response.setHeader("#arguments.headerName#","#arguments.headerValue#");
					}
					else if(findNoCase("X-",arguments.headerName) EQ 0){
						// Custom Header, prefix with X-
						local.response.setHeader("X-#arguments.headerName#","#arguments.headerValue#");
					}
				}
				catch (any e){
					// Some Response do not have the setheader() available to them
					// FYI I HATE setting empty catch blocks but local.response is a java object and local.reponse.getMethods() doesn't work...
				}
			}else{
				// LAZY CREATION - append to event for later creation
				if(!structKeyExists(request,"responseHeaders") OR !isArray(request.responseHeaders)){
					request.responseHeaders = [];
				}
				
				// create struct with headers param
				local.headerParams = {
					headerName  = arguments.headerName,
					headerValue = arguments.headerValue
				};
				
				// append to request responseHeaders
				arrayAppend(request.responseHeaders,local.headerParams);
			}
		</cfscript>  
    </cffunction>

    <cffunction name="handleGetObjects" access="public" output="false" returntype="string">
		<cfargument name="event"     type="component"   required="true" />
		<cfargument name="isPrivate" type="boolean"   default="false">
		<cfscript>
			local.userinfo  = arguments.event.getArg('userinfo',0);
			local.urlString = arguments.event.getArg('portfoliourl');

			if( !validateUserInfo(local.userInfo) ){
				throw(type    = "404",
		          	  message = "Invalid User Info",
		          	  detail  = "Make sure you are logged in and check app cookie");
			}
			else{

				if(arguments.isPrivate){
					// private GETs are only available to record owner
					local.basic_id = getBasicInfo(	urlString = "",
					                 				userInfo  = local.userInfo);
				}
				else{
					local.basic_id = getBasicInfo( urlString = local.urlString,
				                 				   userInfo  = local.userInfo);
				}
				
				return getJSONData(local.basic_id);
			}
		</cfscript>	
	</cffunction>
	
	
	<cffunction name="handleUpdateObject" access="public" output="false" returntype="string">
		<cfargument name="event" type="component" required="true" />
		<cfscript>
			local.args.userinfo = arguments.event.getArg('userinfo',{});
			local.args.action   = arguments.event.getArg('action');
			local.args.data     = jsonHelper.toObject(arguments.event.getArg('data'));

			validatePostRequest(local.args.action, local.args.userinfo, local.args.data);

			// get basic_id
			local.args.basic_id = getBasicInfo(urlString = "",
										       userInfo  = local.args.userInfo);

			// populate id based on basic_id if not present (for basicsEndpoint)
			local.args.data[1].id = structKeyExists(local.args.data[1], "id") ? local.args.data[1].id : local.args.basic_id;

			local.oRequest = createObject("component","intfroot.api.private.model.portfolio.updateObjectRequest").init(argumentCollection=local.args);
		
			// process requested action
			switch(oRequest.getaction()){
				case 'save':
					saveObjects(oRequest);
				break;

				case 'delete':
					deleteObjects(oRequest);
				break;
			}
			
			return getJSONData(oRequest.getbasic_id());
		</cfscript>
	</cffunction>
	
	
	<cffunction name="saveObjects" access="public" output="false" returntype="void">
		<cfargument name="oRequest" type="component" required="true" />
		<cfscript>
			local.arrData  = arguments.oRequest.getdata();

			// loop over array and determine if we need to update or create a record
			for(local.i = 1; i lte arrayLen(local.arrData); local.i++){
				// grab single structure
				local.stParams          = local.arrData[local.i];
				local.stParams.basic_id = arguments.oRequest.getBasic_ID();

				// get numeric value from id string
				local.stParams.id = replace(local.arrData[local.i].id,getIDPrefix(),'');

				// no one should be allowed to create/update/delete other people's records
				if(local.stParams.id NEQ "" && local.stParams.id NEQ 0){
					local.qOwner = checkOwnership(basicid = local.stParams.basic_id,
				                                  id      = local.stParams.id);
					if(!local.qOwner.recordcount){
						throwPermissionDenied();
					}
				}
				
				// set action specific arguments
				local.args = validateSaveArguments(	stParams = local.stParams,
													userinfo = oRequest.getuserInfo(),
				                                    action   = oRequest.getaction(),
				                                    basic_id = oRequest.getbasic_id());

				save(local.args);
			}
		</cfscript>
	</cffunction> 

	
	<cffunction name="deleteObjects" access="public" output="false" returntype="void">
		<cfargument name="oRequest" type="component" required="true" />
		<cfscript>
			local.arrData  = oRequest.getdata();
			local.basic_id = arguments.oRequest.getBasic_ID();

			// delete specific subsection
			for(local.i = 1; local.i lte arrayLen(local.arrData); local.i++){
				local.id = replace(local.arrData[local.i].id,getIDPrefix(),'');

				// validate id attribute is present
				local.error = validateRequired(paramName  = 'id', 
			                          		   paramValue = local.id);
				if(len(local.error)){
					throwParameterError(local.error);
				}
				else{
					local.qOwner = checkOwnership(basicid = local.basic_id,
					                              id      = local.id);

					if(!local.qOwner.recordcount){
						throwPermissionDenied();
					}
					else{
						delete(local.id);
					}
				}
			}
		</cfscript>
	</cffunction>

	<cffunction name="toJSON" access="private" output="false" returntype="String">
		<cfargument name="dataStruct" type="any" required="true" />
		<cfreturn variables.jsonHelper.toJSON(arguments.dataStruct)>		
	</cffunction>

</cfcomponent>