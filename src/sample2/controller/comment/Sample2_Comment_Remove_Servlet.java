package sample2.controller.comment;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sample2.service.comment.CommentService;

/**
 * Servlet implementation class Sample2_Comment_Remove_Servlet
 */
@WebServlet("/sample2/comment/remove")
public class Sample2_Comment_Remove_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private CommentService service;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Sample2_Comment_Remove_Servlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    @Override
    public void init() throws ServletException {
    	super.init();
    	this.service = new CommentService();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String commentId = request.getParameter("commentId");
		String boardId = request.getParameter("boardId");
		
		service.remove(Integer.parseInt(commentId));
		
		response.sendRedirect(request.getContextPath() + "/sample2/board/detail?boardId="+ boardId);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
