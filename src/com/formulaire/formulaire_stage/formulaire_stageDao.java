package com.formulaire.formulaire_stage;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;



public class formulaire_stageDao {
    String sql="insert into ensiastement.formulaire_stage(entreprise_nom, texte_descriptif, file, mode, duree_stage, date_debut, technologie, ville, reminiration, niveau, note, owner, date_creation) values (?,?,?,?,?,?,?,?,?,?,?,?,?)";
    String password="Maroc@tinjdad123";
    String user="root";
    String URL="jdbc:mysql://localhost:3306/ensiastement";
    public boolean checkSt(String entreprise_nom,String texte_descriptif,String file,String mode,int duree_stage,String date_debut,String technologie,String ville,String reminiration,String niveau,int note,String owner,String date_creation){
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection(URL,user,password);
            PreparedStatement statement=conn.prepareStatement(sql);
            statement.setString(1,entreprise_nom);
            statement.setString(2,texte_descriptif);
            statement.setString(3,file);
            statement.setString(4,mode);
            statement.setInt(5,duree_stage);
            statement.setString(6,date_debut);
            statement.setString(7,technologie);
            statement.setString(8,ville);
            statement.setString(9,reminiration);
            statement.setString(10,niveau);
            statement.setInt(11,note);
            statement.setString(12,owner);
            statement.setString(13,date_creation);
            System.out.println(statement);
            statement.executeUpdate();
            return true;
        }catch (Exception e){
            e.printStackTrace();
        }
        return false;
    }
}
