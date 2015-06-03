import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.*;

/**
 * Created by Petru on 4/4/2015.
 */
@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("emailLog");
        String password = request.getParameter("passLog");
        if (checkLogin(username, password)) {
            System.out.println("A mers login");
            HttpSession session = request.getSession();
            session.setAttribute("isFailedLog", false);
            session.setAttribute("sessionUser", username);
            request.setAttribute("sessionUser", password);
            response.sendRedirect("home.jsp");
        } else {
            System.out.println("Nu a mers login");
            HttpSession session = request.getSession();
            session.setAttribute("isFailedLog", true);
            response.sendRedirect("home.jsp");
        }
    }

    private boolean checkLogin(String username, String password) {
        String JDBC_DRIVER = "oracle.jdbc.driver.OracleDriver";
        String serverName = "localhost";
        String serverPort = "1521";
        String sid = "XE";
        String DB_URL = "jdbc:oracle:thin:@" + serverName + ":" + serverPort + ":" + sid;
        String USER = "student";
        String PASS = "student";
        Connection conn = null;
        PreparedStatement pstmt = null;
        Statement stmt = null;

        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            System.out.println("Connecting to database...");
            conn = DriverManager.getConnection(DB_URL, USER, PASS);
            conn.setAutoCommit(false);
            System.out.println("Creating statement...");

            stmt = conn.createStatement();
            String sql = "SELECT * FROM users WHERE email='" + username + "' AND password='" + password + "'";
            ResultSet rs = stmt.executeQuery(sql);

            if (rs.next()) {
                int id = rs.getInt("id");
                String firstName = rs.getString("email");
                String lastName = rs.getString("password");

                System.out.print("ID: " + id);
                System.out.print(", First name: " + firstName);
                System.out.println(", Last name: " + lastName);
                return true;
            }
        } catch (ClassNotFoundException e) {
            System.out.println(e);
        } catch (SQLException e) {
            System.out.println(e);
        } catch (Exception e) {
            System.out.println(e);
        }
        return false;
    }
}
