<%--
  Created by IntelliJ IDEA.
  User: Sonia
  Date: 6/1/2015
  Time: 7:14 PM
  To change this template use File | Settings | File Templates.
--%>
<%--<%@ page contentType="text/html;text/css;charset=UTF-8" language="java" %>--%>

<html>
<head>
    <title>Hello World</title>
    <link href="<%=request.getContextPath()%>/CSS/about.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="<%=request.getContextPath()%>/JS/jquery-1.4.2.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/JS/about.js"></script>
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">

</head>
<body>
<header>
    <div class="navbar" role="navigation">
        <div class="container">
            <div class="navbar-header">
                <a class="navbar-brand" id="logo" href="index.jsp">URWeb</a>

                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#mynav">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
            </div>
            <div class="collapse navbar-collapse" id="mynav">
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="#about">About</a></li>
                    <li><a href="#producers">Producers</a></li>
                    <li><a href="#process">Process</a></li>
                    <li><a href="#demo">Demo</a></li>

                </ul>
            </div>
        </div>
    </div>
    <div class="banner">
        <h2>"Those who believe in telekinetics, raise my hand."</h2>
        <h2 id="quote">-Kurt Vonnegut</h2>
        <div class="info">
            <a href="#process" title="">See our process</a>
            <a href="#producers" title="">See our producers</a>
        </div>
    </div>
</header>
<section class="about" id="about">
    <div class="container">
        <div class="row">
            <div class="col-xs-12">
                <h2>About us</h2>
            </div>
        </div>
        <div class="row">
            <div class="col-xs-12 col-sm-4">
                <h4>Our history</h4>
                <p>We exist since June 2015.</p>

                <p>Initially it all started as a homework.</p>
            </div>
            <div class="col-xs-12 col-sm-4">
                <h4>Our vision</h4>

                <p>We want people to be able to find their friends</p>

                <p>much faster,ergo more time to have FUN.</p>
            </div>
            <div class="col-xs-12 col-sm-4">
                <h4>Our values</h4>

                <p>We will never share the data we gather to</p>

                <p>any other website.Full disclosure.</p>
            </div>
        </div>
    </div>
</section>
<!-- end of about section-->
<hr>
<section class="producers" id="producers">
    <div class="container">
        <div class="row">
            <div class="col-xs-12">
                <h2>Our producers</h2>
            </div>
        </div>
        <div class="row">
            <div class="col-xs-12 col-sm-6 col-md-4 col-lg-3">
                <div class="producers-info">
                    <h3><a href="https://www.facebook.com/Ioan.Dani3l"target="_blank"><img src="<%=request.getContextPath()%>/Images/Ionut.jpg" /></a></h3>
                </div>
            </div>
            <div class="col-xs-12 col-sm-6 col-md-4 col-lg-3">
                <div class="producers-info">
                    <h3 id="sonia"><a href="https://www.facebook.com/sonia.angela.336?fref=ts"target="_blank"><img src="<%=request.getContextPath()%>/Images/Sonia.png" /></a></h3>
                </div>
            </div>
            <div class="col-xs-12 col-sm-6 col-md-4 col-lg-3">
                <div class="producers-info">
                    <h3><a href="https://www.facebook.com/manea.petru.9?fref=ts"target="_blank"><img src="<%=request.getContextPath()%>/Images/Petru.png" /></a></h3>
                </div>
            </div>
            <div class="col-xs-12 col-sm-6 col-md-4 col-lg-3">
                <div class="producers-info">
                    <h3><a href="https://www.facebook.com/oana.anghelache.9?fref=ts"target="_blank"><img src="<%=request.getContextPath()%>/Images/Oana.png" /></a></h3>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- end of producers section-->
<hr>
<section class="process" id="process">
    <div class="container">
        <div class="row">
            <div class="col-xs-12">
                <h2>Our Process</h2>
            </div>
        </div>
        <div class="row">
            <div class="col-xs-12 col-sm-6 col-md-3">
                <div class="method">
                    <h3>Analyze</h3>
                    <hr>
                    <p>We researched if our app would actualy be used.</p>
                    <h4>1</h4>
                </div>
            </div>
            <div class="col-xs-12 col-sm-6 col-md-3">
                <div class="method">
                    <h3>Develop</h3>
                    <hr>
                    <p>We started gathering information and built a prototype.</p>
                    <h4>2</h4>
                </div>
            </div>
            <div class="col-xs-12 col-sm-6 col-md-3">
                <div class="method">
                    <h3>Test</h3>
                    <hr>
                    <p>We tested our app thoroughly for your satisfaction.</p>
                    <h4>3</h4>
                </div>
            </div>
            <div class="col-xs-12 col-sm-6 col-md-3">
                <div class="method">
                    <h3>Deploy</h3>
                    <hr>
                    <p>We launched it for free, Just For You !</p>
                        </br>
                    <h4>4</h4>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- end of method section-->
<hr>
<section class="demo">
    <div class="container">
        <div class="row">
            <div class="col-xs-12">
                <h2>Our demo</h2>
                <h3>COMMING SOON :)</h3>
            </div>
        </div>
        <div class="row">
            <div class="col-xs-12 col-sm-4">

                    <h3><img src="<%=request.getContextPath()%>/Images/home.png" /></h3>
            </div>
            <div class="col-xs-12 col-sm-4">

                    <h3><img src="<%=request.getContextPath()%>/Images/register.png" /></h3>

            </div>
            <div class="col-xs-12 col-sm-4">

                    <h3><img src="<%=request.getContextPath()%>/Images/about.png" /></h3>

            </div>
        </div>
    </div>
</section>
<!-- end of demo section-->
<hr>
<section class="demo" id="demo">
    <div class="container">
        <div class="row">
            <div class="col-xs-12">
                <h2>demo movie</h2>
                <video width="1024" height="768" controls>
                    <source src="<%=request.getContextPath()%>/Images/video.mp4" type="video/mp4">
                    Your browser does not support the video tag.
                </video>
            </div>
        </div>
        <div class="row">
            <div class="col-xs-12 col-lg-8">
                <p class="visible-lg">Diverse informatii</p>
            </div>
            <div class="visible-lg col-lg-4">

            </div>
        </div>
    </div>
</section>
<!-- end of demo section-->

<footer>
    <p>We're going on a trip
        In our favorite rocket ship...</p>
</footer>
</body>
</html>
