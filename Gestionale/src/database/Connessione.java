package database;

import java.sql.DriverManager;
import java.sql.SQLException;

import com.mysql.jdbc.Connection;

public class Connessione {

	private final String url="jdbc:mysql://localhost";
	private final int port=3306;
	private final String user="root";
	private final String password="";
	private final String database_name="entrate/uscite";
	private final String connessione=url+":"+port+"/"+database_name;
		
	private Connection con=null;
	
	public Connection getConnessione() {
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con=(Connection) DriverManager.getConnection(connessione,user,password);
			if(con!=null)
				System.out.println("Connesso");
			else
				System.out.println("non connesso");
		} catch (SQLException | ClassNotFoundException e) {
			System.out.println("Errore connesione database");
			e.printStackTrace();
		}		
		return con;
	}	
}
