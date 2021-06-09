package sample2.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import sample2.bean.Comment;
import sample2.util.DBConnection;

public class CommentDAO {

	public void insert(Comment comment, Connection con) {
		String sql = "INSERT INTO Comment (memberId, boardId, comment) "
				+	 "VALUES (?, ?, ?) ";
		
		try(
			PreparedStatement pstmt =  con.prepareStatement(sql);
				) {
			pstmt.setString(1, comment.getMemberId());
			pstmt.setInt(2, comment.getBoardId());
			pstmt.setString(3, comment.getComment());
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public List<Comment> list(int boardId, Connection con) {
		List<Comment> commentList = new ArrayList<Comment>();
		ResultSet rs = null;
		String sql = "SELECT c.id commentId, "
				   + "       m.id memberId, "
				   + "		 m.name memberName, "
				   + "		 c.inserted inserted, "
				   + "		 c.comment comment, "
				   + "		 c.boardId boardId "
				   + "FROM Comment c JOIN Member m ON c.memberId = m.id "
				   + "WHERE c.boardId = ? "
				   + "ORDER BY commentId DESC ";
		
		try(
			PreparedStatement pstmt = con.prepareStatement(sql);
				) {
			
			pstmt.setInt(1, boardId);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Comment comment = new Comment();
				comment.setId(rs.getInt("commentId"));
				comment.setMemberId(rs.getString("memberId"));
				comment.setMemberName(rs.getString("memberName"));
				comment.setInserted(rs.getTimestamp("inserted"));
				comment.setComment(rs.getString("comment"));
				comment.setBoardId(rs.getInt("boardId"));
				
				commentList.add(comment);
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(rs);
		}
		return commentList;
	}

	public void modify(Comment comment, Connection con) {
		String sql = "UPDATE Comment "
				+ "   SET comment = ? "
				+ "   WHERE id = ?";
		try(
			PreparedStatement pstmt = con.prepareStatement(sql);
				) {
			
			pstmt.setString(1, comment.getComment());
			pstmt.setInt(2, comment.getId());
			
			pstmt.executeUpdate();
			
		} catch(Exception e) {
			e.printStackTrace();
		}
	}

	public void remove(int commentId, Connection con) {
		String sql = "DELETE FROM Comment WHERE id = ?";
		
		try(
			PreparedStatement pstmt = con.prepareStatement(sql);
				) {
			pstmt.setInt(1, commentId);
			pstmt.executeUpdate();
			
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
}
