
<cfcomponent name="userroleaccessService" output="false">

	<cffunction name="init" access="public" output="false" returntype="userroleaccessService">
		<cfargument name="userroleaccessDAO" type="userroleaccessDAO" required="true" />
		<cfargument name="userroleaccessGateway" type="userroleaccessGateway" required="true" />

		<cfset variables.userroleaccessDAO = arguments.userroleaccessDAO />
		<cfset variables.userroleaccessGateway = arguments.userroleaccessGateway />

		<cfreturn this/>
	</cffunction>

	<cffunction name="createuserroleaccess" access="public" output="false" returntype="userroleaccess">
		<cfargument name="RecordID" type="numeric" required="true" />
		<cfargument name="UserRoleRecordID" type="numeric" required="false" />
		<cfargument name="ProgramID" type="numeric" required="false" />
		<cfargument name="DeptID" type="numeric" required="false" />
		<cfargument name="DivisionID" type="numeric" required="false" />
		<cfargument name="SuperDivisionID" type="numeric" required="false" />
		<cfargument name="OrganizationID" type="numeric" required="false" />
		<cfargument name="DateInserted" type="date" required="false" />
		
			
		<cfset var userroleaccess = createObject("component","userroleaccess").init(argumentCollection=arguments) />
		<cfreturn userroleaccess />
	</cffunction>

	<cffunction name="getuserroleaccess" access="public" output="false" returntype="userroleaccess">
		<cfargument name="RecordID" type="numeric" required="true" />
		
		<cfset var userroleaccess = createuserroleaccess(argumentCollection=arguments) />
		<cfset variables.userroleaccessDAO.read(userroleaccess) />
		<cfreturn userroleaccess />
	</cffunction>

	<cffunction name="getuserroleaccesss" access="public" output="false" returntype="array">
		<cfargument name="RecordID" type="numeric" required="false" />
		<cfargument name="UserRoleRecordID" type="numeric" required="false" />
		<cfargument name="ProgramID" type="numeric" required="false" />
		<cfargument name="DeptID" type="numeric" required="false" />
		<cfargument name="DivisionID" type="numeric" required="false" />
		<cfargument name="SuperDivisionID" type="numeric" required="false" />
		<cfargument name="OrganizationID" type="numeric" required="false" />
		<cfargument name="DateInserted" type="date" required="false" />
		
		<cfreturn variables.userroleaccessGateway.getByAttributes(argumentCollection=arguments) />
	</cffunction>

	<cffunction name="saveuserroleaccess" access="public" output="false" returntype="boolean">
		<cfargument name="userroleaccess" type="userroleaccess" required="true" />

		<cfreturn variables.userroleaccessDAO.save(userroleaccess) />
	</cffunction>

	<cffunction name="deleteuserroleaccess" access="public" output="false" returntype="boolean">
		<cfargument name="RecordID" type="numeric" required="true" />
		
		<cfset var userroleaccess = createuserroleaccess(argumentCollection=arguments) />
		<cfreturn variables.userroleaccessDAO.delete(userroleaccess) />
	</cffunction>

	<cffunction name="onMissingMethod" access="public" output="false" >
		<cfargument name="missingMethodName" type="string" hint="Name of missing method" />
		<cfargument name="missingMethodArguments" type="any" hint="Arguments passed to the missing method, maybe a named arg set or a numerically indexed set" />

		<cfset var ret = ""/>
		<cfinvoke component="#variables.userroleaccessGateway#" 
				  method="#arguments.missingMethodName#" 
				  argumentcollection="#arguments.missingMethodArguments#" 
				  returnvariable="ret"/>
		<cfreturn ret />
	</cffunction>
</cfcomponent>
