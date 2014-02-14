<cfcomponent displayname="SessionFacade" hint="Basic Session Facade" output="false">
	
    <cffunction name="init" returntype="SessionFacade" access="public" output="false">
    	<cfreturn this/>
    </cffunction>
    
    <cffunction name="setVar" access="public" returntype="void" output="false" hint="I set a value into the session">
        <cfargument name="key" type="string" required="true" hint="I am the key to store as"/>
        <cfargument name="value" type="any" required="true" hint="I am the value to store"/>

        <cfset session[arguments.key] = arguments.value />
    </cffunction>
    

    <cffunction name="getVar" access="public" returntype="any" output="false" hint="I retrieve a value from the session">
        <cfargument name="key" type="string" required="true" hint="I am the key whose value will be retrieved"/>
		<cfargument name="default" type="any" default="" hint="If the variable doesn't exist, what I should return">

		<cfif !structKeyExists(session,arguments.key)>
			<cfreturn arguments.default>
		<cfelse>
            <cfreturn session[arguments.key] />
		</cfif>
    </cffunction>
    
	
	<cffunction name="deleteVar" access="public" returntype="void" output="false" hint="I delete a variable from session">
		<cfargument name="key" type="string" required="true" hint="I am the key to be removed from session">
		
		<cfset structDelete(session,arguments.key)>
	</cffunction>
		
	<cffunction name="getAll" access="public" returntype="any" output="false" hint="I return everything in session - I'm for debugging, not production!">
		<cfreturn session>
	</cffunction>
		
</cfcomponent>