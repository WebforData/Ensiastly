<%--
  Created by IntelliJ IDEA.
  User: condor
  Date: 24/01/2022
  Time: 01:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Error search</title>
    <link rel="stylesheet" href="css/error.css">
</head>
<body>
<div>
    <aside><img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/4424790/Mirror.png" alt="404 Image" />
    </aside>
    <main>
        <h1>Sorry!</h1>
        <p>
            <em>Hi <%=session.getAttribute("name")%></em><br>
            We did not find <i><%=session.getAttribute("error")%></i><em><br>. . . try to search in other category.</em>
        </p>
        <a href="accueil.jsp">Search</a>
    </main>
</div>
</body>
</html>
