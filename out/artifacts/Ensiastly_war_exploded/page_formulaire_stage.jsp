<%@ page import="java.util.ArrayList" %>
<%@ page import="java.io.File" %><%--
  Created by IntelliJ IDEA.
  User: condor
  Date: 29/01/2022
  Time: 21:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Stage( <%=((ArrayList<String>)session.getAttribute("page")).get(1)%> )</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Font awesome icon -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" integrity="sha512-+4zCK9k+qNFUR5X+cKL9EIR+ZOhtIloNl9GIKS57V1MyNsYpYcUrUeQc9vNfzsWfV28IaLL3i96P9sdNyeRssA==" crossorigin="anonymous" />
    <link rel="stylesheet" href="css/Formation.css">
</head>
<body>

<!-- header -->
<header>
    <nav class = "navbar">
        <div class = "container">
            <a href = "accueil.jsp" class = "navbar-brand">Ensiastly</a>
            <div class = "navbar-nav">
                <a href = "profil"> <i class="fas fa-user"></i><%=session.getAttribute("name")%></a>
            </div>
        </div>
    </nav>
</header>
<!-- end of header -->
<div class="planContainer">
    <div class="blog-item">
        <div class = "blog-img">
            <%
                String folderName = "upload";
                String uploadPath =  folderName+ File.separator+((ArrayList<String>)session.getAttribute("page")).get(3);
            %>

            <img src = "<%=uploadPath%>" alt = "">
        </div>
        <div class = "blog-text">
            <div>
                <h3 style="font-size: 1.5rem;"><i class="fas fa-user"></i><%=((ArrayList<String>)session.getAttribute("page")).get(12)%></h3>
                <span><%=((ArrayList<String>)session.getAttribute("page")).get(13)%></span>
                <h2><%=((ArrayList<String>)session.getAttribute("page")).get(1)%></h2>
                <p ><span class="spanTexte"> <i class="far fa-star"></i>  <%=((ArrayList<String>)session.getAttribute("page")).get(11)%>/5</span></p>
                <label >Technologies :   </label> <span class="spanTexte"><%=((ArrayList<String>)session.getAttribute("page")).get(7)%></span>
                <label >Entreprise name :   </label><span class="spanTexte"><%=((ArrayList<String>)session.getAttribute("page")).get(1)%></span>
                <label >Internship begin :   </label><span class="spanTexte"><%=((ArrayList<String>)session.getAttribute("page")).get(6)%></span>
                <label >duration of the internship :   </label><span class="spanTexte"><%=((ArrayList<String>)session.getAttribute("page")).get(5)%> days</span>
                <label >city :   </label><span class="spanTexte"><%=((ArrayList<String>)session.getAttribute("page")).get(8)%></span>
                <label >Reminiration :   </label><span class="spanTexte"><%=((ArrayList<String>)session.getAttribute("page")).get(9)%></span>
                <label >grade required :   </label><span class="spanTexte"><%=((ArrayList<String>)session.getAttribute("page")).get(10)%></span>

                <label >Description :</label>
                <p>
                    <!-- Texte descriptif -->
                    <%=((ArrayList<String>)session.getAttribute("page")).get(2)%>
                     </p>
            </div>
        </div>
    </div>
    <div class="reaction">
        <div class="like-dislike" style="padding-left: 30px;">

                    <button class="span1">
                        5 <i class="far fa-thumbs-up "></i>
                    </button>


                    <button class="span2">
                        6 <i class="far fa-thumbs-down "></i>
                    </button>


        </div>

        <form action="comments" method="post" class="comment-section">
                <input type="text" name="body" style="padding-left: 20px;" placeholder="       add a comment...">
                <button class="btn transparent" type="submit">post</button>

        </form>

    </div>
    <div class="comment">
        <br>

        <% if(session.getAttribute("com")!=null){%>
        <% for(int i=0;i<((ArrayList<ArrayList<String>>)session.getAttribute("com")).size();i++){%>
        <div class="comment-template">
            <span><i class="fas fa-user"></i><%=((ArrayList<ArrayList<String>>)session.getAttribute("com")).get(i).get(0)%></span>
            <p><%=((ArrayList<ArrayList<String>>)session.getAttribute("com")).get(i).get(1)%></p>
            <h6><%=((ArrayList<ArrayList<String>>)session.getAttribute("com")).get(i).get(2)%></h6>
        </div>
        <%}%>
        <%}%>
        <br>
    </div>
</div>


<!-- footer -->
<footer>
    <span>Ensiastly team</span>
</footer>
<!-- end of footer -->


</body>
</html>