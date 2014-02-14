
<cfcomponent name="reportingunitsService" output="false">

	<cffunction name="init" access="public" output="false" returntype="reportingunitsService">
		<cfargument name="reportingunitsDAO" type="reportingunitsDAO" required="true" />
		<cfargument name="reportingunitsGateway" type="reportingunitsGateway" required="true" />

		<cfset variables.reportingunitsDAO = arguments.reportingunitsDAO />
		<cfset variables.reportingunitsGateway = arguments.reportingunitsGateway />

		<cfreturn this/>
	</cffunction>

	<cffunction name="createreportingunits" access="public" output="false" returntype="reportingunits">
		<cfargument name="ReportingUnitID" type="numeric" required="true" />
		<cfargument name="ProgramID" type="numeric" required="false" />
		<cfargument name="DeptID" type="numeric" required="false" />
		<cfargument name="DivisionID" type="numeric" required="false" />
		<cfargument name="SuperDivisionID" type="numeric" required="false" />
		<cfargument name="OrganizationID" type="numeric" required="false" />
		<cfargument name="ReportingUnitActive" type="numeric" required="false" />
		
			
		<cfset var reportingunits = createObject("component","reportingunits").init(argumentCollection=arguments) />
		<cfreturn reportingunits />
	</cffunction>

	<cffunction name="getreportingunits" access="public" output="false" returntype="reportingunits">
		<cfargument name="ReportingUnitID" type="numeric" required="true" />
		
		<cfset var reportingunits = createreportingunits(argumentCollection=arguments) />
		<cfset variables.reportingunitsDAO.read(reportingunits) />
		<cfreturn reportingunits />
	</cffunction>

	<cffunction name="getreportingunitss" access="public" output="false" returntype="array">
		<cfargument name="ReportingUnitID" type="numeric" required="false" />
		<cfargument name="ProgramID" type="numeric" required="false" />
		<cfargument name="DeptID" type="numeric" required="false" />
		<cfargument name="DivisionID" type="numeric" required="false" />
		<cfargument name="SuperDivisionID" type="numeric" required="false" />
		<cfargument name="OrganizationID" type="numeric" required="false" />
		<cfargument name="ReportingUnitActive" type="numeric" required="false" />
		
		<cfreturn variables.reportingunitsGateway.getByAttributes(argumentCollection=arguments) />
	</cffunction>

	<cffunction name="getReportingUnitsQuery" access="public" output="false" returntype="query">
		<cfargument name="ReportingUnitID" type="numeric" required="false" />
		<cfargument name="ProgramID" type="numeric" required="false" />
		<cfargument name="DeptID" type="numeric" required="false" />
		<cfargument name="DivisionID" type="numeric" required="false" />
		<cfargument name="SuperDivisionID" type="numeric" required="false" />
		<cfargument name="OrganizationID" type="numeric" required="false" />
		<cfargument name="ReportingUnitActive" type="numeric" required="false" />
		
		<cfreturn variables.reportingunitsGateway.getReportingUnitsQuery(argumentCollection=arguments) />
	</cffunction>

	<cffunction name="savereportingunits" access="public" output="false" returntype="boolean">
		<cfargument name="reportingunits" type="reportingunits" required="true" />

		<cfreturn variables.reportingunitsDAO.save(reportingunits) />
	</cffunction>

	<cffunction name="deletereportingunits" access="public" output="false" returntype="boolean">
		<cfargument name="ReportingUnitID" type="numeric" required="true" />
		
		<cfset var reportingunits = createreportingunits(argumentCollection=arguments) />
		<cfreturn variables.reportingunitsDAO.delete(reportingunits) />
	</cffunction>

	<cffunction name="onMissingMethod" access="public" output="false" >
		<cfargument name="missingMethodName" type="string" hint="Name of missing method" />
		<cfargument name="missingMethodArguments" type="any" hint="Arguments passed to the missing method, maybe a named arg set or a numerically indexed set" />

		<cfset var ret = ""/>
		<cfinvoke component="#variables.reportingunitsGateway#" 
				  method="#arguments.missingMethodName#" 
				  argumentcollection="#arguments.missingMethodArguments#" 
				  returnvariable="ret"/>
		<cfreturn ret />
	</cffunction>
</cfcomponent>
