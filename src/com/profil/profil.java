package com.profil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;

@WebServlet("/profil")
public class profil extends HttpServlet {
    public profil() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String sql = "Select * from ensiastement.formulaire_stage where owner=?";
        String sql1 = "Select * from ensiastement.formulaire_restau where owner=?";
        String sql2 = "Select * from ensiastement.formulaire_formation where owner=?";
        String password = "Maroc@tinjdad123";
        String user = "root";
        String url = "jdbc:mysql://localhost:3306/ensiastement";
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            ArrayList<ArrayList<String>> arr = new ArrayList<ArrayList<String>>();
            ArrayList<ArrayList<String>> arr1 = new ArrayList<ArrayList<String>>();
            ArrayList<ArrayList<String>> arr2 = new ArrayList<ArrayList<String>>();
            Connection conn = DriverManager.getConnection(url, user, password);
            Connection conn1 = DriverManager.getConnection(url, user, password);
            Connection conn2 = DriverManager.getConnection(url, user, password);
            PreparedStatement statement = conn.prepareStatement(sql);
            PreparedStatement statement1 = conn1.prepareStatement(sql1);
            PreparedStatement statement2 = conn2.prepareStatement(sql2);
            HttpSession session = request.getSession();
            statement.setString(1, (String) session.getAttribute("name"));
            statement1.setString(1, (String) session.getAttribute("name"));
            System.out.println(statement1);
            statement2.setString(1, (String) session.getAttribute("name"));
            System.out.println(statement2);
            ResultSet rs = statement.executeQuery();
            ResultSet rs1 = statement1.executeQuery();
            ResultSet rs2 = statement2.executeQuery();
            int sum = 0;
            while (rs.next()) {
                ++sum;
                ArrayList<String> a = new ArrayList<String>();
                a.add(rs.getString("entreprise_nom"));
                a.add(rs.getString("reminiration"));
                a.add(rs.getString("duree_stage"));
                a.add(rs.getString("date_creation"));
                a.add(rs.getString("idformulaire_stage"));
                arr.add(a);
            }
            while (rs1.next()) {
                ++sum;
                ArrayList<String> a = new ArrayList<String>();
                a.add(rs1.getString("lieu_restau"));
                a.add(rs1.getString("min_consommation"));
                a.add(rs1.getString("wifi_restau"));
                a.add(rs1.getString("date_pub"));
                a.add(rs1.getString("idformulaire_restau"));
                arr1.add(a);

            }
            while (rs2.next()) {
                ++sum;
                ArrayList<String> a = new ArrayList<String>();
                a.add(rs2.getString("theme"));
                a.add(rs2.getString("duree"));
                a.add(rs2.getString("gratuit"));
                a.add(rs2.getString("date_pub"));
                a.add(rs2.getString("idformulaire_formation"));
                arr2.add(a);
                System.out.println(arr2.toString());
            }
            session.setAttribute("arr", arr);
            session.setAttribute("arr1", arr1);
            session.setAttribute("arr2", arr2);
            session.setAttribute("sum", sum);
        } catch (Exception e) {
            e.printStackTrace();
        }
        request.getRequestDispatcher("profil.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String pass = request.getParameter("pass");
        String password = "Maroc@tinjdad123";
        String user = "root";
        String url = "jdbc:mysql://localhost:3306/ensiastement";
        HttpSession session = request.getSession();
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String email=(String) session.getAttribute("email");
            System.out.println(email);
            if(pass==null){
                request.getRequestDispatcher("profil.jsp").forward(request,response);
            }
            String sql = "UPDATE ensiast SET password = '"+pass+"' WHERE emailUm5 = '"+email+"'";
            Connection conn = DriverManager.getConnection(url, user, password);
            PreparedStatement statement = conn.prepareStatement(sql);
            System.out.println(statement);
            statement.executeUpdate(sql);
        } catch (Exception e) {
            e.printStackTrace();
        }
        session.setAttribute("pass","Password changed successfully!!");
        request.getRequestDispatcher("profil.jsp").forward(request,response);
    }
}
