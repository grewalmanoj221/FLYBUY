<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" errorPage="errorPage.jsp"%>
<%@page import="com.entity.Category"%>
<%@page import="java.util.List"%>
<%@page import="com.connection.HibernateUtil"%>
<%@page import="com.dao.CategoryDao"%>
<%@page import="com.entity.User"%>
<%@page import="com.helper.Helper"%>
<%@page import="java.util.*"%>
<%@page import="com.dao.ProductDao"%>
<%
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
response.setHeader("Pragma", "no-cache");
response.setHeader("Expires", "0");
%>

<%
	User user = (User) session.getAttribute("current-user");
if (user == null) {

	session.setAttribute("message", "You are not logged in !! Login first");
	response.sendRedirect("login.jsp");
	return;

} else {

	if (user.getUserType().equals("normal")) {

		session.setAttribute("message", "You are not admin ! Do not access this page");
		response.sendRedirect("login.jsp");
		return;

	}

}
%>

<!DOCTYPE html>
<html>
<head>
<head>
<link rel="shortcut icon" type="image/png" href="img/logo.png">

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>FLY BUY-View Product</title>
<%@include file="Components/common_css_js.jsp"%>
<style>
body {
	background-color: #e2e2e2;
}
</style>

<script>
	function goBack() {
		window.history.back();
	}
</script>

</head>
<body>
	<%@include file="Components/navbar.jsp"%>
	<button style="float: right;" class="btn btn-primary"
		onclick="goBack()">Back</button>

	<%
		ProductDao dao = new ProductDao(HibernateUtil.getSessionFactory());
	List<Product> list = null;

	list = dao.getAllProducts();
	%><!--show products-->
	<div class="col-md-10">

		<div class="container-fluid mt-3">
			<%@include file="Components/message.jsp"%>
		</div>

		<!--row-->
		<div class="row mt-4">

			<!--col:12-->
			<div class="col-md-12">

				<div class="card-columns">

					<!--traversing products-->

					<%
						for (Product p : list) {
					%>


					<!--product card-->
					<div class="card product-card">

						<div class="container text-center">
							<img src="img/products/<%=p.getpPhoto()%>"
								style="max-height: 200px; max-width: 100%; width: auto;"
								class="card-img-top m-2" alt="...">

						</div>

						<div class="card-body">

							<h5 align="center" class="card-title"><%=p.getpName()%></h5>

							<h6 class="card-title">
								Quantity :
								<%=p.getpQuantity()%></h6>
							<h6 class="card-title">
								Product ID :<%=p.getpId()%></h6>
							<h6 class="card-title">
								Category :<%=p.getCategory().getCategoryTitle()%></h6>
							<h6 class="card-title">
								MRP :&#8377;<%=p.getpPrice()%>/-
							</h6>
							<h6 class="card-title">
								Discount :&#8377;<%=p.getpDiscount()%>/- off
							</h6>
							<p class="card-text">
								Description-
								<%=Helper.get10Words(p.getpDesc())%>

							</p>

						</div>

					</div>

					<%
						}
					%>

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