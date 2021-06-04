package sample2.controller.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import sample2.bean.Board;
import sample2.bean.Member;
import sample2.dao.BoardDAO;

/**
 * Servlet implementation class Sample2_Board_Write_Servlet
 */
@WebServlet("/sample2/board/write")
public class Sample2_Board_Write_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Sample2_Board_Write_Servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path = "/WEB-INF/sample2/board/write.jsp";
		request.getRequestDispatcher(path).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Member member = (Member) session.getAttribute("userLogined");
		
		String title = request.getParameter("title");
		String body = request.getParameter("body");
		
		Board board = new Board();
		board.setTitle(title);
		board.setBody(body);
		board.setMemberId(member.getId());
		
		BoardDAO dao = new BoardDAO();
		boolean ok  = dao.insert(board);
		
		if(ok) {
			String path = request.getContextPath() + "/sample2/board/list";
			response.sendRedirect(path);
		} else {
			String path = "/WEB-INF/sample2/board/write.jsp";
			request.getRequestDispatcher(path).forward(request, response);
		}
		
	}

}
