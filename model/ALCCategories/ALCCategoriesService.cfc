
<cfcomponent name="ALCCategoriesService" output="false">

	<cffunction name="init" access="public" output="false" returntype="ALCCategoriesService">
		<cfargument name="ALCCategoriesDAO" type="ALCCategoriesDAO" required="true" />
		<cfargument name="ALCCategoriesGateway" type="ALCCategoriesGateway" required="true" />

		<cfset variables.ALCCategoriesDAO = arguments.ALCCategoriesDAO />
		<cfset variables.ALCCategoriesGateway = arguments.ALCCategoriesGateway />

		<cfreturn this/>
	</cffunction>

	<cffunction name="createALCCategories" access="public" output="false" returntype="ALCCategories">
		<cfargument name="CategoryID" type="numeric" required="true" />
		<cfargument name="CategoryOrder" type="numeric" required="false" />
		<cfargument name="CategoryTitle" type="string" required="false" />
		<cfargument name="CategoryActive" type="numeric" required="false" />
		
			
		<cfset var ALCCategories = createObject("component","ALCCategories").init(argumentCollection=arguments) />
		<cfreturn ALCCategories />
	</cffunction>

	<cffunction name="getALCCategories" access="public" output="false" returntype="ALCCategories">
		<cfargument name="CategoryID" type="numeric" required="true" />
		
		<cfset var ALCCategories = createALCCategories(argumentCollection=arguments) />
		<cfset variables.ALCCategoriesDAO.read(ALCCategories) />
		<cfreturn ALCCategories />
	</cffunction>

	<cffunction name="getALCCategoriess" access="public" output="false" returntype="array">
		<cfargument name="CategoryID" type="numeric" required="false" />
		<cfargument name="CategoryOrder" type="numeric" required="false" />
		<cfargument name="CategoryTitle" type="string" required="false" />
		<cfargument name="CategoryActive" type="numeric" required="false" />
		
		<cfreturn variables.ALCCategoriesGateway.getByAttributes(argumentCollection=arguments) />
	</cffunction>

	<cffunction name="saveALCCategories" access="public" output="false" returntype="boolean">
		<cfargument name="ALCCategories" type="ALCCategories" required="true" />

		<cfreturn variables.ALCCategoriesDAO.save(ALCCategories) />
	</cffunction>

	<cffunction name="deleteALCCategories" access="public" output="false" returntype="boolean">
		<cfargument name="CategoryID" type="numeric" required="true" />
		
		<cfset var ALCCategories = createALCCategories(argumentCollection=arguments) />
		<cfreturn variables.ALCCategoriesDAO.delete(ALCCategories) />
	</cffunction>

	<cffunction name="onMissingMethod" access="public" output="false" >
		<cfargument name="missingMethodName" type="string" hint="Name of missing method" />
		<cfargument name="missingMethodArguments" type="any" hint="Arguments passed to the missing method, maybe a named arg set or a numerically indexed set" />

		<cfset var ret = ""/>
		<cfinvoke component="#variables.ALCCategoriesGateway#" 
				  method="#arguments.missingMethodName#" 
				  argumentcollection="#arguments.missingMethodArguments#" 
				  returnvariable="ret"/>
		<cfreturn ret />
	</cffunction>
</cfcomponent>
