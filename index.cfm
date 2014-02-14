<!---
<!--- Set the path to the application's mach-ii.xml file. --->
<cfset MACHII_CONFIG_PATH = ExpandPath("./config/mach-ii.xml") />
<!--- Set the configuration mode (when to reload): -1=never, 0=dynamic, 1=always --->
<cfset MACHII_CONFIG_MODE = 1 />
<!--- Set the app key for sub-applications within a single cf-application. --->
<!--- <cfset MACHII_APP_KEY = GetFileFromPath(ExpandPath(".")) /> --->
<cfset MACHII_APP_KEY = 'DEV' />
<!--- Include the mach-ii.cfm file included with the core code. --->
<cfset MACHII_DTD_PATH     = ExpandPath("/Mach-II/mach-ii_1_1_1.dtd") />

<cfset MACHII_VALIDATE_XML = false />

--->
<cfinclude template="/MachII/mach-ii.cfm" />

