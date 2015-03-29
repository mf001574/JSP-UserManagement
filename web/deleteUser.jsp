<%-- 
    Document   : index
    Created on : Mar 20, 2015, 2:15:53 PM
    Author     : Florian Massa and Yoann Moise
--%>



<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="${language}" />
<fmt:setBundle basename="i18n.text" />
<!DOCTYPE html>
<!-- Ne pas oublier cette ligne sinon tous les tags de la JSTL seront ignorés ! -->
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gestionnaire d'utilisateurs</title>
        <link rel="stylesheet" type="text/css"
                href="${pageContext.request.contextPath}/resources/style.css" />
        <link rel="stylesheet" type="text/css"
                href="${pageContext.request.contextPath}/resources/app.min.css" media="all"/>
    </head>
    <body>
        <div class="pure-container" data-effect="pure-effect-reveal">

                <jsp:include page="header.jsp"/>

                <div class="pure-pusher-container">
                    <div class="pure-pusher">
                        <div class="contenu">
                            <c:if test="${connecte}">
                                <h3><fmt:message key="deleteUser.h3.title"/>:</h3>
                                <div id="form-area">
                                    <form action="ServletUsers" method="get">
                                        <label for="login"><fmt:message key="deleteUser.label.login" />:</label>
                                        <input type="text" name="login"/>

                                        <input type="hidden" name="action" value="supprimerUnUtilisateur"/>
                                        
                                        <fmt:message key="deleteUser.button.submit" var="buttonValue" />
                                        <input type="submit" value="${buttonValue}" name="submit" class="submit-button"/>
                                    </form>

                                    <div style="clear: both;"></div>
                                </div>
                            </c:if>
                                
                            <c:if test="${!connecte}">
                                <figure>
                                    <img src="${pageContext.request.contextPath}/resources/Warning.png" alt="Vous devez vous connecter" style="width:50%; height:50%; margin-right: 25%; margin-left:25%;"/><br/><br/>
                                    <figcaption style="text-align:center;"><b><fmt:message key="createDeleteDisplayModify.figcaption.errorMessage" /></b></figcaption>
                                </figure>
                            </c:if>
                        </div>
                        <jsp:include page="footer.jsp"/>

                    </div>
                     </div>
                </div>
            <label class="pure-overlay" for="pure-toggle-left" data-overlay="left"></label> 
        </div>
    </body>
</html>