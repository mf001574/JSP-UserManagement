/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import java.io.IOException;
import java.util.Collection;
import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import utilisateurs.gestionnaires.GestionnaireUtilisateurs;
import utilisateurs.modeles.Utilisateur;

/**
 *
 * @author Yoann
 */
@WebServlet(name = "ServletUsers", urlPatterns = {"/ServletUsers"})
public class ServletUsers extends HttpServlet {
    // ici injection de code ! On n'initialise pas !
    @EJB
    private GestionnaireUtilisateurs gestionnaireUtilisateurs;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Pratique pour décider de l'action à faire
        String action = request.getParameter("action");
        String forwardTo = "";
        String message = "";
        String deplacement = request.getParameter("deplacement");
        if(deplacement == null){
           this.gestionnaireUtilisateurs.setIndiceDepart(0);
           this.gestionnaireUtilisateurs.setIndiceFin(10);
        }
        if (action != null) {
            if (action.equals("listerLesUtilisateurs")) {
                if(deplacement != null){
                    if(deplacement.equals("suiv")){
                        this.gestionnaireUtilisateurs.avancer();
                    }else{
                        this.gestionnaireUtilisateurs.reculer();
                    }
                }
               
                Collection<Utilisateur> liste = gestionnaireUtilisateurs.getAllUsers();
                request.setAttribute("indiceDepart",this.gestionnaireUtilisateurs.getIndiceDepart());
                request.setAttribute("indiceFin",this.gestionnaireUtilisateurs.getIndiceFin());
                request.setAttribute("listeDesUsers", liste);
                forwardTo = "index.jsp?action=listerLesUtilisateurs";
                message = "Liste des utilisateurs";
                
            } else if (action.equals("creerUtilisateursDeTest")) {
                this.gestionnaireUtilisateurs.creerUtilisateursDeTest();
                Collection<Utilisateur> liste = gestionnaireUtilisateurs.getAllUsers();
               request.setAttribute("listeDesUsers", liste);
                forwardTo = "index.jsp?action=listerLesUtilisateurs";
                message = "Création de 4 utilisateurs";
            }else if(action.equals("creer100UtilisateursDeTest")){
                this.gestionnaireUtilisateurs.creer100UtilisateursDeTest();
                Collection<Utilisateur> liste = gestionnaireUtilisateurs.getAllUsers();
                request.setAttribute("listeDesUsers", liste);
                forwardTo = "index.jsp?action=listerLesUtilisateurs";
                message = "Création de 100 utilisateurs";
            }else if(action.equals("creerUnUtilisateur")){
                forwardTo = "index.jsp?action=listerLesUtilisateurs";
                message = "Liste des utilisateurs";
                String nom = (String) request.getParameter("nom");
                String prenom = (String)request.getParameter("prenom");
                String login =  (String) request.getParameter("login");
                this.gestionnaireUtilisateurs.creeUtilisateur(nom, prenom, login);
                Collection<Utilisateur> liste = this.gestionnaireUtilisateurs.getAllUsers();
                request.setAttribute("listeDesUsers", liste);
            }else if(action.equals("supprimerUnUtilisateur")){
                forwardTo = "index.jsp?action=listerLesUtilisateurs";
                message = "Liste des utilisateurs";
                String login = (String) request.getParameter("login");
                this.gestionnaireUtilisateurs.supprimerUtilisateur(login);
                Collection<Utilisateur> liste = this.gestionnaireUtilisateurs.getAllUsers();
                request.setAttribute("listeDesUsers", liste);
            }else if(action.equals("chercherParLogin")){
                forwardTo = "index.jsp?action=listerLesUtilisateurs";
                message = "Recherche par login";
                String login = (String) request.getParameter("login");
                request.setAttribute("listeDesUsers", this.gestionnaireUtilisateurs.getUtilisateursWithLogin(login));
            }else if(action.equals("updateUtilisateur")){
                forwardTo = "index.jsp?action=listerLesUtilisateurs";
                message = "Mise à jour d'un utilisateur";
                String nom = (String) request.getParameter("nom");
                String prenom = (String)request.getParameter("prenom");
                String login =  (String) request.getParameter("login");
                this.gestionnaireUtilisateurs.majUtilisateur(login,nom,prenom);
                Collection<Utilisateur> liste = this.gestionnaireUtilisateurs.getAllUsers();
                request.setAttribute("listeDesUsers", liste);
                
            }else{
                forwardTo = "index.jsp?action=todo";
                message = "La fonctionnalité pour le paramètre " + action + " est à implémenter !";
               
            }
        }
        request.setAttribute("nbTuples",this.gestionnaireUtilisateurs.getNbTuples());
        RequestDispatcher dp = request.getRequestDispatcher(forwardTo + "&message=" + message);
        dp.forward(request, response);
        // Après un forward, plus rien ne peut être exécuté après !
    }
    
    

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
