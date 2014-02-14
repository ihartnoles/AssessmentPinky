
<cfcomponent name="assessmentPlanSupportingDocumentsService" output="false">

	<cffunction name="init" access="public" output="false" returntype="assessmentPlanSupportingDocumentsService">
		<cfargument name="assessmentPlanSupportingDocumentsDAO" type="assessmentPlanSupportingDocumentsDAO" required="true" />
		<cfargument name="assessmentPlanSupportingDocumentsGateway" type="assessmentPlanSupportingDocumentsGateway" required="true" />

		<cfset variables.assessmentPlanSupportingDocumentsDAO = arguments.assessmentPlanSupportingDocumentsDAO />
		<cfset variables.assessmentPlanSupportingDocumentsGateway = arguments.assessmentPlanSupportingDocumentsGateway />

		<cfreturn this/>
	</cffunction>

	<cffunction name="createassessmentPlanSupportingDocuments" access="public" output="false" returntype="assessmentPlanSupportingDocuments">
		<cfargument name="RecordID" type="numeric" required="true" />
		<cfargument name="OutcomeID" type="numeric" required="false" />
		<cfargument name="FileName" type="string" required="false" />
		<cfargument name="FileNameUploaded" type="string" required="false" />
		<cfargument name="FileDescription" type="string" required="false" />
		<cfargument name="FileUserID" type="numeric" required="false" />
		<cfargument name="DateInserted" type="date" required="false" />
		
			
		<cfset var assessmentPlanSupportingDocuments = createObject("component","assessmentPlanSupportingDocuments").init(argumentCollection=arguments) />
		<cfreturn assessmentPlanSupportingDocuments />
	</cffunction>

	<cffunction name="getassessmentPlanSupportingDocuments" access="public" output="false" returntype="assessmentPlanSupportingDocuments">
		<cfargument name="RecordID" type="numeric" required="true" />
		
		<cfset var assessmentPlanSupportingDocuments = createassessmentPlanSupportingDocuments(argumentCollection=arguments) />
		<cfset variables.assessmentPlanSupportingDocumentsDAO.read(assessmentPlanSupportingDocuments) />
		<cfreturn assessmentPlanSupportingDocuments />
	</cffunction>

	<cffunction name="getassessmentPlanSupportingDocumentss" access="public" output="false" returntype="array">
		<cfargument name="RecordID" type="numeric" required="false" />
		<cfargument name="OutcomeID" type="numeric" required="false" />
		<cfargument name="FileName" type="string" required="false" />
		<cfargument name="FileNameUploaded" type="string" required="false" />
		<cfargument name="FileDescription" type="string" required="false" />
		<cfargument name="FileUserID" type="numeric" required="false" />
		<cfargument name="DateInserted" type="date" required="false" />
		
		<cfreturn variables.assessmentPlanSupportingDocumentsGateway.getByAttributes(argumentCollection=arguments) />
	</cffunction>

	<cffunction name="saveassessmentPlanSupportingDocuments" access="public" output="false" returntype="boolean">
		<cfargument name="assessmentPlanSupportingDocuments" type="assessmentPlanSupportingDocuments" required="true" />

		<cfreturn variables.assessmentPlanSupportingDocumentsDAO.save(assessmentPlanSupportingDocuments) />
	</cffunction>

	<cffunction name="deleteassessmentPlanSupportingDocuments" access="public" output="false" returntype="boolean">
		<cfargument name="RecordID" type="numeric" required="true" />
		<cfargument name="doctype" type="string" required="true" />

		<!--- creeate the bean --->
		<cfset local.documents 	 = getassessmentPlanSupportingDocuments(argumentCollection=arguments) />
		<cfset local.doc 		 = DocExists(recordID = arguments.recordID) />
		<cfif arguments.doctype eq 'support'>
			<cfset local.destination  = application.SupportDocDirectory />
		<cfelse>
			<cfset local.destination  = application.ALCDocDirectory />
		</cfif> 

		<!---
		<cfdump var="#local#" abort="true" label="@@assPlanSupportingDocsService" />
		--->

		<cfset local.FileToRead  = local.destination & local.doc.filename />
		
		<!--- delete physical file --->
		<cffile action	= "delete"
				file	= "#local.FileToRead#" >

		<cfreturn variables.assessmentPlanSupportingDocumentsDAO.delete(local.documents) />
	</cffunction>

	<cffunction name="downloadDocument" access="public" output="false" returntype="any">
		<cfargument name="recordID" type="numeric" required="true" />
		<cfargument name="doctype" type="string" required="true" />
		
		<cfset local.filecontents = "" />
		<cfset local.doc 		  = DocExists(recordID = arguments.recordID) />
		
		<!---
		<cfdump var="#application#" abort="false" label="@@aaplansupdocservice_1" />
		--->

		<cfif arguments.doctype eq 'support'>
			<cfset local.destination  = application.SupportDocDirectory />
		<cfelse>
			<cfset local.destination  = application.ALCDocDirectory />
		</cfif> 
		
		<!---
		<cfdump var="#arguments#" abort="false" label="@@aaplansupdocservice_2" />
		<cfdump var="#local#" abort="true" label="@@aaplansupdocservice_3" />
		--->

		<cfset local.FileToRead   = local.destination & local.doc.filename />
		<cfset local.tmp 		  = listlast(local.FileToRead,'.') />
		<cfset local.fileext      = "." & local.tmp />
		
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
			<cfcase value="xls,xlxs">
				<cfset local.fileMimeType = 'application/vnd.ms-excel'>
			</cfcase>
			<cfdefaultcase>
				<cfset local.fileMimeType = 'application/octet-stream'>
			</cfdefaultcase>
		</cfswitch>
		 <!--- More mimeTypes: http://www.iana.org/assignments/media-types/application/ --->

		<!--- Set content header --->
		<cfheader name="content-disposition" value='attachment; filename="#local.doc.filename#"'>
		<cfcontent type="#local.fileMimeType#" file="#local.FileToRead#" deletefile="false">
	

		<cfreturn local.filecontents />
	</cffunction>


	<cffunction name="DocExists" access="public" output="false" returntype="query">
		<cfargument name="RecordID" type="numeric" required="false" />
		
		
		<cfreturn variables.assessmentPlanSupportingDocumentsGateway.getByAttributesQuery(argumentCollection=arguments) />
	</cffunction>

	<cffunction name="onMissingMethod" access="public" output="false" >
		<cfargument name="missingMethodName" type="string" hint="Name of missing method" />
		<cfargument name="missingMethodArguments" type="any" hint="Arguments passed to the missing method, maybe a named arg set or a numerically indexed set" />

		<cfset var ret = ""/>
		<cfinvoke component="#variables.assessmentPlanSupportingDocumentsGateway#" 
				  method="#arguments.missingMethodName#" 
				  argumentcollection="#arguments.missingMethodArguments#" 
				  returnvariable="ret"/>
		<cfreturn ret />
	</cffunction>
</cfcomponent>
