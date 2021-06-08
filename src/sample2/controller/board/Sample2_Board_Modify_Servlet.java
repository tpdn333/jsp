package sample2.controller.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sample2.bean.BoardDTO;
import sample2.bean.Member;
import sample2.dao.BoardDAO;

/**
 * Servlet implementation class Sample2_Board_Modify_Servlet
 */
@WebServlet("/sample2/board/modify/*")
public class Sample2_Board_Modify_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Sample2_Board_Modify_Servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id = request.getParameter("boardId");
		String title = request.getParameter("title");
		String body = request.getParameter("body");
		
		BoardDAO dao = new BoardDAO();
		BoardDTO board = dao.get2(Integer.parseInt(id));
		
		Member member = (Member) request.getSession().getAttribute("userLogined");
		
		
		if (board.getMemberId().equals(member.getId())) {
			// 같은면 수정 
			BoardDTO newBoard = new BoardDTO();
			newBoard.setBoardId(Integer.parseInt(id));
			newBoard.setTitle(title);
			newBoard.setBody(body);
			
			boolean ok = dao.modify(newBoard);
			
			// 메세지 남기기
			if (ok) {
				request.getSession().setAttribute("message", "수정되었습니다.");
			} else {
				request.getSession().setAttribute("message", "수정시 오류 발생");
			}
			
		} else {
			// 메세지 남기기
			request.getSession().setAttribute("message", "작성자가 아닙니다.");
			
		}
		
		String path = request.getContextPath() + "/sample2/board/detail?boardId=" + id;
		response.sendRedirect(path);
	}

}
