package com.search;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class searchDao {
    String sql = "";
    String password = "Maroc@tinjdad123";
    String user = "root";
    String URL = "jdbc:mysql://localhost:3306/ensiastement";

    public ArrayList<ArrayList<String>> searchText(String search, String categorie) {
        categorie = "formulaire_" + categorie;
        if (categorie.equals("formulaire_stage")) {
            sql = "select * from " + categorie + " where entreprise_nom like '%" + search + "%' or texte_descriptif like'%" + search + "%' or technologie like '%" + search + "%'or ville like '%" + search + "%'";
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conn = DriverManager.getConnection(URL, user, password);
                PreparedStatement statement = conn.prepareStatement(sql);
                System.out.println(statement);
                ResultSet rs = statement.executeQuery();
                System.out.println("hi!!");
                ArrayList<ArrayList<String>> a = new ArrayList<ArrayList<String>>();
                while (rs.next()){
                    ArrayList<String> as=new ArrayList<String>();
                    as.add(rs.getString("entreprise_nom"));
                    as.add(rs.getString("technologie"));
                    as.add(rs.getString("texte_descriptif"));
                    as.add(rs.getString("owner"));
                    as.add(rs.getString("note"));
                    as.add(rs.getString("ville"));
                    as.add(rs.getString("date_creation"));
                    as.add(rs.getString("reminiration"));
                    as.add(rs.getString("idformulaire_stage"));
                    as.add(rs.getString("like"));
                    as.add(rs.getString("deslike"));
                    a.add(as);
                }
                return a;
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        else if (categorie.equals("formulaire_formation")) {
            sql = "select * from " + categorie + " where theme like '%" + search + "%' or texte_descriptif like'%" + search + "%' or gratuit like '%" + search + "%'or duree like '%" + search + "%' or owner like '%"+search+"%'";
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conn = DriverManager.getConnection(URL, user, password);
                PreparedStatement statement = conn.prepareStatement(sql);
                System.out.println(statement);
                ResultSet rs = statement.executeQuery();
                System.out.println("hi!!");
                ArrayList<ArrayList<String>> a = new ArrayList<ArrayList<String>>();
                while (rs.next()){
                    ArrayList<String> as=new ArrayList<String>();
                    as.add(rs.getString("theme"));
                    as.add(rs.getString("texte_descriptif"));
                    as.add(rs.getString("gratuit"));
                    as.add(rs.getString("owner"));
                    as.add(rs.getString("note"));
                    as.add(rs.getString("duree"));
                    as.add(rs.getString("date_pub"));
                    as.add(rs.getString("idformulaire_formation"));
                    as.add(rs.getString("like"));
                    as.add(rs.getString("deslike"));
                    a.add(as);
                }
                return a;
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        else if (categorie.equals("formulaire_restau")) {
            sql = "select * from " + categorie + " where nom_plan like '%" + search + "%' or texte_descriptif like'%" + search + "%' or lieu_restau like '%" + search + "%'or possibilité_etude like '%" +"%'or min_consommation like '%"+ search + "%' or owner like '%"+search+"%'";;
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conn = DriverManager.getConnection(URL, user, password);
                PreparedStatement statement = conn.prepareStatement(sql);
                System.out.println(statement);
                ResultSet rs = statement.executeQuery();
                System.out.println("hi!!");
                ArrayList<ArrayList<String>> a = new ArrayList<ArrayList<String>>();
                while (rs.next()){
                    ArrayList<String> as=new ArrayList<String>();
                    as.add(rs.getString("nom_plan"));
                    as.add(rs.getString("texte_descriptif"));
                    as.add(rs.getString("lieu_restau"));
                    as.add(rs.getString("owner"));
                    as.add(rs.getString("note"));
                    as.add(rs.getString("possibilité_etude"));
                    as.add(rs.getString("date_pub"));
                    as.add(rs.getString("idformulaire_restau"));
                    as.add(rs.getString("like"));
                    as.add(rs.getString("deslike"));
                    a.add(as);
                }
                return a;
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return new ArrayList<ArrayList<String>>(0);
    }
}
