<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: condor
  Date: 27/01/2022
  Time: 12:26
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
    <link rel="stylesheet" href="css/style2.css">
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
</header>
<!-- end of header -->
<section class = "blog" id = "blog">
    <div class = "container">
        <div class = "title">
            <h2>Search results (<%=((ArrayList<ArrayList<String>>)session.getAttribute("result")).size()%>)</h2>
            <p>about <span><%=session.getAttribute("search")%></span> in the category <span><%=session.getAttribute("categorie")%></span> </p>
        </div>
        <div class = "blog-content">
        <% if(session.getAttribute("st")!=null){%>
        <% for(int i=0;i<((ArrayList<ArrayList<String>>)session.getAttribute("result")).size();i++){%>
            <!-- item -->
            <div class = "blog-item">
                <div class = "blog-img">

                    <span class="span1"><%=((ArrayList<ArrayList<String>>)session.getAttribute("result")).get(i).get(9)%> <i class = "far fa-thumbs-down"></i></span>
                    <span class="span2"><%=((ArrayList<ArrayList<String>>)session.getAttribute("result")).get(i).get(10)%> <i class = "far fa-thumbs-up"></i></span>
                </div>
                <div class = "blog-text">
                    <span><%=((ArrayList<ArrayList<String>>)session.getAttribute("result")).get(i).get(6)%>> by <%=((ArrayList<ArrayList<String>>)session.getAttribute("result")).get(i).get(3)%></span>
                    <h2>Entreprise name: <%=((ArrayList<ArrayList<String>>)session.getAttribute("result")).get(i).get(0)%><br>( <%=((ArrayList<ArrayList<String>>)session.getAttribute("result")).get(i).get(7)%> )</h2>
                    <p ><span style="color: #870000; font-family: 'Playfair Display';"> <i class="far fa-star"></i>  <%=((ArrayList<ArrayList<String>>)session.getAttribute("result")).get(i).get(4)%>/5</span></p>
                    <p><%=((ArrayList<ArrayList<String>>)session.getAttribute("result")).get(i).get(2)%></p>
                    <form action="page" method="post">
                        <input type="hidden" name="id" value="<%=((ArrayList<ArrayList<String>>)session.getAttribute("result")).get(i).get(8)%>">
                        <button class="btn transparent" type="submit">Read More</button></form>
                </div>
            </div>
            <!-- end of item -->

        <%}%>
        <%}%>
        </div>
        <div class = "blog-content">
        <% if(session.getAttribute("form")!=null){%>
        <% for(int i=0;i<((ArrayList<ArrayList<String>>)session.getAttribute("result")).size();i++){%>

            <!-- item -->
            <div class = "blog-item">
                <div class = "blog-img">
                    <%--<img src = "pictures/Ensias.jpg" alt = "">--%>
                    <span class="span1"><%=((ArrayList<ArrayList<String>>)session.getAttribute("result")).get(i).get(8)%> <i class = "far fa-thumbs-down"></i></span>
                    <span class="span2"><%=((ArrayList<ArrayList<String>>)session.getAttribute("result")).get(i).get(9)%> <i class = "far fa-thumbs-up"></i></span>
                </div>
                <div class = "blog-text">
                    <span><%=((ArrayList<ArrayList<String>>)session.getAttribute("result")).get(i).get(6)%>> by <%=((ArrayList<ArrayList<String>>)session.getAttribute("result")).get(i).get(3)%></span>
                    <h2>Theme of formation: <br><%=((ArrayList<ArrayList<String>>)session.getAttribute("result")).get(i).get(0)%>
                        <br>duree: <%=((ArrayList<ArrayList<String>>)session.getAttribute("result")).get(i).get(5)%> hours<br><h4><%=((ArrayList<ArrayList<String>>)session.getAttribute("result")).get(i).get(2)%> formation</h4></h2>
                    <p ><span style="color: #870000; font-family: 'Playfair Display';"> <i class="far fa-star"></i>  <%=((ArrayList<ArrayList<String>>)session.getAttribute("result")).get(i).get(4)%>/5</span></p>
                    <p><%=((ArrayList<ArrayList<String>>)session.getAttribute("result")).get(i).get(1)%></p>
                    <form action="page" method="post">
                        <input type="hidden" name="id" value="<%=((ArrayList<ArrayList<String>>)session.getAttribute("result")).get(i).get(7)%>">
                        <button class="btn transparent" type="submit">Read More</button></form>
                </div>
            </div>
            <!-- end of item -->

        <%}%>
        <%}%>
        </div>
        <div class = "blog-content">
        <% if(session.getAttribute("res")!=null){%>
        <% for(int i=0;i<((ArrayList<ArrayList<String>>)session.getAttribute("result")).size();i++){%>

            <!-- item -->
            <div class = "blog-item">
                <div class = "blog-img">
                    <%--<img src = "pictures/Ensias.jpg" alt = "">--%>
                    <span class="span1"><%=((ArrayList<ArrayList<String>>)session.getAttribute("result")).get(i).get(8)%><i class = "far fa-thumbs-down"></i></span>
                    <span class="span2"><%=((ArrayList<ArrayList<String>>)session.getAttribute("result")).get(i).get(9)%> <i class = "far fa-thumbs-up"></i></span>
                </div>
                <div class = "blog-text">
                    <span><%=((ArrayList<ArrayList<String>>)session.getAttribute("result")).get(i).get(6)%>> by <%=((ArrayList<ArrayList<String>>)session.getAttribute("result")).get(i).get(3)%></span>
                    <h2>Restaurant name : <%=((ArrayList<ArrayList<String>>)session.getAttribute("result")).get(i).get(0)%><br>adress: <%=((ArrayList<ArrayList<String>>)session.getAttribute("result")).get(i).get(2)%></h2>
                    <p ><span style="color: #870000; font-family: 'Playfair Display';"> <i class="far fa-star"></i>  <%=((ArrayList<ArrayList<String>>)session.getAttribute("result")).get(i).get(4)%>/5</span></p>
                    <p><%=((ArrayList<ArrayList<String>>)session.getAttribute("result")).get(i).get(1)%></p>
                    <form action="page" method="post">
                        <input type="hidden" name="id" value="<%=((ArrayList<ArrayList<String>>)session.getAttribute("result")).get(i).get(7)%>">
                        <button class="btn transparent" type="submit">Read More</button></form>
                </div>
            </div>
            <!-- end of item -->

        <%}%>
        <%}%>
        </div>
    </div>
</section>
<!-- footer -->
<footer>
    <span>Ensiastly team</span>
</footer>
<!-- end of footer -->


</body>
</html>