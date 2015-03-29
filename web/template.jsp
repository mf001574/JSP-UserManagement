<%-- 
    Document   : template
    Created on : Mar 20, 2015, 4:02:24 PM
    Author     : Florian Massa and Yoann Moise
--%>

<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="${language}" />
<fmt:setBundle basename="i18n.text" />

<!DOCTYPE html>
<html>
    <head>
        <title>${param.title}</title>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath}/resources/style.css" />
    </head>
    <body>
        <jsp:include page="header.jsp"/>


        <h1>${param.title}</h1>

        <jsp:include page="${param.content}.jsp"/>

        <jsp:include page="footer.jsp"/>
    </body>
</html>
