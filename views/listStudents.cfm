<cfscript>	
	
	getStudents	 = request.event.getArg('qStudents');
	
</cfscript>

<cfoutput>
	<cfloop query="getStudents">
		#id# - #fullname#
	</cfloop>
</cfoutput>