package com.login;

import javax.servlet.http.HttpSession;
import java.sql.*;
import java.util.ArrayList;

public class LoginDao {
    String sql="Select * from ensiastement.ensiast where emailUm5=? and password=?";
    String password="Maroc@tinjdad123";
    String user="root";
    String url="jdbc:mysql://localhost:3306/ensiastement";
    public ArrayList<String> check(String email, String pass){
        ArrayList<String > a=new ArrayList<String>();
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection conn = DriverManager.getConnection(url,user,password);
            PreparedStatement statement=conn.prepareStatement(sql);
            statement.setString(1,email);
            statement.setString(2,pass);
            ResultSet rs=statement.executeQuery();
            if(rs.next()){
                a.add(rs.getString("name"));
                a.add(rs.getString("emailUm5"));
                a.add(rs.getString("branch"));
                a.add(rs.getString("grade"));
                return a;
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        a.clear();
        return a;
    }
}
