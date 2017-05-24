<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/mainTheme.css">
    	<link rel="stylesheet" href="css/errorsShow.css">
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
                    <a class="nav-link" href="regError.cfm">Зарегистрировать ошибку<span class="sr-only">(current)</span></a>
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
    <div class="container show-area">
	    <table class="table">
	    	<cfquery name="getErrors" datasource="errors">
	    		SELECT e.error_id, u.user_first_name, u.user_last_name, i.importance_value, s.status_value, tb.time_bound_value
	    		FROM error e
	    		LEFT OUTER JOIN users u ON e.user_id = u.user_id
	    		LEFT OUTER JOIN importance i ON e.importance_id = i.importance_id
	    		LEFT OUTER JOIN status s ON e.status_id = s.status_id
	    		LEFT OUTER JOIN time_bound tb ON e.time_bound_id = tb.time_bound_id;
	    	</cfquery>
	    	<thead>
	    		<tr>
	    			<th>ID</th>
	    			<th>Автор</th>
	    			<th>Критичность</th>
	    			<th>Статус</th>
	    			<th>Срочность</th>
	    		</tr>
	    	</thead>
	    	<cfoutput query="getErrors">
	    		<tr>
	    			<td>#error_id#</td>
	    			<td>#user_first_name# #user_last_name#</td>
	    			<td>#importance_value#</td>
	    			<td>#status_value#</td>
	    			<td>#time_bound_value#</td>
	    		</tr>
	    	</cfoutput>
	    </table>
    </div>
</body>
</html>