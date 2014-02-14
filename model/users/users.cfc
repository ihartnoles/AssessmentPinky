
<cfcomponent displayname="users" output="false">
		<cfproperty name="UserID" type="numeric" default="" />
		<cfproperty name="UserLname" type="string" default="" />
		<cfproperty name="UserFname" type="string" default="" />
		<cfproperty name="UserInitial" type="string" default="" />
		<cfproperty name="UserTitle" type="string" default="" />
		<cfproperty name="UserAddress" type="string" default="" />
		<cfproperty name="UserCampus" type="string" default="" />
		<cfproperty name="UserPhoneAcode" type="string" default="" />
		<cfproperty name="UserPhoneNumber" type="string" default="" />
		<cfproperty name="UserEmail" type="string" default="" />
		<cfproperty name="UserName" type="string" default="" />
		<cfproperty name="UserPassword" type="string" default="" />
		<cfproperty name="UserTrained" type="numeric" default="" />
		
	<!---
	PROPERTIES
	--->
	<cfset variables.instance = StructNew() />

	<!---
	INITIALIZATION / CONFIGURATION
	--->
	<cffunction name="init" access="public" returntype="users" output="false">
		<cfargument name="UserID" type="string" required="false" default="" />
		<cfargument name="UserLname" type="string" required="false" default="" />
		<cfargument name="UserFname" type="string" required="false" default="" />
		<cfargument name="UserInitial" type="string" required="false" default="" />
		<cfargument name="UserTitle" type="string" required="false" default="" />
		<cfargument name="UserAddress" type="string" required="false" default="" />
		<cfargument name="UserCampus" type="string" required="false" default="" />
		<cfargument name="UserPhoneAcode" type="string" required="false" default="" />
		<cfargument name="UserPhoneNumber" type="string" required="false" default="" />
		<cfargument name="UserEmail" type="string" required="false" default="" />
		<cfargument name="UserName" type="string" required="false" default="" />
		<cfargument name="UserPassword" type="string" required="false" default="" />
		<cfargument name="UserTrained" type="string" required="false" default="" />
		
		<!--- run setters --->
		<cfset setUserID(arguments.UserID) />
		<cfset setUserLname(arguments.UserLname) />
		<cfset setUserFname(arguments.UserFname) />
		<cfset setUserInitial(arguments.UserInitial) />
		<cfset setUserTitle(arguments.UserTitle) />
		<cfset setUserAddress(arguments.UserAddress) />
		<cfset setUserCampus(arguments.UserCampus) />
		<cfset setUserPhoneAcode(arguments.UserPhoneAcode) />
		<cfset setUserPhoneNumber(arguments.UserPhoneNumber) />
		<cfset setUserEmail(arguments.UserEmail) />
		<cfset setUserName(arguments.UserName) />
		<cfset setUserPassword(arguments.UserPassword) />
		<cfset setUserTrained(arguments.UserTrained) />
		
		<cfreturn this />
 	</cffunction>

	<!---
	PUBLIC FUNCTIONS
	--->
	<cffunction name="setMemento" access="public" returntype="users" output="false">
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
		
		<!--- UserID --->
		<cfif NOT len(trim(getUserID())) >
			<cfset thisError.field = "UserID" />
			<cfset thisError.type = "required" />
			<cfset thisError.message = "UserID iis required" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- UserLname --->
		<cfif (NOT len(trim(getUserLname())))>
			<cfset thisError.field = "UserLname" />
			<cfset thisError.type = "required" />
			<cfset thisError.message = "UserLname is required" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getUserLname())) AND NOT IsSimpleValue(trim(getUserLname())))>
			<cfset thisError.field = "UserLname" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "UserLname is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getUserLname())) GT 50)>
			<cfset thisError.field = "UserLname" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "UserLname is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- UserFname --->
		<cfif (NOT len(trim(getUserFname())))>
			<cfset thisError.field = "UserFname" />
			<cfset thisError.type = "required" />
			<cfset thisError.message = "UserFname is required" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getUserFname())) AND NOT IsSimpleValue(trim(getUserFname())))>
			<cfset thisError.field = "UserFname" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "UserFname is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getUserFname())) GT 20)>
			<cfset thisError.field = "UserFname" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "UserFname is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- UserInitial --->
		<cfif (len(trim(getUserInitial())) AND NOT IsSimpleValue(trim(getUserInitial())))>
			<cfset thisError.field = "UserInitial" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "UserInitial is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getUserInitial())) GT 2)>
			<cfset thisError.field = "UserInitial" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "UserInitial is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- UserTitle --->
		<cfif (len(trim(getUserTitle())) AND NOT IsSimpleValue(trim(getUserTitle())))>
			<cfset thisError.field = "UserTitle" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "UserTitle is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getUserTitle())) GT 50)>
			<cfset thisError.field = "UserTitle" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "UserTitle is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- UserAddress --->
		<cfif (len(trim(getUserAddress())) AND NOT IsSimpleValue(trim(getUserAddress())))>
			<cfset thisError.field = "UserAddress" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "UserAddress is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getUserAddress())) GT 50)>
			<cfset thisError.field = "UserAddress" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "UserAddress is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- UserCampus --->
		<cfif (len(trim(getUserCampus())) AND NOT IsSimpleValue(trim(getUserCampus())))>
			<cfset thisError.field = "UserCampus" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "UserCampus is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getUserCampus())) GT 2)>
			<cfset thisError.field = "UserCampus" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "UserCampus is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- UserPhoneAcode --->
		<cfif (len(trim(getUserPhoneAcode())) AND NOT IsSimpleValue(trim(getUserPhoneAcode())))>
			<cfset thisError.field = "UserPhoneAcode" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "UserPhoneAcode is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getUserPhoneAcode())) GT 3)>
			<cfset thisError.field = "UserPhoneAcode" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "UserPhoneAcode is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- UserPhoneNumber --->
		<cfif (len(trim(getUserPhoneNumber())) AND NOT IsSimpleValue(trim(getUserPhoneNumber())))>
			<cfset thisError.field = "UserPhoneNumber" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "UserPhoneNumber is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getUserPhoneNumber())) GT 7)>
			<cfset thisError.field = "UserPhoneNumber" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "UserPhoneNumber is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- UserEmail --->
		<cfif (len(trim(getUserEmail())) AND NOT IsSimpleValue(trim(getUserEmail())))>
			<cfset thisError.field = "UserEmail" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "UserEmail is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getUserEmail())) GT 50)>
			<cfset thisError.field = "UserEmail" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "UserEmail is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- UserName --->
		<cfif (len(trim(getUserName())) AND NOT IsSimpleValue(trim(getUserName())))>
			<cfset thisError.field = "UserName" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "UserName is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getUserName())) GT 50)>
			<cfset thisError.field = "UserName" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "UserName is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- UserPassword --->
		<cfif (len(trim(getUserPassword())) AND NOT IsSimpleValue(trim(getUserPassword())))>
			<cfset thisError.field = "UserPassword" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "UserPassword is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getUserPassword())) GT 8)>
			<cfset thisError.field = "UserPassword" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "UserPassword is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- UserTrained --->
		<cfif (len(trim(getUserTrained())) AND NOT isNumeric(trim(getUserTrained())))>
			<cfset thisError.field = "UserTrained" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "UserTrained is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<cfreturn errors />
	</cffunction>

	<!---
	ACCESSORS
	--->
	<cffunction name="setUserID" access="public" returntype="void" output="false">
		<cfargument name="UserID" type="string" required="true" />
		<cfset variables.instance.UserID = arguments.UserID />
	</cffunction>
	<cffunction name="getUserID" access="public" returntype="string" output="false">
		<cfreturn variables.instance.UserID />
	</cffunction>

	<cffunction name="setUserLname" access="public" returntype="void" output="false">
		<cfargument name="UserLname" type="string" required="true" />
		<cfset variables.instance.UserLname = arguments.UserLname />
	</cffunction>
	<cffunction name="getUserLname" access="public" returntype="string" output="false">
		<cfreturn variables.instance.UserLname />
	</cffunction>

	<cffunction name="setUserFname" access="public" returntype="void" output="false">
		<cfargument name="UserFname" type="string" required="true" />
		<cfset variables.instance.UserFname = arguments.UserFname />
	</cffunction>
	<cffunction name="getUserFname" access="public" returntype="string" output="false">
		<cfreturn variables.instance.UserFname />
	</cffunction>

	<cffunction name="setUserInitial" access="public" returntype="void" output="false">
		<cfargument name="UserInitial" type="string" required="true" />
		<cfset variables.instance.UserInitial = arguments.UserInitial />
	</cffunction>
	<cffunction name="getUserInitial" access="public" returntype="string" output="false">
		<cfreturn variables.instance.UserInitial />
	</cffunction>

	<cffunction name="setUserTitle" access="public" returntype="void" output="false">
		<cfargument name="UserTitle" type="string" required="true" />
		<cfset variables.instance.UserTitle = arguments.UserTitle />
	</cffunction>
	<cffunction name="getUserTitle" access="public" returntype="string" output="false">
		<cfreturn variables.instance.UserTitle />
	</cffunction>

	<cffunction name="setUserAddress" access="public" returntype="void" output="false">
		<cfargument name="UserAddress" type="string" required="true" />
		<cfset variables.instance.UserAddress = arguments.UserAddress />
	</cffunction>
	<cffunction name="getUserAddress" access="public" returntype="string" output="false">
		<cfreturn variables.instance.UserAddress />
	</cffunction>

	<cffunction name="setUserCampus" access="public" returntype="void" output="false">
		<cfargument name="UserCampus" type="string" required="true" />
		<cfset variables.instance.UserCampus = arguments.UserCampus />
	</cffunction>
	<cffunction name="getUserCampus" access="public" returntype="string" output="false">
		<cfreturn variables.instance.UserCampus />
	</cffunction>

	<cffunction name="setUserPhoneAcode" access="public" returntype="void" output="false">
		<cfargument name="UserPhoneAcode" type="string" required="true" />
		<cfset variables.instance.UserPhoneAcode = arguments.UserPhoneAcode />
	</cffunction>
	<cffunction name="getUserPhoneAcode" access="public" returntype="string" output="false">
		<cfreturn variables.instance.UserPhoneAcode />
	</cffunction>

	<cffunction name="setUserPhoneNumber" access="public" returntype="void" output="false">
		<cfargument name="UserPhoneNumber" type="string" required="true" />
		<cfset variables.instance.UserPhoneNumber = arguments.UserPhoneNumber />
	</cffunction>
	<cffunction name="getUserPhoneNumber" access="public" returntype="string" output="false">
		<cfreturn variables.instance.UserPhoneNumber />
	</cffunction>

	<cffunction name="setUserEmail" access="public" returntype="void" output="false">
		<cfargument name="UserEmail" type="string" required="true" />
		<cfset variables.instance.UserEmail = arguments.UserEmail />
	</cffunction>
	<cffunction name="getUserEmail" access="public" returntype="string" output="false">
		<cfreturn variables.instance.UserEmail />
	</cffunction>

	<cffunction name="setUserName" access="public" returntype="void" output="false">
		<cfargument name="UserName" type="string" required="true" />
		<cfset variables.instance.UserName = arguments.UserName />
	</cffunction>
	<cffunction name="getUserName" access="public" returntype="string" output="false">
		<cfreturn variables.instance.UserName />
	</cffunction>

	<cffunction name="setUserPassword" access="public" returntype="void" output="false">
		<cfargument name="UserPassword" type="string" required="true" />
		<cfset variables.instance.UserPassword = arguments.UserPassword />
	</cffunction>
	<cffunction name="getUserPassword" access="public" returntype="string" output="false">
		<cfreturn variables.instance.UserPassword />
	</cffunction>

	<cffunction name="setUserTrained" access="public" returntype="void" output="false">
		<cfargument name="UserTrained" type="string" required="true" />
		<cfset variables.instance.UserTrained = arguments.UserTrained />
	</cffunction>
	<cffunction name="getUserTrained" access="public" returntype="string" output="false">
		<cfreturn variables.instance.UserTrained />
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
