package com.formulaire.formulaire_stage;

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
@WebServlet("/formulaire_stage")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 10,
        maxFileSize = 1024 * 1024 * 1000,
        maxRequestSize = 1024 * 1024 * 1000)
public class formulaire_stage extends HttpServlet {
    private static final long serialVersionUID = 1L;
    public formulaire_stage(){
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher( "formulaire_stage.jsp" ).forward( request, response );
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String entreprise_nom=request.getParameter("entreprise_nom");
        String texte_descriptif=request.getParameter("texte_descriptif");
        Part filePart = request.getPart("file");
        String mode=request.getParameter("mode");
        int duree_stage=Integer.parseInt(request.getParameter("duree_stage"));
        String date_debut=request.getParameter("date_debut");
        String technologie=request.getParameter("technologie");
        String ville=request.getParameter("ville");
        String reminiration=request.getParameter("reminiration");
        String niveau=request.getParameter("niveau");
        int note=Integer.parseInt(request.getParameter("note"));
        formulaire_stageDao f=new formulaire_stageDao();
        HttpSession session=request.getSession();
        String owner= (String) session.getAttribute("name");
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
        LocalDateTime now = LocalDateTime.now();
        String date_creation=dtf.format(now);
        String folderName = "upload";
        String uploadPath = request.getServletContext().getRealPath("") +File.separator+ folderName;
        File dir = new File(uploadPath);
        if (!dir.exists()) {
            dir.mkdirs();
        }
        String file = filePart.getSubmittedFileName();
        InputStream is = filePart.getInputStream();
        Files.copy(is, Paths.get(uploadPath + File.separator + file), StandardCopyOption.REPLACE_EXISTING);
        if(f.checkSt(entreprise_nom, texte_descriptif, file, mode, duree_stage, date_debut, technologie, ville, reminiration, niveau, note, owner, date_creation)){
            session.setAttribute("add","added successfully!!");
            request.getRequestDispatcher( "/accueil.jsp" ).forward( request, response );
    }
    else{
            session.setAttribute("err","Remplir le formulaire autre fois!");
            request.getRequestDispatcher( "/formulaire_stage.jsp" ).forward( request, response );
        }
    }
}