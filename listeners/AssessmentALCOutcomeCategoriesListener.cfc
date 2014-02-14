<!---
	COMPONENT: AssessmentALCOutcomeCategoriesListener
--->

<cfcomponent name="AssessmentALCOutcomeCategoriesListener" displayname="AssessmentALCOutcomeCategoriesListener" output="false" 
		extends="MachII.framework.Listener" 
		hint="AssessmentALCOutcomeCategoriesListener">
	
	<cffunction name="configure" access="public" output="false" 
			returntype="void" 
			hint="Configures this listener as part of the Mach-II framework">
		<!--- do nothing for now --->
		<cfset var sf = getProperty("ServiceFactory")>
		

		 <cfset variables.AssessmentALCOutcomeCategoriesService = sf.getBean('AssessmentALCOutcomeCategoriesService') /> 
	</cffunction>
	
	
	<cffunction name="saveALCCategoriesSelected" access="public" output="false" 
			returntype="void" >
		<cfargument name="event" type="MachII.framework.Event" required="true" />
		
		<!--- 	
		<cfdump var="#arguments#" abort="false" label="arguments @@AssALCOutcomeCategoriesListener" />
		<cfdump var="#request.event.getArgs()#" abort="true" label="@@AssALCOutcomeCategoriesListener" />
		--->

		<!--- 1) Delete all existing for the outcomeID; delete * from  AssessmentALCOutcomeCategories where outcomeID = request.event.getArg('outcomeID') --->
		<cfset local.deleteExisting = variables.AssessmentALCOutcomeCategoriesService.deleteALCCategories(outcomeID = request.event.getArg('outcomeID')) />
			
		<!--- 2) Loop over  ALCSubgcategories --->
		<cfloop list="#request.event.getArg('ALCSubCategory')#" index="idx">
			<!--- 3) Save the categories one by one --->
			<cfset local.saveALCCategories = variables.AssessmentALCOutcomeCategoriesService.saveALCCategories(outcomeID 	 = request.event.getArg('outcomeID'),
																											   SubCategoryID = idx) />
		</cfloop>		
		
	</cffunction>
	
</cfcomponent>