<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="en">
<head>
<%@ include file="../includes/header.jsp"%>
</head>
<body>
	<!--Section-1-->
	<section class="section-1">
		<div class="jumbotron d-flex align-items-center">
			<div class="gradient"></div>
			<div class="container-fluid content">
				<h1 data-aos="fade-right" data-aos-delay="300">축구영상</h1>
				<h2 data-aos="fade-left" data-aos-delay="300">유명구단들의 유튜브 공식
					영상입니다.</h2>
			</div>
			<!--container-fluid end-->
		</div>
	</section>

	<!--Section-5-->
	<section class="portfolio">
		<div class="container">
			<div class="row">
				<div class="col-sm-12 col-12">
					<h3>Videos</h3>
					<h5>${teamname }</h5>
					<a href="videos?teamname=Tottenham Hotspur"><img
						src="resources/images/Tottenham.jpg" height="50px"></a> <a
						href="videos?teamname=Manchester United"><img
						src="resources/images/ManU.jpg" height="50px"></a> <a
						href="videos?teamname=Manchester City"><img
						src="resources/images/ManCity.jpg" height="50px"></a> <a
						href="videos?teamname=Arsenal"><img
						src="resources/images/Arsenal.jpg" height="50px"></a> <a
						href="videos?teamname=Liverpool"><img
						src="resources/images/Liverpool.jpg" height="50px"></a> <a
						href="videos?teamname=Chelsea"><img
						src="resources/images/Chelsea.jpg" height="50px"></a> <a
						href="videos?teamname=Real Madrid"><img
						src="resources/images/RealMadrid.jpg" height="50px"></a> <a
						href="videos?teamname=Barcelona"><img
						src="resources/images/Barcelona.jpg" height="50px"></a> <a
						href="videos?teamname=Atlético Madrid"><img
						src="resources/images/Atletico.jpg" height="50px"></a> <a
						href="videos?teamname=Valencia"><img
						src="resources/images/Valencia.jpg" height="50px"></a> <a
						href="videos?teamname=Juventus"><img
						src="resources/images/Juventus.jpg" height="50px"></a> <a
						href="videos?teamname=AC Milan"><img
						src="resources/images/Milan.jpg" height="50px"></a> <a
						href="videos?teamname=Inter Milan"><img
						src="resources/images/Inter.jpg" height="50px"></a> <a
						href="videos?teamname=Roma"><img
						src="resources/images/Roma.jpg" height="50px"></a> <a
						href="videos?teamname=Bayern München"><img
						src="resources/images/BayernMunchen.jpg" height="50px"></a> <a
						href="videos?teamname=Borussia Dortmund"><img
						src="resources/images/Dortmund.jpg" height="50px"></a><br>
				</div>
			</div>
		</div>
		<hr>
		<div class="container-fluid">
			<!--row-->
			<div class="row" data-aos="fade-up" data-aos-delay="300">
				<c:forEach items="${arr }" var="arr" varStatus="status">
					<a href="${arr.href }" data-toggle="lightbox"
						data-gallery="example-gallery" class="col-sm-3 box"> <img
						src="${arr.img_src }" class="img-fluid">
						<div class="overlay">
							<img src="resources/images/plus-img.png" alt="plus-icon">
							<div class="inner-text">
								<h4>${arr.title }</h4>
							</div>
						</div>
					</a>
					<c:if test="${status.index%4==3 }">
			</div>
			<!--/row-->
			<!--row-->
			<div class="row" data-aos="fade-up" data-aos-delay="300">
				</c:if>
				</c:forEach>
			</div>
			<div class="load-more">
				<c:if test="${prevPageToken ne ''}">
					<button type="button" class="btn btn-secondary"
						onclick="location.href='videos?pageToken=${prevPageToken }&teamname=${teamname }'">go
						back</button>
				</c:if>
				<c:if test="${nextPageToken ne ''}">
					<button type="button" class="btn btn-secondary"
						onclick="location.href='videos?pageToken=${nextPageToken }&teamname=${teamname }'">load
						more</button>
				</c:if>
			</div>
		</div>
		<!--/row-->
		</div>
		<!--container-->
	</section>

	<section class="section-7">
		<!-- Footer -->
		<%@ include file="../includes/footer.jsp"%>
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
