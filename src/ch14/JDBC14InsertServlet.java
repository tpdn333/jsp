package ch14;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
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

import ch14.bean.Customer;

/**
 * Servlet implementation class JDBC14Servlet
 */
@WebServlet("/JDBC14InsertServlet")
public class JDBC14InsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public JDBC14InsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path = "/ch14/jdbc14form.jsp";
		request.getRequestDispatcher(path).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		String contactName = request.getParameter("contactName");
		String address = request.getParameter("address");
		String city = request.getParameter("city");
		String potalCode = request.getParameter("postalCode");
		String country = request.getParameter("country");
				
		Customer customer = new Customer();
		customer.setName(name);
		customer.setContactName(contactName);
		customer.setAddress(address);
		customer.setCity(city);
		customer.setPostalCode(potalCode);
		customer.setCountry(country);
		
//		executeJDBC(name, contactName, address, city, potalCode, country);
		executeJDBC(customer);
		
		doGet(request, response);
	}
	
	private void executeJDBC(Customer customer) {

		List<Customer> list = new ArrayList<>(); // ????????? ??????
		
		String sql = "INSERT INTO Customers " + 
					 "(CustomerName, ContactName, Address, City, PostalCode, Country) " + 
					 "VALUE " +
					 "(?, ?, ?, ?, ?, ?)";
				

		String url = "jdbc:mysql://3.36.92.67/test";
		String user = "root";
		String password = "wnddkdwjdqhcjfl1";

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			// ????????? ??????
			Class.forName("com.mysql.cj.jdbc.Driver");
			// ??????
			con = DriverManager.getConnection(url, user, password);

			// Prepared Statement ??????
			pstmt = con.prepareStatement(sql);
			
			// ? (????????????)??? ??? ??????
			pstmt.setString(1, customer.getName());
			pstmt.setString(2, customer.getContactName());
			pstmt.setString(3, customer.getAddress());
			pstmt.setString(4, customer.getCity());
			pstmt.setString(5, customer.getPostalCode());
			pstmt.setString(6, customer.getCountry());

			// Query ??????, ?????? ??????
			int cnt = pstmt.executeUpdate();
			if(cnt == 1 ) {
				System.out.println("Customer ?????? ??????");
			} else {
				System.out.println("?????? ??????");
			}
			// ?????? ??????
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
			// ?????? ??????
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
