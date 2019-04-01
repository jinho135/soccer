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
				<h1 data-aos="fade-right" data-aos-delay="300">일일 경기 일정 및 결과</h1>
				<h2 data-aos="fade-left" data-aos-delay="300">날짜별로 조회해보세요!</h2>
			</div>
			<!--container-fluid end-->
		</div>
	</section>

	<!-- About Section Start -->
	<div id="daily">
		<div class="container">
			<h3>Daily</h3>
			<div class="row" style="margin-right: 0; margin-left: 0;"
				data-aos="fade-up" data-aos-delay="300">
				<div>
					<p>
						<c:forEach items="${arr }" var="arr">
								${arr }<br>
						</c:forEach>
					</p>
				</div>
				<hr>
				<div>
					<form action="daily">
						<input type="date" name="date" id="date"> <input
							type="submit" value="조회">
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- About Section End -->

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
	<script src="resources/js/animate.js"></script>
	<script src="resources/js/custom.js"></script>
</body>

</html>
