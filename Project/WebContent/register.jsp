<%@page contentType="text/html" pageEncoding="UTF-8"
	errorPage="errorPage.jsp"%>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" type="image/png" href="img/logo.png">

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>FLY BUY-New User</title>

<%@include file="Components/common_css_js.jsp"%>
</head>
<body>
	<%
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	response.setHeader("Pragma", "no-cache");
	response.setHeader("Expires", "0");
	%>

	<%@include file="Components/navbar.jsp"%>
	<div class="container-fluid">

		<div class="row mt-3">

			<div class="col-md-4 offset-md-4">

				<div class="card">

					<%@include file="Components/message.jsp"%>
					<div class="card-body px-5">

						<div class="container text-center">

							<img src="img/add-friend.png" style="max-width: 100px;"
								class="img-fluid" alt="">
						</div>


						<h3 class="text-center my-3">Sign up here !!</h3>

						<form action="RegisterServlet" method="post">

							<div class="form-group">
								<label for="name">User Name</label> <input name="user_name"
									type="text" class="form-control" id="name" required
									placeholder="Enter here" aria-describedby="emailHelp">
							</div>

							<div class="form-group">
								<label for="email">User Email</label> <input name="user_email"
									type="email" class="form-control" id="email" required
									placeholder="Enter here" aria-describedby="emailHelp">
							</div>

							<div class="form-group">
								<label for="password">User password</label> <input
									name="user_password" type="password" class="form-control"
									id="password" placeholder="Enter here" required
									aria-describedby="emailHelp">
							</div>

							<div class="form-group">
								<label for="phone">User phone</label> <input name="user_phone"
									type="number" class="form-control" id="phone" required
									placeholder="Enter here" aria-describedby="emailHelp">
							</div>

							<div class="form-group">
								<label for="phone">User Address</label>
								<textarea name="user_address" style="height: 200px;" required
									class="form-control" placeholder="Enter your address"></textarea>


							</div>

							<div class="container text-center">
								<button class="btn btn-outline-success">Register</button>
								<button class="btn btn-outline-warning">Reset</button>

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

</body>
</html>
