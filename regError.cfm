<cfquery name="statuses" datasource="errors">
	SELECT * FROM status;
</cfquery>

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
                    <a class="nav-link" href="#">Просмотреть ошибку<span class="sr-only">(current)</span></a>
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
    	<form method="post" action="">
   			<table class="table">
   				<tr>
	   				<td>Краткое описание</td>
	   				<td>
	   					<div class="form-group input-group">
	   						<textarea class="blue-border form-control" name="brief-desc" cols="70" rows="3"></textarea>
	   					</div>
	   				</td>
   				<tr>
   				<tr>
	   				<td>Подробное описание</td>
	   				<td>
	   					<div class="form-group">
	   						<textarea class="blue-border form-control" name="full-desc" cols="70" rows="3"></textarea>
	   					</div>
	   				</td>
   				<tr>
   				<tr>
	   				<td>Пользователь</td>
	   				<td>
	   					<div class="form-group">
	   						<input type="text" class="form-control blue-border" value="<cfoutput>#ListRest(GetAuthUser())#</cfoutput>" readonly/>
	   					</div>
	   				</td>
   				<tr>	
   				<tr>
	   				<td>Статус</td>
	   				<td>
	   					<div class="form-group">
	   						<select class="form-control" name="status">
	   							<cfoutput query="statuses">
	   								<option value="#status_id#">#status_value#</option>
	   							</cfoutput>
	   						</select>
	   					</div>
	   				</td>
   				<tr>
   			</table>
    	</form>
    </div>
    </div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js" integrity="sha384-DztdAPBWPRXSA/3eYEEUWrWCy7G5KFbe8fFjk5JAIxUYHKkDx6Qin1DkWx51bBrb" crossorigin="anonymous"></script>
    <script src="js/bootstrap.min.js"></script>
</body>
</html>