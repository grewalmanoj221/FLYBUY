package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.connection.HibernateUtil;
import com.dao.AddressDao;
import com.dao.OrderDao;
import com.entity.Address;
import com.entity.Order;
import com.entity.User;

/**
 * Servlet implementation class OrderServlet
 */
public class OrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=UTF-8");
		try (PrintWriter out = response.getWriter()) {
			HttpSession httpSession = request.getSession();
			Address address = (Address) httpSession.getAttribute("useraddress");
			User user = (User) httpSession.getAttribute("current-user");

			Order order = new Order(address, user);

			OrderDao orderdao = new OrderDao(HibernateUtil.getSessionFactory());
			AddressDao addDao = new AddressDao(HibernateUtil.getSessionFactory());

			addDao.saveAdress(address);
			orderdao.saveOrder(order);

			if (addDao.saveAdress(address) && orderdao.saveOrder(order)) {
				httpSession.removeAttribute("useraddress");
				httpSession.setAttribute("message", "Order placed");
				response.sendRedirect("index.jsp");
			} else {
				httpSession.removeAttribute("useraddress");
				httpSession.setAttribute("message", "Order placing failed");
				response.sendRedirect("index.jsp");
			}

		}
	}

}
