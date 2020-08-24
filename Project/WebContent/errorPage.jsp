<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" type="image/png" href="img/logo.png">

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css?family=Josefin+Sans"
	rel="stylesheet">
<meta charset="ISO-8859-1">
<title>FLY BUY-Error</title>
<link rel="stylesheet" href="css/errorpage.css">
</head>
<%
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
response.setHeader("Pragma", "no-cache");
response.setHeader("Expires", "0");
%>
<body>
	<div class="container-fluid text-center">
		<div class="row">
			<div class="col-md-6 pull-right">
				<br> <br> <img src="img/error.png" width="400"
					class="mt-2 emoji">
			</div>
			<div class="col-md-6">
				<div class="pull-left">
					<h3 class="not-found">We are currently facing an error</h3>
					<br>
					<h2>Please try again !!</h2>
					<h2></h2>

					<div class="text-center mt-4 mb-5">

						<a class="btn btn-success send px-3" href="index.jsp"
							role="button">Home Page</a> <a
							class="btn btn-success send ml-2 px-3" href="#" role="button">Contact
							us</a>

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

</body>
</html>