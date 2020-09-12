package controller;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;
import database.Connessione;
import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.JSONObject;

@WebServlet("/richiestaInserimentoEntrate")
public class RichiestaInserimentoEntrate extends HttpServlet {
  private Connessione connessione = null;
  private Connection con = null;
  private String insertDate =
    "insert into entrate (tipo_entrata,data,valore) values (?,?,?);";
  private static final long serialVersionUID = 1L;

  protected void doPost(
    HttpServletRequest request,
    HttpServletResponse response
  )
    throws ServletException, IOException {
    String tipoentrata = request.getParameter("tipoentrata");
    String data = request.getParameter("data");
    Float valoreentrata = Float.parseFloat(request.getParameter("valoreentrata"));

    connessione = new Connessione();

    con = connessione.getConnessione();
    PreparedStatement insertImpegno = null;

    JSONObject jsonIm = new JSONObject();

    try {
      insertImpegno = (PreparedStatement) con.prepareStatement(insertDate);
      insertImpegno.setString(1, tipoentrata);
      insertImpegno.setString(2, data);
      insertImpegno.setFloat(3, valoreentrata);

      int result = insertImpegno.executeUpdate();

      System.out.println("Query update");

      if(result == 1)
    	  jsonIm.put("response", "success");
      else
    	  jsonIm.put("response", "error");

    } catch (SQLException e) {
      System.out.println("Errore query");
    }

    try {
      insertImpegno.close();
    } catch (SQLException e) {
      System.out.println("Errore chiusura query");
    }

    response.setContentType("application/json");
    response.setCharacterEncoding("UTF-8");
    response.getWriter().write(jsonIm.toString());
  }
}
