package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.connection.HibernateUtil;
import com.dao.UserDao;
import com.entity.User;
import com.helper.HashAlgo;

public class UpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		try (PrintWriter out = response.getWriter()) {

			// coding area
			String email = request.getParameter("regemail");

			String original = request.getParameter("oemail");

			// System.out.println(user);
			HttpSession httpSession = request.getSession();
			if (original.equals(email)) {
				String password1 = request.getParameter("oldpassword");

				String password = HashAlgo.encryptThisString(password1);

				// validations
				// authenticating user
				UserDao userDao = new UserDao(HibernateUtil.getSessionFactory());
				User user = userDao.getUserByEmailAndPassword(email, password);

				if (user == null) {
					httpSession.setAttribute("message", "Wrong credentails");
					response.sendRedirect("normal.jsp");
					return;
				} else {
					String newPassword = request.getParameter("newpassword");
					if (userDao.updateUser(user, newPassword)) {
						httpSession.setAttribute("message", "Password Updated.");
						response.sendRedirect("normal.jsp");
						return;
					} else {
						httpSession.setAttribute("message", "Unable to change password");
						response.sendRedirect("normal.jsp");
						return;
					} // inner-else

				} // outer else

			} // if
			else {
				httpSession.setAttribute("message", "Use your crendials");
				response.sendRedirect("normal.jsp");
				return;
			}
		} // try
	}// doPost

}//
