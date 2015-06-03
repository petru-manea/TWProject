import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

/**
 * Created by user on 4/5/2015.
 */
@WebServlet("/createUser")
public class CreateUserServlet extends GenericServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        boolean ok = true;
        String failed = "";
        String userName = req.getParameter("email");
        System.out.println("User: " + userName);
        if (userName.equals("") || userName.contains(Character.toString('@')) == false) {
            if(failed.equals(""))
                failed = "Email is invalid!";
            ok = false;
        }
        System.out.println("Aici nu intra");
        String password = req.getParameter("pass");
        String cpassword = req.getParameter("cpass");
        if (password.equals("") || password.equals(cpassword) == false) {
            if(failed.equals(""))
                failed = "Passwords do not match!";
            ok = false;
        }
        String twitter = req.getParameter("twitter");
        String facebook = req.getParameter("facebook");
        String gplus = req.getParameter("gplus");
        String fname = req.getParameter("fname");
        String lname = req.getParameter("lname");
        if ((fname.equals("") == false && fname.matches("[a-zA-Z]+") == false) || (lname.equals("")==false && lname.matches("[a-zA-Z]+") == false)) {
            if(failed.equals(""))
                failed = "Invalid name!";
            ok = false;
        }
        String phone = req.getParameter("phone");
        if (phone.equals("") == false && phone.matches("\\+?\\d+") == false) {
            if(failed.equals(""))
                failed = "Invalid phone!";
            ok = false;
        }
        String address = req.getParameter("address");
        //Integer userId = Integer.parseInt(req.getParameter("userId"));
        //System.out.println(userId);

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
            if(ok == true) {
                stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery("SELECT ID FROM USERS WHERE email = '" + userName + "'");
                System.out.println("Aici intra la select");
                if(rs.next()){
                    System.out.println("Aici intra");
                    HttpSession session = req.getSession();
                    session.setAttribute("isFailed", "Email already in use!");
                    resp.sendRedirect("register.jsp");
                    rs.close();
                    stmt.close();
                }
                else {
                    rs.close();
                    stmt.close();
                    System.out.println("Aici intra");
                    pstmt = conn.prepareStatement("INSERT INTO users (email, password, firstname, lastname, phone, address) VALUES (?,?,?,?,?,?)", new String[]{"ID"});
                    pstmt.setString(1, userName);
                    pstmt.setString(2, password);
                    pstmt.setString(3, fname);
                    pstmt.setString(4, lname);
                    pstmt.setString(5, phone);
                    pstmt.setString(6, address);
                    System.out.println("Aici intra la insert");
                    pstmt.executeUpdate();
                    int newId = 0;
                    ResultSet keys = pstmt.getGeneratedKeys();
                    if (keys.next()) {
                        newId = keys.getInt(1);
                        System.out.println(newId);
                    }
                    conn.commit();
                    pstmt.close();
                    //conn.close();
                    req.setAttribute("newId", newId);
                    getServletContext().getRequestDispatcher("/index.jsp").forward(req, resp);
                }
            }
            else{
                HttpSession session = req.getSession();
                session.setAttribute("isFailed", failed);
                resp.sendRedirect("register.jsp");
            }
        } catch (ClassNotFoundException e) {
            System.out.println(e);
            RequestDispatcher rd = getServletContext().getRequestDispatcher("/register.jsp");
            PrintWriter out = resp.getWriter();
            out.println("<font color=red>" + e + "</font>");
            rd.include(req, resp);
        } catch (SQLException e) {
            if (conn != null) {
                try {
                    conn.rollback();
                } catch (SQLException excep) {
                    System.out.println(excep);
                    RequestDispatcher rd = getServletContext().getRequestDispatcher("/register.jsp");
                    PrintWriter out = resp.getWriter();
                    out.println("<font color=red>" + excep + "</font>");
                    rd.include(req, resp);
                }
                System.out.println(e);
                RequestDispatcher rd = getServletContext().getRequestDispatcher("/register.jsp");
                PrintWriter out = resp.getWriter();
                out.println("<font color=red>" + e + "</font>");
                rd.include(req, resp);
            }
        } catch (Exception e) {
            System.out.println(e);
            RequestDispatcher rd = getServletContext().getRequestDispatcher("/register.jsp");
            PrintWriter out = resp.getWriter();
            out.println("<font color=red>" + e + "</font>");
            rd.include(req, resp);
        } finally {
            try {
                conn.setAutoCommit(true);
                conn.close();
            } catch (SQLException excep) {
                System.out.println(excep);
                RequestDispatcher rd = getServletContext().getRequestDispatcher("/register.jsp");
                PrintWriter out = resp.getWriter();
                out.println("<font color=red>" + excep + "</font>");
                rd.include(req, resp);
            }
        }
    }

    private String getString(HttpServletRequest request, String parameter, String defaultValue) {
        String newVal = defaultValue;
        if (request.getParameter(parameter) != null)
            newVal = request.getParameter(parameter);
        return newVal;
    }
}
