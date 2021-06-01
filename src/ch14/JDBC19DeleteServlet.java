package ch14;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ch14.bean.Customer;
import ch14.bean.Employee;
import ch14.dao.CustomersDAO;
import ch14.dao.EmployeesDAO;

/**
 * Servlet implementation class JDBC19DeleteServlet
 */
@WebServlet("/JDBC19DeleteServlet")
public class JDBC19DeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public JDBC19DeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		
		EmployeesDAO empDAO = new EmployeesDAO();
		Employee emp = empDAO.getEmployee(id);
		request.setAttribute("emp", emp);
		
		String path = "/ch14/jdbc19.jsp";
		request.getRequestDispatcher(path).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		EmployeesDAO empDAO = new EmployeesDAO();
		
		empDAO.deleteEmployeer(id);
		
		doGet(request, response);
	}

}
