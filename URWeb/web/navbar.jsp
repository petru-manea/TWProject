<head>
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
    <link href="<%=request.getContextPath()%>/CSS/navbar.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="<%=request.getContextPath()%>/JS/facebook.js"></script>
</head>
<nav class="navbar navbar-inverse">
<div class="navbar" role="navigation">
    <div class="container">
        <div class="navbar-header">
            <a class="navbar-brand" id="logo" href="#">URWeb</a>
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#mynav">
                <span class="sr-only"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
        </div>
        <div class="collapse navbar-collapse" id="mynav">
            <ul class="nav navbar-nav">
                <li><a href="home.jsp"><span class="glyphicon glyphicon-home"></span> Home </a></li>
                <li><a href="about.jsp"><span class="glyphicon glyphicon-info-sign"></span> About </a></li>


            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li><a href="register.jsp"><span class="glyphicon glyphicon-user"></span> Register</a></li>
                <li><a href="#"id="loginform"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
                <%--<li><a href="#"><span class="glyphicon glyphicon-cog"></span> Settings</a></li>--%>

            </ul>

            <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

            <script src="JS/navbar.js"></script>

        </div>
    </div>
</div>
</nav>

    <div class="login">
        <div class="formholder">
            <div class="randompad">
                <fieldset>
                    <label name="email">Email</label>
                    <input type="email" value="example@example.com" />
                    <label name="password">Password</label>
                    <input type="password" />
                    <input type="submit" value="Login" />
                    <fb:login-button scope="public_profile,email" onlogin="checkLoginState();">
                    </fb:login-button>
                    <div class="fb-login-button" data-max-rows="1" data-size="large" data-show-faces="false" data-auto-logout-link="true"> log in</div>
                </fieldset>
            </div>
        </div>
    </div>
