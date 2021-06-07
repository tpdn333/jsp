package sample2.controller.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sample2.bean.BoardDTO;
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
		
		board.setTitle(title);
		board.setBody(body);
	
		boolean ok = dao.update2(board);
		
		String message = "";
		if (ok) {
			message = "변경 완료";
		} else {
			message = "변경 실패";
		}
		request.setAttribute("message", message);
		request.setAttribute("board", board);
		
		String path = request.getContextPath() + "/sample2/board/detail?boardId=" + id;
		response.sendRedirect(path);
	}

}
