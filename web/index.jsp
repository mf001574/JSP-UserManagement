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
            <div class="contenu">
                <c:if test="${connecte}">

                    <h3>${nbTuples} <fmt:message key="index.h3.nbUsers" /></h3>

                    <!-- Message qui s'affiche lorsque la page est appelé avec un paramètre http message -->
                    <c:if test="${!empty param['message']}">
                        <h5><fmt:message key="index.h3.msgReceived" />: ${param.message}</h5>
                    </c:if>

                    <br/>
                    <a href="ServletUsers?action=listerLesUtilisateurs"><fmt:message key="index.h3.updateListUsers" /></a>
                    <br/><br/><br/><br/>

                    <!-- Zone qui affiche les utilisateurs si le paramètre action vaut listerComptes -->
                    <c:if test="${param['action'] == 'listerLesUtilisateurs'}" >

                        <table class="listing">
                            <!-- La ligne de titre du tableau des comptes -->
                            <tr>
                                <th><b><fmt:message key="index.table.login" /></b></th>
                                <th><b><fmt:message key="index.table.nom" /></b></th>
                                <th><b><fmt:message key="index.table.prenom" /></b></th>
                            </tr>

                            <!-- Ici on affiche les lignes, une par utilisateur -->
                            <!-- cette variable montre comment on peut utiliser JSTL et EL pour calculer -->
                            <c:set var="total" value="0"/>

                            <c:forEach var="u" items="${requestScope['listeDesUsers']}">
                                <tr>
                                    <td>${u.login}</td>
                                    <td>${u.firstname}</td>
                                    <td>${u.lastname}</td>
                                    <!-- On compte le nombre de users -->
                                    <c:set var="total" value="${total+1}"/>
                                </tr>
                            </c:forEach>

                            <!-- Affichage du solde total dans la dernière ligne du tableau -->
                            <tr><td><b>TOTAL</b></td><td></td><td><b>${total}</b></td></tr>
                            <tr class='tfooter'><td><a href='ServletUsers?action=listerLesUtilisateurs&deplacement=pre' class='button-link'><fmt:message key="index.td.previous" /></a></td><td>${indiceDepart}-${indiceFin}</td><td><a href='ServletUsers?action=listerLesUtilisateurs&deplacement=suiv' class='button-link'><fmt:message key="index.td.next" /></a></td></tr>
                        </table>


                    </c:if>
                    <c:if test="${param['action'] == 'ResultatRecherche'}" >
                        <a href='ServletUsers?action=chercherParLogin&deplacement=pre&login=${param['login']}'>pre</a> - 
                        <a href='ServletUsers?action=chercherParLogin&deplacement=suiv&login=${param['login']}'>suiv</a>
                        <br/><br/>
                        <div class='index'>
                        ${indiceDepart}-${indiceFin}
                        </div>
                            <c:forEach var="u" items="${requestScope['listeDesUsers']}">
                                <div class='detailU'>
                                  <figure>
                                    <img src="resources/profil.jpg">
                                    <figcaption><b>${u.login}</b></figcaption>
                                  </figure>
                                
                                    <span class='nom'>${u.firstname}</span>
                                    <span class='prenom'>${u.lastname}</span>
                                  
                                </div>
                            </c:forEach>
                       
                    </c:if>
                </c:if>

                <c:if test="${!connecte}">
                    <figure>
                        <figcaption style="text-align:center;"><b><fmt:message key="index.figcaption.connectMsg" /></b></figcaption>
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