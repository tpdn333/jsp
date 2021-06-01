package ch14;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ch14.bean.Employee;
import ch14.dao.EmployeesDAO;

/**
 * Servlet implementation class JDBC17UpdateServlet
 */
@WebServlet("/JDBC17UpdateServlet")
public class JDBC17UpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public JDBC17UpdateServlet() {
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
		String path = "ch14/jdbc17.jsp";
		request.getRequestDispatcher(path).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int id = Integer.parseInt(request.getParameter("id"));
		String lastName = request.getParameter("lastName");
		String firstName = request.getParameter("firstName");
		String notes = request.getParameter("notes");
		Date date = Date.valueOf(request.getParameter("date"));
		
		Employee emp = new Employee();
		emp.setId(id);
		emp.setLastName(lastName);
		emp.setFirstName(firstName);
		emp.setNotes(notes);
		emp.setDate(date);
		
		EmployeesDAO empDAO = new EmployeesDAO();
		empDAO.updateEmployee(emp);
				
		doGet(request, response);
	}
	
	
}
