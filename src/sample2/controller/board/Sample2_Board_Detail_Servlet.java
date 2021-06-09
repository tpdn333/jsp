package sample2.controller.board;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sample2.bean.BoardDTO;
import sample2.bean.Comment;
import sample2.dao.BoardDAO;
import sample2.service.comment.CommentService;


/**
 * Servlet implementation class Sample2_Board_Detail_Servlet
 */
@WebServlet("/sample2/board/detail")
public class Sample2_Board_Detail_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static CommentService commentService = null;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Sample2_Board_Detail_Servlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    @Override
    public void init() throws ServletException {
    	// TODO Auto-generated method stub
    	super.init();
    	this.commentService = new CommentService();
    }
    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String boardId = request.getParameter("boardId");
		
		if(boardId == null) {
			String path = request.getContextPath() + "/sample2/board/detail";
			response.sendRedirect(path);
		} else {
			BoardDAO dao = new BoardDAO();
			BoardDTO board = dao.get2(Integer.parseInt(boardId));
			
			List<Comment> commentList = commentService.list(Integer.parseInt(boardId));
			request.setAttribute("boards", board);
			request.setAttribute("comments", commentList);
			
			String path = "/WEB-INF/sample2/board/detail.jsp";
			request.getRequestDispatcher(path).forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
