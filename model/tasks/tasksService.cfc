
<cfcomponent name="tasksService" output="false">

	<cffunction name="init" access="public" output="false" returntype="tasksService">
		<cfargument name="tasksDAO" type="tasksDAO" required="true" />
		<cfargument name="tasksGateway" type="tasksGateway" required="true" />

		<cfset variables.tasksDAO = arguments.tasksDAO />
		<cfset variables.tasksGateway = arguments.tasksGateway />

		<cfreturn this/>
	</cffunction>

	<cffunction name="createtasks" access="public" output="false" returntype="tasks">
		<cfargument name="TaskID" type="numeric" required="false" />
		<cfargument name="userID" type="numeric" required="false" />
		<cfargument name="task_text" type="string" required="false" />
		<cfargument name="done" type="numeric" required="false" />
		<cfargument name="bookmarked" type="numeric" required="false" />
		
			
		<cfset var tasks = createObject("component","tasks").init(argumentCollection=arguments) />
		<cfreturn tasks />
	</cffunction>

	<cffunction name="gettasks" access="public" output="false" returntype="tasks">
		
		<cfset var tasks = createtasks(argumentCollection=arguments) />
		<cfset variables.tasksDAO.read(tasks) />
		<cfreturn tasks />
	</cffunction>

	<cffunction name="gettaskss" access="public" output="false" returntype="array">
		<cfargument name="TaskID" type="numeric" required="false" />
		<cfargument name="userID" type="numeric" required="false" />
		<cfargument name="task_text" type="string" required="false" />
		<cfargument name="done" type="numeric" required="false" />
		<cfargument name="bookmarked" type="numeric" required="false" />
		
		<cfreturn variables.tasksGateway.getByAttributes(argumentCollection=arguments) />
	</cffunction>

	<cffunction name="savetasks" access="public" output="false" returntype="numeric">
		<cfargument name="task_text" type="string" required="true" />

		<!---
		<cfdump var="#arguments#" abort="false" label="@@taskService-55" output="C:\arguments.html"  format="html"/>
		--->

		<!--- create the bean --->
		<cfset local.taskBean = createtasks(TaskID = 0,
											userID = session.user.userID,
											task_text = arguments.task_text,
											done = 0,
											bookmarked = 0) />

		<!--- 
		<cfdump var="#local.taskBean#" abort="true" label="@@taskService-55" output="C:\taskbean.html"  format="html"/>
		--->
		<cfreturn variables.tasksDAO.save(local.taskBean) />
	</cffunction>

	<cffunction name="updateTask" access="public" output="false" returntype="boolean">
		<cfargument name="argumentCollection" type="any" required="true" />
		
		<!--- 
		<cfdump var="#arguments#" abort="false" label="@@taskService-55" output="C:\arguments.html"  format="html"/>
		--->

		<!--- create the bean --->
		<cfset local.taskBean = gettasks(TaskID = arguments.taskID) />

		<cfset local.taskBean.setUserID(session.user.userID) />

		<!--- set the properties --->
		<cfif structkeyexists(arguments,"task_text") >
			<cfset local.taskBean.settask_text(arguments.task_text) />
		</cfif>

		<cfif structkeyexists(arguments,"done")>
			<cfset local.taskBean.setdone(arguments.done) />
		</cfif>

		<cfif structkeyexists(arguments,"bookmarked")>
			<cfset local.taskBean.setbookmarked(arguments.bookmarked) />
		</cfif>

		<!--- 
		<cfdump var="#local.taskBean#" abort="true" label="@@taskService-95" output="C:\taskbean.html"  format="html"/>
		--->
		<cfreturn variables.tasksDAO.save(local.taskBean) />
	</cffunction>
	

	<cffunction name="addTask" access="public" output="false" returntype="boolean">
		<cfargument name="task_text" type="tasks" required="true" />

		<cfreturn variables.tasksDAO.save(tasks) />
	</cffunction>

	<cffunction name="deletetasks" access="public" output="false" returntype="boolean">
		
		<cfset var tasks = createtasks(argumentCollection=arguments) />
		<cfreturn variables.tasksDAO.delete(tasks) />
	</cffunction>

	<cffunction name="onMissingMethod" access="public" output="false" >
		<cfargument name="missingMethodName" type="string" hint="Name of missing method" />
		<cfargument name="missingMethodArguments" type="any" hint="Arguments passed to the missing method, maybe a named arg set or a numerically indexed set" />

		<cfset var ret = ""/>
		<cfinvoke component="#variables.tasksGateway#" 
				  method="#arguments.missingMethodName#" 
				  argumentcollection="#arguments.missingMethodArguments#" 
				  returnvariable="ret"/>
		<cfreturn ret />
	</cffunction>
</cfcomponent>
