package ch14;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ch14.bean.Customer;
import ch14.dao.CustomersDAO;

/**
 * Servlet implementation class JDBC16UpdateServlet
 */
@WebServlet("/JDBC16UpdateServlet")
public class JDBC16UpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public JDBC16UpdateServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		CustomersDAO cusDAO = new CustomersDAO();
		Customer cus = cusDAO.getCustomer(id);
		
		request.setAttribute("cus", cus);

		String path = "/ch14/jdbc16.jsp";
		request.getRequestDispatcher(path).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		String name = request.getParameter("name");
		String contactName = request.getParameter("contactName");
		String address = request.getParameter("address");
		String city = request.getParameter("city");
		String postalCode = request.getParameter("postalCode");
		String country = request.getParameter("country");
		
		Customer cus = new Customer();
		cus.setId(id);
		cus.setName(name);
		cus.setContactName(contactName);
		cus.setAddress(address);
		cus.setCity(city);
		cus.setPostalCode(postalCode);
		cus.setCountry(country);
		
		CustomersDAO cusDAO = new CustomersDAO();
		cusDAO.updateCustomer(cus);
		
		doGet(request, response);
	}
	
	
}
