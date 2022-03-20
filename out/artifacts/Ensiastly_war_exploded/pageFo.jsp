<%--
  Created by IntelliJ IDEA.
  User: condor
  Date: 29/12/2021
  Time: 10:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="resources/bootstrap.min.css" >
    <title>Page de formulaire__<%= session.getAttribute("name")%></title>
    <script>
        setTimeout(function(){
            document.getElementById('l').style.display = 'none';
        }, 2000);
    </script>
</head>
<body>
<%
    if (session.getAttribute("email")==null)
    {
        request.getRequestDispatcher( "/Login.jsp" ).forward( request, response );
    }
%>

<nav class="navbar navbar-light navbar-expand bg-light navigation-clean">
    <div class="container"><a class="navbar-brand" href="accueil.jsp">EnsiasQ</a><button data-bs-toggle="collapse" class="navbar-toggler" data-bs-target="#navcol-1"></button>
        <div class="collapse navbar-collapse d-flex d-sm-flex flex-row align-items-center" id="navcol-1"><a style="color: white;" class="btn btn-primary link-success bg-success border-success " role="button" href="formulaire.jsp">Add</a></div>
        <div class="collapse navbar-collapse d-flex d-sm-flex flex-row align-items-center"><a style="color: white;" class="btn btn-primary link-success bg-success border-danger " role="button" href="Logout">Logout</a></div>
    </div>
</nav>

<div class="alert alert-success" style="text-align: center;" id="l" role="alert">
    Votre avis est enregistré <%=session.getAttribute("name")%>
</div>
<div class="card container" style="width:1000px;">
    <div style="background-color: coral; height: 100px;"></div>
    <div class="card-body" >
        <h3 class="card-title" style="text-align: center;"><%= session.getAttribute("Titre")%></h3>
        <i> Créer le <%=session.getAttribute("date_creation")%></i>
        <h5 class="card-title" style="text-align: center;"><%= session.getAttribute("theme")%></h5>
        <p class="card-text" style="text-align: center;"><%=session.getAttribute("description")%></p>
        <h5 style="text-align: center;"> <%=session.getAttribute("entreprise_nom")%></h5>
        <i style="text-align: center;"><%=session.getAttribute("email")%></i><br>
        <label>Info :</label>
        <ul>
            <li> Ville de stage :<%=session.getAttribute("ville")%></li>
            <li> Mode de stage :<%=session.getAttribute("mode")%></li>
            <li> Date :<%=session.getAttribute("date")%></li>
            <li>La duree de stage :<%=session.getAttribute("duree")%></li>
            <li> Niveau :<%=session.getAttribute("grade")%></li>
            <li> Type :<%=session.getAttribute("type")%></li>
            <li> La remuniration :<%=session.getAttribute("remuniration")%></li>
        </ul>
        <label>Experience :</label>
        <ul>
            <li> Le stage etait<%=session.getAttribute("experience")%></li>
            <li> Note :<%=session.getAttribute("note")%></li>
        </ul>
        <a href="<%=session.getAttribute("url")%>" class="btn btn-primary"><b>site web</b></a>
    </div>
</div>
</body>
</html>
