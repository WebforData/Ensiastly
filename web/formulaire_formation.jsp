<%--
  Created by IntelliJ IDEA.
  User: condor
  Date: 23/01/2022
  Time: 22:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <script
            src="https://kit.fontawesome.com/64d58efce2.js"
            crossorigin="anonymous"
    ></script>
    <link rel="stylesheet" href="css/stylesFormation.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" integrity="sha512-+4zCK9k+qNFUR5X+cKL9EIR+ZOhtIloNl9GIKS57V1MyNsYpYcUrUeQc9vNfzsWfV28IaLL3i96P9sdNyeRssA==" crossorigin="anonymous" />
    <style>
        .pr{
            text-transform: uppercase;
            font-family: var(--Roboto);
            letter-spacing: 1px;
            font-weight: 500;
            color: #fff;
            text-decoration: none;
            display: inline-block;
            padding: 0.4rem 0.1rem;
            letter-spacing: 3px;
            transition: opacity 0.5s ease;
            margin: 25px;
        }
        .pr :hover{
            opacity: 0.7;
        }
    </style>
    <script>
        setTimeout(function(){
            document.getElementById('er').style.display = 'none';
        }, 2000);
    </script>
    <title>Formation</title>
</head>

<body>
<%
    if (session.getAttribute("email")==null)
    {
        String restau="formation";
        session.setAttribute("here",restau);
        request.getRequestDispatcher( "/Login.jsp" ).forward( request, response );
    }
%>
<nav class="navBar" >
    <div class="navbarContainer">
        <a href="accueil.jsp" id="navBarLogo">Ensiastly</a>

    </div>
</nav>

<div class="container">
    <div class="forms-container"> </div>
    <% if(session.getAttribute("err")!=null && (!session.getAttribute("err").equals(""))){%>
    <div class="alert alert-danger" id="er" style="text-align: center ; margin-top: 5px" >
        <%=session.getAttribute("err")%>
    </div><%}%>
    <form action="formulaire_formation" method="post" enctype="multipart/form-data" class="sign-up-form">
        <h2 class="title">Formation</h2>
        <div class="input-field">
            <i class="fas fa-award"></i>
            <input type="text" name="nom_plan" placeholder="Nom de la formation" required/>
        </div>
        <div class="input-field">
            <i class="fas fa-award"></i>
            <input type="text" name="theme" placeholder="Thème" required/>
        </div>
        <div class="input-field">
            <i class="fas fa-newspaper"></i>
            <input type="text" name="texte_descriptif" placeholder="Texte descriptif" required/>
        </div>
        <div class="input-field">
            <i class="fas fa-globe-africa"></i>
            <input type="url" name="website" placeholder="Adresse internet" required/>
        </div>
        <div class="input-field">
            <i class="fas fa-camera-retro"></i>
            <input type="file" name="file" placeholder="Enter your file" style="color: #aaa;opacity: 0;" required/>
        </div>
        <div class="input-field">
            <i class="fas fa-hourglass-end"></i>
            <input type="number" name="duree" placeholder="Duration (hours)" required/>
        </div>
        <div class="input-field">
            <i class="far fa-thumbs-up"></i>
            <select name="qualite" id="qualité", aria-placeholder="" style="color: #aaa;" required>
                <option style="color: black;" value="">Quality</option>
                <option style="color: black;" value="Bad">Bad</option>
                <option style="color: black;" value="Moyen">Moyen</option>
                <option style="color: black;" value="Good">Good</option>
                <option style="color: black;" value="Excellent">Excellent</option>
            </select>
        </div>
        <div class="input-field">
            <i class="far fa-credit-card"></i>
            <select name="gratuit" id="gratuit" aria-placeholder="" style="color: #aaa;"required>
                <option value="">Formation gratuite</option>
                <option style="color: black;" value="free">free</option>
                <option style="color: black;" value="not free">not free</option>
            </select>
        </div>
        <div class="input-field">
            <i class="far fa-handshake"></i>
            <select name="aidFinancier" id="aidFinancier", aria-placeholder="" style="color: #aaa;" required>
                <option style="color: black;" value="">Aide financière</option>
                <option style="color: black;" value="not available">not available</option>
                <option style="color: black;" value="available">available</option>
            </select>
        </div>
        <div class="input-field">
            <i class="fas fa-percentage"></i>
            <select name="note" id="note", aria-placeholder="" style="color: #aaa;" required>
                <option style="color: black;" value="">Note</option>
                <option style="color: black;" value="1">1</option>
                <option style="color: black;" value="2">2</option>
                <option style="color: black;" value="3">3</option>
                <option style="color: black;" value="4">4</option>
                <option style="color: black;" value="5">5</option>
            </select>
        </div>

        <input type="submit" class="btn" value="Confirmer" />
    </form>
    <div class="panels-container">
        <div class="panel left-panel">
            <img src="pictures/undraw_certificate_re_yadi.svg" class="image" alt="" />
        </div>
    </div>

</div>
<!-- footer -->
<footer>
    <span>Ensiastly Team</span>
</footer>
<!-- end of footer -->
<script src="js/appFormation.js"></script>
</body>
</html>
