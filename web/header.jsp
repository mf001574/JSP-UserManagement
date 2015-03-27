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
                <c:if test="${connecte}">
                    <li><a href="createUser.jsp">Creer un compte utilisateur</a></li>
                    <li><a href="displayUser.jsp">Afficher les détails d'un utilisateur</a></li>
                    <li><a href="modifyUser.jsp">Modifier les détails d'un utilisateur</a></li>
                    <li><a href="deleteUser.jsp">Supprimer un utilisateur</a></li>
                </c:if>
            </ul> 
        </div>
    </div>
</nav>

 <div class="pure-pusher-container">
    <div class="pure-pusher">
        <div class='header'>
            <h2>Gestion des utilisateurs </h2>
                            <form action="ServletConnexion" method="get" id="formConnexion">

            <c:if test="${!connecte}">
                    <input type="text" placeholder="Login" name="log" class='inputHeader'>
                    <input type="password" placeholder="Password" name="pass" class='inputHeader'>
                    
                    <input type="hidden" name="action" value="checkConnexion">
                        
                    <input type="submit" value="Se connecter" name="action" class="inputSubmitHeader">
                    
            </c:if>

            <c:if test="${connecte}">
                
                                 <input type="hidden" name="action" value="deconnexion">

                    <input type="submit" value="Se déconnecter" name="action" class="inputSubmitHeader">

            </c:if>
                                </form> 

        </div> 
        <hr>