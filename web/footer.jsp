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

<div id="footer">
    <div class="footer section" id="features">
        <div class="row">
            <div class="large-12 columns">
                <a href="http://miage.unice.fr/" style="margin-right:10px"><fmt:message key="footer.link.miageHome" /></a> |
                <a href="http://florian-massa.com/" style="margin-left:10px; margin-right:10px"><fmt:message key="footer.link.massa" /></a> |
                <a href="http://yoann-moise.com/" style="margin-left:10px"><fmt:message key="footer.link.moise" /></a>
              <!--  <div id="language" name="language" onchange="submit()"> 
                    <h4><fmt:message key="footer.h4.translate" /></h4>
                    <hr/>
                    <img src="${pageContext.request.contextPath}/resources/uk_icon.png" alt="UK" value="en" ${language == 'en' ? 'selected' : ''}>
                    <img src="${pageContext.request.contextPath}/resources/france_icon.png" alt="France" value="fr" ${language == 'fr' ? 'selected' : ''}>   
                </div>-->
                <form id="formLanguage">
                    <h4><fmt:message key="footer.h4.translate" /></h4>
                    <hr/>
                    <select id="language" name="language" onchange="submit()">
                        <option value="en" ${language == 'en' ? 'selected' : ''}><fmt:message key="footer.option.UK" /></option>
                        <option value="fr" ${language == 'fr' ? 'selected' : ''}><fmt:message key="footer.option.FR" /></option>
                    </select>
                </form>
            <div class="large-12 columns" id='phraseBas'>
                <p><fmt:message key="footer.p.description" /></p>
            </div>
        </div>
    </div>
</div>
