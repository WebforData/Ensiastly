<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="icon" href="pictures/E.png">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Ensiastly</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Font awesome icon -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" integrity="sha512-+4zCK9k+qNFUR5X+cKL9EIR+ZOhtIloNl9GIKS57V1MyNsYpYcUrUeQc9vNfzsWfV28IaLL3i96P9sdNyeRssA==" crossorigin="anonymous" />
    <link rel="stylesheet" href="css/styleaccueil.css">
    <style>
        a{
            cursor: pointer;
        }

    </style>
</head>
<body>

<!-- header -->
<header>
    <% if(session.getAttribute("add")!=null){%>
    <div style="text-align: center;color: white;" id="mAdd" role="alert"><%=session.getAttribute("add")%></div>
    <%}%>
    <% if(session.getAttribute("welcome")!=null){%>
    <div style="text-align: center;color: white;" id="welcome" role="alert"><%=session.getAttribute("welcome")%> <%=session.getAttribute("name")%></div>
    <%}%>
    <nav class = "navbar">
        <div class = "container">
            <a href = "accueil.jsp" class = "navbar-brand">Ensiastly</a>
            <div class = "navbar-nav">
                <% if(session.getAttribute("name")!=null){
                %>
                    <div><a href = "profil">
                        <i class="fas fa-user"></i><i><%=session.getAttribute("name")%></i></a>
                        <a href="Logout">Log Out</a></div>
                    <%}else{
                        request.setAttribute("errorMessage", "Log in first !!!");
                        session.setAttribute("here","accueil");
                    %>
                    <div><a href="Login">sign In</a>
                        <a href="Login">Sign Up</a></div>
                    <%}%>
            </div>
        </div>
    </nav>

    <div class = "banner">
        <div class = "container">
            <h1 class = "banner-title">
                <span>Ensias.</span>tly
            </h1>
            <p>everything that you want and need to know</p>
            <%if (session.getAttribute("error")!=null){%>
            <div class="alert alert-danger" id="me"><%=session.getAttribute("error")%>. . . try to search in other category.</div>
            <%}%>
            <form action="Search" method="post">
                <input type = "text" id="search" name="search" class = "search-input" placeholder="find a coffeeshop, formation . . ." required>
                <select name="categorie" id="categorie" class="categorie" required>
                    <option value="Category">Category</option>
                    <option value="formation">Formation</option>
                    <option value="restau">Restaurant/Cafe</option>
                    <option value="stage">Stage</option>
                </select>
                <button type = "submit" class = "search-btn">
                    <i class = "fas fa-search"></i>
                </button>
            </form>
        </div>
    </div>
    <div class = "banner">
        <div class = "container">
            <h1 class = "banner-title">
                Or
            </h1>
            <p>Feel free to share advices, recommandations and plans with us !</p>
            <a href="categorie.jsp"><button class="btn transparent" id="sign-in-btn">New plan</button></a>
        </div>
    </div>
</header>
<!-- end of header -->

<!-- footer -->
<footer>
    <span>Ensiastly Team</span>
</footer>
<!-- end of footer -->
<% if(session.getAttribute("name")==null){
%> <script>
    document.getElementById("search").disabled=true;
    document.getElementById("search").placeholder = "Sign in to make a search !!!";
</script>
<%}%>
<script>
    setTimeout(function(){
        document.getElementById('me').style.display = 'none';
    }, 3000);
    setTimeout(function(){
        document.getElementById('mAdd').style.display = 'none';
    }, 3000);
    setTimeout(function(){
        document.getElementById('welcome').style.display = 'none';
    }, 3000);
</script>
</body>
</html>