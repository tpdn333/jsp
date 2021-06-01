package ch14.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import ch14.bean.Customer;

public class CustomersDAO {
	public Customer getCustomer(int id) {
		Customer cus = new Customer();
		String sql = "SELECT CustomerID, CustomerName, ContactName, Address, City, PostalCode, Country " + 
					 "FROM Customers " + 
					 "WHERE CustomerID = ? ";

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
			pstmt.setInt(1, id);
			
			// Query 실행, 결과 리턴
			rs = pstmt.executeQuery();
			if (rs.next()) {
				cus = new Customer();
				cus.setId(id);
				cus.setName(rs.getString(2));
				cus.setContactName(rs.getString(3));
				cus.setAddress(rs.getString(4));
				cus.setCity(rs.getString(5));
				cus.setPostalCode(rs.getString(6));
				cus.setCountry(rs.getString(7));
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
		return cus;
	}
	
	public void updateCustomer(Customer cus) {
		String sql = "UPDATE Customers " + 
				 	 "SET CustomerName = ?, " +
				 	 "	  ContactName = ?, " +
				 	 "	  Address = ?, " +
				 	 "	  City = ?, " +
				 	 "	  PostalCode = ?, " +
				 	 "	  Country = ? " +
				 	 "WHERE CustomerID = ? ";

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
			pstmt.setString(1, cus.getName());
			pstmt.setString(2, cus.getContactName());
			pstmt.setString(3, cus.getAddress());
			pstmt.setString(4, cus.getCity());
			pstmt.setString(5, cus.getPostalCode());
			pstmt.setString(6, cus.getCountry());
			pstmt.setInt(7, cus.getId());
			
			// Query 실행, 결과 리턴
			int cnt = pstmt.executeUpdate();
			if (cnt == 1) {
				System.out.println("Customer 수정 성공");
			} else {
				System.out.println("수정 실패");
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

	public void deleteCustomer(int id) {
		String sql = "DELETE FROM Customers WHERE CustomerID = ?";
		String url = "jdbc:mysql://3.36.92.67/test";
		String user = "root";
		String password = "wnddkdwjdqhcjfl1";
	
		Connection con = null;
		PreparedStatement pstmt = null;
	
		try {
			// 클래스 로딩
			Class.forName("com.mysql.cj.jdbc.Driver");
			// 연결
			con = DriverManager.getConnection(url, user, password);
	
			// Prepared Statement 생성
			pstmt = con.prepareStatement(sql);
	
			// ? (파라미터)에 값 할당
			pstmt.setInt(1, id);
			
			// Query 실행, 결과 리턴
			int cnt = pstmt.executeUpdate();
			if (cnt == 1) {
				System.out.println("Customer 삭제 성공");
			} else {
				System.out.println("삭제 실패");
			}
	
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// 연결 종료
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
