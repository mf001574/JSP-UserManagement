<%-- 
    Document   : header
    Created on : Mar 20, 2015, 4:04:40 PM
    Author     : Florian Massa and Yoann Moise
--%>
      
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<input type="checkbox" id="pure-toggle-left" class="pure-toggle" data-toggle="left"/>
<label class="pure-toggle-label" for="pure-toggle-left" data-toggle-label="left">
    <span class="pure-toggle-icon"></span>
</label>


<nav class="pure-drawer" data-position="left">
    <div class="row collapse">
        <div class="large-12 columns">
            <ul class="nav-primary">
                <li><a href="index.jsp">Accueil</a></li>
                <li><a href="createUser.jsp">Creer un compte utilisateur</a></li>
                <li><a href="displayUser.jsp">Afficher les détails d'un utilisateur</a></li>
                <li><a href="modifyUser.jsp">Modifier les détails d'un utilisateur</a></li>
                <li><a href="deleteUser.jsp">Supprimer un utilisateur</a></li>
            </ul> 
        </div>
    </div>
</nav>

 <div class="pure-pusher-container">
    <div class="pure-pusher">
        <div class='header'>
            <h2>Gestion des utilisateurs </h2>
            <c:if test="${!connecte}">
                <form action="ServletConnexion" method="get" id="formConnexion">
                    <input type="text" placeholder="login" name="login" class='inputHeader'>
                    <input type="text" placeholder="mot de passe" name="mdp" class='inputHeader'>
                    <input type="submit" value="Se connecter" name="action" class='inputSubmitHeader'>
                </form> 
            </c:if>

            <c:if test="${connecte}">
                <a href="ServletConnexion?action=deconnexion">Déconnexion</a>
            </c:if>
        </div> 
        <hr>