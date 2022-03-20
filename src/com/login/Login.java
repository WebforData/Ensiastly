package com.login;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/Login")
    public class Login extends HttpServlet {
        private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher( "/Login.jsp" ).forward( request, response );
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        String email = request.getParameter("Email");
        String password = request.getParameter("Password");
       request.setAttribute("name", "");
        LoginDao dao=new LoginDao();
        if(dao.check(email,password).size()!=0){
            HttpSession session=request.getSession();
            session.setAttribute("email",email);
            session.setAttribute("name",dao.check(email,password).get(0));
            session.setAttribute("branche",dao.check(email,password).get(2));
            session.setAttribute("grade",dao.check(email,password).get(3));
            System.out.println(session.getAttribute("here"));
            if(session.getAttribute("here")==null){
                request.getRequestDispatcher("/accueil.jsp").forward(request,response);
            }
            else if(session.getAttribute("here").equals("restau")){
                request.getRequestDispatcher("/formulaire_Restau.jsp").forward(request,response);
            }
            else if(session.getAttribute("here").equals("profil")){
                request.getRequestDispatcher("profil.jsp").forward(request,response);
            }
            else if(session.getAttribute("here").equals("accueil")){
                request.getRequestDispatcher( "/accueil.jsp" ).forward( request, response );
            }
            else if(session.getAttribute("here").equals("formation")){
                request.getRequestDispatcher( "/formulaire_formation.jsp" ).forward( request, response );
            }else if(session.getAttribute("here").equals("stage")){
                request.getRequestDispatcher( "/formulaire_stage.jsp" ).forward( request, response );
            }else if(session.getAttribute("here").equals("accueil")){
                request.getRequestDispatcher( "/accueil.jsp" ).forward( request, response );
            }

        }
        else{
            request.setAttribute("errorMessage", "Failed to log in !!!");
            request.getRequestDispatcher( "/Login.jsp" ).forward( request, response );
        }
    }
}
