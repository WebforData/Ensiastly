package com.registre;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class registreDao {
    String sql="insert into ensiastement.ensiast(name,emailUm5,password,branch,grade)"+" values (?, ?, ?, ?, ?)";
    String password="Maroc@tinjdad123";
    String user="root";
    String url="jdbc:mysql://localhost:3306/ensiastement";
    public Boolean checkRegister(String name,String email, String pass,String branche,int grade){
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection conn = DriverManager.getConnection(url,user,password);
            PreparedStatement statement=conn.prepareStatement(sql);
            System.out.println(sql);
            statement.setString(1,name);
            statement.setString(2,email);
            statement.setString(3,pass);
            statement.setString(4,branche);
            statement.setInt(5,grade);
            System.out.println(statement);
            statement.executeUpdate();
            return true;
        }catch (Exception e){
            e.printStackTrace();
        }
        return false;
    }
}
