package com.registre;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/registre")
public class registre extends HttpServlet {
    private static final long serialVersionUID = 1L;
    public registre(){
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher( "/Login.jsp" ).forward( request, response );
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name=request.getParameter("name");
        String email=request.getParameter("email");
        if(!email.contains("@um5.ac.ma"))
            request.getRequestDispatcher("Login.jsp").forward(request,response);
        String password=request.getParameter("password");
        String branche=request.getParameter("branche");
        String g=request.getParameter("grade");
        int grade=Integer.parseInt(g);
        registreDao re=new registreDao();
        request.setAttribute("errorMessage","");
        if(re.checkRegister(name,email,password,branche,grade)){
            HttpSession session=request.getSession();
            session.setAttribute("email",email);
            session.setAttribute("name",name);
            session.setAttribute("branche",branche);
            session.setAttribute("grade",grade);
            session.setAttribute("welcome","Welcome");
            request.getRequestDispatcher( "/accueil.jsp" ).forward( request, response );
        }
        else{
            request.setAttribute("errorMessage", "Erreur de registrement essayer une autre fois");
            request.getRequestDispatcher( "/Login.jsp" ).forward( request, response );
        }
    }
}