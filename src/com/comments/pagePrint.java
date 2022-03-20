package com.comments;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class pagePrint {
    public ArrayList<ArrayList<String>> printP(int id_f, String table){
        String sql="select * from comments where id_formulaire = ? and `table` = ?";
        String password="Maroc@tinjdad123";
        String user="root";
        String url="jdbc:mysql://localhost:3306/ensiastement";
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection conn = DriverManager.getConnection(url, user, password);
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setInt(1,id_f);
            statement.setString(2,table);
            System.out.println(statement);
            ResultSet rs = statement.executeQuery();
            ArrayList<ArrayList<String>> a=new ArrayList<>();
            ArrayList<String > ad=new ArrayList<String>();
            while (rs.next()){
                ad.add(rs.getString("owner_com"));
                ad.add(rs.getString("body"));
                ad.add(rs.getString("date_pub_com"));
                a.add(ad);
            }
           return a;
        }catch (Exception e){
            e.printStackTrace();
        }
        return new ArrayList<ArrayList<String>>(0);
    }
}
