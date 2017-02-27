<%@page contentType="text/html" pageEncoding="UTF-8" language="java" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>         
<!DOCTYPE html>
<html>
    <head>
        <title>Hello User Application</title>
    </head>
    <body>
        <h1>Your Selections</h1>
        <c:choose>
            <c:when test="${empty paramValues.fruit}">
                You did not select any fruits.
            </c:when>
            <c:otherwise>
                <ul>
                    <c:forEach var="f" items="${paramValues.fruit}">
                        <li>${f}</li>
                    </c:forEach>
                </ul>
            </c:otherwise>
        </c:choose>

    </body>
</html>
