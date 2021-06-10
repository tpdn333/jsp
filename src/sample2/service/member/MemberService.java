package sample2.service.member;

import java.sql.Connection;

import sample2.bean.Member;
import sample2.dao.BoardDAO;
import sample2.dao.CommentDAO;
import sample2.dao.MemberDAO;
import sample2.util.DBConnection;

public class MemberService {
	private BoardDAO bdao = null;
	private MemberDAO mdao = null;
	private CommentDAO cdao = null;

	public MemberService() {
		this.bdao = new BoardDAO();
		this.mdao = new MemberDAO();
		this.cdao = new CommentDAO();
	}

	public Member getMember(String id) {
		Connection con = null;
		try {
			con = DBConnection.getConnection();
			Member member = this.mdao.getMember(id, con);
			int numBoard = this.bdao.getNumberOfBoard(id, con);
			int numComment = this.cdao.getNumberOfComment(id, con);

			member.setNumberOfBoard(numBoard);
			member.setNumberOfCommnet(numComment);

			return member;

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(con);
		}
		return null;
	}

	public void remove(String id) {
		Connection con = null;
		try {
			con = DBConnection.getConnection();
			con.setAutoCommit(false);

			this.bdao.removeByMember(id, con);
			this.mdao.remove(id, con);

			con.commit();
		} catch (Exception e) {
			e.printStackTrace();
			DBConnection.rollback(con);
		} finally {
			DBConnection.close(con);
		}
	}
}
