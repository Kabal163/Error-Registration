<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/mainTheme.css">
    <title>Главная страница</title>
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
                    <a class="nav-link" href="regError.cfm">Зарегистрировать ошибку<span class="sr-only">(current)</span></a>
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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js" integrity="sha384-DztdAPBWPRXSA/3eYEEUWrWCy7G5KFbe8fFjk5JAIxUYHKkDx6Qin1DkWx51bBrb" crossorigin="anonymous"></script>
    <script src="js/bootstrap.min.js"></script>
</body>
</html>