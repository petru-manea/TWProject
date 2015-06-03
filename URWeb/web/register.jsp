<%--
  Created by IntelliJ IDEA.
  User: Sonia
  Date: 6/2/2015
  Time: 9:52 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <link href="<%=request.getContextPath()%>/CSS/register.css" rel="stylesheet" type="text/css">
    <link href="<%=request.getContextPath()%>/CSS/navbar.css" rel="stylesheet" type="text/css">
    <script src="http://thecodeplayer.com/uploads/js/jquery.easing.min.js" type="text/javascript"></script>
    <script src="http://thecodeplayer.com/uploads/js/jquery-1.9.1.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/JS/login.js"></script>
</head>

<body>
<header>
    <%@include file="/navbar.jsp" %>
</header>

<!-- multistep form -->
<form id="msform" action="./createUser" method = "POST">
    <%
        String failed = "false";
        failed = String.valueOf(session.getAttribute("isFailed"));
        System.out.println("Aici trece");
        String userName = request.getParameter("email");
        if(userName == null)
            userName = "";
        System.out.println("Aici trece");
        String twitter = request.getParameter("twitter");
        System.out.println("Twitter: " + twitter);
        String facebook = request.getParameter("facebook");
        String gplus = request.getParameter("gplus");
        String fname = request.getParameter("fname");
        String lname = request.getParameter("lname");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        System.out.println("Aici trece");
    %>
    <!-- progressbar -->
    <ul id="progressbar">
        <li class="active">Account Setup</li>
        <li>Social Profiles</li>
        <li>Personal Details</li>
    </ul>
    <!-- fieldsets -->
    <fieldset>
        <h2 class="fs-title">Create your account</h2>
        <h3 class="fs-subtitle">This is step 1</h3>
        <%if(failed.equals("Email is invalid!") || failed.equals("Email already in use!")){ %>
            <input class = "failedInput" type="text" name="email" placeholder="<%=failed%>" />
        <%}else{ %>
            <input type="text" name="email" placeholder="Email" value="<%=userName%>"/>
        <%} %>
        <%if(failed.equals("Passwords do not match!")){ %>
            <input class = "failedInput" type="password" name="pass" placeholder="<%=failed%>" />
            <input class = "failedInput" type="password" name="cpass" placeholder="<%=failed%>" />
        <%}else{ %>
            <input type="password" name="pass" placeholder="Password" />
            <input type="password" name="cpass" placeholder="Confirm Password" />
        <%} %>
        <input type="button" name="next" class="next action-button" value="Next" />
    </fieldset>
    <fieldset>
        <h2 class="fs-title">Social Profiles</h2>
        <h3 class="fs-subtitle">Your presence on the social network</h3>
        <input type="text" name="twitter" placeholder="Twitter" value="<%=(twitter == null) ? "" : twitter%>"/>
        <input type="text" name="facebook" placeholder="Facebook" value="<%=(facebook == null) ? "" : facebook%>"/>
        <input type="text" name="gplus" placeholder="Google Plus" value="<%=(gplus == null) ? "" : gplus%>"/>
        <input type="button" name="previous" class="previous action-button" value="Previous" />
        <input type="button" name="next" class="next action-button" value="Next" />
    </fieldset>
    <fieldset>
        <h2 class="fs-title">Personal Details</h2>
        <h3 class="fs-subtitle">We will never sell it</h3>
        <%if(failed.equals("Invalid name!")){ %>
            <input class = "failedInput" type="text" name="fname" placeholder="<%=failed%>" />
            <input class = "failedInput" type="text" name="lname" placeholder="<%=failed%>" />
        <%}else{ %>
            <input type="text" name="fname" placeholder="First Name" value="<%=(fname == null) ? "" : fname%>"/>
            <input type="text" name="lname" placeholder="Last Name" value="<%=(lname == null) ? "" : lname%>"/>
        <%} %>
        <%if(failed.equals("Invalid phone!")){ %>
            <input class = "failedInput" type="text" name="phone" placeholder="<%=failed%>" />
        <%}else{ %>
            <input type="text" name="phone" placeholder="Phone" value="<%=(phone == null) ? "" : phone%>"/>
        <%} %>
        <textarea name="address" placeholder="Address" value="<%=(address == null) ? "" : address%>"></textarea>
        <input type="button" name="previous" class="previous action-button" value="Previous" />
        <input type="submit" name="submit" class="submit action-button" value="Submit" />
    </fieldset>
</form>

<!-- jQuery -->
<script src="http://thecodeplayer.com/uploads/js/jquery-1.9.1.min.js" type="text/javascript"></script>
<!-- jQuery easing plugin -->
<script src="http://thecodeplayer.com/uploads/js/jquery.easing.min.js" type="text/javascript"></script>
<script>
    //jQuery time
    var current_fs, next_fs, previous_fs; //fieldsets
    var left, opacity, scale; //fieldset properties which we will animate
    var animating; //flag to prevent quick multi-click glitches

    $(".next").click(function(){
        if(animating) return false;
        animating = true;

        current_fs = $(this).parent();
        next_fs = $(this).parent().next();

        //activate next step on progressbar using the index of next_fs
        $("#progressbar li").eq($("fieldset").index(next_fs)).addClass("active");

        //show the next fieldset
        next_fs.show();
        //hide the current fieldset with style
        current_fs.animate({opacity: 0}, {
            step: function(now, mx) {
                //as the opacity of current_fs reduces to 0 - stored in "now"
                //1. scale current_fs down to 80%
                scale = 1 - (1 - now) * 0.2;
                //2. bring next_fs from the right(50%)
                left = (now * 50)+"%";
                //3. increase opacity of next_fs to 1 as it moves in
                opacity = 1 - now;
                current_fs.css({'transform': 'scale('+scale+')'});
                next_fs.css({'left': left, 'opacity': opacity});
            },
            duration: 800,
            complete: function(){
                current_fs.hide();
                animating = false;
            },
            //this comes from the custom easing plugin
            easing: 'easeInOutBack'
        });
    });

    $(".previous").click(function(){
        if(animating) return false;
        animating = true;

        current_fs = $(this).parent();
        previous_fs = $(this).parent().prev();

        //de-activate current step on progressbar
        $("#progressbar li").eq($("fieldset").index(current_fs)).removeClass("active");

        //show the previous fieldset
        previous_fs.show();
        //hide the current fieldset with style
        current_fs.animate({opacity: 0}, {
            step: function(now, mx) {
                //as the opacity of current_fs reduces to 0 - stored in "now"
                //1. scale previous_fs from 80% to 100%
                scale = 0.8 + (1 - now) * 0.2;
                //2. take current_fs to the right(50%) - from 0%
                left = ((1-now) * 50)+"%";
                //3. increase opacity of previous_fs to 1 as it moves in
                opacity = 1 - now;
                current_fs.css({'left': left});
                previous_fs.css({'transform': 'scale('+scale+')', 'opacity': opacity});
            },
            duration: 800,
            complete: function(){
                current_fs.hide();
                animating = false;
            },
            //this comes from the custom easing plugin
            easing: 'easeInOutBack'
        });
    });

    $(".submit").click(function(){
        return true;
    })

</script>
</body>
</html>
