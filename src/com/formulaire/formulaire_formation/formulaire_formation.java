package com.formulaire.formulaire_formation;

import com.formulaire.formulaire_Restau.formulaire_RestauDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@WebServlet("/formulaire_formation")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 10,
        maxFileSize = 1024 * 1024 * 1000,
        maxRequestSize = 1024 * 1024 * 1000)
public class formulaire_formation extends HttpServlet {
    public formulaire_formation(){
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("formulaire_formation.jsp").forward(request,response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       String nom_plan=request.getParameter("nom_plan");
       String theme=request.getParameter("theme");
       String texte_descriptif=request.getParameter("texte_descriptif");
       String website=request.getParameter("website");
       String qualite=request.getParameter("qualite");
       Part filePart = request.getPart("file");
       int duree=Integer.parseInt(request.getParameter("duree"));
       String gratuit=request.getParameter("gratuit");
       String aidFinancier=request.getParameter("aidFinancier");
       int note=Integer.parseInt(request.getParameter("note"));
        HttpSession session=request.getSession();
        String owner= (String) session.getAttribute("name");
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
        LocalDateTime now = LocalDateTime.now();
        String date_pub=dtf.format(now);
        formulaire_RestauDao f=new formulaire_RestauDao();
        String folderName = "upload";
        String uploadPath = request.getServletContext().getRealPath("") + folderName;
        File dir = new File(uploadPath);
        if (!dir.exists()) {
            dir.mkdirs();
        }
        String file = filePart.getSubmittedFileName();
        InputStream is = filePart.getInputStream();
        Files.copy(is, Paths.get(uploadPath + File.separator + file), StandardCopyOption.REPLACE_EXISTING);
        formulaire_formationDao fo=new formulaire_formationDao();
        if(fo.checkFor(nom_plan,theme,texte_descriptif,website,file,duree,gratuit,aidFinancier,note,owner,date_pub,qualite)){
            session.setAttribute("add","added successfully!!");
            request.getRequestDispatcher("accueil.jsp").forward(request,response);
        }
        else{
            request.getRequestDispatcher( "/formulaire_formation.jsp" ).forward( request, response );
        }
    }
}
