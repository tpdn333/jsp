package ch14.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import ch14.bean.Employee;

public class EmployeesDAO {
	public Employee getEmployee(int id) {
		Employee emp = new Employee();
		String sql = "SELECT LastName, FirstName, BirthDate, Notes " + 
					 "FROM Employees " + 
					 "WHERE EmployeeID = ? ";

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
				emp = new Employee();
				emp.setId(id);
				emp.setLastName(rs.getString(1));
				emp.setFirstName(rs.getString(2));
				emp.setDate(rs.getDate(3));
				emp.setNotes(rs.getString(4));
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
		return emp;
	}
	
	public void updateEmployee(Employee emp) {
		String sql = "UPDATE Employees " + 
				 	 "SET LastName = ?, " +
				 	 "	  FirstName = ?, " +
				 	 "	  BirthDate = ?, " +
				 	 "	  Notes = ? " +
				 	 "WHERE EmployeeID = ? ";

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
			pstmt.setInt(5, emp.getId());
			
			// Query 실행, 결과 리턴
			int cnt = pstmt.executeUpdate();
			if (cnt == 1) {
				System.out.println("Employee 수정 성공");
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
	
	public void deleteEmployeer(int id) {
		String sql = "DELETE FROM Employees WHERE EmployeeID = ?";
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
				System.out.println("Employee 삭제 성공");
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
