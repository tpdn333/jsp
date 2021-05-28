package ch14;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ch14.bean.Customer;

/**
 * Servlet implementation class JDBC10Servlet
 */
@WebServlet("/JDBC10Servlet")
public class JDBC10Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public JDBC10Servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		Customer cus = executeJDBC(id);
		
		request.setAttribute("customer", cus);
		
		String path = "/ch14/jdbc10.jsp";
		request.getRequestDispatcher(path).forward(request, response);
	}

	private Customer executeJDBC(String id) {

		Customer cus = null; // 리턴할 객체
		
		String sql = "SELECT CustomerName, City FROM Customers " +
					 "WHERE CustomerID = " + id;

		String url = "jdbc:mysql://3.36.92.67/test";
		String user = "root";
		String password = "wnddkdwjdqhcjfl1";

		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;

		try {
			// 클래스 로딩
			Class.forName("com.mysql.cj.jdbc.Driver");
			// 연결
			con = DriverManager.getConnection(url, user, password);

			// Statement 생성
			stmt = con.createStatement();

			// Query 실행, 결과 리턴
			rs = stmt.executeQuery(sql);

			// 결과 탐색
			if (rs.next()) {
				String name = rs.getString(1);
				String city = rs.getString(2);
				
				cus = new Customer();
				cus.setName(name);
				cus.setCity(city);
				
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// 연결 종료
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}

			if (stmt != null) {
				try {
					stmt.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}

			if (con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}

		return cus;
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
