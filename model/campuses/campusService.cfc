
<cfcomponent name="campusService" output="false">

	<cffunction name="init" access="public" output="false" returntype="campusService">
		<cfargument name="campusDAO" type="campusDAO" required="true" />
		<cfargument name="campusGateway" type="campusGateway" required="true" />

		<cfset variables.campusDAO = arguments.campusDAO />
		<cfset variables.campusGateway = arguments.campusGateway />

		<cfreturn this/>
	</cffunction>

	<cffunction name="createcampus" access="public" output="false" returntype="campus">
		<cfargument name="Campus" type="string" required="true" />
		<cfargument name="CampusDescription" type="string" required="false" />
		
			
		<cfset local.campus = createObject("component","campus").init(argumentCollection=arguments) />
		<cfreturn local.campus />
	</cffunction>

	<cffunction name="getcampus" access="public" output="false" returntype="campus">
		<cfargument name="Campus" type="string" required="true" />
		
		<cfset local.campus = createcampus(argumentCollection=arguments) />
		<cfset variables.campusDAO.read(campus) />
		<cfreturn local.campus />
	</cffunction>

	<cffunction name="getcampuss" access="public" output="false" returntype="array">
		<cfargument name="Campus" type="string" required="false" />
		<cfargument name="CampusDescription" type="string" required="false" />
		
		<cfreturn variables.campusGateway.getByAttributes(argumentCollection=arguments) />
	</cffunction>

	<cffunction name="savecampus" access="public" output="false" returntype="boolean">
		<cfargument name="campus" type="campus" required="true" />

		<cfreturn variables.campusDAO.save(campus) />
	</cffunction>

	<cffunction name="deletecampus" access="public" output="false" returntype="boolean">
		<cfargument name="Campus" type="string" required="true" />
		
		<cfset local.campus = createcampus(argumentCollection=arguments) />
		<cfreturn variables.campusDAO.delete(local.campus) />
	</cffunction>

	<cffunction name="onMissingMethod" access="public" output="false" >
		<cfargument name="missingMethodName" type="string" hint="Name of missing method" />
		<cfargument name="missingMethodArguments" type="any" hint="Arguments passed to the missing method, maybe a named arg set or a numerically indexed set" />

		<cfset local.ret = ""/>
		<cfinvoke component="#variables.campusGateway#" 
				  method="#arguments.missingMethodName#" 
				  argumentcollection="#arguments.missingMethodArguments#" 
				  returnvariable="ret"/>
		<cfreturn ret />
	</cffunction>
</cfcomponent>
