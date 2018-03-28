package web;

import java.sql.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Locale;

public class resultat {

	public static ArrayList<Object> find(String nom, String prenom, String nir, String num, String typereq){
		
		Connection conn = web.connexion.MySql();
		ArrayList<Object> al = new ArrayList<Object>();
		ResultSet result = null;
		Statement state;
		ArrayList<String> tableauCrit= new ArrayList<String>();
		String requete = "Select * from tiers where";


		if(typereq.equals("contient")) {
			if(nom != "") {
				tableauCrit.add( "nomtiers like '%" + nom + "%'");
			}
		
			if(prenom != "") {
				tableauCrit.add( "prenomtiers like '%" + prenom + "%'");
			}
		
			if(nir != "") {
				tableauCrit.add( "nircletiers like '%" + nir + "%'");
			}
		
			if(num != "") {
				tableauCrit.add( "numtiers like '%" + num + "%'");
			}
		
			for(int i = 0; i < tableauCrit.size(); i++) {
				if(i != 0) {
					requete += " and " + tableauCrit.get(i);
				}else {
					requete += " " + tableauCrit.get(i);
				}
			}
		}else{
			if(nom != "") {
				tableauCrit.add( "nomtiers like '" + nom + "%'");
			}
		
			if(prenom != "") {
				tableauCrit.add( "prenomtiers like '" + prenom + "%'");
			}
		
			if(nir != "") {
				tableauCrit.add( "nircletiers like '" + nir + "%'");
			}
		
			if(num != "") {
				tableauCrit.add( "numtiers like '" + num + "%'");
			}
		
			for(int i = 0; i < tableauCrit.size(); i++) {
				if(i != 0) {
					requete += " and " + tableauCrit.get(i);
				}else {
					requete += " " + tableauCrit.get(i);
				}
			}
		}
		
		requete += "order by nomtiers asc";
		
		try {
			state = conn.createStatement();
			result = state.executeQuery(requete);
			while(result.next()) {
				al.add(result.getString("nomtiers"));
				al.add(result.getString("prenomtiers"));
				al.add(result.getInt("numtiers"));
				al.add(result.getString("nircletiers"));
				al.add(result.getString("sitetiers"));			
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}
			
		return al;
	}
	
	public static ArrayList<Object> yearsum(String num, String site) {
		
		ArrayList<Object> al = new ArrayList<Object>();
		Connection conn = web.connexion.MySql();
		Statement state;
		
		String requete = "SELECT anneepaiement,SUM(nbjourpaiement) as nbjour,SUM(INDBRUTPAIEMENT) as indbrut,SUM(BRUTABATTUPAIEMENT) as brutabat,SUM(BRUTSSTOTPAIEMENT) as brutss , SUM(BRUTSSPLAFPAIEMENT) as brutssplaf,SUM(BASEVIEILLPAIEMENT) as basevieill, SUM(COTVIEILLPAIEMENT) as cotvieill, SUM(NETPAYEPAIEMENT)as netpaye FROM PAIEMENTS WHERE numtierspaiements =" + num + " and sitepaiement = " + site + " group by anneepaiement order by anneepaiement desc";
		
		try {
			state = conn.createStatement();
			ResultSet result = state.executeQuery(requete);
			while(result.next()) {
				al.add(result.getInt("anneepaiement"));
				al.add(result.getInt("nbjour"));
				al.add(result.getDouble("indbrut"));
				al.add(result.getDouble("brutabat"));
				al.add(result.getDouble("brutss"));
				al.add(result.getDouble("brutssplaf"));
				al.add(result.getDouble("basevieill"));
				al.add(result.getDouble("cotvieill"));
				al.add(result.getDouble("netpaye"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return al;
	}
	
	public static ArrayList<Object> yeardetails(String num, String site, Object annee) throws ParseException{
		
		ArrayList<Object> al = new ArrayList<Object>();
		Connection conn = web.connexion.MySql();
		Statement state;
		
		String requete = "SELECT datepaiement, nbjourpaiement as nbjour,INDBRUTPAIEMENT as indbrut,BRUTABATTUPAIEMENT as brutabat,BRUTSSTOTPAIEMENT as brutss , BRUTSSPLAFPAIEMENT as brutssplaf, BASEVIEILLPAIEMENT as basevieill, COTVIEILLPAIEMENT as cotvieill, NETPAYEPAIEMENT as netpaye FROM PAIEMENTS WHERE numtierspaiements =" + num + " and sitepaiement = " + site + " and anneepaiement = '" + annee +"' order by datepaiement asc";
		
		try {
			state = conn.createStatement();
			ResultSet result = state.executeQuery(requete);
			while(result.next()) {
				String date =  result.getString("datepaiement");
				java.util.Date tradeDate = new SimpleDateFormat("yyyyMMdd", Locale.ENGLISH).parse(date);
		        String krwtrDate = new SimpleDateFormat("dd-MM-yyyy", Locale.ENGLISH).format(tradeDate);
		        al.add(krwtrDate);
		        al.add(result.getInt("nbjour"));
				al.add(result.getDouble("indbrut"));
				al.add(result.getDouble("brutabat"));
				al.add(result.getDouble("brutss"));
				al.add(result.getDouble("brutssplaf"));
				al.add(result.getDouble("basevieill"));
				al.add(result.getDouble("cotvieill"));
				al.add(result.getDouble("netpaye"));				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return al;
	}
}


