package com.comments;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

@WebServlet("/comments")
public class comments extends HttpServlet {
    public comments(){
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session=request.getSession();
        String body=request.getParameter("body");
        if(body!=null){
            DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
            LocalDateTime now = LocalDateTime.now();
            String date_pub_com=dtf.format(now);
            String table=(String)session.getAttribute("table");
            int id_f=(int)session.getAttribute("id_f");
            String owner_com=(String) session.getAttribute("name");
            commentsDao cd=new commentsDao();
            if(cd.postComment(owner_com,body,date_pub_com,id_f,table)){
                System.out.println("inserted!!!");
            }

        }
        String table=(String)session.getAttribute("table");
        int id_f=(int)session.getAttribute("id_f");
        pagePrint p=new pagePrint();
        ArrayList<ArrayList<String>> pa=p.printP(id_f,table);
        if(pa.size()!=0){
            session.setAttribute("com",pa);
            request.getRequestDispatcher("page_"+table+".jsp").forward(request,response);
        }
        else
            request.getRequestDispatcher("page_"+table+".jsp").forward(request,response);

    }
}
