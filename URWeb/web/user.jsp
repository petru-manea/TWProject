
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
    <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
    <script src="/JS/login.js"></script>

    <link href="<%=request.getContextPath()%>/CSS/navbar.css" rel="stylesheet" type="text/css">
    <link href="<%=request.getContextPath()%>/CSS/menu.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
    <link href="<%=request.getContextPath()%>/CSS/map.css" rel="stylesheet" type="text/css">
    <link href="<%=request.getContextPath()%>/CSS/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="<%=request.getContextPath()%>/CSS/style.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="/CSS/login.css">

</head>
<body>
<header>
    <%@include file="/navbar.jsp" %>

</header>
<div class="container-fluid">
    <div id="perfil">
        <div class="col-md-12" id="foto-perfil">
            <img src="https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcRny5jk1DXogIBbUsKYXcJ3xTaKYo_lnzF6RzntDuJ9J1IRW_uJsw">
            <h2>John</h2>
        </div>
        <div class="col-md-12" id="info-perfil">
            <b>Email:</b> john@teste.com</br>
            <b>City:</b> New York, NY</br>
            <b>Website:</b><a href="" target="_blank">http://example.com</a></br>
            <b>Email:</b> john@teste.com</br>
        </div>
    </div>
</div>
</body>
</html>
