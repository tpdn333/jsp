package sample2.service.board;

import java.sql.Connection;

import sample2.bean.BoardDTO;
import sample2.dao.BoardDAO;
import sample2.dao.CommentDAO;
import sample2.dao.MemberDAO;
import sample2.util.DBConnection;

public class BoardService {
	private BoardDAO bdao = null;
	private MemberDAO mdao = null;
	private CommentDAO cdao = null;

	public BoardService() {
		this.bdao = new BoardDAO();
		this.mdao = new MemberDAO();
		this.cdao = new CommentDAO();
	}

	public BoardDTO get(int id) {
		Connection con = null;
		try {
			con = DBConnection.getConnection();
			con.setAutoCommit(false);
			
			this.bdao.doardViews(id, con);
			con.commit();
			
			BoardDTO board = this.bdao.get(id, con);
			
			return board;
		} catch (Exception e) {
			e.printStackTrace();
			DBConnection.rollback(con);
		} finally {
			DBConnection.close(con);
		}
		return null;
	}

//	public void get(int id) {
//		Connection con = null;
//		try {
//			con = DBConnection.getConnection();
//			con.setAutoCommit(false);
//			
//			this.bdao.doardViews(id, con);
//			this.bdao.get(id, con);
//			
//			con.commit();
//		} catch (Exception e) {
//			e.printStackTrace();
//			DBConnection.rollback(con);
//		} finally {
//			DBConnection.close(con);
//		}
//	}

}
