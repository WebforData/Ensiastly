package com.formulaire.formulaire_Restau;

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

@WebServlet("/formulaire_Restau")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 10,
        maxFileSize = 1024 * 1024 * 1000,
        maxRequestSize = 1024 * 1024 * 1000)
public class formulaire_Restau extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("formulaire_Restau.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nom_plan=request.getParameter("nom_plan");
        String texte_descriptif=request.getParameter("texte_descriptif");
        String lieu_restau=request.getParameter("lieu_restau");
        Part filePart = request.getPart("file");
        String possibilite_etude=request.getParameter("possibilite_etude");
        System.out.println(possibilite_etude);
        int duree=Integer.parseInt(request.getParameter("duree"));
        float min_consommation=Float.parseFloat(request.getParameter("min_consommation"));
        String transport=request.getParameter("transport");
        String wifi_restau=request.getParameter("wifi_restau");
        String prise_courant=request.getParameter("prise_courant");
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
        if(f.checkRes(nom_plan,texte_descriptif,lieu_restau,file,possibilite_etude,duree,min_consommation,transport,wifi_restau,prise_courant,note,date_pub,owner)){
            session.setAttribute("add","added successfully!!");
            request.getRequestDispatcher("accueil.jsp").forward(request,response);
        }
        else{
            session.setAttribute("err","Remplir le formulaire autre fois!");
            request.getRequestDispatcher( "/formulaire_Restau.jsp" ).forward( request, response );
        }
    }
}
