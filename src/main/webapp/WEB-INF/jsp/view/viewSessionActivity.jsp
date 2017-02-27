<%@ page import="edu.ouhk.comps380f.lab05.*" %>
<%@ page import="java.util.Date, java.text.SimpleDateFormat" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>       

<%
    SimpleDateFormat f = new SimpleDateFormat("EEE, d MMM yyyy HH:mm:ss Z");
%>

<jsp:useBean id="timeValue" class="java.util.Date"></jsp:useBean>
<c:set target="${timeValue}" property="time" value="${pageContext.session.creationTime}"/>

<!DOCTYPE html>
<html>
    <head>
        <title>Session Activity</title>
    </head>
    <body>
        <h1>Session Activity</h1>

        <h2>Session properties</h2>
        Session ID: ${pageContext.session.id}<br />
        Session is new: ${pageContext.session["new"]}<br />
        Session created: <fmt:formatDate value="${timeValue}" pattern="EEE, d MMM yyyy HH:mm:ss Z" /><br />

        <h2>Page activity in this session</h2>
        <c:forEach var="visit" items="${activity}">
            ${visit.request} 
            <c:if test="${not empty visit.ipAddress}">
                from IP ${visit.ipAddress.hostAddress}
            </c:if>
            <c:set target="${timeValue}" property="time" value="${visit.enteredTimestamp}"/>
            (<fmt:formatDate value="${timeValue}" pattern="EEE, d MMM yyyy HH:mm:ss Z" />
            <c:if test="${not empty visit.leftTimestamp}">, 
                stayed for ${visit.toString(visit.leftTimestamp - visit.enteredTimestamp)}
            </c:if>
            ) <br/>
        </c:forEach>

    </body>
</html>
