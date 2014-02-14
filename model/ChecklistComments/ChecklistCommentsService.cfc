
<cfcomponent name="ChecklistCommentsService" output="false">

	<cffunction name="init" access="public" output="false" returntype="checklistCommentsService">
		<cfargument name="checklistCommentsDAO" type="checklistCommentsDAO" required="true" />
		<cfargument name="checklistCommentsGateway" type="checklistCommentsGateway" required="true" />

		<cfset variables.checklistCommentsDAO = arguments.checklistCommentsDAO />
		<cfset variables.checklistCommentsGateway = arguments.checklistCommentsGateway />

		<cfreturn this/>
	</cffunction>

	<cffunction name="createchecklistComments" access="public" output="false" returntype="checklistComments">
		<cfargument name="checklistCommentID" type="numeric" required="true" />
		<cfargument name="planID" type="numeric" required="false" />
		<cfargument name="reportingUnitID" type="numeric" required="false" />
		<cfargument name="checklistTypeID" type="numeric" required="false" />
		<cfargument name="comment" type="string" required="false" />
		<cfargument name="created_on" type="date" required="false" />
		<cfargument name="created_by" type="numeric" required="false" />
		
			
		<cfset var checklistComments = createObject("component","checklistComments").init(argumentCollection=arguments) />
		<cfreturn checklistComments />
	</cffunction>

	<cffunction name="getchecklistComments" access="public" output="false" returntype="checklistComments">
		<cfargument name="checklistCommentID" type="numeric" required="true" />
		
		<cfset var checklistComments = createchecklistComments(argumentCollection=arguments) />
		<cfset variables.checklistCommentsDAO.read(checklistComments) />
		<cfreturn checklistComments />
	</cffunction>

	<cffunction name="getchecklistCommentss" access="public" output="false" returntype="array">
		<cfargument name="checklistCommentID" type="numeric" required="false" />
		<cfargument name="planID" type="numeric" required="false" />
		<cfargument name="reportingUnitID" type="numeric" required="false" />
		<cfargument name="checklistTypeID" type="numeric" required="false" />
		<cfargument name="comment" type="string" required="false" />
		<cfargument name="created_on" type="date" required="false" />
		<cfargument name="created_by" type="numeric" required="false" />
		
		<cfreturn variables.checklistCommentsGateway.getByAttributes(argumentCollection=arguments) />
	</cffunction>

	<cffunction name="savechecklistComments" access="public" output="false" returntype="boolean">
		<cfargument name="checklistComments" type="checklistComments" required="true" />

		<cfreturn variables.checklistCommentsDAO.save(checklistComments) />
	</cffunction>

	<cffunction name="deletechecklistComments" access="public" output="false" returntype="boolean">
		<cfargument name="checklistCommentID" type="numeric" required="true" />
		
		<cfset var checklistComments = createchecklistComments(argumentCollection=arguments) />
		<cfreturn variables.checklistCommentsDAO.delete(checklistComments) />
	</cffunction>

	<cffunction name="onMissingMethod" access="public" output="false" >
		<cfargument name="missingMethodName" type="string" hint="Name of missing method" />
		<cfargument name="missingMethodArguments" type="any" hint="Arguments passed to the missing method, maybe a named arg set or a numerically indexed set" />

		<cfset var ret = ""/>
		<cfinvoke component="#variables.checklistCommentsGateway#" 
				  method="#arguments.missingMethodName#" 
				  argumentcollection="#arguments.missingMethodArguments#" 
				  returnvariable="ret"/>
		<cfreturn ret />
	</cffunction>
</cfcomponent>
