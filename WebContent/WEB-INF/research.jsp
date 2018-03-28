<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="Styles/research.css" />
</head>
<body>
	<%
		String nom = (String) request.getAttribute("nom");
		String prenom = (String) request.getAttribute("prenom");
		String nir = (String) request.getAttribute("nir");
		String num = (String) request.getAttribute("num");
		String typereq = (String) request.getAttribute("typereq");
		ArrayList<Object> al = new ArrayList<Object>();
		int compteur = 0;
		
		al = web.resultat.find(nom, prenom, nir, num, typereq);
		
	
		for (int j = 0; j < (al.size() / 5 ); j++)
		{
			out.println("<form method='post' action='research'>");
				out.println("<fieldset>");
						out.println("<label>");
						out.println("Nom : ");
						out.println("</label>");
						out.println("<input type='text' name='nomtiers' value='" + al.get(compteur) + "' readonly />");
						compteur++;
						out.println("<label>");
						out.println("Prénom : ");
						out.println("</label>");
						out.println("<input type='text' name='prenomtiers' value='" + al.get(compteur) + "' readonly />");
						compteur++;
						out.println("<label>");
						out.println("Numéro de tiers : ");
						out.println("</label>");
						out.println("<input type='text' name='numtiers' value='" + al.get(compteur) + "' readonly />");
						compteur++;
						out.println("<label>");
						out.println("NIR : ");
						out.println("</label>");
						out.println("<input type='text' name='nirtiers' value='" + al.get(compteur) + "' readonly />");
						compteur++;
						out.println("<label>");
						out.println("Site : ");
						out.println("</label>");
						out.println("<input type='text' name='sitetiers' value='" + al.get(compteur) + "' readonly />");
						compteur++;
						out.println("<input type='submit' value='>' name='submit' class='submit'/>");
				out.println("</fieldset>");
			out.println("</form>");	
		};
		
		if(compteur == 0){
			request.setAttribute("notfound", "Aucun résultat");
			this.getServletContext().getRequestDispatcher( "/WEB-INF/search.jsp" ).forward( request, response );
		}

	%>
</body>
</html>