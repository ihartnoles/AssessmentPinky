
<cfcomponent name="organizationDeptService" output="false">

	<cffunction name="init" access="public" output="false" returntype="organizationDeptService">
		<cfargument name="organizationDeptDAO" type="organizationDeptDAO" required="true" />
		<cfargument name="organizationDeptGateway" type="organizationDeptGateway" required="true" />

		<cfset variables.organizationDeptDAO = arguments.organizationDeptDAO />
		<cfset variables.organizationDeptGateway = arguments.organizationDeptGateway />

		<cfreturn this/>
	</cffunction>

	<cffunction name="createorganizationDept" access="public" output="false" returntype="organizationDept">
		<cfargument name="DeptID" type="numeric" required="true" />
		<cfargument name="DeptName" type="string" required="false" />
		<cfargument name="DivisionID" type="numeric" required="false" />
		<cfargument name="SamasDeptID" type="string" required="false" />
		<cfargument name="DeptActive" type="numeric" required="false" />
		
			
		<cfset var organizationDept = createObject("component","organizationDept").init(argumentCollection=arguments) />
		<cfreturn organizationDept />
	</cffunction>

	<cffunction name="getorganizationDept" access="public" output="false" returntype="organizationDept">
		<cfargument name="DeptID" type="numeric" required="true" />
		
		<cfset var organizationDept = createorganizationDept(argumentCollection=arguments) />
		<cfset variables.organizationDeptDAO.read(organizationDept) />
		<cfreturn organizationDept />
	</cffunction>

	<cffunction name="getorganizationDepts" access="public" output="false" returntype="array">
		<cfargument name="DeptID" type="numeric" required="false" />
		<cfargument name="DeptName" type="string" required="false" />
		<cfargument name="DivisionID" type="numeric" required="false" />
		<cfargument name="SamasDeptID" type="string" required="false" />
		<cfargument name="DeptActive" type="numeric" required="false" />
		
		<cfreturn variables.organizationDeptGateway.getByAttributes(argumentCollection=arguments) />
	</cffunction>

	<cffunction name="saveorganizationDept" access="public" output="false" returntype="boolean">
		<cfargument name="organizationDept" type="organizationDept" required="true" />

		<cfreturn variables.organizationDeptDAO.save(organizationDept) />
	</cffunction>

	<cffunction name="deleteorganizationDept" access="public" output="false" returntype="boolean">
		<cfargument name="DeptID" type="numeric" required="true" />
		
		<cfset var organizationDept = createorganizationDept(argumentCollection=arguments) />
		<cfreturn variables.organizationDeptDAO.delete(organizationDept) />
	</cffunction>

	<cffunction name="onMissingMethod" access="public" output="false" >
		<cfargument name="missingMethodName" type="string" hint="Name of missing method" />
		<cfargument name="missingMethodArguments" type="any" hint="Arguments passed to the missing method, maybe a named arg set or a numerically indexed set" />

		<cfset var ret = ""/>
		<cfinvoke component="#variables.organizationDeptGateway#" 
				  method="#arguments.missingMethodName#" 
				  argumentcollection="#arguments.missingMethodArguments#" 
				  returnvariable="ret"/>
		<cfreturn ret />
	</cffunction>
</cfcomponent>
