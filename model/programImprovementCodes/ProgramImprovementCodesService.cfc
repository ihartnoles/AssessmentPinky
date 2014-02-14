
<cfcomponent name="ProgramImprovementCodesService" output="false">

	<cffunction name="init" access="public" output="false" returntype="ProgramImprovementCodesService">
		<cfargument name="ProgramImprovementCodesDAO" type="ProgramImprovementCodesDAO" required="true" />
		<cfargument name="ProgramImprovementCodesGateway" type="ProgramImprovementCodesGateway" required="true" />

		<cfset variables.ProgramImprovementCodesDAO = arguments.ProgramImprovementCodesDAO />
		<cfset variables.ProgramImprovementCodesGateway = arguments.ProgramImprovementCodesGateway />

		<cfreturn this/>
	</cffunction>

	<cffunction name="createProgramImprovementCodes" access="public" output="false" returntype="ProgramImprovementCodes">
		<cfargument name="ProgramImprovementCodeID" type="numeric" required="true" />
		<cfargument name="item_number" type="string" required="false" />
		<cfargument name="label" type="string" required="false" />
		<cfargument name="description" type="string" required="false" />
		
			
		<cfset var ProgramImprovementCodes = createObject("component","ProgramImprovementCodes").init(argumentCollection=arguments) />
		<cfreturn ProgramImprovementCodes />
	</cffunction>

	<cffunction name="getProgramImprovementCodes" access="public" output="false" returntype="ProgramImprovementCodes">
		<cfargument name="ProgramImprovementCodeID" type="numeric" required="true" />
		
		<cfset var ProgramImprovementCodes = createProgramImprovementCodes(argumentCollection=arguments) />
		<cfset variables.ProgramImprovementCodesDAO.read(ProgramImprovementCodes) />
		<cfreturn ProgramImprovementCodes />
	</cffunction>

	<cffunction name="getProgramImprovementCodess" access="public" output="false" returntype="array">
		<cfargument name="ProgramImprovementCodeID" type="numeric" required="false" />
		<cfargument name="item_number" type="string" required="false" />
		<cfargument name="label" type="string" required="false" />
		<cfargument name="description" type="string" required="false" />
		
		<cfreturn variables.ProgramImprovementCodesGateway.getByAttributes(argumentCollection=arguments) />
	</cffunction>

	<cffunction name="saveProgramImprovementCodes" access="public" output="false" returntype="boolean">
		<cfargument name="ProgramImprovementCodes" type="ProgramImprovementCodes" required="true" />

		<cfreturn variables.ProgramImprovementCodesDAO.save(ProgramImprovementCodes) />
	</cffunction>

	<cffunction name="deleteProgramImprovementCodes" access="public" output="false" returntype="boolean">
		<cfargument name="ProgramImprovementCodeID" type="numeric" required="true" />
		
		<cfset var ProgramImprovementCodes = createProgramImprovementCodes(argumentCollection=arguments) />
		<cfreturn variables.ProgramImprovementCodesDAO.delete(ProgramImprovementCodes) />
	</cffunction>

	<cffunction name="onMissingMethod" access="public" output="false" >
		<cfargument name="missingMethodName" type="string" hint="Name of missing method" />
		<cfargument name="missingMethodArguments" type="any" hint="Arguments passed to the missing method, maybe a named arg set or a numerically indexed set" />

		<cfset var ret = ""/>
		<cfinvoke component="#variables.ProgramImprovementCodesGateway#" 
				  method="#arguments.missingMethodName#" 
				  argumentcollection="#arguments.missingMethodArguments#" 
				  returnvariable="ret"/>
		<cfreturn ret />
	</cffunction>
</cfcomponent>
