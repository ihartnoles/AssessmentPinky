<cfcomponent output="false" extends="MachII.framework.Property" hint="I set properties dynamically upon startup">

    <cffunction name="configure" access="public" output="false" returntype="void">
		<cfset setAppProperties()>
    </cffunction>
	
	<cffunction name="setAppProperties" access="private" output="false" returntype="void">
		<cfset var qGetTempEdPID = "">
		
		<!---
		DEV NOTE: if you need to add a property that is used by any services or model objects (gateway, DAO), 
		be sure to also add the property to the properties struct for /ScheduledTasks/Application.cfc
		failure to do this may cause errors in loading the service factory for scheduled tasks
		--->
		<cfscript>
			//setProperty("applicationRoot","/intfroot");
			setProperty("defaultEvent","showLogin");
			setProperty("eventParameter","event");
			setProperty("parameterPrecedence","form");
			setProperty("maxEvents","10");
			//setProperty("exceptionEvent","exception");
			//setProperty("dsn","Assessment");
			
		</cfscript>
		
		<!--- create session facade property that can be accessed anywhere in the application --->
		<cfset var sessionFacade = createObject('component','Assessment.utility.model.sessionFacade').init()>
		<cfset setProperty('sessionFacade',sessionFacade)>
	</cffunction>

</cfcomponent>