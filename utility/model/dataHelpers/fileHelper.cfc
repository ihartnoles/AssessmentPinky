<cfcomponent output="false" displayname="File Helper">

	<cffunction name="getMimeType" access="public" output="false" returntype="string">
		<cfargument name="extension" type="string" default="" />
		
		<cfset var mimetype = "" />
		
		<cfswitch expression="#arguments.extension#">
			<cfcase value="doc,docx,dot">
				<cfset mimetype="application/msword">
			</cfcase>
			<cfcase value="pdf">
				<cfset mimetype = "application/pdf">
			</cfcase>
			<cfcase value="xls,xlsx">
				<cfset mimetype="application/vnd.ms-excel">
			</cfcase>
			<cfcase value="wpd">
				<cfset mimetype="application/wordperfect">
			</cfcase>
			<cfcase value="rtf">
				<cfset mimetype="application/rtf">
			</cfcase>
			<cfcase value="ppt,pptx">
				<cfset mimetype="application/powerpoint">
			</cfcase>
			<cfcase value="txt">
				<cfset mimetype="text/plain">
			</cfcase>
			<cfcase value="html,htm">
				<cfset mimetype="text/html">
			</cfcase>
			<cfcase value="jpeg,jpg">
				<cfset mimetype="image/jpeg">
			</cfcase>
			<cfcase value="bmp">
				<cfset mimetype="image/bmp">
			</cfcase>
			<cfcase value="png">
				<cfset mimetype="image/x-png">
			</cfcase>
			<cfcase value="gif">
				<cfset mimetype="image/gif">
			</cfcase>
			<cfcase value="tif,tiff">
				<cfset mimetype="image/tiff">
			</cfcase>
			<cfcase value="odt">
				<cfset mimetype="application/vnd.oasis.opendocument.text">
			</cfcase>
			<cfdefaultcase>
				<cfset mimetype = "application/octet-stream" />
			</cfdefaultcase>
		</cfswitch>
		
		<cfreturn mimetype />
	</cffunction>

	<cffunction name="getUniqueFilePath" access="public" output="false" returntype="string">
		<cfargument name="directory"	type="string" required="true" />
		<cfargument name="fileName"		type="string" required="true" />
		<cfscript>
			local.filePath = arguments.directory & arguments.filename;

			if(fileExists(local.filePath)){
				local.extension	= getFileExtension(arguments.filename);
				local.docTitle	= replace(arguments.filename, local.extension, '');

				local.copyNumber = 0;
				local.duplicateTitle = true;
				while(local.duplicateTitle eq true){
					local.copyNumber++;
					local.filePath = arguments.directory & local.docTitle & "(#local.copyNumber#)" & local.extension;
					local.duplicateTitle = fileExists(local.filePath);
				}
			}

			return local.filePath;
		</cfscript>
	</cffunction>
	
	
	<cffunction name="getCleanFilename" access="public" output="false" returntype="string" hint="I make sure a filename has no protected characters">
		<cfargument name="filename" type="string" required="true" />
		<cfreturn rereplace(arguments.filename, '[\\/:\*\?\<\>\|"]','','all') />
	</cffunction>
	
	
	<cffunction name="getFileExtension" access="public" output="false" returntype="string">
		<cfargument name="filename" type="string" required="true" />
		<cfscript>
			local.beginExtension = arguments.filename.lastIndexOf('.');
			local.extension = local.beginExtension gt 0
								? mid(arguments.filename, local.beginExtension + 1, len(arguments.fileName) - local.beginExtension)
								: '';
			return local.extension;
		</cfscript>
	</cffunction>

</cfcomponent>