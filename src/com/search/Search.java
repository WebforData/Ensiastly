package com.search;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/Search")
public class Search extends HttpServlet {
    public Search(){
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("accueil.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String search=request.getParameter("search");
        HttpSession session=request.getSession();
        if(search==null || search.trim().equals("")){
            request.getRequestDispatcher("accueil.jsp");
        }
        search=search.trim().toLowerCase();
        String categorie=request.getParameter("categorie");
        session.setAttribute("categorie",categorie);
        session.setAttribute("search",search);
        if(categorie.equals("Category")){
            request.getRequestDispatcher("accueil.jsp").forward(request,response);
        }
        else {
            searchDao s=new searchDao();
            if(s.searchText(search,categorie).size()!=0){
                if(categorie.equals("stage")){
                    session.setAttribute("st","formulaire_stage");
                }
                else if(categorie.equals("formation")){
                    System.out.println("malk");
                    session.setAttribute("form","formulaire_formation");
                }
                else if(categorie.equals("restau")){
                    session.setAttribute("res","formulaire_restau");
                }
                session.setAttribute("result",s.searchText(search,categorie));
                request.getRequestDispatcher("result.jsp").forward(request,response);

            }
            else{
                if(categorie.equals("restau"))
                    categorie="restaurant/cafe";
                String error=search+" in "+categorie+" categorie";
                session.setAttribute("error",error);
                request.getRequestDispatcher("accueil.jsp").forward(request,response);
            }
        }


    }
}
