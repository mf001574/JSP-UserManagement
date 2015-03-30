<%-- 
    Document   : footer
    Created on : Mar 20, 2015, 4:05:02 PM
    Author     : Florian Massa and Yoann Moise
--%>
<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="${language}" />
<fmt:setBundle basename="i18n.text" />

<footer class="footer section" id="features">
    <div class="row">
        <div class="large-12 columns">
            <form id="formLanguage" method="POST">
                <button name="language"  value="en" ${language == 'en' ? 'selected' : ''}<fmt:message key="footer.option.UK"/>><img src="${pageContext.request.contextPath}/resources/uk_icon.png"/></button>
                <button name="language"  value="es" ${language == 'es' ? 'selected' : ''}<fmt:message key="footer.option.ES"/>><img src="${pageContext.request.contextPath}/resources/es_icon.png"/></button>
                <button name="language"  value="fr" ${language == 'fr' ? 'selected' : ''}<fmt:message key="footer.option.FR"/>><img src="${pageContext.request.contextPath}/resources/fr_icon.png"/></button>                
            </form> 
        </div>
        <div class="large-12 columns">
            <a href="http://miage.unice.fr/" style="margin-right:10px"><fmt:message key="footer.link.miageHome" /></a> |
            <a href="http://florian-massa.com/" style="margin-left:10px; margin-right:10px"><fmt:message key="footer.link.massa" /></a> |
            <a href="http://yoann-moise.com/" style="margin-left:10px"><fmt:message key="footer.link.moise" /></a>

        </div> 
    </div>
</footer>