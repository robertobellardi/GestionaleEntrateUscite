package controller;

import java.io.IOException;
import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;

import database.Connessione;

import java.sql.SQLException;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

@WebServlet("/richiestaConfrontoEntrateUsciteTot")
public class RichiestaConfrontoEntrateUsciteTot extends HttpServlet {
		
	private Connessione connessione=null;
	private Connection con=null;
	private ResultSet rsEntrate=null;
	private ResultSet rsUscite=null;
	private String queryDateUscite="select * from uscite";
	private String queryDateEntrate="select * from entrate";
	private static final long serialVersionUID = 1L;
 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		connessione = new Connessione();		
		con=connessione.getConnessione();		
		JSONObject jsonArray = new JSONObject();
		PreparedStatement selectEntrate = null;
		PreparedStatement selectUscite = null;
		
		if(con!=null) {
			try {
				selectEntrate=(PreparedStatement)con.prepareStatement(queryDateEntrate);
				selectUscite=(PreparedStatement)con.prepareStatement(queryDateUscite);
				rsEntrate=selectEntrate.executeQuery();
				rsUscite=selectUscite.executeQuery();
				int i=1;
				
				while(rsEntrate.next()) {
					JSONObject jsonIm = new JSONObject();
					jsonIm.put("id",rsEntrate.getString(1));
					jsonIm.put("data",rsEntrate.getString(3));
					jsonIm.put("valore",rsEntrate.getFloat(4));
					jsonArray.put("entrata"+i, jsonIm);
					i++;
				}
				
				i=1;
				while(rsUscite.next()) {
					JSONObject jsonIm = new JSONObject();
					jsonIm.put("id",rsUscite.getString(1));
					jsonIm.put("data",rsUscite.getString(3));
					jsonIm.put("prezzo",rsUscite.getFloat(4));
					jsonArray.put("uscita"+i, jsonIm);
					i++;
				}
			} catch (SQLException e) {
				System.out.println("Errore query select");
			}	
			try {
				con.close();
			} catch (SQLException e) {
				System.out.println("Errore chiusura query select");
			}
			response.setContentType("application/json");
		    response.setCharacterEncoding("UTF-8");
		    response.getWriter().write(jsonArray.toString());
		}		
	}
}
