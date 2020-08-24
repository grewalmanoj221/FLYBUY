<%@page import="com.entity.User"%>
<%@page import="com.entity.Product"%>

<%
	User user = (User) session.getAttribute("current-user");
if (user == null) {

	session.setAttribute("message", "You are not logged in !! Login first to access checkout page");
	response.sendRedirect("login.jsp");
	return;

}
%>
<%
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
response.setHeader("Pragma", "no-cache");
response.setHeader("Expires", "0");
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" type="image/png" href="img/logo.png">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>FLY BUY-Checkout</title>
<%@include file="Components/common_css_js.jsp"%>

</head>
<body>
	<%@include file="Components/navbar.jsp"%>

	<div class="container">

		<div class="row mt-5">

			<div class="col-md-6">
				<!--card-->
				<div class="card">

					<div class="card-body">

						<h3 class="text-center mb-5">Your selected items</h3>

						<div class="cart-body"></div>

					</div>

				</div>

			</div>

			<div class="col-md-6">
				<!--form details-->
				<!--card-->
				<div class="card">

					<div class="card-body">

						<h3 class="text-center mb-5">Your details for order</h3>

						<form action="payment.jsp">

							<div class="form-group">

								<label for="exampleInputEmail1">Email address</label> <input
									value="<%=user.getUserEmail()%>" type="email"
									class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="Enter email">
								<small id="emailHelp" class="form-text text-muted">We'll
									never share your email with anyone else.</small>
							</div>


							<div class="form-group">
								<label for="name">Your name</label> <input
									value="<%=user.getUserName()%>" type="text"
									class="form-control" id="name" aria-describedby="emailHelp"
									placeholder="Enter name">
							</div>


							<div class="form-group">
								<label for="name">Your contact</label> <input
									value="<%=user.getUserPhone()%>" type="text"
									class="form-control" id="name" aria-describedby="emailHelp"
									placeholder="Enter contact number">
							</div>


							<div class="form-group">
								<label for="exampleFormControlTextarea1">Your shipping &
									Billing address</label>
								<!--  <textarea value="<%=user.getUserAddress()%>"
									class="form-control" id="exampleFormControlTextarea1"
									placeholder="Enter your address" rows="3"></textarea>-->

								<br> <input type="text" name="line1" placeholder="Line 1"
									required class="form-control"> <br> <input
									type="text" name="line2" placeholder="Line 2" required
									class="form-control"> <br> <input type="text"
									name="city" placeholder="City" required class="form-control">
								<br> <select name="pincode" class="form-control" required>
									<option value="">Pincode</option>
									<option value="101213">101213</option>
									<!-- faridabad -->
									<option value="110038">110038</option>
									<!-- gurgaon -->
									<option value="124001">124001</option>
									<!-- rohtak -->
									<option value="132103">132103</option>
									<!-- panipat -->
									<option value="127021">127021</option>
									<!-- bhiwani -->
									<option value="110085">110085</option>
									<!-- delhi -->
									<option value="121102">121102</option>
									<!-- palwal -->

								</select>
							</div>

							<h3 align="center">
								<small>Delievery only in limited areas</small>
							</h3>
							<h3 align="center">
								<small><%=session.getAttribute("totalPrice")%></small>
							</h3>

							<div class="container text-center">
								<button class="btn btn-outline-success" type="submit">Order
									Now</button>

								<button type="submit" class="btn btn-outline-primary "
									onclick="location.href='index.jsp'" type="button">Continue
									Shopping</button>

							</div>

						</form>

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

	</div>


	<%@include file="Components/common_modals.jsp"%>

</body>
</html>