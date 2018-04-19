package web;

import java.io.IOException;
import java.sql.*;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import javax.swing.ImageIcon;
import javax.swing.JOptionPane;

@WebServlet (urlPatterns ="/test")

public class test extends HttpServlet {

@Override
public void doGet( HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
	
	/* Transmission de la paire d'objets request/response à notre JSP */
	this.getServletContext().getRequestDispatcher( "/WEB-INF/test.jsp" ).forward( request, response );
	}


@Override
public void doPost( HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
	

		
		this.getServletContext().getRequestDispatcher( "/WEB-INF/test.jsp" ).forward( request, response );
	}
}