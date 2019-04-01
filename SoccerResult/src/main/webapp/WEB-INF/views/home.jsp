<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="en">

<head>
<title>SoccerResult</title>
<%@ include file="includes/header.jsp"%>
</head>

<body>
	<!--Section-1-->
	<section class="section-1">
		<div class="jumbotron d-flex align-items-center">
			<div class="gradient"></div>
			<div class="container-fluid content">
				<h1 data-aos="fade-up" data-aos-delay="100">뉴스</h1>
				<h2 data-aos="fade-left" data-aos-delay="300">국내, 해외축구에 대한 주요
					뉴스입니다.</h2>
			</div>
			<!--container-fluid end-->
		</div>
	</section>

	<section class="section-3">
		<div class="container">
			<div class="row m-0">
				<div class="col-lg-7 col-md-12 p-0" data-aos="fade-right"
					data-aos-delay="300" style="max-width: 500px; overflow: hidden;">
					<h2>한국축구 주요뉴스</h2>
					<figure>
						<c:forEach items="${arr1 }" var="arr1" begin="0" end="0">
							<div align="center">
								<a href="${arr1.href }" target="_blank" align="center"><img
									src="${arr1.img }" height="400px" style="max-width: initial;"></a>
							</div>
							<div>
								<br>
								<h4 style="font-size: 20px">
									<a href="${arr1.href }" target="_blank">${arr1.title }</a>
								</h4>
								<hr>
							</div>

							<h5 style="font-size: 15px">
								<a href="${arr1.href }" target="_blank"><span>${arr1.desc }</span></a>
							</h5>
						</c:forEach>
					</figure>
				</div>
				<div class="col-lg-5 col-md-12 p-0" data-aos="fade-left"
					data-aos-delay="300">
					<br> <br> <br>
					<ul>
						<c:forEach items="${arr1 }" var="arr1" begin="1" end="5">
							<li><a href="${arr1.href }"><i class="fa fa-angle-right"
									aria-hidden="true"></i>${arr1.title }</a></li>
						</c:forEach>
					</ul>
				</div>
			</div>
		</div>
	</section>
	<br>
	<section class="section-3">
		<div class="container">
			<div class="row m-0">
				<div class="col-lg-7 col-md-12 p-0" data-aos="fade-right"
					data-aos-delay="300" style="max-width: 500px; overflow: hidden;">
					<br> <br>
					<figure>
						<c:forEach items="${arr2 }" var="arr2" begin="0" end="0">
							<div align="center">
								<a href="${arr2.href }" target="_blank" align="center"><img
									src="${arr2.img }" height="400px" style="max-width: initial;"></a>
							</div>
							<div>
								<br>
								<h4 style="font-size: 20px">
									<a href="${arr2.href }" target="_blank">${arr2.title }</a>
								</h4>
								<hr>
							</div>
							<h5 style="font-size: 15px">
								<a href="${arr2.href }" target="_blank"><span>${arr2.desc }</span></a>
							</h5>
						</c:forEach>
					</figure>
				</div>
				<div class="col-lg-5 col-md-12 p-0" data-aos="fade-left"
					data-aos-delay="300">
					<br> <br> <br>
					<ul>
						<c:forEach items="${arr2 }" var="arr2" begin="1" end="5">
							<li><a href="${arr2.href }"><i class="fa fa-angle-right"
									aria-hidden="true"></i>${arr2.title }</a></li>
						</c:forEach>
					</ul>
				</div>
			</div>
		</div>
	</section>
	<br>

	<section class="section-3">
		<div class="container">
			<h2>해외축구 주요뉴스</h2>
			<div class="row m-0">
				<c:forEach items="${arr3 }" var="arr3" varStatus="status">
					<c:if test="${status.index%10==0 }">
						<div class="col-lg-7 col-md-12 p-0" data-aos="fade-right"
							data-aos-delay="300" align="center">
							<a href="${arr3.href }" target="_blank"> <img
								src="${arr3.img }" height="200px"></a><br> <b><a
								href="${arr3.href }" target="_blank">${arr3.title }</a></b> <br>
						</div>
						<div class="col-lg-5 col-md-12 p-0" data-aos="fade-left"
							data-aos-delay="300">
					</c:if>
					<c:if test="${status.index%10!=0 }">
						<a href="${arr3.href }" target="_blank" style="font-size: 13px;">${arr3.title }</a>
						<br>
					</c:if>
					<c:if test="${status.index%10==9 }">
						<hr>
			</div>
			</c:if>
			</c:forEach>
		</div>
		</div>
	</section>

	<section class="section-7">
		<!-- Footer -->
		<%@ include file="includes/footer.jsp"%>
		<!-- Footer -->
	</section>

	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
		integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/ekko-lightbox/5.3.0/ekko-lightbox.js"></script>
	<script src="resources/js/animate.js"></script>
	<script src="resources/js/custom.js"></script>
	<script>
		$(document).on('click', '[data-toggle="lightbox"]', function(event) {
			event.preventDefault();
			$(this).ekkoLightbox();
		});
	</script>
</body>

</html>
