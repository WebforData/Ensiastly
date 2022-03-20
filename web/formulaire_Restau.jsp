<%--
  Created by IntelliJ IDEA.
  User: condor
  Date: 23/01/2022
  Time: 18:02
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
    <link rel="stylesheet" href="css/stylesRestau.css" />
    <script>
        setTimeout(function(){
            document.getElementById('er').style.display = 'none';
        }, 2000);
    </script>
    <title>Restaurant/Cafe</title>
</head>

<body>
<%
    if (session.getAttribute("email")==null)
    {
        String restau="restau";
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
    <form action="formulaire_Restau" method="post" class="sign-up-form" enctype="multipart/form-data">

        <h2 class="title">Restaurant/Cafe</h2>
        <div class="input-field">
            <i class="fas fa-coffee"></i>
            <input type="text" name="nom_plan" placeholder="Name of restaurant/cafe" required/>
        </div>
        <div class="input-field">
            <i class="fas fa-newspaper"></i>
            <input type="text" name="texte_descriptif" placeholder="Texte descriptif" required/>
        </div>
        <div class="input-field">
            <i class="fas fa-map-marker-alt"></i>
            <input type="text" name="lieu_restau" placeholder="Adress" required/>
        </div>
        <div class="input-field">
            <i class="fas fa-camera-retro"></i>
            <input type="file" name="file" placeholder="Enter your file" style="color: #aaa;opacity: 0;" required/>
        </div>
        <div class="input-field">
            <i class="fas fa-book-reader"></i>
            <select name="possibilite_etude" id="possibilité_etude" aria-placeholder="" style="color: #aaa;" required>
                <option value="">Possibility of study</option>
                <option style="color: black;" value="You can study">yes</option>
                <option style="color: black;" value="You can not study">No</option>
            </select>
        </div>
        <div class="input-field">
            <i class="fas fa-hourglass-end"></i>
            <input type="number" name="duree" placeholder="Consumption min duration (hours)" style="color: #aaa;" required/>
        </div>
        <div class="input-field">
            <i class="fas fa-money-bill-wave"></i>
            <input type="number" name="min_consommation" placeholder="minimal price for consumption"/>
        </div>
        <div class="input-field">
            <i class="fas fa-subway"></i>
            <select name="transport" id="transport" aria-placeholder="" style="color: #aaa;" required>
                <option style="color: black;" value=""> tramway station in proximity :</option>
                <option style="color: black;" value="There is ">Yes</option>
                <option style="color: black;" value="There is not">No</option>
            </select>
        </div>
        <div class="input-field">
            <i class="fas fa-wifi"></i>
            <select name="wifi_restau" id="wifi_restau" aria-placeholder="" style="color: #aaa;" required>
                <option style="color: black;" value="">Wifi</option>
                <option style="color: black;" value="not available">not available</option>
                <option style="color: black;" value="available,low debit">available, bas debit</option>
                <option style="color: black;" value="available,good debit">available, debit correct</option>
                <option style="color: black;" value="available, fibre optique">available, fibre optique</option>
            </select>
        </div>
        <div class="input-field">
            <i class="fas fa-plug"></i>
            <select name="prise_courant" id="prise", aria-placeholder="plug " style="color: #aaa;" required>
                <option style="color: black;" value="">Prises de courant</option>
                <option style="color: black;" value="available">not available</option>
                <option style="color: black;" value="not available">available</option>
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
            <img src="pictures/undraw_coffee_re_x35h.svg" class="image" alt="" />
        </div>
    </div>

</div>

<footer>
    <span>Ensiastly Team</span>
</footer>
<script src="js/appRestau.js"></script>
</body>
</html>
