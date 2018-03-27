<%@page import="web.resultat" import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="Styles/style.css" />
		<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
		<title>Insert title here</title>
	</head>
	<body>
		<%
		
			String nom = (String) request.getAttribute("nom");
			String prenom = (String) request.getAttribute("prenom"); 
			String num = (String) request.getAttribute("num");
			String nir = (String) request.getAttribute("nir");
			String site = (String) request.getAttribute("site");
			out.println("<header>");
			out.println("Nom : " + nom + " Prénom : " + prenom + "<br>Numéro de tiers : " + num + "<br>N.I.R. : " + nir);
		
			out.println("</header>");
			ArrayList al = new ArrayList();
			al = web.resultat.yearsum(num, site);
			int compteur = 0;
			
			for(int i = 0; i< al.size() / 9; i++){
				out.println("<nav>");
					out.println("<span> Année : "+ al.get(compteur));
					compteur++;
					out.println("<br> Nombre de jours payés : " + al.get(compteur));
					compteur++;
					out.println("<br> Indemnités bruts : "	+ al.get(compteur));
					compteur++;
					out.println(" € Brut Abattu : "+ al.get(compteur) + " €");
					compteur++;
					out.println("<br> Brut SS Total : " + al.get(compteur));
					compteur++;
					out.println(" € Brut SS Plafonné : " + al.get(compteur) + " €");
					compteur++;
					out.println("Base vieillesse : " + al.get(compteur) + " €");
					compteur++;
					out.println("<br> Cotisation vieillesse : " + al.get(compteur) + " €");
					compteur++;
					out.println("Net Payé : " + al.get(compteur) + " € </span>");
					compteur++;
					out.println("<button class='hamburger'>&#9776;</button>");
					out.println("<button class='cross'>&#735;</button>");
					out.println("<div class='menu'>");
						out.println("<ul>");
							out.println("<li>Link One</li>");
						out.println("</ul>");
					out.println("</div>");
				out.println("</nav><br><br><br>");
			}
		%>
	</body>

	<script type="text/javascript">
		$( document ).ready(function() {

		$( ".cross" ).hide();
		$( ".menu" ).hide();
		$( ".hamburger" ).click(function() {
			$(this).parent().find(".menu").slideToggle( "slow", function() {
				$(this).parent().find( ".hamburger" ).hide();
				$(this).parent().find( ".cross" ).show();
			});
		});

		$( ".cross" ).click(function() {
			$(this).parent().find( ".menu" ).slideToggle( "slow", function() {
				$(this).parent().find( ".cross" ).hide();
				$(this).parent().find( ".hamburger" ).show();
		});
		});
		});
	</script>
</html>