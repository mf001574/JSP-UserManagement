<%-- 
    Document   : template
    Created on : Mar 20, 2015, 4:02:24 PM
    Author     : Florian Massa and Yoann Moise
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
