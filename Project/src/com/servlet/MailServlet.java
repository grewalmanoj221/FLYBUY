package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.connection.HibernateUtil;
import com.dao.MailDao;
import com.entity.EmailSubscriber;

public class MailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");

		try (PrintWriter out = response.getWriter()) {
			
			try {
				String operation = request.getParameter("operation");

				if (operation.trim().equals("addsubscriber")) {

					String email = request.getParameter("email");

					MailDao dao = new MailDao(HibernateUtil.getSessionFactory());
					EmailSubscriber subscriber = dao.getSubscriber(email);
					HttpSession httpSession = request.getSession();

					if (subscriber == null) {
						String firstName = request.getParameter("fname");

						String lastName = "";
						lastName += request.getParameter("sname");
						subscriber = new EmailSubscriber();
						subscriber.setEmail(email);
						subscriber.setFirstName(firstName);
						subscriber.setLastName(lastName);

						if (dao.addSubscriber(subscriber)) {
							MailDao mDao = new MailDao(HibernateUtil.getSessionFactory());
							if (mDao.confirmationMail(email, firstName + " " + lastName)) {
								httpSession.setAttribute("message", "Subscription Completed");

								response.sendRedirect("index.jsp");
								return;

							} else {
								httpSession.setAttribute("message", "Subscription Completed");

								response.sendRedirect("index.jsp");
								return;

							}
						} else {
							httpSession.setAttribute("message", "Subscribed but Confirmation Mail failed.");

							response.sendRedirect("index.jsp");
							return;
						}

					} //
					else {
						httpSession.setAttribute("message", "Email Already Registred");

						response.sendRedirect("index.jsp");
						return;

					} //

				} // outer-most if

			} // try
			catch (Exception e) {
				e.printStackTrace();
			} // catch
		} // try with resource
	}// doPost

}// Servlet
