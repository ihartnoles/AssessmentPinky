
<cfcomponent name="organizationDivisionService" output="false">

	<cffunction name="init" access="public" output="false" returntype="organizationDivisionService">
		<cfargument name="organizationDivisionDAO" type="organizationDivisionDAO" required="true" />
		<cfargument name="organizationDivisionGateway" type="organizationDivisionGateway" required="true" />

		<cfset variables.organizationDivisionDAO = arguments.organizationDivisionDAO />
		<cfset variables.organizationDivisionGateway = arguments.organizationDivisionGateway />

		<cfreturn this/>
	</cffunction>

	<cffunction name="createorganizationDivision" access="public" output="false" returntype="organizationDivision">
		<cfargument name="DivisionID" type="numeric" required="true" />
		<cfargument name="DivisionName" type="string" required="false" />
		<cfargument name="DivisionAbv" type="string" required="false" />
		<cfargument name="SamasDivisionID" type="string" required="false" />
		<cfargument name="SuperDivisionID" type="numeric" required="false" />
		<cfargument name="DivisionActive" type="numeric" required="false" />
		
			
		<cfset var organizationDivision = createObject("component","organizationDivision").init(argumentCollection=arguments) />
		<cfreturn organizationDivision />
	</cffunction>

	<cffunction name="getorganizationDivision" access="public" output="false" returntype="organizationDivision">
		<cfargument name="DivisionID" type="numeric" required="true" />
		
		<cfset var organizationDivision = createorganizationDivision(argumentCollection=arguments) />
		<cfset variables.organizationDivisionDAO.read(organizationDivision) />
		<cfreturn organizationDivision />
	</cffunction>

	<cffunction name="getorganizationDivisions" access="public" output="false" returntype="array">
		<cfargument name="DivisionID" type="numeric" required="false" />
		<cfargument name="DivisionName" type="string" required="false" />
		<cfargument name="DivisionAbv" type="string" required="false" />
		<cfargument name="SamasDivisionID" type="string" required="false" />
		<cfargument name="SuperDivisionID" type="numeric" required="false" />
		<cfargument name="DivisionActive" type="numeric" required="false" />
		
		<cfreturn variables.organizationDivisionGateway.getByAttributes(argumentCollection=arguments) />
	</cffunction>

	<cffunction name="saveorganizationDivision" access="public" output="false" returntype="boolean">
		<cfargument name="organizationDivision" type="organizationDivision" required="true" />

		<cfreturn variables.organizationDivisionDAO.save(organizationDivision) />
	</cffunction>

	<cffunction name="deleteorganizationDivision" access="public" output="false" returntype="boolean">
		<cfargument name="DivisionID" type="numeric" required="true" />
		
		<cfset var organizationDivision = createorganizationDivision(argumentCollection=arguments) />
		<cfreturn variables.organizationDivisionDAO.delete(organizationDivision) />
	</cffunction>

	<cffunction name="onMissingMethod" access="public" output="false" >
		<cfargument name="missingMethodName" type="string" hint="Name of missing method" />
		<cfargument name="missingMethodArguments" type="any" hint="Arguments passed to the missing method, maybe a named arg set or a numerically indexed set" />

		<cfset var ret = ""/>
		<cfinvoke component="#variables.organizationDivisionGateway#" 
				  method="#arguments.missingMethodName#" 
				  argumentcollection="#arguments.missingMethodArguments#" 
				  returnvariable="ret"/>
		<cfreturn ret />
	</cffunction>
</cfcomponent>
