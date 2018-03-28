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
			
			ArrayList<Object> al = new ArrayList<Object>();
			al = web.resultat.yearsum(num, site);
			int compteur = 0;
			
			
			for(int i = 0; i< al.size() / 9; i++){
				out.println("<nav>");
					out.println("<span> Année : "+ al.get(compteur));
					Object annee = al.get(compteur);
					compteur++;
					out.println("<br><span> Nombre de jours payés : " + al.get(compteur));
					compteur++;
					out.println("<br><span> Indemnités bruts : "	+ al.get(compteur));
					compteur++;
					out.println(" € <span>Brut Abattu : "+ al.get(compteur) + " €");
					compteur++;
					out.println(" <span>Brut SS Total : " + al.get(compteur));
					compteur++;
					out.println(" € <span>Brut SS Plafonné : " + al.get(compteur) + " €");
					compteur++;
					out.println("<br><span>Base vieillesse : " + al.get(compteur) + " €");
					compteur++;
					out.println(" <span>Cotisation vieillesse : " + al.get(compteur) + " €");
					compteur++;
					out.println("<br><span>Net Payé : " + al.get(compteur) + " €");
					compteur++;
					out.println("<button class='hamburger'>&#9776;</button>");
					out.println("<button class='cross'>&#735;</button>");
					out.println("<div class='menu'>");
						out.println("<ul>");
							out.println("<li>");	
								ArrayList<Object> al2 = new ArrayList<Object>();
								al2 = web.resultat.yeardetails(num, site, annee);
								int compteur1 = 0;
								while(compteur1 < al2.size()){
																
										out.println("<span>" + al2.get(compteur1));
										compteur1++;
										out.println("<br><span> Nombre de jours payés : " + al2.get(compteur1));
										compteur1++;
										out.println("<br><span> Indemnités bruts : "	+ al2.get(compteur1));
										compteur1++;
										out.println(" € <span>Brut Abattu : "+ al2.get(compteur1) + " €");
										compteur1++;
										out.println(" <span>Brut SS Total : " + al2.get(compteur1));
										compteur1++;
										out.println(" € <span>Brut SS Plafonné : " + al2.get(compteur1) + " €");
										compteur1++;
										out.println("<br><span> Base vieillesse : " + al2.get(compteur1) + " €");
										compteur1++;
										out.println("<span>Cotisation vieillesse : " + al2.get(compteur1) + " €");
										compteur1++;
										out.println("<br><span> Net Payé : " + al2.get(compteur1) + " € <br>");
										compteur1++;
								}	
							out.println("</li>");	
						out.println("</ul>");
					out.println("</div>");
				out.println("</nav><br><br>");
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