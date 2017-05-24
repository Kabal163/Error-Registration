<cfparam name="briefDesc" default="" >
<cfparam name="fullDesc" default="" >
<cfif isDefined("Form.briefDesc")>
	<cfset briefDesc = #Form.briefDesc#>
</cfif>
<cfif isDefined("Form.fullDesc")>
	<cfset fullDesc = #Form.fullDesc#>
</cfif>
<cfif isDefined("Form.status")>
	<cfset statusId = #Form.status#>
</cfif>
<cfif isDefined("Form.timeBound")>
	<cfset timeBoundId = #Form.timeBound#>
</cfif>
<cfif isDefined("Form.importance")>
	<cfset importanceId = #Form.importance#>
</cfif>
<cfif isDefined("Form.user")>
	<cfset userId = #Form.user#>
	<cfquery name="errorReg" datasource="errors">
		INSERT INTO error (brief_desc, full_desc, user_id, status_id, time_bound_id, importance_id)
		VALUES (<cfqueryparam value="#briefDesc#" cfsqltype="cf_sql_varchar">
			, <cfqueryparam value="#fullDesc#" cfsqltype="cf_sql_varchar">
			, <cfqueryparam value="#userId#" cfsqltype="cf_sql_numeric">
			, <cfqueryparam value="#statusId#" cfsqltype="cf_sql_numeric">
			, <cfqueryparam value="#timeBoundId#" cfsqltype="cf_sql_numeric">
			, <cfqueryparam value="#importanceId#" cfsqltype="cf_sql_numeric">);
	</cfquery>	
</cfif>	

<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/regError.css">
    <title>Регистрация ошибки</title>
</head>
<body>
    <nav class="navbar fixed-top navbar-toggleable-sm navbar-inverse bg-inverse">
        <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <a class="navbar-brand" href="main.cfm"><cfoutput>#userFullName#</cfoutput></a>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item">
                    <a class="nav-link" href="main.cfm">На главную<span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="errorShow.cfm">Просмотреть ошибку<span class="sr-only">(current)</span></a>
                </li>
                <li>
                    <a class="nav-link" href="#">Просмотреть все<span class="sr-only">(current)</span></a>
                </li>
            </ul>
            <div class="form-inline my-2 my-lg-0">
            	<ul class="navbar-nav mr-auto">
            		<li>
	                	<a class="nav-link" href="logout.cfm">Выйти</a>
	                </li>
            	</ul>
            </div>
        </div>
    </nav>
    <div class="container creation-holder">
    	<form id="form-error-reg" method="post" >
    		<cfquery name="errorCriteria" datasource="errors">
				select st.status_id, st.status_value, tb.time_bound_id, tb.time_bound_value, im.importance_id, im.importance_value
				from status st
				full outer join time_bound tb on st.status_id = tb.time_bound_id
				full outer join importance im on st.status_id = im.importance_id;
			</cfquery>
   			<table class="table">
   				<tr>
	   				<td>Краткое описание</td>
	   				<td>
	   					<div class="form-group input-group">
	   						<textarea class="blue-border form-control" name="briefDesc" cols="70" rows="3" required="required" ></textarea>
	   					</div>
	   				</td>
   				<tr>
   				<tr>
	   				<td>Подробное описание</td>
	   				<td>
	   					<div class="form-group">
	   						<textarea class="blue-border form-control" name="fullDesc" cols="70" rows="3"></textarea>
	   					</div>
	   				</td>
   				<tr>
   				<tr>
	   				<td>Пользователь</td>
	   				<td>
	   					<div class="form-group">
	   						<input type="text" class="form-control blue-border" name="user" 
	   							value="<cfoutput>#userId#</cfoutput>" 
	   							placeholder="<cfoutput>#userFullName#</cfoutput>" readonly/>
	   					</div>
	   				</td>
   				<tr>	
   				<tr>
	   				<td>Статус</td>
	   				<td>
	   					<div class="form-group">
	   						<select class="form-control" name="status">
	   							<cfoutput query="errorCriteria">
	   								<option value="#status_id#">#status_value#</option>
	   							</cfoutput>
	   						</select>
	   					</div>
	   				</td>
   				<tr>
   					<tr>
	   				<td>Срочность</td>
	   				<td>
	   					<div class="form-group">
	   						<select class="form-control" name="timeBound">
	   							<cfoutput query="errorCriteria">
	   								<option value="#time_bound_id#">#time_bound_value#</option>
	   							</cfoutput>
	   						</select>
	   					</div>
	   				</td>
   				<tr>
   					<tr>
   					<tr>
	   				<td>Критичность</td>
	   				<td>
	   					<div class="form-group">
	   						<select class="form-control" name="importance">
	   							<cfoutput query="errorCriteria">
	   								<option value="#importance_id#">#importance_value#</option>
	   							</cfoutput>
	   						</select>
	   					</div>
	   				</td>
   				<tr>
   			</table>
   			<button type="submit" class="btn btn-success btn-block" onclick="sendErrorRegistration()">Зарегистрировать</button>
    	</form>
    </div>
    </div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js" integrity="sha384-DztdAPBWPRXSA/3eYEEUWrWCy7G5KFbe8fFjk5JAIxUYHKkDx6Qin1DkWx51bBrb" crossorigin="anonymous"></script>
    <script src="js/bootstrap.min.js"></script>
</body>
</html>