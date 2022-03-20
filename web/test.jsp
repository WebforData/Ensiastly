<%--
  Created by IntelliJ IDEA.
  User: condor
  Date: 25/01/2022
  Time: 20:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>test</title>
</head>
<body>
    <form action="like" method="post">
        <input name="like" type="text" id="number" value="0"/>
        <input value="ok" type="submit" onclick="incrementValue()">
    </form>
    <% if(session.getAttribute("like")!=null){%>
    <div ><%=session.getAttribute("like")%></div>
<%}%>
</body>
<script>
    function incrementValue()
    {
        var value = parseInt(document.getElementById('number').value);
        value = isNaN(value) ? 0 : value;
        value++;
        document.getElementById('number').value = value;
    }
</script>
</html>
