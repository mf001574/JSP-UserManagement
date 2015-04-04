<%-- 
    Document   : header
    Created on : Mar 20, 2015, 4:04:40 PM
    Author     : Florian Massa and Yoann Moise
--%>

<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="${language}" />
<fmt:setBundle basename="i18n.text" />


<input type="checkbox" id="pure-toggle-left" class="pure-toggle" data-toggle="left"/>
<label class="pure-toggle-label" for="pure-toggle-left" data-toggle-label="left">
    <span class="pure-toggle-icon"></span>
</label>


<nav class="pure-drawer" data-position="left">
    <div class="row collapse">
        <div class="large-12 columns">
            <ul class="nav-primary">
                <li><a href="index.jsp"><fmt:message key="header.link.home" /></a></li>
                <c:if test="${connecte}">
                    <li><a href="createUser.jsp"><fmt:message key="header.link.create" /></a></li>
                    <li><a href="displayUser.jsp"><fmt:message key="header.link.display" /></a></li>
                    <li><a href="modifyUser.jsp"><fmt:message key="header.link.modify" /></a></li>
                    <li><a href="deleteUser.jsp"><fmt:message key="header.link.delete" /></a></li>
                </c:if>
                <li><a href="contact.jsp"><fmt:message key="header.link.contact" /></a></li>
            </ul> 
        </div>
    </div>
</nav>

<div class="pure-pusher-container">
    <div class="pure-pusher">
        <div class='header'>
            <h2><fmt:message key="header.h2.title" /></h2>
            <form action="ServletConnexion" method="get" id="formConnexion">
                <c:if test="${!connecte}">
                    <fmt:message key="header.placeholder.login" var="placeHolderLogin" />
                    <input type="text" placeholder="${placeHolderLogin}" name="log" class='inputHeader'>
                    
                    <fmt:message key="header.placeholder.password" var="placeHolderPass" />
                    <input type="password" placeholder="${placeHolderPass}" name="pass" class='inputHeader'>

                    <input type="hidden" name="action" value="checkConnexion">

                    <fmt:message key="header.button.connect" var="buttonConnect" />
                    <input type="submit" value="${buttonConnect}" name="action" class="inputSubmitHeader"/>  
                </c:if>

                <c:if test="${connecte}">
                    <input type="hidden" name="action" value="deconnexion">

                    <fmt:message key="header.button.deconnect" var="buttonDeconnect" />
                    <input type="submit" value="${buttonDeconnect}" name="action" class="inputSubmitHeader"/>                   
                </c:if>
            </form> 

        </div> 
        <hr>