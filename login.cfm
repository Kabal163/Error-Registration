<cfif NOT isDefined("formAction")>
	<cfset formAction = "login_action.cfm">
</cfif>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/authentication.css">
    <title>Авторизация</title>
</head>
<body>
	<div class="col-sm-5 offset-3 vcenter">
		<div class="container">
			<form class="authentication-form" method="post" action="<cfoutput>#formAction#</cfoutput>">
				<cfif IsDefined ("invalid")>
        			<cfif invalid EQ "yes">
        				<h4 align="center"><font color="#FF0000">Неверный логин или пароль</font></h4>
        			</cfif>    
    			</cfif>
				<div class="form-group row">
					<div class="col-sm-12">
						<input type="email" name="login" class="form-control" id="inputEmail3" placeholder="Email">
					</div>
				</div>
				<div class="form-group row">
					<div class="col-sm-12">
						<input type="password" name="password" class="form-control" id="inputPassword3" placeholder="Password">
					</div>
				</div>
					<button type="submit" class="btn btn-success btn-block">Войти</button>
						<a href="registration.cfm">Регистрация</a>
			</form>
		</div>
	</div>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js" integrity="sha384-DztdAPBWPRXSA/3eYEEUWrWCy7G5KFbe8fFjk5JAIxUYHKkDx6Qin1DkWx51bBrb" crossorigin="anonymous"></script>
	<script src="js/bootstrap.min.js"></script>
</body>
</html>