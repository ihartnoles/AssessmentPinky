<!---
	COMPONENT: TaskListener
--->

<cfcomponent name="TaskListener" displayname="TaskListener" output="false" 
		extends="MachII.framework.Listener" 
		hint="TaskListener">
	
	<cffunction name="configure" access="public" output="false" 
			returntype="void" 
			hint="Configures this listener as part of the Mach-II framework">
		<!--- do nothing for now --->
		<cfset var sf = getProperty("ServiceFactory")>
		

		 <cfset variables.tasksService 	= sf.getBean('tasksService') /> 
	</cffunction>

	<cffunction name="getTasks" access="public" output="false" 
			returntype="query" >
		<cfargument name="event" type="MachII.framework.Event" required="true" />

			
		<cfreturn variables.tasksService.getByAttributesQuery(UserID=session.user.userID) >
	</cffunction>
	
	<cffunction name="addTask" access="public" output="false" 
			returntype="numeric" >
		<cfargument name="event" type="MachII.framework.Event" required="true" />

		<!---
		<cfdump var="#request.event.getArgs()#" abort="true" label="@@TaskListener-31" output="C:\request.html"  format="html"/>
		--->

		<cfreturn variables.tasksService.savetasks(task_text=request.event.getArg('task_text')) >
	</cffunction>

	
	<cffunction name="updateTask" access="public" output="false" 
			returntype="numeric" >
		<cfargument name="event" type="MachII.framework.Event" required="true" />

		<cfset local.args = {} >

		<cfset local.args.taskid = request.event.getArg('taskid')/>

		<cfif len(trim(request.event.getArg('done')))>
			<cfset local.args.done = request.event.getArg('done')/>
		</cfif>
	

		<cfif len(trim(request.event.getArg('bookmarked')))>
			<cfset local.args.bookmarked = request.event.getArg('bookmarked')/>
		</cfif>

		<cfif len(trim(request.event.getArg('task_text')))>
			<cfset local.args.task_text = request.event.getArg('task_text')/>
		</cfif>

		<cfreturn variables.tasksService.updateTask(argumentCollection = local.args) >
	</cffunction>
    
    <cffunction name="deleteTask" access="public" output="false" 
			returntype="boolean" >
		<cfargument name="event" type="MachII.framework.Event" required="true" />

			
		<cfreturn variables.tasksService.deletetasks(taskid=request.event.getArg('taskid')) >
	</cffunction>

</cfcomponent>