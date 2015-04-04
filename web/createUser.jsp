<%-- 
    Document   : index
    Created on : Mar 20, 2015, 2:15:53 PM
    Author     : Florian Massa and Yoann Moise
--%>



<!DOCTYPE html>
<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="${language}" />
<fmt:setBundle basename="i18n.text" />
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create a user account</title>
        <link rel="stylesheet" type="text/css"
                href="${pageContext.request.contextPath}/resources/style.css" />
        <link rel="stylesheet" type="text/css"
                href="${pageContext.request.contextPath}/resources/app.min.css" media="all"/>
        
         <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
         <script src="//code.jquery.com/jquery-1.10.2.js"></script>
         <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
          <script>
            $(function() {
              $( "#tabs" ).tabs();
            });
            
        </script>
    </head>
    <body>
        <div class="pure-container" data-effect="pure-effect-reveal">

                <jsp:include page="header.jsp"/>

                <div class="pure-pusher-container">
                    <div class="pure-pusher">
                    <div class="contenu">
                        
                        <c:if test="${connecte}">
                                         
                            <h3><fmt:message key="createUser.h3.creerUnUtilisateur"/></h3>
                            <div id="tabs">
                                <ul>
                                  <li><a href="#tabs-1">1 utilisateur</a></li>
                                  <li><a href="#tabs-2">4 utilisateurs</a></li>
                                  <li><a href="#tabs-3">100 utilisateurs</a></li>
                                </ul>
                                <div class="form-area2" id="tabs-1">
                                    <form action="ServletUsers" method="get">

                                        <label for="nom"><fmt:message key="createUser.label.nom" />:</label>
                                        <input type="text" id="nom" name="nom">

                                        <label for="prenom"><fmt:message key="createUser.label.prenom" />:</label>
                                        <input type="text" id="prenom" name="prenom">

                                        <label for="login"><fmt:message key="createUser.label.login" />:</label>
                                        <input type="text" id="login" name="login">

                                        <!-- Astuce pour passer des paramètres à une servlet depuis un formulaire JSP !-->
                                        <input type="hidden" name="action" value="creerUnUtilisateur"/>

                                        <fmt:message key="createUser.button.submitOne" var="buttonValueOne" />
                                        <input type="submit" value="${buttonValueOne}" name="submit" class="submit-button"/>
                                    </form>

                                    <div style="clear: both;"></div>
                                </div>
                             
                  
                                    <div class="form-area2" id="tabs-2">
                                 
                                        <form action="ServletUsers" method="get">
                                            <!-- Astuce pour passer des paramètres à une servlet depuis un formulaire JSP !-->
                                            <input type="hidden" name="action" value="creerUtilisateursDeTest"/>                                       
                                            <fmt:message key="createUser.button.submitFour" var="buttonValueFour" />
                                            <input type="submit" value="${buttonValueFour}" name="submit" class="submit-button"/>
                                        </form>
                                        <div style="clear: both;"></div>
                                    </div>
                                  
                                  
                                    <div class="form-area2" id="tabs-3">
                                        <form action="ServletUsers" method="get">
                                            <!-- Astuce pour passer des paramètres à une servlet depuis un formulaire JSP !-->
                                            <input type="hidden" name="action" value="creer100UtilisateursDeTest"/>
                                            <fmt:message key="createUser.button.submitHundred" var="buttonValueHundred" />
                                            <input type="submit" value="${buttonValueHundred}" name="submit" class="submit-button"/>                                    </form>
                                        <div style="clear: both;"></div>
                                    </div>
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
            <label class="pure-overlay" for="pure-toggle-left" data-overlay="left"></label> 
        </div>

    </body>
</html>