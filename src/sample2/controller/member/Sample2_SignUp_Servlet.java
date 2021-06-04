package sample2.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sample2.bean.Member;
import sample2.dao.MemberDAO;

/**
 * Servlet implementation class Sample2_SignUp_Servlet
 */
@WebServlet("/sample2/signup")
public class Sample2_SignUp_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Sample2_SignUp_Servlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String path = "/WEB-INF/sample2/signup.jsp";
		request.getRequestDispatcher(path).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// request parameter 수집
		String id = request.getParameter("id");
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		String name = lastName + firstName;
		
		String password = request.getParameter("password");
//		String birth = request.getParameter("birth");
		String birth_yy = request.getParameter("birth_yy");
		String birth_dd = request.getParameter("birth_dd");
		String birth_mm = request.getParameter("birth_mm");
		String birth = birth_yy + "-" + birth_mm + "-" + birth_dd;
		String gender = request.getParameter("gender");

		// 규칙에 맞게 들어왔는지 검사...
		// 맴버 bean 완성
		Member member = new Member();
		member.setId(id);
		member.setName(name);
		member.setPassword(password);
		member.setBirth(Date.valueOf(birth));
		member.setGender(gender);

		// dao insert 메소드 호출
		MemberDAO dao = new MemberDAO();
		boolean ok = dao.insert(member);

		// forward or redirect 실행
		if (ok) {
			String path = request.getContextPath() + "/sample2/list";
			response.sendRedirect(path);
		} else {
			request.setAttribute("message", "가입실패");
			
			String path = "/WEB-INF/sample2/signup.jsp";
			request.getRequestDispatcher(path).forward(request, response);
		}
	}
}
