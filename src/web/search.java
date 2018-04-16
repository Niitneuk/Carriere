package web;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;


@WebServlet (urlPatterns ="/search")

public class search extends HttpServlet {

@Override
public void doGet( HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		
	

	
	/* Transmission de la paire d'objets request/response à notre JSP */
	this.getServletContext().getRequestDispatcher( "/WEB-INF/search.jsp" ).forward( request, response );
	}


@Override
public void doPost( HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
	
	String recupnom = request.getParameter("nomtiers");
	String recupprenom = request.getParameter("prenomtiers");
	String recupnir = request.getParameter("nirtiers");
	String recupnum = request.getParameter("numtiers");
	String recupreq = request.getParameter("choixreq");
	
	boolean redirect = false;
	
	if(recupnom == "" && recupprenom == "" && recupnir == "" && recupnum == "") {
		request.setAttribute("none", "oui");
	}else if (recupreq == null){
		request.setAttribute("noradio", "oui");
	}
	else
	{
		request.setAttribute("nom", recupnom);
		request.setAttribute("prenom", recupprenom);
		request.setAttribute("nir", recupnir);
		request.setAttribute("num", recupnum);
		request.setAttribute("typereq", recupreq);
 
		redirect = true;
	}
	
	
	/* Transmission de la paire d'objets request/response à notre JSP */
	if(redirect == false) {
		this.getServletContext().getRequestDispatcher( "/WEB-INF/search.jsp" ).forward( request, response );
	}
	}
}
