<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page contentType="text/html;charset=UTF-8"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>Beauty-Line</title>

<!-- Bootstrap Core CSS -->
<link href="/beautyline/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="/beautyline/bootstrap/css/business-casual.css" rel="stylesheet">
<link href="/beautyline/beautyline/css/include.css" rel="stylesheet">

<!-- Fonts -->
<link 	href="https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800" rel="stylesheet" type="text/css">
<link 	href="https://fonts.googleapis.com/css?family=Josefin+Slab:100,300,400,600,700,100italic,300italic,400italic,600italic,700italic" rel="stylesheet" type="text/css">

</head>

<body>
	<c:import url="/WEB-INF/views/include/header.jsp" />

	
	<div class="container">
		<div class="row">
			<div class="box">
				<div class="col-lg-12 text-center">
					<div id="carousel-example-generic" class="carousel slide">
						<!-- Indicators -->
						<ol class="carousel-indicators hidden-xs">
							<li data-target="#carousel-example-generic" data-slide-to="0"
								class="active"></li>
							<li data-target="#carousel-example-generic" data-slide-to="1"></li>
							<li data-target="#carousel-example-generic" data-slide-to="2"></li>
						</ol>

						<!-- Wrapper for slides -->
						<div class="carousel-inner">
							<div class="item active">
								<img class="img-responsive img-full"
									src="bootstrap/img/slide-1.jpg" alt="">
							</div>
							<div class="item">
								<img class="img-responsive img-full"
									src="bootstrap/img/slide-2.jpg" alt="">
							</div>
							<div class="item">
								<img class="img-responsive img-full"
									src="bootstrap/img/slide-3.jpg" alt="">
							</div>
						</div>

						<!-- Controls -->
						<a class="left carousel-control" href="#carousel-example-generic"
							data-slide="prev"> <span class="icon-prev"></span>
						</a> <a class="right carousel-control"
							href="#carousel-example-generic" data-slide="next"> <span
							class="icon-next"></span>
						</a>
					</div>
					<h2 class="brand-before">
						<small>Welcome to</small>
					</h2>
					<h1 class="brand-name">Business Casual</h1>
					<hr class="tagline-divider">
					<h2>
						<small>By <strong>Start Bootstrap</strong>
						</small>
					</h2>
				</div>
			</div>
		</div>

		<div class="row">
			<div class="box">
				<div class="col-lg-12">
					<hr>
					<h2 class="intro-text text-center">
						Build a website <strong>worth visiting</strong>
					</h2>
					<hr>
					<img class="img-responsive img-border img-left"
						src="bootstrap/img/intro-pic.jpg" alt="">
					<hr class="visible-xs">
					<p>The boxes used in this template are nested inbetween a
						normal Bootstrap row and the start of your column layout. The
						boxes will be full-width boxes, so if you want to make them
						smaller then you will need to customize.</p>
					<p>
						A huge thanks to <a href="http://join.deathtothestockphoto.com/"
							target="_blank">Death to the Stock Photo</a> for allowing us to
						use the beautiful photos that make this template really come to
						life. When using this template, make sure your photos are decent.
						Also make sure that the file size on your photos is kept to a
						minumum to keep load times to a minimum.
					</p>
					<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
						Nunc placerat diam quis nisl vestibulum dignissim. In hac
						habitasse platea dictumst. Interdum et malesuada fames ac ante
						ipsum primis in faucibus. Pellentesque habitant morbi tristique
						senectus et netus et malesuada fames ac turpis egestas.</p>
				</div>
			</div>
		</div>

		<div class="row">
			<div class="box">
				<div class="col-lg-12">
					<hr>
					<h2 class="intro-text text-center">
						Beautiful boxes <strong>to showcase your content</strong>
					</h2>
					<hr>
					<p>Use as many boxes as you like, and put anything you want in
						them! They are great for just about anything, the sky's the limit!</p>
					<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
						Nunc placerat diam quis nisl vestibulum dignissim. In hac
						habitasse platea dictumst. Interdum et malesuada fames ac ante
						ipsum primis in faucibus. Pellentesque habitant morbi tristique
						senectus et netus et malesuada fames ac turpis egestas.</p>
				</div>
			</div>
		</div>

	</div>
	<!-- /.container -->
	<c:import url="/WEB-INF/views/include/footer.jsp" />

	

	<!-- jQuery -->
	<script src="bootstrap/js/jquery.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="bootstrap/js/bootstrap.min.js"></script>

	<!-- Script to Activate the Carousel -->
	<script>
		$('.carousel').carousel({
			interval : 5000
		//changes the speed
		})
	</script>

</body>

</html>
