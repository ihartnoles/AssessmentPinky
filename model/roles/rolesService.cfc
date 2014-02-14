
<cfcomponent name="rolesService" output="false">

	<cffunction name="init" access="public" output="false" returntype="rolesService">
		<cfargument name="rolesDAO" type="rolesDAO" required="true" />
		<cfargument name="rolesGateway" type="rolesGateway" required="true" />

		<cfset variables.rolesDAO = arguments.rolesDAO />
		<cfset variables.rolesGateway = arguments.rolesGateway />

		<cfreturn this/>
	</cffunction>

	<cffunction name="createroles" access="public" output="false" returntype="roles">
		<cfargument name="AssessmentRoleID" type="numeric" required="true" />
		<cfargument name="AssessmentRoleDescription" type="string" required="false" />
		<cfargument name="LastChangeDate" type="date" required="false" />
		
			
		<cfset var roles = createObject("component","roles").init(argumentCollection=arguments) />
		<cfreturn roles />
	</cffunction>

	<cffunction name="getroles" access="public" output="false" returntype="roles">
		<cfargument name="AssessmentRoleID" type="numeric" required="true" />
		
		<cfset var roles = createroles(argumentCollection=arguments) />
		<cfset variables.rolesDAO.read(roles) />
		<cfreturn roles />
	</cffunction>

	<cffunction name="getroless" access="public" output="false" returntype="array">
		<cfargument name="AssessmentRoleID" type="numeric" required="false" />
		<cfargument name="AssessmentRoleDescription" type="string" required="false" />
		<cfargument name="LastChangeDate" type="date" required="false" />
		
		<cfreturn variables.rolesGateway.getByAttributes(argumentCollection=arguments) />
	</cffunction>

	<cffunction name="saveroles" access="public" output="false" returntype="boolean">
		<cfargument name="roles" type="roles" required="true" />

		<cfreturn variables.rolesDAO.save(roles) />
	</cffunction>

	<cffunction name="deleteroles" access="public" output="false" returntype="boolean">
		<cfargument name="AssessmentRoleID" type="numeric" required="true" />
		
		<cfset var roles = createroles(argumentCollection=arguments) />
		<cfreturn variables.rolesDAO.delete(roles) />
	</cffunction>

	<cffunction name="onMissingMethod" access="public" output="false" >
		<cfargument name="missingMethodName" type="string" hint="Name of missing method" />
		<cfargument name="missingMethodArguments" type="any" hint="Arguments passed to the missing method, maybe a named arg set or a numerically indexed set" />

		<cfset var ret = ""/>
		<cfinvoke component="#variables.rolesGateway#" 
				  method="#arguments.missingMethodName#" 
				  argumentcollection="#arguments.missingMethodArguments#" 
				  returnvariable="ret"/>
		<cfreturn ret />
	</cffunction>
</cfcomponent>
