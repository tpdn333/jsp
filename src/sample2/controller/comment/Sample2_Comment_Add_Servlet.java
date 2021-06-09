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
 * Servlet implementation class Sample2_Comment_Add_Servlet
 */
@WebServlet("/sample2/comment/add")
public class Sample2_Comment_Add_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private CommentService service = null;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Sample2_Comment_Add_Servlet() {
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
		// 파라미터 수집
		String commentBody = request.getParameter("comment");
		String memberId = request.getParameter("memberId");
		String boardId = request.getParameter("boardId");
		
		// 빈 생성 및 프로퍼티 세팅
		Comment comment = new Comment();
		
		comment.setComment(commentBody);
		comment.setMemberId(memberId);
		comment.setBoardId(Integer.parseInt(boardId));
		
		// 서비스에게 일을 시킴
		
		service.add(comment);
		
		// view에 전송(forward or redirect)
		response.sendRedirect(request.getContextPath() + "/sample2/board/detail?boardId=" + boardId);
	}

}
