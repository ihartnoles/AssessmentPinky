<!---
<cfsetting enablecfoutputonly="true">
<cfsetting showdebugoutput="true">
--->
<cfset variables.forJSON = request.event.getArg("forJSON")>
<cfset variables.serializeQueryByColumns = request.event.getArg('serializeQueryByColumns',false)>
<cfset variables.useJsonHelper = request.event.getArg('useJsonHelper',false)>

<cfif variables.useJsonHelper>
	<cfset jsonHelper = createObject('component','utility.model.dataHelpers.jsonHelper').init()>
	<cfcontent reset="true">
	<cfoutput>#jsonHelper.toJSON(variables.forJSON)#</cfoutput>
<cfelse>
	<cfcontent reset="true">
	<cfoutput>#SerializeJSON(variables.forJSON,variables.serializeQueryByColumns)#</cfoutput>
</cfif>