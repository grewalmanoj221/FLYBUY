<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" errorPage="errorPage.jsp"%>

<%@page import="com.entity.User"%>
<%@page import="com.entity.Order"%>
<%@page import="com.entity.Address"%>
<%@page import="com.dao.OrderDao"%>
<%@page import="java.util.*"%>
<%@page import="com.connection.HibernateUtil"%>

<%
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	response.setHeader("Pragma", "no-cache");
	response.setHeader("Expires", "0");

	User user = (User) session.getAttribute("current-user");
	if (user == null) {

		session.setAttribute("message", "You are not logged in !! Login first");
		response.sendRedirect("login.jsp");
		return;

	} else {

		if (user.getUserType().equals("admin")) {

			session.setAttribute("message", "You are an admin ! Do not access this page");
			response.sendRedirect("login.jsp");
			return;

		}

	}
%>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" type="image/png" href="img/logo.png">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="ISO-8859-1">
<title>Fly Buy-User</title>
<script src="https://code.jquery.com/jquery-1.11.2.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script>
	$("#update-user-modal").modal({
		"backdrop" : "static"
	});
	$("form").submit(function(event) {
		event.preventDefault();
	});
</script>

<%@include file="Components/common_css_js.jsp"%>
<style>
body {
	background-color: #e2e2e2;
}
</style>
</head>
<body>
	<!-- include statement for navbar -->
	<%@include file="Components/navbar.jsp"%>


	<div class="container-fluid mt-3">
		<%@include file="Components/message.jsp"%>
	</div>

	<div class="row mt-3">

		<!--second :row first col-->
		<div class="col-md-4">


			<div class="card" data-toggle="modal"
				data-target="#update-user-modal" data-toggle="modal">

				<div class="card-body text-center">

					<div class="container">
						<img style="max-width: 125px;" class="img-fluid rounded-circle"
							src="img/changepassword.png" alt="user_icon">

					</div>

					<p class="mt-2">Click here to change password</p>
					<h1 class="text-uppercase text-muted">Change Password</h1>

				</div>

			</div>

		</div>

		<!--second row : second col-->

		<div class="col-md-4">

			<div class="card" data-toggle="modal" data-target="#orderInfo">

				<div class="card-body text-center">

					<div class="container">
						<img style="max-width: 125px;" class="img-fluid rounded-circle"
							src="img/order.png" alt="user_icon">

					</div>

					<p class="mt-2">Click here view Orders</p>
					<h1 class="text-uppercase text-muted">My Orders</h1>

				</div>

			</div>

		</div>

		<div class="col-md-4">


			<div class="card" data-toggle="modal" data-target="#userInfo"
				data-toggle="modal">

				<div class="card-body text-center">

					<div class="container">
						<img style="max-width: 125px;" class="img-fluid rounded-circle"
							src="img/userdetails.png" alt="user_icon">
					</div>
					<p class="mt-2">Click here to see user details</p>
					<h1 class="text-uppercase text-muted">User Details</h1>

				</div>

			</div>
		</div>


	</div>

	<!-- Modals -->

	<div class="modal" id="update-user-modal">

		<div class="modal-dialog">

			<div class="modal-content">

				<div class="modal-header">

					<div class="modal-body">

						<div class="form-group">

							<div class="container-fluid">

								<div class="row no-gutter">

									<div class="container">

										<div class="row">

											<div class="col-lg-15 col-xl-15 mx-auto">

												<h4 class="display-4" align="center">Change Password</h4>
												<br>

												<form action="UpdateServlet" method="post">
													<input type="hidden" name="oemail"
														value=<%=user.getUserEmail()%>>
													<div class="form-group mb-3">
														<label>Registered Email Id : </label> <input
															id="inputEmail" type="email" placeholder="Email Address"
															required autofocus
															class="form-control rounded-pill border-2 shadow-sm px-4 text-dark"
															name="regemail">
													</div>

													<div class="form-group mb-3">
														Old Password : <input id="inputPassword" type="password"
															placeholder="Old Password" required
															class="form-control rounded-pill border-2 shadow-sm px-4 text-dark"
															name="oldpassword">
													</div>

													<div class="form-group mb-3">
														New Password : <input id="inputPassword" type="password"
															placeholder="New Password" required
															class="form-control rounded-pill border-2 shadow-sm px-4 text-dark">
													</div>

													<div class="form-group mb-3">
														Confirm New Password : <input id="inputPassword"
															type="password" placeholder="Confirm Password" required
															class="form-control rounded-pill border-2 shadow-sm px-4 text-dark"
															name="newpassword">
													</div>
													<button type="submit"
														class="btn btn-danger btn-block text-uppercase mb-2 rounded-pill shadow-sm">Submit</button>
												</form>

											</div>

										</div>

									</div>

								</div>

							</div>

						</div>

					</div>

					<button type="button" class="close" data-dismiss="modal">
						&times;</button>

				</div>

			</div>

		</div>

	</div>


	<div class="modal" id="userInfo">

		<div class="modal-dialog">

			<div class="modal-content">


				<div class="modal-header">

					<div class="modal-body">

						<div class="form-group">

							<div class="container-fluid">

								<div class="row no-gutter">

									<div class="container">

										<div class="row">

											<div class="col-lg-15 col-xl-15 mx-auto">

												<h3 class="display-3" align="center">User Details</h3>
												<br>
												<div align="center">
													<img src="img/account.png" width="100" height="100">
												</div>
												<br>
												<div class="form-group mb-3">
													<label>Name :<%=user.getUserName()%></label>
												</div>

												<div class="form-group mb-3">
													Email Address :
													<%=user.getUserEmail()%></div>
												<div class="form-group mb-3">
													Mobile Number :
													<%=user.getUserPhone()%></div>
												<div class="form-group mb-3">
													Address :
													<%=user.getUserAddress()%></div>

											</div>

										</div>

									</div>

								</div>

							</div>

						</div>


					</div>
					<button type="button" class="close" data-dismiss="modal">
						&times;</button>
				</div>

			</div>

		</div>

	</div>

	<!-- User Info Modal -->
	<div class="modal" id="orderInfo">

		<div class="modal-dialog">

			<div class="modal-content">


				<div class="modal-header">

					<div class="modal-body">

						<div class="form-group">

							<div class="container-fluid">

								<div class="row no-gutter">

									<div class="container">

										<div class="row">
											<%
												OrderDao orderDao = new OrderDao(HibernateUtil.getSessionFactory());
												List<Order> orderList = orderDao.getOrders(user.getUserId());
											%>

											<div class="col-lg-15 col-xl-15 mx-auto">

												<h3 class="display-3" align="center">
													Order Details
													<%=user.getUserName()%></h3>
												<br>
												<div align="center">
													<img src="img/account.png" width="100" height="100">
												</div>
												<br>
												<div class="form-group mb-3">
													<%
														for (Order order : orderList) {
													%>
													<label>Order No<%=order.getId()%></label> <label>Address
														<%=order.getAddress()%></label>

													<%
														}
													%>

												</div>



											</div>

										</div>

									</div>

								</div>

							</div>

						</div>


					</div>
					<button type="button" class="close" data-dismiss="modal">
						&times;</button>
				</div>

			</div>

		</div>

	</div>



	<footer class="my-5 pt-5 text-muted text-center text-small">
		<p class="mb-1">
			&copy;@FLYBUY <a href="about.jsp">about us</a>
		</p>
		<p class="mb-1">Follow us on Instagram, Twitter and other leading
			social platforms</p>
	</footer>

	<%@include file="Components/common_modals.jsp"%>

</body>
</html>