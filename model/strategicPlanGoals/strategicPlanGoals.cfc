
<cfcomponent displayname="strategicPlanGoals" output="false">
		<cfproperty name="ID" type="numeric" default="" />
		<cfproperty name="objective" type="string" default="" />
		<cfproperty name="goal" type="string" default="" />
		
	<!---
	PROPERTIES
	--->
	<cfset variables.instance = StructNew() />

	<!---
	INITIALIZATION / CONFIGURATION
	--->
	<cffunction name="init" access="public" returntype="strategicPlanGoals" output="false">
		<cfargument name="ID" type="string" required="false" default="" />
		<cfargument name="objective" type="string" required="false" default="" />
		<cfargument name="goal" type="string" required="false" default="" />
		
		<!--- run setters --->
		<cfset setID(arguments.ID) />
		<cfset setobjective(arguments.objective) />
		<cfset setgoal(arguments.goal) />
		
		<cfreturn this />
 	</cffunction>

	<!---
	PUBLIC FUNCTIONS
	--->
	<cffunction name="setMemento" access="public" returntype="strategicPlanGoals" output="false">
		<cfargument name="memento" type="struct" required="yes"/>
		<cfset variables.instance = arguments.memento />
		<cfreturn this />
	</cffunction>
	<cffunction name="getMemento" access="public" returntype="struct" output="false" >
		<cfreturn variables.instance />
	</cffunction>

	<cffunction name="validate" access="public" returntype="array" output="false">
		<cfset var errors = arrayNew(1) />
		<cfset var thisError = structNew() />
		
		<!--- ID --->
		<cfif (len(trim(getID())) AND NOT isNumeric(trim(getID())))>
			<cfset thisError.field = "ID" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "ID is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- objective --->
		<cfif (len(trim(getobjective())) AND NOT IsSimpleValue(trim(getobjective())))>
			<cfset thisError.field = "objective" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "objective is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getobjective())) GT 2147483647)>
			<cfset thisError.field = "objective" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "objective is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- goal --->
		<cfif (len(trim(getgoal())) AND NOT IsSimpleValue(trim(getgoal())))>
			<cfset thisError.field = "goal" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "goal is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getgoal())) GT 2147483647)>
			<cfset thisError.field = "goal" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "goal is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<cfreturn errors />
	</cffunction>

	<!---
	ACCESSORS
	--->
	<cffunction name="setID" access="public" returntype="void" output="false">
		<cfargument name="ID" type="string" required="true" />
		<cfset variables.instance.ID = arguments.ID />
	</cffunction>
	<cffunction name="getID" access="public" returntype="string" output="false">
		<cfreturn variables.instance.ID />
	</cffunction>

	<cffunction name="setobjective" access="public" returntype="void" output="false">
		<cfargument name="objective" type="string" required="true" />
		<cfset variables.instance.objective = arguments.objective />
	</cffunction>
	<cffunction name="getobjective" access="public" returntype="string" output="false">
		<cfreturn variables.instance.objective />
	</cffunction>

	<cffunction name="setgoal" access="public" returntype="void" output="false">
		<cfargument name="goal" type="string" required="true" />
		<cfset variables.instance.goal = arguments.goal />
	</cffunction>
	<cffunction name="getgoal" access="public" returntype="string" output="false">
		<cfreturn variables.instance.goal />
	</cffunction>


	<!---
	DUMP
	--->
	<cffunction name="dump" access="public" output="true" return="void">
		<cfargument name="abort" type="boolean" default="false" />
		<cfdump var="#variables.instance#" />
		<cfif arguments.abort>
			<cfabort />
		</cfif>
	</cffunction>

</cfcomponent>
