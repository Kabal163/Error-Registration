<cfif IsUserLoggedIn()>
	<cflogout>
	<cfset structClear(session)>
	<cflocation url="main.cfm" >
	<cfabort >
</cfif>