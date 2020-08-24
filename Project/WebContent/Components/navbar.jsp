<%@page import="com.entity.User"%>
<%@page import="com.entity.Category"%>
<%@page import="com.dao.CategoryDao"%>
<%@page import="com.entity.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.connection.HibernateUtil" errorPage="errorPage.jsp"%>
<%
	User user1 = (User) session.getAttribute("current-user");
%>
<link rel="shortcut icon" type="image/png" href="img/logo.png">

<nav class="navbar navbar-expand-lg navbar-dark  custom-bg ">
	<div class="container">
		<a class="navbar-brand" href="index.jsp"> <img width="200px"
			height="70px" src="img\logofb.png">
		</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">

				<li class="nav-item active"><a class="nav-link"
					href="index.jsp">Home <span class="sr-only">(current)</span></a></li>


				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> Categories </a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<%
							CategoryDao categorydao = new CategoryDao(HibernateUtil.getSessionFactory());
						List<Category> categorylist = categorydao.getCategories();
						%>
						<%
							for (Category c : categorylist) {
						%>

						<a class="dropdown-item"
							href="index.jsp?category=<%=c.getCategoryId()%>"><%=c.getCategoryTitle()%></a>

						<%
							}
						%>
						<!--  <a class="dropdown-item" href="#">Another action</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="#">Something else here</a>-->
					</div></li>
				<li></li>

			</ul>
			<form class="form-inline" action="index.jsp">
				<input type="hidden" name="category" value="search"> <input
					class="form-control mr-sm-2" type="search" name="value"
					placeholder="Search" aria-label="Search">
				<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
			</form>
			<ul class="navbar-nav ml-auto">

				<li class="nav-item active"><a class="nav-link"
					data-target="#newsletter" data-toggle="modal">NewsLetter <span
						class="sr-only"></span>
				</a></li>

				<li class="nav-item active"><a class="nav-link" href="#!"
					data-toggle="modal" data-target="#cart"> <i
						class="fa fa-cart-plus" style="font-size: 20px;"></i> <span
						class="ml-0 cart-items">( 0 )</span>
				</a></li>



				<%
					if (user1 == null) {
				%>

				<li class="nav-item active"><a class="nav-link"
					href="login.jsp">Login </a></li>

				<li class="nav-item active"><a class="nav-link"
					href="register.jsp">Register </a></li>


				<%
					} else {
				%>
				<li class="nav-item active"><a class="nav-link"
					href="<%=user1.getUserType().equals("admin") ? "admin.jsp" : "normal.jsp"%>"><%=user1.getUserName()%>
				</a></li>

				<li class="nav-item active"><a class="nav-link"
					href="LogoutServlet">Logout </a></li>



				<%
					}
				%>

			</ul>

		</div>

	</div>

	<!-- Modal for newsletter -->
	<div class="modal fade" id="newsletter" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">

		<div class="modal-dialog modal-lg" role="document">

			<div class="modal-content">

				<div class="modal-header custom-bg text-white">

					<h5 class="modal-title" id="exampleModalLabel">Fill Subscriber
						details</h5>


					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>

				</div>

				<div class="modal-body">
					<form action="MailServlet" method="post">

						<input type="hidden" value="addsubscriber" name="operation">
						<div class="form-group">
							<input type="text" class="form-control" name="fname"
								placeholder="Enter First name" required />

						</div>


						<div class="form-group">
							<input type="text" class="form-control" name="sname"
								placeholder="Enter your second name" />

						</div>


						<div class="form-group">
							<input type="email" class="form-control" name="email"
								placeholder="Enter your email" required />

						</div>

						<div class="cotnainer text-center">

							<button class="btn btn-outline-success">Subscribe</button>
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">Close</button>

						</div>



					</form>




				</div>

			</div>

		</div>

	</div>


	<!--  end of Modal for newsleter-->



</nav>
