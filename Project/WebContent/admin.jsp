<%@page import="com.entity.Category"%>
<%@page import="com.entity.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.connection.HibernateUtil"%>
<%@page import="com.dao.CategoryDao"%>
<%@page import="com.dao.ProductDao"%>
<%@page import="com.entity.User"%>
<%@page import="com.helper.Helper"%>
<%@page import="java.util.*"%>
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

		if (user.getUserType().equals("normal")) {

			session.setAttribute("message", "You are not admin ! Do not access this page");
			response.sendRedirect("login.jsp");
			return;

		}

	}

	CategoryDao cdao = new CategoryDao(HibernateUtil.getSessionFactory());
	List<Category> list = cdao.getCategories();

	ProductDao pdao = new ProductDao(HibernateUtil.getSessionFactory());
	List<Product> pList = pdao.getAllProducts();

	Map<String, Long> map = Helper.getCount(HibernateUtil.getSessionFactory());
%>

<%@page contentType="text/html" pageEncoding="UTF-8"
	errorPage="errorPage.jsp"%>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" type="image/png" href="img/logo.png">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>FLY BUY-Admin Panel</title>
<%@include file="Components/common_css_js.jsp"%>
<style>
body {
	background-color: #e2e2e2;
}
</style>

</head>
<body>

	<%@include file="Components/navbar.jsp"%>

	<div class="container admin">


		<div class="container-fluid mt-3">
			<%@include file="Components/message.jsp"%>
		</div>

		<div class="row mt-3">

			<!--first col-->
			<div class="col-md-4">

				<!--first box-->
				<div class="card" data-toggle="tooltip" data-placement="top"
					title="Total user : ">
					<div class="card-body text-center">
						<div class="container">
							<img style="max-width: 125px;" class="img-fluid rounded-circle"
								src="img/seo-and-web.png" alt="user_icon">

						</div>
						<h1><%=map.get("userCount")%></h1>
						<h1 class="text-uppercase text-muted">Users</h1>

					</div>

				</div>



			</div>

			<!--second col-->

			<div class="col-md-4" data-toggle="tooltip" data-placement="top"
				title="Total category : ">


				<div class="card text-center">

					<div class="card-body">

						<div class="container">
							<img style="max-width: 125px;" class="img-fluid rounded-circle"
								src="img/list.png" alt="user_icon">

						</div>

						<h1><%=list.size()%></h1>
						<h1 class="text-uppercase text-muted">Categories</h1>

					</div>

				</div>

			</div>


			<!--third col-->
			<div class="col-md-4" data-toggle="tooltip" data-placement="top"
				title="Total Product : ">


				<div class="card">

					<div class="card-body text-center">

						<div class="container">
							<img style="max-width: 125px;" class="img-fluid rounded-circle"
								src="img/product.png" alt="user_icon">

						</div>

						<h1><%=map.get("productCount")%></h1>
						<h1 class="text-uppercase text-muted">Products</h1>

					</div>

				</div>


			</div>





		</div>

		<!--second row-->

		<div class="row mt-3">

			<!--second :row first col-->
			<div class="col-md-6">


				<div class="card" data-toggle="modal"
					data-target="#add-category-modal">

					<div class="card-body text-center">

						<div class="container">
							<img style="max-width: 125px;" class="img-fluid rounded-circle"
								src="img/folder.png" alt="user_icon">

						</div>

						<p class="mt-2">Click here to add new category</p>
						<h1 class="text-uppercase text-muted">Add Category</h1>

					</div>

				</div>
			</div>

			<!--second row : second col-->

			<div class="col-md-6">

				<div class="card" data-toggle="modal"
					data-target="#add-product-modal">

					<div class="card-body text-center">

						<div class="container">
							<img style="max-width: 125px;" class="img-fluid rounded-circle"
								src="img/plus.png" alt="user_icon">

						</div>

						<p class="mt-2">Click here to add new Product</p>
						<h1 class="text-uppercase text-muted">Add Product</h1>

					</div>

				</div>

			</div>




		</div>

		<!-- third col -->

		<!-- view products rows -->
		<div class="row mt-3">
			<div class="col-md-4">

				<div onclick="window.location='viewproduct.jsp'" class="card">

					<div class="card-body text-center">

						<div class="container">
							<img style="max-width: 125px;" class="img-fluid rounded-circle"
								src="img/view.png" alt="user_icon">

						</div>

						<p class="mt-2">Click here to view all products</p>
						<h1 class="text-uppercase text-muted">View Products</h1>

					</div>

				</div>

			</div>

			<div class="col-md-4">

				<div class="card" data-toggle="modal"
					data-target="#update-product-modal">

					<div class="card-body text-center">

						<div class="container">
							<img style="max-width: 125px;" class="img-fluid rounded-circle"
								src="img/update.png" alt="user_icon">

						</div>

						<p class="mt-2">Click here to update product</p>
						<h1 class="text-uppercase text-muted">Update Products</h1>

					</div>

				</div>

			</div>
			<div class="col-md-4">

				<div class="card" data-toggle="modal"
					data-target="#delete-product-modal">

					<div class="card-body text-center">

						<div class="container">
							<img style="max-width: 125px;" class="img-fluid rounded-circle"
								src="img/trash.png" alt="user_icon">

						</div>

						<p class="mt-2">Click here to delete product</p>
						<h1 class="text-uppercase text-muted">Delete Products</h1>

					</div>

				</div>

			</div>


		</div>



	</div>



	<!--add category modal-->



	<!-- Modal -->
	<div class="modal fade" id="add-category-modal" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">

		<div class="modal-dialog modal-lg" role="document">

			<div class="modal-content">

				<div class="modal-header custom-bg text-white">

					<h5 class="modal-title" id="exampleModalLabel">Fill category
						details</h5>

					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>

				<div class="modal-body">
					<form action="ProductOperationServlet" method="post">

						<input type="hidden" name="operation" value="addcategory">


						<div class="form-group">
							<input type="text" class="form-control" name="catTitle"
								placeholder="Enter category title" required />

						</div>


						<div class="form-group">
							<textarea style="height: 300px;" class="form-control"
								placeholder="Enter category description" name="catDescription"
								required></textarea>

						</div>

						<div class="cotnainer text-center">

							<button class="btn btn-outline-success">Add Category</button>
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">Close</button>

						</div>



					</form>




				</div>

			</div>

		</div>

	</div>




	<!--End add category modal-->

	<!--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-->

	<!--product modal-->

	<!-- Modal -->
	<div class="modal fade" id="add-product-modal" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">

			<div class="modal-content">

				<div class="modal-header">

					<h5 class="modal-title" id="exampleModalLabel">Product details</h5>

					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>

				<div class="modal-body">
					<!--form-->

					<form action="ProductOperationServlet" method="post"
						enctype="multipart/form-data">

						<input type="hidden" name="operation" value="addproduct" />

						<!--product title-->

						<div class="form-group">
							<input type="text" class="form-control"
								placeholder="Enter title of product" name="pName" required />
						</div>

						<!--product description-->

						<div class="form-group">
							<textarea style="height: 150px;" class="form-control"
								placeholder="Enter product description" name="pDesc"></textarea>

						</div>

						<!--product price-->

						<div class="form-group">
							<input type="number" class="form-control"
								placeholder="Enter price of product" name="pPrice" required />
						</div>

						<!--product discount-->

						<div class="form-group">
							<input type="number" class="form-control"
								placeholder="Enter product discount" name="pDiscount" required />
						</div>


						<!--product quantity-->

						<div class="form-group">
							<input type="number" class="form-control"
								placeholder="Enter product Quantity" name="pQuantity" required />
						</div>


						<!--product category-->




						<div class="form-group">
							<select name="catId" class="form-control" id="">
								<%
									for (Category c : list) {
								%>
								<option value="<%=c.getCategoryId()%>">
									<%=c.getCategoryTitle()%>
								</option>
								<%
									}
								%>
							</select>

						</div>

						<!--product file-->

						<div class="form-group">
							<label for="pPic">Select Picture of product</label> <br> <input
								type="file" id="pPic" name="pPic" required />

						</div>

						<!--submit button-->
						<div class="container text-center">

							<button class="btn btn-outline-success">Add product</button>

						</div>

					</form>
					<!--end form-->
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
				</div>

			</div>

		</div>

	</div>


	<!--End product modal-->

	<!-- Update product modal -->
	<div class="modal fade" id="update-product-modal" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">

		<div class="modal-dialog modal-lg" role="document">

			<div class="modal-content">

				<div class="modal-header custom-bg text-white">

					<h5 class="modal-title" id="exampleModalLabel">Fill Update
						details</h5>

					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>

				<div class="modal-body">
					<form action="ProductOperationServlet" method="post">

						<input type="hidden" name="operation" value="updateproduct">

						<div class="form-group">
							<select name="pid" class="form-control" id="">
								<%
									for (Product p : pList) {
								%>
								<option value="<%=p.getpId()%>">
									<%=p.getpId()%>
								</option>
								<%
									}
								%>
							</select>

						</div>

						<div class="form-group">
							<input type="number" class="form-control"
								placeholder="Enter new price of product" name="pPrice" required />
						</div>

						<!--product discount-->

						<div class="form-group">
							<input type="number" class="form-control"
								placeholder="Enter new product discount" name="pDiscount"
								required />
						</div>


						<!--product quantity-->

						<div class="form-group">
							<input type="number" class="form-control"
								placeholder="Enter new product Quantity" name="pQuantity"
								required />
						</div>



						<div class="cotnainer text-center">

							<button class="btn btn-outline-success">Update Product</button>
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">Close</button>

						</div>

					</form>

				</div>

			</div>

		</div>

	</div>

	<!-- end of Update product modal -->




	<!-- Delete product modal -->
	<div class="modal fade" id="delete-product-modal" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">

		<div class="modal-dialog modal-lg" role="document">

			<div class="modal-content">

				<div class="modal-header custom-bg text-white">

					<h5 class="modal-title" id="exampleModalLabel">Fill Product
						details</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>

				</div>

				<div class="modal-body">
					<form action="ProductOperationServlet" method="post">

						<input type="hidden" name="operation" value="deleteproduct">


						<div class="form-group">
							<select name="pid" class="form-control" id="">
								<%
									for (Product p : pList) {
								%>
								<option value="<%=p.getpId()%>">
									<%=p.getpId()%>
								</option>
								<%
									}
								%>
							</select>

						</div>

						<div class="cotnainer text-center">

							<button class="btn btn-danger">Delete Product</button>
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">Close</button>
						</div>

					</form>

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



	<!-- End of delete product modal -->

	<%@include file="Components/common_modals.jsp"%>
	<script>
		$(function() {
			$('[data-toggle="tooltip"]').tooltip()
		})
	</script>
</body>
</html>
