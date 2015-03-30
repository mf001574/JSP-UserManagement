/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utilisateurs.gestionnaires;

import java.util.Collection;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import utilisateurs.modeles.Utilisateur;

/**
 *
 * @author Florian Massa and Yoann Moise
 */

@Stateless
public class GestionnaireUtilisateurs {
    // Ici injection de code : on n'initialise pas. L'entity manager sera créé
    // à partir du contenu de persistence.xml
    @PersistenceContext
    private EntityManager em;
    static String[] prenomsTest = {"John","Paul", "Yoann", "Florian", "David", "Yann","Yves","Patrick","Jean","Noel","Michel", "Elmahdi","Wissam","Harold","Kevin","Maxence","Maxime","Rémi", "Karim","Nicolas","Zalbiya","Fabrice"};
    static String[] nomsTest = {"Marchal","Martin","Delaplace","Korfed","Moise","Carbonini","Besson","Massa","Silima","Fighiera","Garbi","Garo","El Hadi","Chazara","Demetrio","Allegro","Arifa","Gauche","Ali Kari","Jauvat"};
    private int indiceDepart;
    private int indiceFin;
    private int nbTuples;
    
    public GestionnaireUtilisateurs(){
        this.indiceDepart = 0;
        this.indiceFin = 0;
        this.nbTuples = 0;
    }

    public int getIndiceDepart() {
        return indiceDepart;
    }

    public void setIndiceDepart(int indice) {
        this.indiceDepart = indice;
    }
     public int getIndiceFin() {
        return indiceFin;
    }

    public void setIndiceFin(int indice) {
        this.indiceFin = indice;
    }
    
    public void creerUtilisateursDeTest() {
        creeUtilisateur("John", "Lennon", "jlennon");
        creeUtilisateur("Paul", "Mac Cartney", "pmc");
        creeUtilisateur("Ringo", "Starr", "rstarr");
        creeUtilisateur("Georges", "Harisson", "georgesH");
    }
    
    public void creer100UtilisateursDeTest(){
        for(int i = 1 ; i<=100;i++){
            int indice1 = (int)(Math.random()*(nomsTest.length-1));
            int indice2 = (int)(Math.random()*(prenomsTest.length-1));
            creeUtilisateur(nomsTest[indice1],prenomsTest[indice2],"user"+this.nbTuples);
        }
    }

    public Utilisateur creeUtilisateur(String nom, String prenom, String login) {
        Utilisateur u = new Utilisateur(login,prenom,nom);
        em.persist(u);
        this.nbTuples++;
        return u;
    }
    
    public void supprimerUtilisateur(String login){
        Query q = em.createQuery("delete from Utilisateur u where u.login='"+login+"'");
        int nbsup = q.executeUpdate();
        this.nbTuples -= nbsup;
        System.out.println("Requête SQL : delete from Utilisateur u where u.login='"+login+"'");
        System.out.println("Nb de tuples supprimés : "+nbsup);
    
    }
    public Collection<Utilisateur> getUtilisateursWithLogin(String login){
        Query q = em.createQuery("select u from Utilisateur u where u.login = '"+login+"'");
        return q.getResultList();
    }
    public Collection<Utilisateur> getAllUsers() {
        // Exécution d'une requête équivalente à un select *
        Query q = em.createQuery("select u from Utilisateur u order by u.id");
        q.setFirstResult(this.indiceDepart);
        q.setMaxResults(10);
        return q.getResultList();
    }
    // Add business logic below. (Right-click in editor and choose
    // "Insert Code > Add Business Method")

    public void majUtilisateur(String login, String nom, String prenom) {
       Query q = em.createQuery("update Utilisateur u "
               + "set u.lastname = '"+prenom+"', "
               + "u.firstname = '"+nom+"' "
               + "where u.login='"+login+"'");
       int nbmod = q.executeUpdate();
       System.out.println("update Utilisateur u "
               + "set u.lastname = '"+nom+"', "
               + "u.firstname = '"+prenom+"' "
               + "where u.login='"+login+"'");
       System.out.println("Nb de tuples modifiés : "+ nbmod);
    }
    public void avancer(){
        if(this.indiceFin < this.nbTuples){
            this.indiceDepart = this.indiceFin;
            this.indiceFin+= 10;
        }
    }
    public void reculer(){
        if(this.indiceDepart<=0){
            this.indiceDepart=0;
            this.indiceFin = 10;
        }else{
            this.indiceFin = this.indiceDepart;
            this.indiceDepart-= 10;  
        }
   
    }
    public int getNbTuples(){
        return this.nbTuples;
    }
}