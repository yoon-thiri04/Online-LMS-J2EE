package controller;

import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Paths;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/egFileController")

@MultipartConfig(maxFileSize = 52428800)
public class egFileController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public egFileController() {
        super();
        
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 Part filePart = request.getPart("file");
	        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();

	        // Extract file extension
	        String fileExtension = "";
	        int dotIndex = fileName.lastIndexOf('.');
	        if (dotIndex > 0) {
	            fileExtension = fileName.substring(dotIndex + 1);
	        }

	        // Do whatever you need with the file extension
	        System.out.println("File Extension: " + fileExtension);

	        
	        
	        
	    }
	}


