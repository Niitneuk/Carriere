<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="Styles/search.css" />
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
</head>
<body>
	<form method="post" action='search'>
		<fieldset>
			<legend>Recherche d'un salarié </legend>
			<br>
			<label class="text">Nom :</label><input type="text" name="nomtiers" autofocus >
			<br>
			<label class="text">Prénom :</label><input type="text" name="prenomtiers">
			<br>
			<label class="text">N.I.R. :</label><input type="text" name="nirtiers">
			<br>
			<label class="text">Numéro de tiers :</label><input type="number" name="numtiers">
			<br><br>
			<input type="radio" name="choixreq" value="contient" />
			<label for="choixreq">CONTIENT</label> 
			<input type="radio" name="choixreq" value="apartir"/>
			<label for="choixreq">A PARTIR DE</label><br>	
			<p>
			<% 	
				String vide = (String) request.getAttribute("none");
				String notfound = (String) request.getAttribute("notfound");
				String noradio = (String) request.getAttribute("noradio");
				if(vide == "oui"){
					out.println("Veuillez remplir au moins un champ");
				}	
				if(notfound == "Aucun résultat"){
					out.println(notfound);
				}
				if(noradio == "oui"){
					out.println("Cocher un bouton");
				}
				
			%>
			</p>
			<input type='submit' value='Go !' name='submit' class='submit'/>
		</fieldset>
	</form>
</body>

</html>