package sample2.service.comment;

import java.sql.Connection;
import java.util.List;

import sample2.bean.Comment;
import sample2.dao.CommentDAO;
import sample2.util.DBConnection;

public class CommentService {
	private static CommentDAO dao = null;
	
	static {
		
		dao = new CommentDAO();
	}

	public void add(Comment comment) {
		Connection con = DBConnection.getConnection();
		dao.insert(comment, con);
		DBConnection.close(con);
	}

	public List<Comment> list(int boardId) {
		Connection con = DBConnection.getConnection();
		List<Comment> commentList = dao.list(boardId, con);
		DBConnection.close(con);
		return commentList;
	}

	public void modify(Comment comment) {
		Connection con = DBConnection.getConnection();
		dao.modify(comment, con);
		DBConnection.close(con);
	}

	public void remove(int commentId) {
		Connection con = DBConnection.getConnection();
		dao.remove(commentId, con);
		DBConnection.close(con);
	}

}
