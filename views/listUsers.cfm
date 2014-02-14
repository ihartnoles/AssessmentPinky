<cfscript>	
	
	qUsers	 = request.event.getArg('qUsers');
	
</cfscript>

<cfoutput>
	<cfloop query="qUsers">
		#UserID# - #UserLname# #UserFname# <br>
	</cfloop>
</cfoutput>