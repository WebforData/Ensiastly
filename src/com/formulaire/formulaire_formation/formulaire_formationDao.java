package com.formulaire.formulaire_formation;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class formulaire_formationDao {
    String sql="insert into ensiastement.formulaire_formation(nom_plan,theme,texte_descriptif,website,file,duree,gratuit,aidFinancier,note,owner,date_pub,qualite) values (?,?,?,?,?,?,?,?,?,?,?,?)";
    String password="Maroc@tinjdad123";
    String user="root";
    String URL="jdbc:mysql://localhost:3306/ensiastement";
    public boolean checkFor(String nom_plan,String theme,String texte_descriptif,String website,String file,int duree,String gratuit,String aidFinancier,int note,String owner,String date_pub,String qualite){
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection(URL,user,password);
            PreparedStatement statement=conn.prepareStatement(sql);
            statement.setString(1,nom_plan);
            statement.setString(2,theme);
            statement.setString(3,texte_descriptif);
            statement.setString(4,website);
            statement.setString(5,file);
            statement.setInt(6,duree);
            statement.setString(7,gratuit);
            statement.setString(8,aidFinancier);
            statement.setInt(9,note);
            statement.setString(10,owner);
            statement.setString(11,date_pub);
            statement.setString(12,qualite);
            System.out.println(statement);
            statement.executeUpdate();
            return true;
        }catch (Exception e){
        e.printStackTrace();
    }
        return false;
    }
}
