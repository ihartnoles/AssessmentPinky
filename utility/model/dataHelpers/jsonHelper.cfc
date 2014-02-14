<cfcomponent output="false">

	<cffunction name="init" returntype="jsonHelper" access="public">
		<cfif structKeyExists(application,"javaLoader")>
			<cfset local.javaLoader = application.javaLoader />
		<cfelse>
			<cfset local.loadPaths = [expandPath('/Assessment/utility/lib/json_simple-1.1.jar')]>
			<cfset local.javaLoader = createObject("component", "Assessment.utility.model.javaloader.JavaLoader").init(local.loadPaths)> 
		</cfif>

		<cfset variables.jsonLib = local.javaLoader.create('org.json.simple.JSONValue')>
		<cfreturn this />
	</cffunction>
	
	
	<cffunction name="mergeJSON" returntype="String" access="public" hint="Serializes the Applicant and CustomForm input data to a merged JSON String.">
		 <cfargument name="CustomForm" type="Any" required="true" hint="The CustomForm input data object to convert to JSON" />
		 <cfargument name="Applicant"  type="Any" required="true" hint="The Applicant input data object to convert to JSON" />	
		<cfset local.data = {
			CustomForm = isQuery(arguments.CustomForm) ? QueryToStruct(arguments.CustomForm) : arguments.CustomForm,
			Applicant  = isQuery(arguments.Applicant) ? QueryToStruct(arguments.Applicant) : arguments.Applicant	
		}>
		
		<cfreturn toJSON(local.data)>
	</cffunction> 


	<cffunction name="toObject" returntype="any" access="public" hint="Deserialize a JSON string representation to a Struct or an Array, depending on the input.">
		<cfargument name="strData" type="Any" required="true" />
		<<cfscript>
			// This object may contain a JSONObject or JSONArray, depending on input String
			local.oLib = "";
			local.oCF  = "";
			
			if (isJSON(arguments.strData)){
				local.oLib = variables.jsonLib.parseWithException(arguments.strData);
				
				if(IsStruct(local.oLib)){
					local.oCF = makeJSONObjectIntoStruct(local.oLib);
				}
				else if(IsArray(local.oLib)){
					local.oCF = makeJSONArrayIntoNormalArray(local.oLib);
				}
			}
			
			return local.oCF;
		</cfscript>
	</cffunction>


	<cffunction name="makeJSONObjectIntoStruct" returntype="Struct" access="private" hint="Copy a JSONObject to a ColdFusion Struct, removing Java-null value elements.">
		<cfargument name="objFromJsonLib" type="Any" required="true" />
		
		<cfset var objData = {} />
		<cfset var currKey = "" />

		<!--- The JSON-Simple JSONObject uses case-sensitive keys, so StructAppend 'casts' it to a CF Struct with case-insensitive keys. --->
		<cfset StructAppend(objData, arguments.objFromJsonLib) />
		
		<cfloop array="#StructKeyArray(objData)#" index="currKey">
			<cfif NOT StructKeyExists(objData, currKey)>
				<cfset StructDelete(objData, currKey) />
			<cfelseif IsStruct(objData[currKey])>
				<cfset objData[currKey] = makeJSONObjectIntoStruct(objData[currKey]) />
			<cfelseif IsArray(objData[currKey])>
				<cfset objData[currKey] = makeJSONArrayIntoNormalArray(objData[currKey]) />
			</cfif>
		</cfloop>

		<cfreturn objData />
	</cffunction>


	<cffunction name="makeJSONArrayIntoNormalArray" returntype="Array" access="private" 
		hint="Copy a JSONArray to a ColdFusion Array, Converting inner-elements into Structs or arrays as necessary.">
		<cfargument name="objFromJsonLib" type="Any" required="true" />
		
		<cfset var objData     = ArrayNew(1) />
		<cfset var i           = 0 />
		<cfset var currElement = "" />
		<cfset var objElement  = "" />

		<cfloop from="1" to="#ArrayLen(objFromJsonLib)#" index="i">
			<cfset currElement = objFromJsonLib[i] />
			<cfif IsStruct(currElement)>
				<cfset ArrayAppend(objData, makeJSONObjectIntoStruct(currElement)) />
			<cfelseif IsArray(currElement)>
				<!--- Recursively call this method for nested arrays --->
				<cfset ArrayAppend(objData, makeJSONArrayIntoNormalArray(currElement)) />
			<cfelse>
				<cfset ArrayAppend(objData, currElement) />
			</cfif>
		</cfloop>

		<cfreturn objData />
	</cffunction>
	
	
	<cffunction name="QueryToStruct" returntype="any" hint="Converts a query to a struct, or an array of structs">
	    <cfargument name="query"      type="query" required="true"/>
	    <cfargument name="row"        type="query"/>
	    <cfargument name="forceArray" type="boolean" default="false"/>
	    <cfargument name="dateFormat" type="string"  default="">
	    <cfscript>
		    local.result       = {};
		    local.idx          = "";
		    local.colName      = "";
		    local.columnLabels = arguments.query.getMetaData().getColumnLabels();

		    if(isDefined("arguments.row")){
		    	local.row = arguments.row;
			}
			else if(arguments.query.recordCount eq 1){
				local.row = 1;
			}

			if(isDefined("local.row") and not arguments.forceArray){
				for(var a=1; a lte arrayLen(local.columnLabels); a++){
					local.colName    = columnLabels[a];
					local.currentVal = arguments.query[local.colName][local.row];

					if(isDate(local.currentVal)){
						local.currentVal = arguments.dateFormat EQ "" ? "#DateFormat(arguments.query[local.colName][local.row], "YYYY-MM-DD")# #TimeFormat(arguments.query[local.colName][local.row], "HH:MM:SS.L")#"
																	  : "#DateFormat(arguments.query[local.colName][local.row], arguments.dateFormat)#";
					}
					StructInsert(local.result, local.colName, local.currentVal);
				}		
			}
			else if(isDefined("local.row")){
				local.result = ArrayNew(1);
				ArrayAppend(local.result, {});

				for(var b=1; b lte arrayLen(local.columnLabels); b++){
					local.colName    = columnLabels[b];
					local.currentVal = arguments.query[local.colName][local.row];

					if(isDate(local.currentVal)){
						local.currentVal = arguments.dateFormat EQ "" ? "#DateFormat(arguments.query[local.colName][local.row], "YYYY-MM-DD")# #TimeFormat(arguments.query[local.colName][local.row], "HH:MM:SS.L")#"
																	  : "#DateFormat(arguments.query[local.colName][local.row], arguments.dateFormat)#";
					}				
					StructInsert(local.result[1], local.colName, local.currentVal);
				}
			}
			else {
				local.result = ArrayNew(1);

				for(var c=1; c lte arguments.query.recordCount; c++){
					local.tempStruct = {};

					for(var d=1; d lte arrayLen(local.columnLabels); d++){
						local.colName    = columnLabels[d];
						local.currentVal = arguments.query[local.colName][c];

						if(isDate(local.currentVal)){
							local.currentVal = arguments.dateFormat EQ "" ? "#DateFormat(arguments.query[local.colName][c], "YYYY-MM-DD")# #TimeFormat(arguments.query[local.colName][c], "HH:MM:SS.L")#"
																		  : "#DateFormat(arguments.query[local.colName][c], arguments.dateFormat)#";
						}
			            StructInsert(local.tempStruct, local.colName, local.currentVal);
					}
					ArrayAppend(local.result, local.tempStruct);
				}
			}

			return local.result;
	    </cfscript>
	</cffunction>


	<!---
	 Serializes data to JSONP format for cross domain JSON requests.
	 
	 @param data      Data to be converted into JSON. (Required)
	 @param callback      The function call that will wrap the output. (Required)
	 @return Returns a string. 
	 @author Steve Good (sgood@lanctr.com) 
	 @version 0, June 11, 2009 
	--->
	<cffunction name="serializeToJSONP" displayname="Serialize to JSONp" hint="Serializes supplied data in JSONp format" output="false" returntype="any">
	    <cfargument name="data"     displayName="data" 	   type="any" 	 hint="The data to serialize" 	  required="true" />
	    <cfargument name="callback" displayName="callback" type="string" hint="the jsonp callback to use" required="true" />
	    <cfset local.jsonp = arguments.callback & '(' & serializeJSON(arguments.data) & ')'>
	    <cfreturn local.jsonp>
	</cffunction>


	<cffunction name="jsonStringToHtml" access="public" output="false" hint="Borrowed from codeDaySpa: https://github.com/adampresley/codedayspa">
		<cfargument name="input" type="string" required="true" />

		<cfset var JSON       = "" />
		<cfset var serializer = "" />
		<cfset var result     = "" />

		<cfif trim(left(arguments.input, 1)) EQ "[">
			<cfset JSON = createObject("java", "net.sf.json.JSONArray") />
		<cfelse>
			<cfset JSON = createObject("java", "net.sf.json.JSONObject") />
		</cfif>

		<cfset serializer = JSON.fromObject(arguments.input) />

		<cfset result = htmlCodeFormat(serializer.toString(3, 0)) />
		<cfset result = reReplaceNoCase(result, "<pre\s*>", "<pre class=""prettyprint lang-js"">", "ALL") />

		<cfreturn result />
	</cffunction>


	<cffunction name="toJSON" returntype="String" access="public" hint="Serialize the input data to a JSON String. ">
		<cfargument name="objData"    type="Any"        required="true" hint="The input object to convert to JSON"/>
		<cfargument name="dateFormat" type="string" default="">

		<cfset local.data = isQuery(arguments.objData) ? QueryToStruct(query      = arguments.objData, 
		                                                               forceArray = true,
		                                                               dateFormat = arguments.dateFormat) 
														 : arguments.objData>
		<cfreturn "#variables.jsonLib.toJSONString(local.data)#" />
	</cffunction>


	<cffunction name="querytoJsonArray" returntype="array" access="public">
		<cfargument name="qQuery"    type="query"        required="true" hint="The input query to convert to JSON"/>
		<cfargument name="dateFormat" type="string" default="">
		<cfreturn QueryToStruct(query      = arguments.qQuery, 
		                        forceArray = true,
		                        dateFormat = arguments.dateFormat) >
	</cffunction>

</cfcomponent>