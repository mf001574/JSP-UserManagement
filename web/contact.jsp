<%-- 
    Document   : contact
    Created on : Mar 27, 2015, 2:15:53 PM
    Author     : Florian Massa and Yoann Moise
--%>


<%@page import="mail.SendEmail" %>
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
        <script src="https://maps.googleapis.com/maps/api/js"></script>
        <script>
            function initialize() {
              var mapCanvas = document.getElementById('map-canvas');
              var mapOptions = {
                center: new google.maps.LatLng(43.695949, 7.271413),
                zoom: 12,
                zoomControl: false,
                scaleControl: false,
                scrollwheel: false,
                disableDoubleClickZoom: true,
                mapTypeId: google.maps.MapTypeId.ROADMAP
              }
              var map = new google.maps.Map(mapCanvas, mapOptions);
            }
            google.maps.event.addDomListener(window, 'load', initialize);
        </script>
    </head>
    <body>
        <div class="pure-container" data-effect="pure-effect-reveal">

            <jsp:include page="header.jsp"/>
            
            <div id="map-canvas"></div>

            <div class="pure-pusher-container">
                <div class="pure-pusher">                    
                    <div class="contenu">
                        <h3 style="margin-top:-25px;">Contactez-nous</h3>
                        <div id="form-area">
                            <form action="contact.jsp" method="POST">
                                <input type="text" placeholder="Prénom *" id="first_name" name="first_name" class='inputHeader' required>

                                <input type="text" placeholder="Nom *" id="last_name" name="last_name" class='inputHeader' required>
                                                              
                                <input type="email" placeholder="Email *" id="email" name="email" class='inputHeader' required>
                                                                
                                <input type="text" placeholder="Message" id="message" name="message" class='inputHeader' style="height:150px; ">
                                
                                <input type="submit" name="send" value="Envoyer" id="send" class="submit-button"/>                          
                            </form>                 
                            
                            <%
                                if ((request.getParameter("last_name") != null) &&
                                        (request.getParameter("first_name") != null) &&
                                        (request.getParameter("email") != null)) {
                                    String lastName = request.getParameter("last_name");
                                    String firstName = request.getParameter("first_name");
                                    String fullname = firstName + " " + lastName;       
                                    String email = request.getParameter("email");
                                    String message = "Message envoyé par " + fullname + " ( " + email + " ). \n \n";
                                    message += request.getParameter("message");
                                    
                                    if (mail.SendEmail.run(email, fullname, message)) {
                                    %>
                                    <p class="goodtogo end">Mail Sent Successfully</p>
                                    <%} else {%>
                                    <p class="warning end">Error Sending Mail</p>
                                    <%}
                                }
                            %>


                            <div style="clear: both;"></div>
                        </div>
                        <jsp:include page="footer.jsp"/>
                    </div>
                </div>
                <label class="pure-overlay" for="pure-toggle-left" data-overlay="left"></label> 
            </div>
    </body>
</html>