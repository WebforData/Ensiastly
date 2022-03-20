<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: condor
  Date: 24/01/2022
  Time: 09:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title style="text-space: 1px;"><%=session.getAttribute("name")%></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <style>
        #mpass{
            display: none;
        }
        #madd{
            display: none;
        }
    </style>
</head>
<body>
<%
    if (session.getAttribute("email")==null)
    {
        String restau="profil";
        session.setAttribute("here",restau);
        request.setAttribute("errorMessage","Log in first");
        request.getRequestDispatcher( "/Login.jsp" ).forward( request, response );
    }
%>
    <section style="background-color: #eee;">
        <div class="container py-5" >
            <div class="row"><% if(session.getAttribute("pass")!=null){%>
                <div class="alert alert-success" id="my"role="alert">
                    <%=session.getAttribute("pass")%>
                </div>
                <%}%></div>
            <div class="row">
                <div class="col">
                    <nav aria-label="breadcrumb" class="bg-light rounded-3 p-3 mb-4">
                        <ol class="breadcrumb mb-0">
                            <li class="breadcrumb-item"><a href="accueil.jsp">Home</a></li>
                            <li class="breadcrumb-item active" aria-current="page">profil -><%=session.getAttribute("name")%></li>
                        </ol>
                    </nav>
                </div>
            </div>

            <div class="row">
                <div class="col-lg-4">
                    <div class="card mb-4">
                        <div class="card-body text-center">
                            <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-chat/ava3.webp" alt="avatar" class="rounded-circle img-fluid" style="width: 150px;">
                            <h5 class="my-3"><%=session.getAttribute("name")%></h5>
                            <p class="text-muted mb-4">École Nationale Supérieure d'Informatique et d'Analyse des Systèmes</p>
                            <div class="d-flex justify-content-center mb-2">
                                <button onclick="fun()"  type="button" class="btn btn-primary">change password</button>
                            </div>
                            <div class="card-body" id="mpass" >
                                <hr>
                                <form action="profil" method="post" style="width: 500px;">
                                    <div class="form-row">
                                        <div class="form-group col-md-6">
                                            <label style="margin-bottom: 2px;">new password</label>
                                            <input type="password" name="pass" class="form-control" id="password" placeholder="new password" onkeyup='check();' required>
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label style="margin-bottom: 2px;">Confirm password</label>
                                            <input type="password" class="form-control" id="confirm_password" placeholder="confirm password" onkeyup='check();' required>
                                            <span id='message'></span>
                                        </div>
                                        <div class="form-group col-md-6">
                                        <button type="submit" style="margin-top: 10px;" class="btn btn-primary">change password</button>
                                        </div>
                                        </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="card mb-4 mb-lg-0" style="padding: 10px; border-radius: 5px;" >
                        <div class="card-body p-0">
                            <div class="row">
                                <div class="col-sm-3">
                                    <p class="mb-0">Name</p>
                                </div>
                                <div class="col-sm-9">
                                    <p class="text-muted mb-0"><%=session.getAttribute("name")%></p>
                                </div>
                            </div>
                            <hr>
                            <div class="row">
                                <div class="col-sm-3">
                                    <p class="mb-0">Email</p>
                                </div>
                                <div class="col-sm-9">
                                    <p class="text-muted mb-0"><%=session.getAttribute("email")%></p>
                                </div>
                            </div>
                            <hr>
                            <div class="row">
                                <div class="col-sm-3">
                                    <p class="mb-0">branch</p>
                                </div>
                                <div class="col-sm-9">
                                    <p class="text-muted mb-0"><%=session.getAttribute("branche")%></p>
                                </div>
                            </div>
                            <hr>
                            <div class="row">
                                <div class="col-sm-3">
                                    <p class="mb-0">Grade</p>
                                </div>
                                <div class="col-sm-9">
                                    <p class="text-muted mb-0"><%=session.getAttribute("grade")%></p>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
                <div class="col-lg-8" style="height: max-content;">
                    <div class="card mb-4">
                        <div class="card-body">
                            <div class="row">
                                <div class="col-sm-3">
                                    <p class="mb-0">Number of publication</p>
                                </div>
                                <div class="col-sm-9">
                                        <button  class="btn btn-primary">
                                        Number publication until now
                                            <span class="badge bg-danger"><%=session.getAttribute("sum")%></span>
                                        </button>

                                    <br>
                                    <button style="margin-right: 20px;margin-top: 10px;" class="btn btn-danger" onclick="fun1()">add</button>
                                    <div id="madd" class="btn-group" style="margin-top: 10px;">
                                        <a href="formulaire_stage.jsp" class="btn btn-primary active" aria-current="page">Stage</a>
                                        <a href="formulaire_formation.jsp" class="btn btn-primary">Formation/certificat</a>
                                        <a href="formulaire_Restau.jsp" class="btn btn-primary">Restaurant/Cafe</a>
                                    </div>
                                </div>
                            </div>
                            <hr>
                            <%--stage--%>
                            <% if(((ArrayList<ArrayList<String>>)session.getAttribute("arr"))!=null && ((ArrayList<ArrayList<String>>)session.getAttribute("arr")).size()!=0){%>
                                <h4>Stage publications :</h4>
                            <% for(int i=0;i<((ArrayList<ArrayList<String>>)session.getAttribute("arr")).size();i++){%>
                            <div class="row">
                                <div class="col-sm-3">
                                    <p class="mb-0">date of publication <br><i><%=((ArrayList<ArrayList<String>>)session.getAttribute("arr")).get(i).get(3)%></i><br>
                                    <form action="page" method="post">
                                    <input type="hidden" name="idwho" value="formulaire_stage">
                                    <input type="hidden" name="id" value="<%=((ArrayList<ArrayList<String>>)session.getAttribute("arr")).get(i).get(4)%>">
                                    <input type="submit" class="btn btn-primary" value="see more">
                                </form>
                                    <form action="delete" method="post">
                                            <input type="hidden" name="id" value="<%=((ArrayList<ArrayList<String>>)session.getAttribute("arr")).get(i).get(4)%>">
                                            <input type="hidden" name="idwho" value="formulaire_stage">
                                        <input type="submit" class="btn btn-danger" value="delete">
                                    </form>
                                    </p>
                                </div>
                                <div class="col-sm-9">
                                    <p class="text-muted mb-0">
                                        <ul>
                                     <li>name of entreprise:<%=((ArrayList<ArrayList<String>>)session.getAttribute("arr")).get(i).get(0)%></li>
                                     <li>reminiration: <%=((ArrayList<ArrayList<String>>)session.getAttribute("arr")).get(i).get(1)%></li>
                                    <li><%=((ArrayList<ArrayList<String>>)session.getAttribute("arr")).get(i).get(2)%> day</li>
                                </ul>
                                    </p>
                                </div>
                            </div><hr>
                            <%}%>
                            <%}%>
                            <%--Formation--%>
                            <% if(((ArrayList<ArrayList<String>>)session.getAttribute("arr2"))!=null && ((ArrayList<ArrayList<String>>)session.getAttribute("arr2")).size()!=0){%>
                            <h4>formation/certificat publications :</h4>
                            <% for(int j=0;j<((ArrayList<ArrayList<String>>)session.getAttribute("arr2")).size();j++){%>
                            <div class="row">
                                <div class="col-sm-3">
                                    <p class="mb-0">date of publication <br><i><%=((ArrayList<ArrayList<String>>)session.getAttribute("arr2")).get(j).get(3)%></i><br>
                                    <form action="page" method="post">
                                    <input type="hidden" name="idwho" value="formulaire_formation">
                                    <input type="hidden" name="id" value="<%=((ArrayList<ArrayList<String>>)session.getAttribute("arr2")).get(j).get(4)%>">
                                        <input type="submit" class="btn btn-primary" value="see more">
                                    </form>
                                    <form action="delete" method="post">
                                        <input type="hidden" name="idwho" value="formulaire_formation">
                                        <input type="hidden" name="id" value="<%=((ArrayList<ArrayList<String>>)session.getAttribute("arr2")).get(j).get(4)%>">
                                        <input type="submit" class="btn btn-danger" value="delete">
                                    </form>
                                    </p>
                                </div>
                                <div class="col-sm-9">
                                    <p class="text-muted mb-0">
                                    <ul>
                                        <li>theme of formation<%=((ArrayList<ArrayList<String>>)session.getAttribute("arr2")).get(j).get(0)%></li>
                                        <li><%=((ArrayList<ArrayList<String>>)session.getAttribute("arr2")).get(j).get(1)%> hours</li>
                                        <li>free: <%=((ArrayList<ArrayList<String>>)session.getAttribute("arr2")).get(j).get(2)%> </li>
                                    </ul>
                                    </p>
                                </div>
                            </div><hr>
                            <%}%>
                            <%}%>
                            <%--restau--%>
                            <% if(((ArrayList<ArrayList<String>>)session.getAttribute("arr1"))!=null && ((ArrayList<ArrayList<String>>)session.getAttribute("arr1")).size()!=0){%>
                            <h4>Restaurant/Cafe publications :</h4>
                            <% for(int z=0;z<((ArrayList<ArrayList<String>>)session.getAttribute("arr1")).size();z++){%>
                            <div class="row">
                                <div class="col-sm-3">
                                    <p class="mb-0">date of publication <br><i><%=((ArrayList<ArrayList<String>>)session.getAttribute("arr1")).get(z).get(3)%></i><br>
                                    <form action="page" method="post">
                                    <input type="hidden" name="id" value="<%=((ArrayList<ArrayList<String>>)session.getAttribute("arr1")).get(z).get(4)%>">
                                    <input type="hidden" name="idwho" value="formulaire_restau">
                                        <input type="submit" class="btn btn-primary" value="see more">
                                    </form>
                                    <form action="delete" method="post">
                                        <input type="hidden" name="id" value="<%=((ArrayList<ArrayList<String>>)session.getAttribute("arr1")).get(z).get(4)%>">
                                        <input type="hidden" name="idwho" value="formulaire_restau">
                                        <input type="submit" class="btn btn-danger" value="delete">
                                    </form>
                                    </p>
                                </div>
                                <div class="col-sm-9">
                                    <p class="text-muted mb-0">
                                    <ul>
                                        <li>place of restaurant <%=((ArrayList<ArrayList<String>>)session.getAttribute("arr1")).get(z).get(0)%></li>
                                        <li>min for consumption <%=((ArrayList<ArrayList<String>>)session.getAttribute("arr1")).get(z).get(1) %> Dh</li>
                                        <li>wifi : <%=((ArrayList<ArrayList<String>>)session.getAttribute("arr1")).get(z).get(2)%> </li>
                                    </ul>
                                    </p>
                                </div>
                            </div><hr>
                            <%}%>
                            <%}%>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

<script>
    var check = function() {
        if (document.getElementById('password').value ==
            document.getElementById('confirm_password').value) {
            document.getElementById('message').style.color = 'green';
            document.getElementById('message').innerHTML = 'matching';
        } else {
            document.getElementById('message').style.color = 'red';
            document.getElementById('message').innerHTML = 'not matching';
        }
    }
    function fun() {
        var x = document.getElementById("mpass");
        if (x.style.display === "none") {
            x.style.display = "block";
        } else {
            x.style.display = "none";
        }
    }
    function fun1() {
        var x = document.getElementById("madd");
        if (x.style.display === "none") {
            x.style.display = "block";
        } else {
            x.style.display = "none";
        }
    }
    setTimeout(function(){
        document.getElementById('my').style.display = 'none';
    }, 5000);
</script>
</body>
</html>
