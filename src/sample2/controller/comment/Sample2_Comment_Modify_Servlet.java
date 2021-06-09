package sample2.controller.comment;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sample2.bean.Comment;
import sample2.service.comment.CommentService;

/**
 * Servlet implementation class Sample2_Comment_Modify_Servlet
 */
@WebServlet("/sample2/comment/modify")
public class Sample2_Comment_Modify_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private CommentService service;   
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Sample2_Comment_Modify_Servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    @Override
    public void init() throws ServletException {
    	super.init();
    	service = new CommentService();
    }
    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String idStr = request.getParameter("commentId");
		String commentStr = request.getParameter("comment");
		String boardId = request.getParameter("boardId");
		
		Comment comment = new Comment();
		comment.setId(Integer.parseInt(idStr));
		comment.setComment(commentStr);
		
		service.modify(comment);
		
		String path = request.getContextPath() + "/sample2/board/detail?boardId=" + boardId;
		response.sendRedirect(path);
	}

}
