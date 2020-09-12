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

@WebServlet("/richiestaCalcolaGraficoUscite")
public class CalcolaGraficoUscite extends HttpServlet {
		
	private Connessione connessione=null;
	private Connection con=null;
	private ResultSet rs=null;
	private String queryDate="select * from uscite";
	private static final long serialVersionUID = 1L;
 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		connessione = new Connessione();		
		con=connessione.getConnessione();		
		JSONObject jsonArray = new JSONObject();
		PreparedStatement selectImpegni = null;
		
		if(con!=null) {
			try {
				selectImpegni=(PreparedStatement)con.prepareStatement(queryDate);
				rs=selectImpegni.executeQuery();
				int i=1;
				while(rs.next()) {
					JSONObject jsonIm = new JSONObject();
					jsonIm.put("id",rs.getString(1));
					jsonIm.put("spesa",rs.getString(2));
					jsonIm.put("data",rs.getString(3));
					jsonIm.put("prezzo",rs.getFloat(4));
					jsonArray.put("uscite"+i, jsonIm);
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