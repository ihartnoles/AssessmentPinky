
<cfcomponent name="ALCDocumentsService" output="false">

	<cffunction name="init" access="public" output="false" returntype="ALCDocumentsService">
		<cfargument name="ALCDocumentsDAO" type="ALCDocumentsDAO" required="true" />
		<cfargument name="ALCDocumentsGateway" type="ALCDocumentsGateway" required="true" />

		<cfset variables.ALCDocumentsDAO = arguments.ALCDocumentsDAO />
		<cfset variables.ALCDocumentsGateway = arguments.ALCDocumentsGateway />

		<cfreturn this/>
	</cffunction>

	<cffunction name="createALCDocuments" access="public" output="false" returntype="ALCDocuments">
		<cfargument name="DocumentID" type="numeric" required="true" />
		<cfargument name="ReportingUnitID" type="numeric" required="false" />
		<cfargument name="DocumentName" type="string" required="false" />
		<cfargument name="UploadedDocumentName" type="string" required="false" />
		<cfargument name="UploadUserID" type="numeric" required="false" />
		<cfargument name="UploadDate" type="date" required="false" />
		
			
		<cfset var ALCDocuments = createObject("component","ALCDocuments").init(argumentCollection=arguments) />
		<cfreturn ALCDocuments />
	</cffunction>

	<cffunction name="getALCDocuments" access="public" output="false" returntype="ALCDocuments">
		<cfargument name="DocumentID" type="numeric" required="true" />
		
		<cfset var ALCDocuments = createALCDocuments(argumentCollection=arguments) />
		<cfset variables.ALCDocumentsDAO.read(ALCDocuments) />
		<cfreturn ALCDocuments />
	</cffunction>

	<cffunction name="getALCDocumentss" access="public" output="false" returntype="array">
		<cfargument name="DocumentID" type="numeric" required="false" />
		<cfargument name="ReportingUnitID" type="numeric" required="false" />
		<cfargument name="DocumentName" type="string" required="false" />
		<cfargument name="UploadedDocumentName" type="string" required="false" />
		<cfargument name="UploadUserID" type="numeric" required="false" />
		<cfargument name="UploadDate" type="date" required="false" />
		
		<cfreturn variables.ALCDocumentsGateway.getByAttributes(argumentCollection=arguments) />
	</cffunction>

	
	<cffunction name="uploadALCdocument" access="public" output="false" returntype="any">
		<cfargument name="ReportingUnitID" type="numeric" required="false" />
		<cfargument name="UploadedDocumentName" type="string" required="false" />
		<cfargument name="UploadUserID" type="numeric" required="false" />
		<cfargument name="UploadDate" type="date" required="false" />
		
		<!---
		<cfdump var="#arguments#" abort="false" label="@@ALCDocumentsService_1" />
		<cfdump var="#request.event.getArgs()#" abort="true" label="@@ALCDocumentsService_2" />
		--->

		<cfreturn variables.ALCDocumentsGateway.getByAttributes(argumentCollection=arguments) />
	</cffunction>


	<cffunction name="saveALCDocuments" access="public" output="false" returntype="numeric">
		<cfargument name="ALCDocuments" type="ALCDocuments" required="true" />

		<cfreturn variables.ALCDocumentsDAO.save(ALCDocuments) />
	</cffunction>

	<cffunction name="deleteALCDocuments" access="public" output="false" returntype="boolean">
		<cfargument name="DocumentID" type="numeric" required="true" />
		
		<!--- creeate the bean --->
		<cfset local.ALCDocuments = createALCDocuments(argumentCollection=arguments) />

		<cfset local.ALCdoc = ALCExists(documentID = arguments.documentID) />
		<cfset local.destination = application.ALCDocDirectory />
		<cfset local.FileToRead  = local.destination & local.ALCDoc.documentname />
		
		<!--- delete physical file --->
		<cffile action	= "delete"
				file	= "#local.FileToRead#" >

		<!--- delete record from DB --->
		<cfreturn variables.ALCDocumentsDAO.delete(local.ALCDocuments) />

	</cffunction>

	<cffunction name="downloadALCDocument" access="public" output="false" returntype="any">
		<cfargument name="documentID" type="numeric" required="true" />
		
		<cfset local.filecontents = "" />
		<cfset local.ALCdoc = ALCExists(documentID = arguments.documentID) />
		<cfset local.destination  = application.ALCDocDirectory />
		<cfset local.FileToRead  = local.destination & local.ALCDoc.documentname />
		<cfset local.tmp 		 = listlast(local.FileToRead,'.') />
		<cfset local.fileext     = "." & local.tmp />
		
		<!--- determine mime type --->
		<cfset var local.fileMimeType = ''>

		<cfswitch expression="#LCASE(local.fileext)#">
			<cfcase value="txt,js,css,cfm,cfc,html,htm,jsp">
				<cfset local.fileMimeType = 'text/plain'>
			</cfcase>
			<cfcase value="gif">
				<cfset local.fileMimeType = 'image/gif'>
			</cfcase>
			<cfcase value="jpg">
				<cfset local.fileMimeType = 'image/jpg'>
			</cfcase>
			<cfcase value="png">
				<cfset local.fileMimeType = 'image/png'>
			</cfcase>
			<cfcase value="wav">
				<cfset local.fileMimeType = 'audio/wav'>
			</cfcase>
			<cfcase value="mp3">
				<cfset local.fileMimeType = 'audio/mpeg3'>
			</cfcase>
			<cfcase value="pdf">
				<cfset local.fileMimeType = 'application/pdf'>
			</cfcase>
			<cfcase value="zip">
				<cfset local.fileMimeType = 'application/zip'>
			</cfcase>
			<cfcase value="ppt">
				<cfset local.fileMimeType = 'application/vnd.ms-powerpoint'>
			</cfcase>
			<cfcase value="doc,docx">
				<cfset local.fileMimeType = 'application/msword'>
			</cfcase>
			<cfcase value="xls,xlsx">
				<cfset local.fileMimeType = 'application/vnd.ms-excel'>
			</cfcase>
			<cfdefaultcase>
				<cfset local.fileMimeType = 'application/octet-stream'>
			</cfdefaultcase>
		</cfswitch>
		 <!--- More mimeTypes: http://www.iana.org/assignments/media-types/application/ --->

		<!--- Set content header --->
		<cfheader name="content-disposition" value='attachment; filename="#local.ALCDoc.documentname#"'>
		<cfcontent type="#local.fileMimeType#" file="#local.FileToRead#" deletefile="false">
	

		<cfreturn local.filecontents />
	</cffunction>

	<cffunction name="ALCExists" access="public" output="false" returntype="query">
		<cfargument name="documentID" type="numeric" required="false" />
		
		
		<cfreturn variables.ALCDocumentsGateway.getByAttributesQuery(argumentCollection=arguments) />
	</cffunction>

	<cffunction name="onMissingMethod" access="public" output="false" >
		<cfargument name="missingMethodName" type="string" hint="Name of missing method" />
		<cfargument name="missingMethodArguments" type="any" hint="Arguments passed to the missing method, maybe a named arg set or a numerically indexed set" />

		<cfset var ret = ""/>
		<cfinvoke component="#variables.ALCDocumentsGateway#" 
				  method="#arguments.missingMethodName#" 
				  argumentcollection="#arguments.missingMethodArguments#" 
				  returnvariable="ret"/>
		<cfreturn ret />
	</cffunction>

</cfcomponent>
