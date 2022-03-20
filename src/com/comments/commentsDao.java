package com.comments;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class commentsDao {
    String sql="insert into ensiastement.comments(owner_com,body,date_pub_com,id_formulaire,`table`)"+" values (?, ?, ?, ?, ?)";
    String password="Maroc@tinjdad123";
    String user="root";
    String url="jdbc:mysql://localhost:3306/ensiastement";
    public Boolean postComment(String owner_com,String body, String date_pub_com,int id_formulaire,String table){
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection conn = DriverManager.getConnection(url,user,password);
            PreparedStatement statement=conn.prepareStatement(sql);
            System.out.println(sql);
            statement.setString(1,owner_com);
            statement.setString(2,body);
            statement.setString(3,date_pub_com);
            statement.setInt(4,id_formulaire);
            statement.setString(5,table);
            System.out.println(statement);
            statement.executeUpdate();
            return true;
        }catch (Exception e){
            e.printStackTrace();
        }
        return false;
    }
}
