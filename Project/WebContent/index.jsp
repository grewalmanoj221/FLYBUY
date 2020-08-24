<%@page import="com.helper.Helper"%>
<%@page import="com.entity.Category"%>
<%@page import="com.dao.CategoryDao"%>
<%@page import="com.entity.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.ProductDao"%>
<%@page import="com.connection.HibernateUtil"%>

<%@page contentType="text/html" pageEncoding="UTF-8"
	errorPage="errorPage.jsp"%>

<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" type="image/png" href="img/logo.png">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>FLY BUY-Home</title>
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

		<div class="container-fluid mt-3">
			<%@include file="Components/message.jsp"%>
		</div>

		<div class="row mt-3 mx-2">

			<%
				String cat = request.getParameter("category");
			//out.println(cat);

			ProductDao dao = new ProductDao(HibernateUtil.getSessionFactory());
			List<Product> list = null;

			if (cat == null || cat.trim().equals("all")) {
				list = dao.getAllProducts();

			} else if (cat.equals("search")) {
				String search = request.getParameter("value");
				list = dao.getAllProductsBySearch(search);
			}

			else {

				int cid = Integer.parseInt(cat.trim());
				list = dao.getAllProductsById(cid);

			}

			CategoryDao cdao = new CategoryDao(HibernateUtil.getSessionFactory());
			List<Category> clist = cdao.getCategories();
			%>



			<!--show categories-->
			<div class="col-md-2">


				<div class="list-group mt-4">

					<a href="index.jsp?category=all"
						class="list-group-item list-group-item-action active"> All
						Products </a>




					<%
						for (Category c : clist) {
					%>

					<div data-toggle="tooltip" data-placement="top"
						title=<%=Helper.get10Words(c.getCategoryDescription())%>>
						<a href="index.jsp?category=<%=c.getCategoryId()%>"
							class="list-group-item list-group-item-action"><%=c.getCategoryTitle()%></a>
					</div>
					<%
						}
					%>





				</div>


			</div>

			<!--show products-->
			<div class="col-md-10">


				<!--row-->
				<div class="row mt-4">

					<!--col:12-->
					<div class="col-md-12">

						<div class="card-columns">

							<!--traversing products-->

							<%
								for (Product p : list) {
							%>

							<form action="productdisplay.jsp">

								<input type="hidden" name="id" value=<%=p.getpId()%>>

								<!--product card-->

								<div class="card product-card">

									<div class="container text-center">
										<button class="btn btn-light btn-outline-light" type="submit">
											<img src="img/products/<%=p.getpPhoto()%>"
												style="max-height: 200px; max-width: 100%; width: auto;"
												class="card-img-top m-2" alt="...">
										</button>

									</div>

									<div class="card-body">

										<h5 align="center" class="card-title"><%=p.getpName()%></h5>
										<h6 class="card-title">
											&#8377;
											<%=p.getPriceAfterApplyingDiscount()%>/- <span
												class="text-secondary discount-label"> &#8377;<%=p.getpDiscount()%>
												off
											</span>

											<%
												String statement = "";
											if (p.getpQuantity() == 0) {
												statement = "Stock Over";
											}

											else if (p.getpQuantity() < 3) {
												statement = "->Less than 3 in stock";
											} else if (p.getpQuantity() < 10) {
												statement = "->Less than 10 in stock";
											}
											%>
											<%=statement%>

										</h6>
										<p class="card-text">
											<%=Helper.get10Words(p.getpDesc())%>

										</p>

									</div>

									<div class="card-footer text-center">
										<button class="btn custom-bg text-white" type="reset"
											onclick="add_to_cart(<%=p.getpId()%>, '<%=p.getpName()%>',<%=p.getPriceAfterApplyingDiscount()%>)">Add
											to Cart</button>

									</div>


								</div>

							</form>

							<%
								}

							if (list.size() == 0) {
							if (cat.equals("search")) {
								out.println("<h3>No item for this search</h3>");
							} //inner if
							else {
								out.println("<h3>No item in this category</h3>");
							} //else
							} //if
							%>

						</div>

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
