package sample;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class BoardDeleteServlet
 */
@WebServlet("/sample/delete")
public class BoardDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Delete doGet method 실행....");
		String index = request.getParameter("index");
		int i = Integer.parseInt(index);
		System.out.println(i);
		
		ServletContext application = request.getServletContext();
		List<Board> list = (List<Board>) application.getAttribute("board");
		
		Board board = list.remove(i);
		request.setAttribute("board", board);
		
		String path = "/WEB-INF/sample/boardList.jsp";
		request.getRequestDispatcher(path).forward(request, response);
//		response.sendRedirect(request.getContextPath() + "/sample/list");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
