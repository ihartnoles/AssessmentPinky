
<cfcomponent name="organizationSuperDivisionService" output="false">

	<cffunction name="init" access="public" output="false" returntype="organizationSuperDivisionService">
		<cfargument name="organizationSuperDivisionDAO" type="organizationSuperDivisionDAO" required="true" />
		<cfargument name="organizationSuperDivisionGateway" type="organizationSuperDivisionGateway" required="true" />

		<cfset variables.organizationSuperDivisionDAO = arguments.organizationSuperDivisionDAO />
		<cfset variables.organizationSuperDivisionGateway = arguments.organizationSuperDivisionGateway />

		<cfreturn this/>
	</cffunction>

	<cffunction name="createorganizationSuperDivision" access="public" output="false" returntype="organizationSuperDivision">
		<cfargument name="SuperDivisionID" type="numeric" required="true" />
		<cfargument name="SuperDivisionName" type="string" required="false" />
		<cfargument name="OrganizationID" type="numeric" required="false" />
		<cfargument name="SuperDivisionActive" type="numeric" required="false" />
		
			
		<cfset var organizationSuperDivision = createObject("component","organizationSuperDivision").init(argumentCollection=arguments) />
		<cfreturn organizationSuperDivision />
	</cffunction>

	<cffunction name="getorganizationSuperDivision" access="public" output="false" returntype="organizationSuperDivision">
		<cfargument name="SuperDivisionID" type="numeric" required="true" />
		
		<cfset var organizationSuperDivision = createorganizationSuperDivision(argumentCollection=arguments) />
		<cfset variables.organizationSuperDivisionDAO.read(organizationSuperDivision) />
		<cfreturn organizationSuperDivision />
	</cffunction>

	<cffunction name="saveorganizationSuperDivision" access="public" output="false" returntype="boolean">
		<cfargument name="organizationSuperDivision" type="organizationSuperDivision" required="true" />

		<cfreturn variables.organizationSuperDivisionDAO.save(organizationSuperDivision) />
	</cffunction>

	<cffunction name="deleteorganizationSuperDivision" access="public" output="false" returntype="boolean">
		<cfargument name="SuperDivisionID" type="numeric" required="true" />
		
		<cfset var organizationSuperDivision = createorganizationSuperDivision(argumentCollection=arguments) />
		<cfreturn variables.organizationSuperDivisionDAO.delete(organizationSuperDivision) />
	</cffunction>

	<cffunction name="onMissingMethod" access="public" output="false" >
		<cfargument name="missingMethodName" type="string" hint="Name of missing method" />
		<cfargument name="missingMethodArguments" type="any" hint="Arguments passed to the missing method, maybe a named arg set or a numerically indexed set" />

		<cfset var ret = ""/>
		<cfinvoke component="#variables.organizationSuperDivisionGateway#" 
				  method="#arguments.missingMethodName#" 
				  argumentcollection="#arguments.missingMethodArguments#" 
				  returnvariable="ret"/>
		<cfreturn ret />
	</cffunction>
</cfcomponent>
