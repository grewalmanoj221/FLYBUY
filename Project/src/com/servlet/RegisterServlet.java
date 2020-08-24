package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.hibernate.Session;
import org.hibernate.Transaction;
import com.connection.HibernateUtil;
import com.entity.User;
import com.helper.HashAlgo;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		try (PrintWriter out = response.getWriter()) {
			/* TODO output your page here. You may use following sample code. */

			try {

				String userName = request.getParameter("user_name");
				String userEmail = request.getParameter("user_email");
				String userPassword = request.getParameter("user_password");
				String password = HashAlgo.encryptThisString(userPassword);
				String userPhone = request.getParameter("user_phone");
				String userAddress = request.getParameter("user_address");

				// validations
				if (userName.isEmpty()) {
					out.println("Name is blank ");
					return;
				}
				// creating user object to store data

				User user = new User(userName, userEmail, password, userPhone, "default.jpg", userAddress, "normal");

				Session hibernateSession = HibernateUtil.getSessionFactory().openSession();

				Transaction tx = hibernateSession.beginTransaction();

				int userId = (int) hibernateSession.save(user);

				System.out.println(userId); 
				
				tx.commit();

				hibernateSession.close();

				HttpSession httpSession = request.getSession();
				httpSession.setAttribute("message", "Registration Successful !!");

				response.sendRedirect("register.jsp");
				return;

			} catch (Exception e) {
				e.printStackTrace();

			} // catch

		} //
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processRequest(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processRequest(request, response);
	}

	@Override
	public String getServletInfo() {
		return "Short description";
	}// </editor-fold>

}
