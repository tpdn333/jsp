package sample;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class BoardWriterServlet
 */
@WebServlet("/sample/writer")
public class BoardWriterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public BoardWriterServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("Board Writer doGet...");

		// forward할 수 있게 해주는 관용표현
		String path = "/WEB-INF/sample/boardForm.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ServletContext application = request.getServletContext();
		List<Board> list = (List<Board>) application.getAttribute("board");

		// 1. 요청 정보 분석
		String title = request.getParameter("title");
		String body = request.getParameter("body");
		String writer = request.getParameter("writer");
		
		// 2. 비지니스 로직 실행
		Date time = new Date();
		Board board = new Board();
		board.setTitle(title);
		board.setBody(body);
		board.setWriter(writer);
		board.setTime(time);
		list.add(board);

		// 3. forward or redirect
		response.sendRedirect(request.getContextPath() + "/sample/list");
	}

}
