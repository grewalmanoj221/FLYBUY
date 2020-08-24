
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" errorPage="errorPage.jsp"%>
<%@page import="com.entity.Product"%>
<%@page import="com.dao.ProductDao"%>
<%@page import="com.connection.HibernateUtil"%>
<%
	int id = Integer.parseInt(request.getParameter("id"));
ProductDao dao = new ProductDao(HibernateUtil.getSessionFactory());
Product product = dao.getProduct(id);
%>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" type="image/png" href="img/logo.png">

<meta charset="ISO-8859-1">
<title>Product <%=product.getpName()%>>
</title>
<%@include file="Components/common_css_js.jsp"%>
</head>
<%
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
response.setHeader("Pragma", "no-cache");
response.setHeader("Expires", "0");
%>

<body>
	<%@include file="Components/navbar.jsp"%>
	<div class="container-fluid">

		<!--row-->

		<div class="container text-center">
			<img src="img/products/<%=product.getpPhoto()%>"
				style="max-height: 400px; max-width: 100%; width: auto;"
				class="card-img-top m-2" alt="...">

		</div>

		<div class="card-body">
			<div align="center">
				<h2 class="card-title"><%=product.getpName()%></h2>

				<h4 class="card-text">
					<%=product.getpDesc()%>
				</h4>
			</div>
		</div>

		<div class="card-footer text-center">
			<button class="btn custom-bg text-white"
				onclick="add_to_cart(<%=product.getpId()%>, '<%=product.getpName()%>',<%=product.getPriceAfterApplyingDiscount()%>)">Add
				to Cart</button>
			<button class="btn  btn-outline-success ">
				&#8377;
				<%=product.getPriceAfterApplyingDiscount()%>/- <span
					class="text-secondary discount-label"> &#8377; <%=product.getpPrice()%>
					, &#8377;<%=product.getpDiscount()%> off
				</span>
			</button>

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