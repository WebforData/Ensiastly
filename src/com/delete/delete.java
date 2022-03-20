package com.delete;

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
@WebServlet("/delete")
public class delete extends HttpServlet {
    public delete(){
        super();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session=request.getSession();
        String id=request.getParameter("id");
        String idwho=request.getParameter("idwho");
        String sql="delete from ensiastement."+idwho+" where id"+idwho+" = "+id;
        String password="Maroc@tinjdad123";
        String user="root";
        String url="jdbc:mysql://localhost:3306/ensiastement";
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(url,user,password);
            PreparedStatement statement=conn.prepareStatement(sql);
            System.out.println(statement);
            statement.execute();
            conn.close();
            session.setAttribute("add","Deleted successfully!!");
            request.getRequestDispatcher("accueil.jsp").forward(request,response);
        }
    catch (Exception e){
            e.printStackTrace();
        }}
}
