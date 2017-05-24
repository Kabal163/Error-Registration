<cflogin idletimeout="1800">
	<cfif #CGI.QUERY_STRING# is "">
		<cfset formAction = #CGI.SCRIPT_NAME#>
	<cfelse>
		<cfset formAction = "#CGI.SCRIPT_NAME#?#CGI.QUERY_STRING#">
	</cfif>
	<cfif #CGI.SCRIPT_NAME# EQ "/MyApp2/registration.cfm">
		<cfinclude template="registration.cfm">
		<cfabort>
	</cfif>
	<cfif NOT (isDefined("Form.login") AND isDefined("Form.password"))>
		<cfinclude template="login.cfm" >
		<cfabort>
	<cfelse>
		<cfquery name = "userInfo" datasource="errors">
			SELECT user_id, user_login, user_password, user_first_name, user_last_name
			FROM users
			WHERE user_login = <cfqueryparam  value="#Form.login#" cfsqltype="cf_sql_varchar">
			AND user_password = <cfqueryparam value="#Form.password#" cfsqltype="cf_sql_varchar">
		</cfquery>	
		<cfif userInfo.RecordCount EQ '1'>
			<cfloginuser name="#userInfo.user_login#, #userInfo.user_id#, #userInfo.user_first_name# #userInfo.user_last_name#" 
			password="#userInfo.user_password#" roles="user">
		<cfelse>
			<cfset invalid = "yes">
			<cfinclude template="login.cfm" >
			<cfabort>
		</cfif>
	</cfif>
</cflogin>
<cfset userLogin = trim(ListFirst(GetAuthUser()))>
<cfset userId = trim(ListGetAt(GetAuthUser(), 2))>
<cfset userFullName = trim(ListGetAt(GetAuthUser(), 3))>