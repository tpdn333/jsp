package sample2.controller.board;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sample2.bean.BoardDTO;
import sample2.dao.BoardDAO;

/**
 * Servlet implementation class Sample2_Board_List_Servlet
 */
@WebServlet("/sample2/board/list")
public class Sample2_Board_List_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Sample2_Board_List_Servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String pageStr = request.getParameter("page");
		int page = 1;
		if(pageStr != null) {
			page = Integer.parseInt(pageStr);
		}
		
		BoardDAO dao = new BoardDAO();
//		List<Board> boardList = dao.list();
//		List<BoardDTO> boardList = dao.list2();
//		List<BoardDTO> boardList = dao.list3();
		List<BoardDTO> boardList = dao.list4(page);
		int total = dao.countAll();
		
		request.setAttribute("boards", boardList);
		request.setAttribute("totalNum", total);
		
		String path = "/WEB-INF/sample2/board/list.jsp";
		request.getRequestDispatcher(path).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
