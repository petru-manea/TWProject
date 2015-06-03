
<%@ page contentType="text/html;text/css;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Hello Wor</title>

    <meta name="viewport" content="width=device-width, initial-scale=1">

    <%--<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>--%>
    <%--<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>--%>
    <%--<script src="http://fonts.googleapis.com/css?family=Source+Sans+Pro:400,700"></script>--%>
    <%--<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>--%>
    <%--<script src="https://maps.googleapis.com/maps/api/js?v=3.exp&signed_in=true&libraries=places"></script>--%>
    <script type="text/javascript" src="<%=request.getContextPath()%>/JS/menu.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/JS/jquery.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/JS/bootstrap.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/JS/map-api.js"></script>

    <link href="<%=request.getContextPath()%>/CSS/navbar.css" rel="stylesheet" type="text/css">
    <link href="<%=request.getContextPath()%>/CSS/menu.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
    <link href="<%=request.getContextPath()%>/CSS/map.css" rel="stylesheet" type="text/css">
    <link href="<%=request.getContextPath()%>/CSS/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="<%=request.getContextPath()%>/CSS/style.css" rel="stylesheet" type="text/css">

    <script type="text/javascript" src="<%=request.getContextPath()%>/JS/map.js"></script>
</head>
<body>
<header>
    <%@include file="/navbar.jsp" %>

</header>

<div id="menu">

    <div id="menu-header">

        <div class="showmenu">
            <div class="line"></div>
            <div class="line"></div>
        </div>
    </div>
    <ul id="cats">
        <li>&nbsp;&nbsp;Info Search</li><br /><br />
        <li>&nbsp;&nbsp;Categories:</li><br /><br />
        <li>&nbsp;&nbsp; A</li>
        <a href="#"><li class="cat" id="accounting" >Accounting</li></a>
        <a href="#"><li class="cat" id="airport">Airport</li></a>
        <a href="#"><li class="cat" id="amusement_park" >Amusement Park</li></a>
        <a href="#"><li class="cat" id="atm">ATM</li></a>

        <li>&nbsp;&nbsp; B</li>
        <a href="#"><li class="cat" id="bank" >Bank</li></a>
        <a href="#"><li class="cat" id="bar" >Bar</li></a>
        <a href="#"><li class="cat" id="bus_station">Bus Station</li></a>

        <li>&nbsp;&nbsp; C</li>
        <a href="#"><li class="cat" id="cafe" >Cafe</li></a>
        <a href="#"><li class="cat" id="church" >Church</li></a>
        <a href="#"><li class="cat" id="cemetery" >Cemetery</li></a>

        <li>&nbsp;&nbsp; D</li>
        <a href="#"><li class="cat" id="doctor" >Doctor</li></a>
        <a href="#"><li class="cat" id="dentist" >Dentist</li></a>

        <li>&nbsp;&nbsp; F</li>
        <a href="#"><li class="cat" id="food" >Food</li></a>


        <li>&nbsp;&nbsp; G</li>
        <a href="#"><li class="cat" id="gym" >Gym</li></a>

        <li>&nbsp;&nbsp; H</li>
        <a href="#"><li class="cat" id="hair_care" >Hair Care</li></a>
        <a href="#"><li class="cat" id="health" >Health</li></a>
        <a href="#"><li class="cat" id="hospital" >Hospital</li></a>

        <li>&nbsp;&nbsp; L</li>
        <a href="#"><li class="cat" id="library" >Library</li></a>

        <li>&nbsp;&nbsp; M</li>
        <a href="#"><li class="cat" id="museum" >Museum</li></a>

        <li>&nbsp;&nbsp; P</li>
        <a href="#"><li class="cat" id="police" >Police</li></a>

        <li>&nbsp;&nbsp; S</li>
        <a href="#"><li class="cat" id="store" >Store</li></a>

        <li>&nbsp;&nbsp; U</li>
        <a href="#"><li class="cat" id="university" >University</li></a>

        <li>&nbsp;&nbsp; Z</li>
        <a href="#"><li class="cat" id="zoo" >Zoo</li></a>

    </ul>

</div>
<div class="container">


    <%@include file="/map.jsp" %>

    <script>
        document.getElementById("accounting").addEventListener("click", function(){
            var loc= "accounting";
            search(loc);
        });
        document.getElementById("airport").addEventListener("click", function(){
            var loc= "airport";
            search(loc);
        });

        document.getElementById("amusement_park").addEventListener("click", function(){
            var loc= "amusement_park";
            search(loc);
        });
        document.getElementById("atm").addEventListener("click", function(){
            var loc= "atm";
            search(loc);
        });
        document.getElementById("bank").addEventListener("click", function(){
            var loc= "bank";
            search(loc);
        });
        document.getElementById("bar").addEventListener("click", function(){
            var loc= "bar";
            search(loc);
        });
        document.getElementById("bus_station").addEventListener("click", function(){
            var loc= "bus_station";
            search(loc);
        });
        document.getElementById("cafe").addEventListener("click", function(){
            var loc= "cafe";
            search(loc);
        });
        document.getElementById("church").addEventListener("click", function(){
            var loc= "church";
            search(loc);
        });
        document.getElementById("cemetery").addEventListener("click", function(){
            var loc= "cemetery";
            search(loc);
        });
        document.getElementById("doctor").addEventListener("click", function(){
            var loc= "doctor";
            search(loc);
        });
        document.getElementById("dentist").addEventListener("click", function(){
            var loc= "dentist";
            search(loc);
        });




        document.getElementById("food").addEventListener("click", function(){
            var loc= "food";
            search(loc);
        });
        document.getElementById("gym").addEventListener("click", function(){
            var loc= "gym";
            search(loc);
        });
        document.getElementById("hair_care").addEventListener("click", function(){
            var loc= "hair_care";
            search(loc);
        });document.getElementById("health").addEventListener("click", function(){
            var loc= "health";
            search(loc);
        });
        document.getElementById("hospital").addEventListener("click", function(){
            var loc= "hospital";
            search(loc);
        });
        document.getElementById("library").addEventListener("click", function(){
            var loc= "library";
            search(loc);
        });document.getElementById("museum").addEventListener("click", function(){
            var loc= "museum";
            search(loc);
        });
        document.getElementById("police").addEventListener("click", function(){
            var loc= "police";
            search(loc);
        });
        document.getElementById("store").addEventListener("click", function(){
            var loc= "store";
            search(loc);
        });


        document.getElementById("university").addEventListener("click", function(){
            var loc= "university";
            search(loc);
        });
        document.getElementById("zoo").addEventListener("click", function(){
            var loc= "zoo";
            search(loc);
        });

    </script>



</div>
<script>

    function position() {
        $('.section').height($(window).height())
        $("#menu").height($(window).height());
        /*$("#cats").css("margin-top", $(window).height() / 3.5);*/
    }

    $(".showmenu").click(function() {
        if ($("#menu").hasClass("onscreen")) {
            $("#menu").removeClass("onscreen");
            $(".showmenu").removeClass("closemenu");
            $("#menu-footer").css("bottom",-50);
            $("#formore").fadeIn(600);
        }
        else {
            $("#menu").addClass("onscreen");
            $(".showmenu").addClass("closemenu");
            $("#menu-footer").css("bottom", 0);
            $("#formore").fadeOut(200);
        }
    });

    $(".cat").click(function() {
        $(".active").removeClass("active");
        $(this).addClass("active");
    });


    window.addEventListener("load", position, false);
    window.addEventListener("resize", position, false);
</script>
</body>
</html>
