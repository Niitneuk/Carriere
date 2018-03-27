package web;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet (urlPatterns="/research")
public class research extends HttpServlet {
	@Override
	public void doGet( HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{


		/* Transmission de la paire d'objets request/response à notre JSP */
		this.getServletContext().getRequestDispatcher( "/WEB-INF/research.jsp" ).forward( request, response );
		}


	@Override
	public void doPost( HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		String recupnom = request.getParameter("nomtiers");
		String recupprenom = request.getParameter("prenomtiers");
		String recupnum = request.getParameter("numtiers");
		String recupnir = request.getParameter("nirtiers");
		String recupsite = request.getParameter("sitetiers");
		
		request.setAttribute("nom", recupnom);
		request.setAttribute("prenom", recupprenom);
		request.setAttribute("num", recupnum);
		request.setAttribute("nir", recupnir);
		request.setAttribute("site", recupsite);
		
		
		/* Transmission de la paire d'objets request/response à notre JSP */
		this.getServletContext().getRequestDispatcher( "/WEB-INF/test.jsp" ).forward( request, response );
		}
	}

