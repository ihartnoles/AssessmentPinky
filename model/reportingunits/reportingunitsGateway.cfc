
<cfcomponent displayname="reportingunitsGateway" output="false">
	<cffunction name="init" access="public" output="false" returntype="reportingunitsGateway">
		<cfargument name="dsn" type="string" required="true" />
		<cfset variables.dsn = arguments.dsn />
		<cfreturn this />
	</cffunction>
	
	<cffunction name="getByAttributesQuery" access="public" output="false" returntype="query">
		<cfargument name="ReportingUnitID" type="numeric" required="false" />
		<cfargument name="ProgramID" type="numeric" required="false" />
		<cfargument name="DeptID" type="numeric" required="false" />
		<cfargument name="DivisionID" type="numeric" required="false" />
		<cfargument name="SuperDivisionID" type="numeric" required="false" />
		<cfargument name="OrganizationID" type="numeric" required="false" />
		<cfargument name="ReportingUnitActive" type="numeric" required="false" />
		<cfargument name="orderby" type="string" required="false" />
		
		<cfset var qList = "" />		
		<cfquery name="qList" datasource="#variables.dsn#">
			SELECT
				ReportingUnitID,
				ProgramID,
				DeptID,
				DivisionID,
				SuperDivisionID,
				OrganizationID,
				ReportingUnitActive
			FROM	ReportingUnit
			WHERE	0=0
		
		<cfif structKeyExists(arguments,"ReportingUnitID") and len(arguments.ReportingUnitID)>
			AND	ReportingUnitID = <cfqueryparam value="#arguments.ReportingUnitID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"ProgramID") and len(arguments.ProgramID)>
			AND	ProgramID = <cfqueryparam value="#arguments.ProgramID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"DeptID") and len(arguments.DeptID)>
			AND	DeptID = <cfqueryparam value="#arguments.DeptID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"DivisionID") and len(arguments.DivisionID)>
			AND	DivisionID = <cfqueryparam value="#arguments.DivisionID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"SuperDivisionID") and len(arguments.SuperDivisionID)>
			AND	SuperDivisionID = <cfqueryparam value="#arguments.SuperDivisionID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"OrganizationID") and len(arguments.OrganizationID)>
			AND	OrganizationID = <cfqueryparam value="#arguments.OrganizationID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"ReportingUnitActive") and len(arguments.ReportingUnitActive)>
			AND	ReportingUnitActive = <cfqueryparam value="#arguments.ReportingUnitActive#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments, "orderby") and len(arguments.orderBy)>
			ORDER BY #arguments.orderby#
		</cfif>
		</cfquery>
		
		<cfreturn qList />
	</cffunction>

	<cffunction name="getReportingUnitsQuery" access="public" output="false" returntype="query">
		<cfargument name="qUserAccessIDs" type="query" required="false" />
		
		<!---		
		<cfdump var="#arguments#" abort="false" label="@@reportingUnitsGateway" />
		<cfdump var="#arguments.quseraccessids.divisionID#" abort="true" label="@@reportingUnitsGateway_2" />
        --->
		<cfset var qList = "" />		
		<cfquery name="qList" datasource="#variables.dsn#">
			
			<!---
 			<cfif session.user.userroleID EQ 2 >
 				<!--- reporters --->
 				SELECT ura.*, ur.RoleID, organizationname, superdivisionname, divisionname, deptname, programname, assessmentroledescription, ru.reportingUnitID 
				FROM UserRoleAccess ura, UserRoles ur, organization o, organizationsuperdivision osd, organizationdivision odv, organizationdept odp, organizationprogram op, roles r, reportingUnit ru
				 WHERE ura.UserRoleRecordID=ur.RecordID AND UserRoleRecordID IN (SELECT RecordID FROM UserRoles WHERE UserID=<cfqueryparam value="#session.user.userID#" CFSQLType="cf_sql_integer" />) 
				 AND    ura.organizationid=o.organizationid 
				 AND ura.superdivisionid=osd.superdivisionid 
				 AND ura.divisionid=odv.divisionid 
				 AND ura.deptid=odp.deptid 
				 AND ura.programid=op.programid 
				 AND ur.roleid = r.assessmentroleid 
				 AND ura.ProgramID = ru.programID
 				 AND ura.deptID = ru.DeptID
 				 AND ura.superdivisionID = 1
 				 ORDER BY SuperDivisionName, DivisionName, DeptName, ProgramID, ReportingUnitID DESC
 			<cfelse>
 			--->
 				<!--- admins userroleID=1, reviewers userroleID=3, view only userroleID=4--->
 				SELECT  a.*, 
						         ProgramName, 
						         ProgramDegreeLevel, 
						         ProgramDegree, 
						         ProgramCIP,    
						         DeptName, 
						         SamasDeptID,      
						         DivisionName, 
						         DivisionAbv, 
						         SamasDivisionID,        
						         SuperDivisionName, 
						         OrganizationName  
			 
			 			FROM ReportingUnit a, 
			 				 OrganizationProgram p, 
			 				 OrganizationDept d, 
			 				 OrganizationDivision di,    
			 				 OrganizationSuperDivision s, 
			 				 Organization o 
			 
			 			WHERE ReportingUnitID IN ( 

			 				SELECT ReportingUnitID FROM ReportingUnit WHERE ( 


			 				<!--- only Admins and View only should include this part of the query --->
			 				<cfif session.user.userroleid EQ 1 OR  session.user.userroleid EQ 4 OR session.user.DeptID CONTAINS 999999>
			 				   <cfif structKeyExists(arguments.quseraccessids,"OrganizationID") and len(arguments.quseraccessids.OrganizationID)>
			 					OrganizationID=<cfqueryparam value="#arguments.quseraccessids.OrganizationID#" CFSQLType="cf_sql_integer" />
			 				   </cfif>

			 				   <cfif structKeyExists(arguments.quseraccessids,"SuperDivisionID") and len(arguments.quseraccessids.SuperDivisionID) AND arguments.quseraccessids.SuperDivisionID NEQ 999999>
			 				   	 AND	SuperDivisionID = <cfqueryparam value="#arguments.quseraccessids.SuperDivisionID#" CFSQLType="cf_sql_integer" />
			 				   </cfif>

			 				    <cfif structKeyExists(session.user,"divisionID") and len(session.user.DivisionID) >
			 				   	 AND	DivisionID IN (<cfqueryparam value="#session.user.DivisionID#" CFSQLType="cf_sql_varchar" list="true" />)
			 				   </cfif>

			 				   OR
			 				 </cfif>
			 				
			 				  <cfif structKeyExists(arguments.quseraccessids,"OrganizationID") and len(arguments.quseraccessids.OrganizationID)>
			 					OrganizationID=<cfqueryparam value="#arguments.quseraccessids.OrganizationID#" CFSQLType="cf_sql_integer" />
			 				  </cfif>

			 				   <cfif structKeyExists(arguments.quseraccessids,"SuperDivisionID") and len(arguments.quseraccessids.SuperDivisionID) AND arguments.quseraccessids.SuperDivisionID NEQ 999999>
			 				   	 AND	SuperDivisionID = <cfqueryparam value="#arguments.quseraccessids.SuperDivisionID#" CFSQLType="cf_sql_integer" />
			 				   </cfif>

			 				  <cfif structKeyExists(arguments.quseraccessids,"DivisionID") and len(arguments.quseraccessids.DivisionID) AND arguments.quseraccessids.DivisionID NEQ 999999>
			 				   	 AND	DivisionID IN (<cfqueryparam value="#arguments.quseraccessids.divisionID#"  CFSQLType="cf_sql_varchar" list="true" />)
			 				   </cfif>

			 				   <!--- exlude admins for this --->
			 				   <cfif session.user.userroleid NEQ 1>		 				 
				 				   <cfif structKeyExists(session.user,"DeptID") and len(session.user.DeptID) AND session.user.DeptID NEQ 999999>
				 				   	 	AND	DeptID IN (<cfqueryparam value="#session.user.DeptID#" CFSQLType="cf_sql_varchar"  list="true"/>)
				 				   	</cfif>

				 				   <cfif NOT structKeyExists(session.user,"ProgramID")  and len(session.user.ProgramID) and listfind(session.user.ProgramID,'999999') >
				 				   	 AND   ProgramID IN (<cfqueryparam value="#session.user.programID#" CFSQLType="cf_sql_varchar" list="true" />)
				 				   </cfif>
			 				   </cfif>
			 				
			 				)
						)
						 AND a.ProgramID = p.ProgramID 
						 And a.DeptID = d.DeptID And a.DivisionID = di.DivisionID 
						 And a.SuperDivisionID = s.SuperDivisionID 
						 And a.OrganizationID = o.OrganizationID  
						 AND a.ReportingUnitActive = 1
						 AND a.SuperDivisionID = 1
						 <!--- And a.programID <> -1 --->

			 			ORDER BY SuperDivisionName, DivisionName, DeptName, ProgramID, ReportingUnitID DESC

 			<!--- </cfif> --->
		</cfquery>

		<!--- 
		<cfdump var="#qList#" abort="true" label="@@reportingUnitsGateway_3" />
		--->
		
		<cfreturn qList />
	</cffunction>

	<cffunction name="getAdminReportingUnitsQuery" access="public" output="false" returntype="query">
		<cfargument name="qUserAccessIDs" type="query" required="false" />
		
		<!---		
		<cfdump var="#arguments#" abort="false" label="@@reportingUnitsGateway" />
		<cfdump var="#arguments.quseraccessids.divisionID#" abort="true" label="@@reportingUnitsGateway_2" />
        --->
		<cfset var qList = "" />		
		<cfquery name="qList" datasource="#variables.dsn#">
			
			<!---
			<cfif session.user.userroleID EQ 2 >
 				<!--- reporters --->
 				SELECT ura.*, ur.RoleID, organizationname, superdivisionname, divisionname, deptname, programname, assessmentroledescription, ru.reportingUnitID 
				FROM UserRoleAccess ura, UserRoles ur, organization o, organizationsuperdivision osd, organizationdivision odv, organizationdept odp, organizationprogram op, roles r, reportingUnit ru
				 WHERE ura.UserRoleRecordID=ur.RecordID AND UserRoleRecordID IN (SELECT RecordID FROM UserRoles WHERE UserID=<cfqueryparam value="#session.user.userID#" CFSQLType="cf_sql_integer" />) 
				 AND    ura.organizationid=o.organizationid 
				 AND ura.superdivisionid=osd.superdivisionid 
				 AND ura.divisionid=odv.divisionid 
				 AND ura.deptid=odp.deptid 
				 AND ura.programid=op.programid 
				 AND ur.roleid = r.assessmentroleid 
				 AND ura.ProgramID = ru.programID
 				 AND ura.deptID = ru.DeptID
 				 AND ura.superdivisionID = 2
 				 ORDER BY SuperDivisionName, DivisionName, DeptName, ProgramID, ReportingUnitID DESC
 			<cfelse>
 			--->
 				<!--- admins userroleID=1, reviewers userroleID=3, view only userroleID=4--->
 				SELECT  a.*, 
						         ProgramName, 
						         ProgramDegreeLevel, 
						         ProgramDegree, 
						         ProgramCIP,    
						         DeptName, 
						         SamasDeptID,      
						         DivisionName, 
						         DivisionAbv, 
						         SamasDivisionID,        
						         SuperDivisionName, 
						         OrganizationName  
			 
			 			FROM ReportingUnit a, 
			 				 OrganizationProgram p, 
			 				 OrganizationDept d, 
			 				 OrganizationDivision di,    
			 				 OrganizationSuperDivision s, 
			 				 Organization o 
			 
			 			WHERE ReportingUnitID IN ( 

			 				SELECT ReportingUnitID FROM ReportingUnit WHERE ( 


			 				<!--- only Admins and View only should include this part of the query --->
			 				<cfif session.user.userroleid EQ 1 OR  session.user.userroleid EQ 4 OR session.user.DeptID CONTAINS 999999 >	
			 				  <cfif structKeyExists(arguments.quseraccessids,"OrganizationID") and len(arguments.quseraccessids.OrganizationID)>
			 					OrganizationID=<cfqueryparam value="#arguments.quseraccessids.OrganizationID#" CFSQLType="cf_sql_integer" />
			 				  </cfif>

			 				   <cfif structKeyExists(arguments.quseraccessids,"SuperDivisionID") and len(arguments.quseraccessids.SuperDivisionID) AND arguments.quseraccessids.SuperDivisionID NEQ 999999>
			 				   	 AND	SuperDivisionID = <cfqueryparam value="#arguments.quseraccessids.SuperDivisionID#" CFSQLType="cf_sql_integer" />
			 				   </cfif>

			 				   <cfif structKeyExists(session.user,"divisionID") and len(session.user.DivisionID) >
			 				   	 AND	DivisionID IN (<cfqueryparam value="#session.user.DivisionID#" CFSQLType="cf_sql_varchar" list="true" />)
			 				   </cfif>

			 				   OR
			 				  </cfif>
			 				
			 				  <cfif structKeyExists(arguments.quseraccessids,"OrganizationID") and len(arguments.quseraccessids.OrganizationID)>
			 					OrganizationID=<cfqueryparam value="#arguments.quseraccessids.OrganizationID#" CFSQLType="cf_sql_integer" />
			 				  </cfif>

			 				   <cfif structKeyExists(arguments.quseraccessids,"SuperDivisionID") and len(arguments.quseraccessids.SuperDivisionID) AND arguments.quseraccessids.SuperDivisionID NEQ 999999>
			 				   	 AND	SuperDivisionID = <cfqueryparam value="#arguments.quseraccessids.SuperDivisionID#" CFSQLType="cf_sql_integer" />
			 				   </cfif>

			 				  <cfif structKeyExists(arguments.quseraccessids,"DivisionID") and len(arguments.quseraccessids.DivisionID) AND arguments.quseraccessids.DivisionID NEQ 999999>
			 				   	 AND	DivisionID IN ( <cfqueryparam value="#arguments.quseraccessids.divisionID#" CFSQLType="cf_sql_varchar" list="true"/> )
			 				   </cfif>
			 				   
			 				   <!--- exlude admins for this --->
			 				   <cfif session.user.userroleid NEQ 1>		 				 
				 				   <cfif structKeyExists(session.user,"DeptID") and len(session.user.DeptID) AND session.user.DeptID NEQ 999999>
				 				   	 	AND	DeptID IN (<cfqueryparam value="#session.user.DeptID#" CFSQLType="cf_sql_varchar"  list="true"/>)
				 				   	</cfif>

				 				   <cfif NOT structKeyExists(session.user,"ProgramID")  and len(session.user.ProgramID) and listfind(session.user.ProgramID,'999999') >
				 				   	 AND   ProgramID IN (<cfqueryparam value="#session.user.programID#" CFSQLType="cf_sql_varchar" list="true" />)
				 				   </cfif>
			 				   </cfif>
			 				
			 			) )
						 AND a.ProgramID = p.ProgramID 
						 And a.DeptID = d.DeptID And a.DivisionID = di.DivisionID 
						 And a.SuperDivisionID = s.SuperDivisionID 
						 And a.OrganizationID = o.OrganizationID  
						 AND a.ReportingUnitActive = 1
						 AND a.SuperDivisionID = 2
						 <!--- And a.programID <> -1 --->

			 			ORDER BY SuperDivisionName, DivisionName, DeptName, ProgramID, ReportingUnitID DESC

 			<!--- </cfif> --->
		</cfquery>


		<!--- 
		<cfdump var="#qList#" abort="true" label="@@reportingUnitsGateway_3" />
		--->
		
		<cfreturn qList />
	</cffunction>

	<cffunction name="getByAttributes" access="public" output="false" returntype="array">
		<cfargument name="ReportingUnitID" type="numeric" required="false" />
		<cfargument name="ProgramID" type="numeric" required="false" />
		<cfargument name="DeptID" type="numeric" required="false" />
		<cfargument name="DivisionID" type="numeric" required="false" />
		<cfargument name="SuperDivisionID" type="numeric" required="false" />
		<cfargument name="OrganizationID" type="numeric" required="false" />
		<cfargument name="ReportingUnitActive" type="numeric" required="false" />
		<cfargument name="orderby" type="string" required="false" />
		
		<cfset var qList = getByAttributesQuery(argumentCollection=arguments) />		
		<cfset var arrObjects = arrayNew(1) />
		<cfset var tmpObj = "" />
		<cfset var i = 0 />
		<cfloop from="1" to="#qList.recordCount#" index="i">
			<cfset tmpObj = createObject("component","reportingunits").init(argumentCollection=queryRowToStruct(qList,i)) />
			<cfset arrayAppend(arrObjects,tmpObj) />
		</cfloop>
				
		<cfreturn arrObjects />
	</cffunction>

	<cffunction name="queryRowToStruct" access="private" output="false" returntype="struct">
		<cfargument name="qry" type="query" required="true">
		
		<cfscript>
			/**
			 * Makes a row of a query into a structure.
			 * 
			 * @param query 	 The query to work with. 
			 * @param row 	 Row number to check. Defaults to row 1. 
			 * @return Returns a structure. 
			 * @author Nathan Dintenfass (nathan@changemedia.com) 
			 * @version 1, December 11, 2001 
			 */
			//by default, do this to the first row of the query
			var row = 1;
			//a var for looping
			var ii = 1;
			//the cols to loop over
			var cols = listToArray(qry.columnList);
			//the struct to return
			var stReturn = structnew();
			//if there is a second argument, use that for the row number
			if(arrayLen(arguments) GT 1)
				row = arguments[2];
			//loop over the cols and build the struct from the query row
			for(ii = 1; ii lte arraylen(cols); ii = ii + 1){
				stReturn[cols[ii]] = qry[cols[ii]][row];
			}		
			//return the struct
			return stReturn;
		</cfscript>
	</cffunction>

</cfcomponent>
