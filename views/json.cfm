<!---
<cfquery name="resp" datasource="Assessment">
	select * from organizationSuperDivision
    where SuperDivisionID <> -1
</cfquery>
--->
<!---
<cfscript>

if ( isDefined("superdivision") AND isDefined("model") ){
	
	writeOutput("two for the road");

} else if (isDefined("superdivision") AND superdivision eq "bmw") {
	
	response = {};
	
	for (x = 1; x <= resp.RecordCount; x=x+1) { 
    	StructInsert(response, resp.SuperDivisionID[x], resp.superdivisionname[x]);
	}
	

	writeOutput(serializeJSON(response));

} else {
	


	writeOutput("Hmmm");
}
</cfscript>
--->
<!--- 
<cfdump var="#request.event.getArgs()#" abort="true" />
--->

<cfscript>



if ( isDefined("SuperDivisionID") AND len(request.event.getArg('superDivisionID')) AND NOT isDefined("divisionID") ) {
	
	qDivisionResults = request.event.getArg('qDivisionResults');

	//writeDump(var=qDivisionResults);

	response = createObject("java", "java.util.LinkedHashMap").init();
	
	for (x = 1; x <= qDivisionResults.RecordCount; x=x+1) { 
    	StructInsert(response, qDivisionResults.DivisionID[x], qDivisionResults.DivisionName[x]);
    }

    structInsert(response, "0", "-- Choose One --");

	//structSort(response, "text", "desc", "" );

	//writeDump(var=response, abort=true);

	writeOutput(serializeJSON(response));

} else if ( isDefined("SuperDivisionID") AND isDefined("divisionID") AND len(request.event.getArg('divisionID')) ) {

	qDepartmentResults = request.event.getArg('qDepartmentResults');

	response = createObject("java", "java.util.LinkedHashMap").init();
	
	for (x = 1; x <= qDepartmentResults.RecordCount; x=x+1) { 
    	StructInsert(response, qDepartmentResults.DeptID[x], qDepartmentResults.DeptName[x]);
	}
	
	structInsert(response, "0", "--- Choose One --");

	//structSort(response, "text", "DESC" );

	writeOutput(serializeJSON(response));

} else {

	response = createObject("java", "java.util.LinkedHashMap").init();
	
	structInsert(response, "0", "-- Choose One --");

	writeOutput(serializeJSON(response));

}
</cfscript>
