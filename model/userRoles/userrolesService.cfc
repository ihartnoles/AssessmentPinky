
<cfcomponent name="userrolesService" output="false">

	<cffunction name="init" access="public" output="false" returntype="userrolesService">
		<cfargument name="userrolesDAO" type="userrolesDAO" required="true" />
		<cfargument name="userrolesGateway" type="userrolesGateway" required="true" />

		<cfset variables.userrolesDAO = arguments.userrolesDAO />
		<cfset variables.userrolesGateway = arguments.userrolesGateway />

		<cfreturn this/>
	</cffunction>

	<cffunction name="createuserroles" access="public" output="false" returntype="userroles">
		<cfargument name="RecordID" type="numeric" required="true" />
		<cfargument name="UserID" type="numeric" required="false" />
		<cfargument name="RoleID" type="numeric" required="false" />
		<cfargument name="DefaultRole" type="numeric" required="false" />
		<cfargument name="DateInserted" type="date" required="false" />
		
			
		<cfset var userroles = createObject("component","userroles").init(argumentCollection=arguments) />
		<cfreturn userroles />
	</cffunction>

	<cffunction name="getuserroles" access="public" output="false" returntype="userroles">
		<cfargument name="RecordID" type="numeric" required="true" />
		
		<cfset var userroles = createuserroles(argumentCollection=arguments) />
		<cfset variables.userrolesDAO.read(userroles) />
		<cfreturn userroles />
	</cffunction>

	<cffunction name="getuserroless" access="public" output="false" returntype="array">
		<cfargument name="RecordID" type="numeric" required="false" />
		<cfargument name="UserID" type="numeric" required="false" />
		<cfargument name="RoleID" type="numeric" required="false" />
		<cfargument name="DefaultRole" type="numeric" required="false" />
		<cfargument name="DateInserted" type="date" required="false" />
		
		<cfreturn variables.userrolesGateway.getByAttributes(argumentCollection=arguments) />
	</cffunction>

	<cffunction name="getDefaultUserRole" access="public" output="false" returntype="numeric">
		<cfargument name="UserID" type="numeric" required="false" />
				
		<cfreturn variables.userrolesGateway.getDefaultUserRole(argumentCollection=arguments) />
	</cffunction>


	<cffunction name="saveuserroles" access="public" output="false" returntype="boolean">
		<cfargument name="userroles" type="userroles" required="true" />

		<cfreturn variables.userrolesDAO.save(userroles) />
	</cffunction>

	<cffunction name="deleteuserroles" access="public" output="false" returntype="boolean">
		<cfargument name="RecordID" type="numeric" required="true" />
		
		<cfset var userroles = createuserroles(argumentCollection=arguments) />
		<cfreturn variables.userrolesDAO.delete(userroles) />
	</cffunction>

	<cffunction name="onMissingMethod" access="public" output="false" >
		<cfargument name="missingMethodName" type="string" hint="Name of missing method" />
		<cfargument name="missingMethodArguments" type="any" hint="Arguments passed to the missing method, maybe a named arg set or a numerically indexed set" />

		<cfset var ret = ""/>
		<cfinvoke component="#variables.userrolesGateway#" 
				  method="#arguments.missingMethodName#" 
				  argumentcollection="#arguments.missingMethodArguments#" 
				  returnvariable="ret"/>
		<cfreturn ret />
	</cffunction>
</cfcomponent>
