<%-- 
    Document   : index
    Created on : Mar 20, 2015, 2:15:53 PM
    Author     : Florian Massa and Yoann Moise
--%>



<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- Ne pas oublier cette ligne sinon tous les tags de la JSTL seront ignorés ! -->
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
                     
                        <h3>${nbTuples} utilisateurs enregistrés</h3>

                        <!-- Message qui s'affiche lorsque la page est appelé avec un paramètre http message -->
                        <c:if test="${!empty param['message']}">
                            <h5>Reçu message : ${param.message}</h5>
                        </c:if>
                          
                        <br/>
                        <a href="ServletUsers?action=listerLesUtilisateurs">Afficher/raffraichir la liste de tous les utilisateurs</a>
                        <br/><br/><br/><br/>

                        <!-- Zone qui affiche les utilisateurs si le paramètre action vaut listerComptes -->
                        <c:if test="${param['action'] == 'listerLesUtilisateurs'}" >

                            <table class="listing">
                                <!-- La ligne de titre du tableau des comptes -->
                                <tr>
                                    <th><b>Login</b></th>
                                    <th><b>Nom</b></th>
                                    <th><b>Prénom</b></th>
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
                                <tr class='tfooter'><td><a href='ServletUsers?action=listerLesUtilisateurs&deplacement=pre' class='button-link'>Précédent</a></td><td>${indiceDepart}-${indiceFin}</td><td><a href='ServletUsers?action=listerLesUtilisateurs&deplacement=suiv' class='button-link'>Suivant</a></td></tr>
                            </table>
                         

                        </c:if>
                    </div>
                    <jsp:include page="footer.jsp"/>
                     </div>
                </div>
            <label class="pure-overlay" for="pure-toggle-left" data-overlay="left"></label> 
        </div>
    </body>
</html>