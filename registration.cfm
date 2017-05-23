
<cfif isDefined("url.registrated")>
	<cfquery name="registration" datasource="errors">
		INSERT INTO users (user_login, user_password, user_first_name, user_last_name)
		VALUES (<cfqueryparam value="#Form.login#" cfsqltype="cf_sql_varchar">
		, <cfqueryparam value="#Form.password#" cfsqltype="cf_sql_varchar">
		, <cfqueryparam  value="#Form.firstName#" cfsqltype="cf_sql_varchar">
		, <cfqueryparam value="#Form.lastName#" cfsqltype="cf_sql_varchar">)
	</cfquery>
	<cflocation url="main.cfm">
	<cfabort>
<cfelse>
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
					<form class="authentication-form" method="post" action="?registrated=yes">
						<div class="offset-1 form-group row">
							<label class="required col-form-label"></label>			
							<div class="col-sm-11">					
								<input type="email" name="login" class="form-control" placeholder="Email" required="required">
							</div>
						</div>
						<div class="offset-1 form-group row">
							<label class="required col-form-label"></label>	
							<div class="col-sm-11">					
								<input type="text" name="firstName" class="form-control" placeholder="Имя" required="required">
							</div>
						</div>
						<div class="offset-1 form-group row">
							<label class="required col-form-label"></label>	
							<div class="col-sm-11">
								<input type="text" name="lastName" class="form-control" placeholder="Фамилия" required="required">
							</div>
						</div>
						<div class="offset-1 form-group row">
							<label class="required col-form-label"></label>	
							<div class="col-sm-11">
								<input type="password" name="password" class="form-control" placeholder="Пароль" required="required">
							</div>
						</div>
						<div class="offset-1 form-group row">
							<label class="col-form-label"></label>	
							<div class="col-sm-11">
								<button type="submit" class="btn btn-success btn-block">Зарегистрировать</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</body>
		</html>
</cfif>
