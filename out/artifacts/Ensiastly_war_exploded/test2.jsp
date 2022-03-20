<%@ page import="java.io.File" %><%--
  Created by IntelliJ IDEA.
  User: condor
  Date: 29/01/2022
  Time: 12:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    String folderName = "upload";
    String im=(String) session.getAttribute("f");
    String uploadPath =  folderName+ File.separator+im;
%>

   <div><%=uploadPath%></div>
    <a href="<%=uploadPath%>" target="_blank"><%=session.getAttribute("f")%></a>
</body>
</html>
