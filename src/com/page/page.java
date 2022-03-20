package com.page;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
@WebServlet("/page")
public class page extends HttpServlet {
    public page(){
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id=Integer.parseInt(request.getParameter("id"));
        HttpSession session=request.getSession();
        String table="";
        String idwho=request.getParameter("idwho");
        if(session.getAttribute("st")!=null)
             table=(String) session.getAttribute("st");
        else if(session.getAttribute("form")!=null)
             table=(String) session.getAttribute("form");
        else if(session.getAttribute("res")!=null)
             table=(String) session.getAttribute("res");
        else {
            table=idwho;
        }
        session.setAttribute("table",table);
        session.setAttribute("id_f",id);
        String sql = "select * from "+table+" where id"+table+" = "+id;
        String password = "Maroc@tinjdad123";
        String user = "root";
        String URL = "jdbc:mysql://localhost:3306/ensiastement";
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(URL, user, password);
            PreparedStatement statement = conn.prepareStatement(sql);
            System.out.println(statement);
            ResultSet rs = statement.executeQuery();
            if(rs.next()){
                ArrayList<String> as=new ArrayList<String>();
                if(table.equals("formulaire_stage")){
                    as.add(rs.getString("idformulaire_stage"));
                    as.add(rs.getString("entreprise_nom"));
                    as.add(rs.getString("texte_descriptif"));
                    as.add(rs.getString("file"));
                    as.add(rs.getString("mode"));
                    as.add(rs.getString("duree_stage"));
                    as.add(rs.getString("date_debut"));
                    as.add(rs.getString("technologie"));
                    as.add(rs.getString("ville"));
                    as.add(rs.getString("reminiration"));
                    as.add(rs.getString("niveau"));
                    as.add(rs.getString("note"));
                    as.add(rs.getString("owner"));
                    as.add(rs.getString("date_creation"));
                    as.add(rs.getString("like"));
                    as.add(rs.getString("deslike"));
                    System.out.println(as);
                    session.setAttribute("page",as);
                    request.getRequestDispatcher("/comments").forward(request,response);
                }
                else if(table.equals("formulaire_formation")){
                    as.add(rs.getString("idformulaire_formation"));
                    as.add(rs.getString("nom_plan"));
                    as.add(rs.getString("theme"));
                    as.add(rs.getString("texte_descriptif"));
                    as.add(rs.getString("website"));
                    as.add(rs.getString("file"));
                    as.add(rs.getString("duree"));
                    as.add(rs.getString("gratuit"));
                        as.add(rs.getString("note"));
                    as.add(rs.getString("owner"));
                    as.add(rs.getString("date_pub"));
                    as.add(rs.getString("like"));
                    as.add(rs.getString("deslike"));
                    as.add(rs.getString("qualite"));
                    as.add(rs.getString("aidFinancier"));
                    session.setAttribute("page",as);
                    System.out.println(as);
                    request.getRequestDispatcher("/comments").forward(request,response);

                }
                else if(table.equals("formulaire_restau")){
                    as.add(rs.getString("idformulaire_restau"));
                    as.add(rs.getString("nom_plan"));
                    as.add(rs.getString("texte_descriptif"));
                    as.add(rs.getString("lieu_restau"));
                    as.add(rs.getString("file"));
                    as.add(rs.getString("possibilité_etude"));
                    as.add(rs.getString("duree"));
                    as.add(rs.getString("min_consommation"));
                    as.add(rs.getString("transport"));
                    as.add(rs.getString("wifi_restau"));
                    as.add(rs.getString("prise_courant"));
                    as.add(rs.getString("note"));
                    as.add(rs.getString("date_pub"));
                    as.add(rs.getString("owner"));
                    as.add(rs.getString("like"));
                    as.add(rs.getString("deslike"));
                    session.setAttribute("page",as);
                    System.out.println(as);
                    request.getRequestDispatcher("/comments").forward(request,response);

                }

            }
        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
