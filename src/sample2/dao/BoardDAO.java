package sample2.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import sample2.bean.Board;
import sample2.bean.BoardDTO;

public class BoardDAO {
	private String url;
	private String user;
	private String password;
	
	public BoardDAO() {
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

	public boolean insert(Board board) {
		String sql = "INSERT INTO Board " + 
					 "(title, body, memberId) " + 
					 "VALUES " + 
					 "(?, ?, ?) ";
		
		try (
				// mysql 연결
				Connection con = DriverManager.getConnection(url, user, password);
				PreparedStatement pstmt = con.prepareStatement(sql);
			){

			pstmt.setString(1, board.getTitle());
			pstmt.setString(2, board.getBody());
			pstmt.setString(3, board.getMemberId());

			int cnt = pstmt.executeUpdate();
			if (cnt == 1) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} 
//		finally {
//			if (con != null) {
//				try {
//					con.close();
//				} catch (SQLException e) {
//					// TODO Auto-generated catch block
//					e.printStackTrace();
//				}
//			}
//			if (pstmt != null) {
//				try {
//					pstmt.close();
//				} catch (SQLException e) {
//					// TODO Auto-generated catch block
//					e.printStackTrace();
//				}
//			}
//		}

		return false;
	}
	
	public List<BoardDTO> list2() {
		List<BoardDTO> list = new ArrayList<>();
		String sql = "SELECT b.id boardId, b.title title, m.name name, b.inserted " +
					 "FROM Board b JOIN Member m " + 
					 "ON b.memberId = m.id " + 
					 "ORDER BY boardId DESC ";
					
		try(
				Connection con = DriverManager.getConnection(url, user, password);
				Statement stmt = con.createStatement();
				ResultSet rs = stmt.executeQuery(sql);
				) {
			while(rs.next()) {
				BoardDTO board = new BoardDTO();
				board.setBoardId(rs.getInt(1));
				board.setTitle(rs.getString(2));
				board.setMemberName(rs.getString(3));
				board.setInserted(rs.getTimestamp(4));
				
				list.add(board);
			}
			
		} catch (Exception e){
			e.printStackTrace();
		}
		return list;
	}

	public List<Board> list() {
		List<Board> list = new ArrayList<Board>();
		String sql = "SELECT id, title, memberId, inserted " +
					 "FROM Board " + 
					 "ORDER BY id DESC ";
					
		try(
				Connection con = DriverManager.getConnection(url, user, password);
				Statement stmt = con.createStatement();
				ResultSet rs = stmt.executeQuery(sql);
				) {
			while(rs.next()) {
				Board board = new Board();
				board.setId(rs.getInt(1));
				board.setTitle(rs.getString(2));
				board.setMemberId(rs.getString(3));
				board.setInserted(rs.getTimestamp(4));
				
				list.add(board);
			}
			
		} catch (Exception e){
			e.printStackTrace();
		}
		return list;
	}

	public BoardDTO get2(int id) {
		String sql = "SELECT b.id boardId, b.title title, b.body body, m.name memberName, b.inserted "
					 + "FROM Board b JOIN Member m "
					 + "ON b.memberId = m.id "
					 + "WHERE b.id = ? ";
		ResultSet rs = null;
		try (
				Connection con = DriverManager.getConnection(url, user, password);
				PreparedStatement pstmt = con.prepareStatement(sql);
				){
			pstmt.setInt(1, id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				BoardDTO board = new BoardDTO();
				board.setBoardId(id);
				board.setTitle(rs.getString(2));
				board.setBody(rs.getString(3));
				board.setMemberName(rs.getString(4));
				board.setInserted(rs.getTimestamp(5));
				
				return board;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return null;
	}
	
	public Board get(int id) {
		String sql = "SELECT id, title, body, memberId, inserted " +
					 "FROM Board " +
					 "WHERE id = ? ";
		ResultSet rs = null;
		try (
				Connection con = DriverManager.getConnection(url, user, password);
				PreparedStatement pstmt = con.prepareStatement(sql);
				){
			pstmt.setInt(1, id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				Board board = new Board();
				board.setId(id);
				board.setTitle(rs.getString(2));
				board.setBody(rs.getString(3));
				board.setMemberId(rs.getString(4));
				board.setInserted(rs.getTimestamp(5));
				
				return board;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return null;
	}

	public boolean update(Board board) {
		String sql = "UPDATE Board " +
			 	 	 "SET title = ?, " +
			 	 	 "	  body = ? "+
			 	 	 "WHERE id = ? ";
		try (
				Connection con = DriverManager.getConnection(url, user, password);
				PreparedStatement pstmt = con.prepareStatement(sql);
				){
			pstmt.setString(1, board.getTitle());
			pstmt.setString(2, board.getBody());
			pstmt.setInt(3, board.getId());
			
			int cnt = pstmt.executeUpdate();
			
			if(cnt > 0) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return false;
	}
	
	public boolean update2(BoardDTO board) {
		String sql = "UPDATE Board " +
			 	 	 "SET title = ?, " +
			 	 	 "	  body = ? "+
			 	 	 "WHERE id = ? ";
		try (
				Connection con = DriverManager.getConnection(url, user, password);
				PreparedStatement pstmt = con.prepareStatement(sql);
				){
			pstmt.setString(1, board.getTitle());
			pstmt.setString(2, board.getBody());
			pstmt.setInt(3, board.getBoardId());
			
			int cnt = pstmt.executeUpdate();
			
			if(cnt > 0) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return false;
	}
	
}