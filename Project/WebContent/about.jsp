
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>FLY BUY-ABOUT</title>
<%@include file="Components/common_css_js.jsp"%>
<link rel="shortcut icon" type="image/png" href="img/logo.png">

</head>
<body>
<%
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
response.setHeader("Pragma", "no-cache");
response.setHeader("Expires", "0");
%>

	<%@include file="Components/navbar.jsp"%>


	<div class="jumbotron">
		<div align="center">
			<h1>
				About <img width="200px" height="70px" src="img\logofb.png">
			</h1>
			<h4>A JOURNEY THAT STARTED WITH IDEA</h4>
		</div>
		<div align="left">
			<h4>How we started?</h4>

			<p>FLY BUY started in early 2020s. It all started with our team
				who worked tirelessly to make this wild dream into an business.</p>
		</div>
		<div align="right">
			<h4>Who all were in FLY BUY idea stareted?</h4>

			<p>When we started FLY BUY, our team was of five. We used to do
				all work of FLY BUY from wrapping up packages and delivering them.
				The team consisted of Ankit Singh, Amit Mandal, Himnish Arora,
				Sachin Yadav and Manoj. It's too good to work with them.</p>
		</div>
		<div align="left">
			<h4>What we offer?</h4>

			<p>We offer a range of products from Mobiles to Clothes. We
				currently have 7+ categories and a range of Products to offer. We
				are expanding.</p>
		</div>
		<div align="right">
			<h4>How we work??</h4>

			<p>FLY BUY is an e-commerce which factilate things to buy from
				our portal and the order will be arriving on your door step.</p>
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
