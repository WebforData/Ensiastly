package com.like_deslike;

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
@WebServlet("/like")
public class like extends HttpServlet {
    public like(){
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int like=Integer.parseInt(request.getParameter("like"));
        HttpSession session=request.getSession();
        String sql="UPDATE formulaire_stage SET `like` = "+like+" WHERE `owner` = '"+session.getAttribute("name")+"'";
        String password="Maroc@tinjdad123";
        String user="root";
        String url="jdbc:mysql://localhost:3306/ensiastement";
            try{
                Class.forName("com.mysql.cj.jdbc.Driver");

                Connection conn = DriverManager.getConnection(url,user,password);
                PreparedStatement statement=conn.prepareStatement(sql);
                System.out.println(statement);
                statement.executeUpdate(sql);
                System.out.println("goo!");
                session.setAttribute("like",like);
                request.getRequestDispatcher("test.jsp").forward(request,response);
            }catch (Exception e){
                e.printStackTrace();
            }
    }
}
