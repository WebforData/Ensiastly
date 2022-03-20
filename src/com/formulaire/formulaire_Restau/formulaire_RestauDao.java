package com.formulaire.formulaire_Restau;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class formulaire_RestauDao {
    String sql="insert into ensiastement.formulaire_restau(nom_plan,texte_descriptif,lieu_restau,file,possibilité_etude,duree,min_consommation,transport,wifi_restau,prise_courant,note,date_pub,owner)"+" values (?,?,?,?,?,?,?,?,?,?,?,?,?)";
    String password="Maroc@tinjdad123";
    String user="root";
    String URL="jdbc:mysql://localhost:3306/ensiastement";
    public boolean checkRes(String nom_plan, String texte_descriptif,String lieu_restau,String file,String possibilite_etude, int duree,float min_consommation,String transport,String wifi_restau,String prise_courant,int note,String date_pub,String owner){
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection(URL,user,password);
            PreparedStatement statement=conn.prepareStatement(sql);
            statement.setString(1,nom_plan);
            statement.setString(2,texte_descriptif);
            statement.setString(3,lieu_restau);
            statement.setString(4,file);
            statement.setString(5,possibilite_etude);
            statement.setFloat(6,duree);
            statement.setFloat(7,min_consommation);
            statement.setString(8,transport);
            statement.setString(9,wifi_restau);
            statement.setString(10,prise_courant);
            statement.setInt(11,note);
            statement.setString(12,date_pub);
            statement.setString(13,owner);
            System.out.println(statement);
            statement.executeUpdate();
            return true;
    }catch (Exception e){
        e.printStackTrace();
    }
        return false;
    }
}
