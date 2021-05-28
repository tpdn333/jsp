 package ch14;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class JDBC06Serlvet
 */
@WebServlet("/JDBC06Serlvet")
public class JDBC06Serlvet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public JDBC06Serlvet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<String> listCity = executeJDBC();
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print("<ul>");
		for(String city : listCity) {
			out.print("<li>");
			out.print(city);
			out.print("</li>");
			
		}
		out.print("</ul>");
	}
	
	private List<String> executeJDBC() {
		
		List<String> listCity = new ArrayList<>();
		String sql = "SELECT DISTINCT City FROM Customers ORDER BY City";
		
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
			while(rs.next()) {
				String city = rs.getString(1);
				listCity.add(city);
//				System.out.println(city);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// 연결 종료
			if(rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
			if(stmt != null) {
				try {
					stmt.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
			if(con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		
		return listCity;
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
