<%--
  Created by IntelliJ IDEA.
  User: condor
  Date: 26/01/2022
  Time: 13:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Ensiastly</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Font awesome icon -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" integrity="sha512-+4zCK9k+qNFUR5X+cKL9EIR+ZOhtIloNl9GIKS57V1MyNsYpYcUrUeQc9vNfzsWfV28IaLL3i96P9sdNyeRssA==" crossorigin="anonymous" />
    <link rel="stylesheet" href="css/styleaccueil.css">
</head>
<body>

<!-- header -->
<header>
    <nav class = "navbar">
        <div class = "container">
            <a href = "accueil.jsp" class = "navbar-brand">Ensiastly</a>
            <div class = "navbar-nav">
                <a href = "profil"> <i class="fas fa-user"></i> <%=session.getAttribute("name")%></a>
            </div>
        </div>
    </nav>

    <div class = "banner">
        <div class = "container">
            <h1 class = "banner-title">

            </h1>
            <p>first choose a category :</p>
            <a href="formulaire_formation.jsp"><button class="btn transparent" >Formation</button></a>
            <a href="formulaire_Restau.jsp"><button class="btn transparent" >Restaurant/Cafe</button></a>
            <a href="formulaire_stage.jsp"><button class="btn transparent" >Stage</button></a>
        </div>
    </div>
</header>
<!-- end of header -->

<!-- footer -->
<footer>
    <span>Ensiastly Team</span>
</footer>
<!-- end of footer -->


</body>
</html>
