<%--
  Created by IntelliJ IDEA.
  User: condor
  Date: 23/01/2022
  Time: 23:46
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
    <script>
        setTimeout(function(){
            document.getElementById('er').style.display = 'none';
        }, 2000);
    </script>
    <link rel="stylesheet" href="css/stylesStage.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" integrity="sha512-+4zCK9k+qNFUR5X+cKL9EIR+ZOhtIloNl9GIKS57V1MyNsYpYcUrUeQc9vNfzsWfV28IaLL3i96P9sdNyeRssA==" crossorigin="anonymous" />
    <title>Internship</title>
</head>

<body>
<%
    if (session.getAttribute("email")==null)
    {
        String restau="stage";
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
    <form action="formulaire_stage" class="sign-up-form" enctype="multipart/form-data" method="post">
        <h2 class="title">Internship</h2>
        <div class="input-field">
            <i class="fas fa-coffee"></i>
            <input type="text" name="entreprise_nom" placeholder="Nom de l'entreprise" required/>
        </div>
        <div class="input-field">
            <i class="fas fa-newspaper"></i>
            <input type="text" name="texte_descriptif" placeholder="Texte descriptif" required/>
        </div>

        <div class="input-field">
            <i class="fas fa-camera-retro"></i>
            <input type="file" name="file" placeholder="Enter your file" style="color: #aaa;opacity: 0;" required/>
        </div>
        <div class="input-field">
            <i class="fas fa-book-reader"></i>
            <select name="mode" id="possibilité_etude" aria-placeholder="" style="color: #aaa;" required>
                <option value="">Mode</option>
                <option style="color: black;" value="remote">remote</option>
                <option style="color: black;" value="you have to deplace to the company">not remote</option>
            </select>
        </div>
        <div class="input-field">
            <i class="fas fa-hourglass-end"></i>
            <input type="number" name="duree_stage" placeholder="Duration (day)" style="color: #aaa;" required/>
        </div>
        <div class="input-field">
            <i class="fas fa-hourglass-end"></i>
            <input type="date" name="date_debut" placeholder="Date of beginning" style="color: #aaa;" required/>
        </div>
        <div class="input-field">
            <i class="fas fa-money-bill-wave"></i>
            <input type="text" name="technologie" placeholder="Technologie" required/>
        </div>
        <div class="input-field">
            <i class="fas fa-money-bill-wave"></i>
            <input type="text" name="ville" placeholder="Ville" required/>
        </div>
        <div class="input-field">
            <i class="fas fa-subway"></i>
            <select name="reminiration" id="transport" aria-placeholder="" style="color: #aaa;" required>
                <option style="color: black;" value="">Reminiration</option>
                <option style="color: black;" value="paid">Yes</option>
                <option style="color: black;" value="Not paid">No</option>
            </select>
        </div>
        <div class="input-field">
            <i class="fas fa-plug"></i>
            <select name="niveau" id="niveau", aria-placeholder="" style="color: #aaa;" required>
                <option style="color: black;" value="">Grade</option>
                <option style="color: black;" value="1 YEAR">1er year</option>
                <option style="color: black;" value="2 YEAR">2 year</option>
                <option style="color: black;" value="3 YEAR">3 year</option>
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
            <img src="pictures/undraw_interview_re_e5jn.svg" class="image" alt="" />
        </div>
    </div>

</div>
<footer>
    <span>Ensiastly Team</span>
</footer>
<script src="js/appStage.js"></script>
</body>
</html>
