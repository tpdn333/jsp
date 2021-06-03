package sample2.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import sample2.bean.Member;

public class MemberDAO {
	private String url;
	private String user;
	private String password;

	public MemberDAO() {
		this.url = "jdbc:mysql://3.36.92.67/test_database";
		this.user = "root";
		this.password = "wnddkdwjdqhcjfl1";

		// 클래스 로딩
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public boolean insert(Member member) {
		String sql = "INSERT INTO Member " + "(id, password, name, birth, gender, inserted) " + "VALUES "
				+ "(?, ?, ?, ?, ?, NOW()) ";

		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			// mysql 연결
			con = DriverManager.getConnection(url, user, password);
			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getPassword());
			pstmt.setString(3, member.getName());
			pstmt.setDate(4, member.getBirth());
			pstmt.setString(5, member.getGender());

			int cnt = pstmt.executeUpdate();
			if (cnt == 1) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (con != null) {
				try {
					con.close();
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
		}

		return false;
	}

	public List<Member> list() {
		List<Member> list = new ArrayList<Member>();

		String sql = "SELECT id, password, name, birth, gender, inserted FROM Member";

		try (Connection con = DriverManager.getConnection(url, user, password);
				Statement stmt = con.createStatement();
				ResultSet rs = stmt.executeQuery(sql);) {
			while (rs.next()) {
				Member member = new Member();
				member.setId(rs.getString(1));
				member.setPassword(rs.getString(2));
				member.setName(rs.getString(3));
				member.setBirth(rs.getDate(4));
				member.setGender(rs.getString(5));
				member.setInserted(rs.getTimestamp(6));

				list.add(member);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public Member getMember(String id) {
		String sql = "SELECT id, password, name, birth, gender, inserted " + "FROM Member " + "WHERE id = ? ";
		ResultSet rs = null;
		try (Connection con = DriverManager.getConnection(url, user, password);
				PreparedStatement pstmt = con.prepareStatement(sql);) {
			pstmt.setString(1, id);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				Member member = new Member();
				member.setId(rs.getString(1));
				member.setPassword(rs.getString(2));
				member.setName(rs.getString(3));
				member.setBirth(rs.getDate(4));
				member.setGender(rs.getString(5));
				member.setInserted(rs.getTimestamp(6));

				return member;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		return null;
	}

	public boolean update(Member member) {
		String sql = "UPDATE Member " + 
					 "SET password = ?, " + 
					 "    name = ?, " + 
					 "    birth = ?, " + 
					 "    gender = ? " +
					 "WHERE id = ? ";

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = DriverManager.getConnection(url, user, password);
			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, member.getPassword());
			pstmt.setString(2, member.getName());
			pstmt.setDate(3, member.getBirth());
			pstmt.setString(4, member.getGender());
			pstmt.setString(5, member.getId());

			int cnt = pstmt.executeUpdate();

			if (cnt > 0) {
				return true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}

		return false;
	}

	public void remove(String id) {
		String sql = "DELETE FROM Member WHERE id = ?";

		try (Connection con = DriverManager.getConnection(url, user, password);
				PreparedStatement pstmt = con.prepareStatement(sql);) {

			pstmt.setString(1, id);
			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	public boolean existsId(String id) {
		String sql = "SELECT id FROM Member WHERE id = ?";
		ResultSet rs = null;
		try(
			Connection con = DriverManager.getConnection(url, user, password);
			PreparedStatement pstmt = con.prepareStatement(sql);
			) {
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		return false;
	}
}
