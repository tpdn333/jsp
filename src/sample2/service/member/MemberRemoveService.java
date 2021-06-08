package sample2.service.member;

import java.sql.Connection;

import sample2.dao.BoardDAO;
import sample2.dao.MemberDAO;
import sample2.util.DBConnection;

public class MemberRemoveService {
	private BoardDAO bdao = null;
	private MemberDAO mdao = null;

	public MemberRemoveService() {
		this.bdao = new BoardDAO();
		this.mdao = new MemberDAO();
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
