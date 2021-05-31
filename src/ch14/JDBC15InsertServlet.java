package ch14;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ch14.bean.Employee;

/**
 * Servlet implementation class JDBC15InsertServlet
 */
@WebServlet("/JDBC15InsertServlet")
public class JDBC15InsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public JDBC15InsertServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String path = "/ch14/jdbc15.jsp";
		request.getRequestDispatcher(path).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
//		int eid = Integer.parseInt(request.getParameter("eid"));
		String lastName = request.getParameter("lastName");
		String firstName = request.getParameter("firstName");
		String notes = request.getParameter("notes");
		Date date = Date.valueOf(request.getParameter("date"));

		Employee emp = new Employee();
//		emp.setId(eid);
		emp.setFirstName(firstName);
		emp.setLastName(lastName);
		emp.setNotes(notes);
		emp.setDate(date);

		execute(emp);
		
		doGet(request, response);
	}

	private void execute(Employee emp) {
		String sql = "Insert Into Employees " + 
					 "(LastName, FirstName, BirthDate, Notes) " + 
					 "Value " + "(?, ?, ?, ?) ";

		String url = "jdbc:mysql://3.36.92.67/test";
		String user = "root";
		String password = "wnddkdwjdqhcjfl1";

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			// 클래스 로딩
			Class.forName("com.mysql.cj.jdbc.Driver");
			// 연결
			con = DriverManager.getConnection(url, user, password);

			// Prepared Statement 생성
			pstmt = con.prepareStatement(sql);

			// ? (파라미터)에 값 할당
			pstmt.setString(1, emp.getLastName());
			pstmt.setString(2, emp.getFirstName());
			pstmt.setDate(3, emp.getDate());
			pstmt.setString(4, emp.getNotes());
			
			// Query 실행, 결과 리턴
			int cnt = pstmt.executeUpdate();
			if (cnt == 1) {
				System.out.println("Employee 입력 성공");
			} else {
				System.out.println("입력 실패");
			}
			// 결과 탐색
//			while (rs.next()) {
//				Customer customer = new Customer();
//				customer.setId(rs.getInt(1));
//				customer.setName(rs.getString(2));
//				customer.setCity(rs.getString(3));
//				
//				list.add(customer);
//			}

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

			if (pstmt != null) {
				try {
					pstmt.close();
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

	}
}
