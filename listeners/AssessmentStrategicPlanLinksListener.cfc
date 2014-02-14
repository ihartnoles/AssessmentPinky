<cfcomponent name="AssessmentStrategicPlanLinksListener" displayname="AssessmentStrategicPlanLinksListener" output="false" 
		extends="MachII.framework.Listener" 
		hint="AssessmentStrategicPlanLinksListener">
	
	<cffunction name="configure" access="public" output="false" 
			returntype="void" 
			hint="Configures this listener as part of the Mach-II framework">
		<!--- do nothing for now --->
		<cfset var sf = getProperty("ServiceFactory")>
		

		 <cfset variables.AssessmentStrategicPlanLinksService 	= sf.getBean('AssessmentStrategicPlanLinksService') /> 
	</cffunction>
	
	<cffunction name="getAssessmentStrategicPlanLinkss" access="public" output="false" returntype="query" hint="I list AssessmentStrategicPlanLinkss as a query" >
		<cfargument name="event" type="MachII.framework.Event" required="true" />
		<cfset var ret = "" />
		
		<cfset ret = variables.AssessmentStrategicPlanLinksService.getAssessmentStrategicPlanLinkss( argumentCollection = arguments.event.getArgs() ) />
		 
		<cfreturn ret />
	</cffunction>

	<cffunction name="getAssessmentStrategicPlanLinks" access="public" output="false" returntype="AssessmentStrategicPlanLinks" hint="I get a AssessmentStrategicPlanLinks object by ID" >
		<cfargument name="event" type="MachII.framework.Event" required="true" />
		<cfset var ret = "" />
		
		<cfset ret = variables.AssessmentStrategicPlanLinksService.getAssessmentStrategicPlanLinks( argumentCollection = arguments.event.getArgs() ) />
		 
		<cfreturn ret />
	</cffunction>

	<cffunction name="saveAssessmentStrategicPlanLinks" access="public" output="false" returntype="void" hint="I save a AssessmentStrategicPlanLinks object" >
		<cfargument name="event" type="MachII.framework.Event" required="true" />
		
		<cfset var successEvent = arguments.event.getArg('successEvent','[EVENTROOT].editAssessmentStrategicPlanLinks') />
		<cfset var failEvent = arguments.event.getArg('failEvent','[EVENTROOT].editAssessmentStrategicPlanLinks') />
		<cfset var aErrors = [] />
		<cfset var errorMsg = "" />
		<cfset var i = "" />
		
		<cfset var AssessmentStrategicPlanLinksBean = variables.AssessmentStrategicPlanLinksService.createAssessmentStrategicPlanLinks( argumentCollection = arguments.event.getArgs() ) />
		<cfif AssessmentStrategicPlanLinksBean.isValid() >
			<cfset AssessmentStrategicPlanLinksBean = variables.AssessmentStrategicPlanLinksService.saveAssessmentStrategicPlanLinks(AssessmentStrategicPlanLinksBean) />
			<cfset session.layout_message = "AssessmentStrategicPlanLinks Saved!" />
			<cfset redirectEvent(successEvent, {AssessmentStrategicPlanLinksBean = AssessmentStrategicPlanLinksBean}) />
		<cfelse>
			<cfset aErrors = AssessmentStrategicPlanLinksBean.validate() />
			<cfset errorMsg = "Please fix the following errors:<ul>" />
			<cfloop from="1" to="#arrayLen( aErrors )#" index="i">
				<cfset errorMsg &= "<li>" & aErrors[i].message & "</li>" />
			</cfloop>
			<cfset errorMsg &= "</ul>"/>
			<cfset session.layout_error = errorMsg />
			<cfset announceEvent(failEvent, {AssessmentStrategicPlanLinksBean = AssessmentStrategicPlanLinksBean}) />
		</cfif>
	</cffunction>

	<cffunction name="deleteAssessmentStrategicPlanLinks" access="public" output="false" returntype="void" hint="I delete a AssessmentStrategicPlanLinks object by ID" >
		<cfargument name="event" type="MachII.framework.Event" required="true" />
		
		<cfset var success = false />
		<cfset var successEvent = arguments.event.getArg('successEvent','[EVENTROOT].listAssessmentStrategicPlanLinks') />
		<cfset var failEvent = arguments.event.getArg('failEvent','[EVENTROOT].listAssessmentStrategicPlanLinks') />
		<cfset var args = {} />
		<cfset args.RecordID = arguments.event.getArg( 'RecordID', 0 ) />
		
		<cfif isNumeric( args.RecordID ) >
			<cfset success = variables.AssessmentStrategicPlanLinksService.deleteAssessmentStrategicPlanLinks( argumentCollection = args ) />
		</cfif>
		
		<cfif success>
			<cfset session.layout_message = "AssessmentStrategicPlanLinks Deleted!" />
			<cfset redirectEvent(successEvent, args ) />
		<cfelse>
			<cfset session.layout_error = "Could not delete AssessmentStrategicPlanLinks" />
			<cfset announceEvent(failEvent, args ) />
		</cfif>
	</cffunction>

	<cffunction name="saveGoals" access="public" output="false" 
			returntype="void" >
		<cfargument name="event" type="MachII.framework.Event" required="true" />
		
		<!--- 	
		<cfdump var="#arguments#" abort="false" label="arguments @@strategicPlanGoalsListener" />
		<cfdump var="#request.event.getArgs()#" abort="true" label="@@strategicPlanGoalsListener" />
		--->

		<!--- 1) Delete all existing for the outcomeID; delete * from  ??? where outcomeID = request.event.getArg('outcomeID') --->
		<cfset local.deleteExisting = variables.AssessmentStrategicPlanLinksService.deleteGoals(outcomeID = request.event.getArg('outcomeID')) />
		

		<!--- 2) Loop over  goalID --->
		<cfloop list="#request.event.getArg('goalID')#" index="idx">
			<!--- 3) Save the categories one by one --->
			<cfset local.savegoals = variables.AssessmentStrategicPlanLinksService.saveGoals(outcomeID 	 	= request.event.getArg('outcomeID'),
																							 objectiveID    = idx) />
		</cfloop>		
		
	</cffunction>

	
</cfcomponent>