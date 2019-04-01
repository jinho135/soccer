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
				<h1 data-aos="fade-right" data-aos-delay="300">4대리그 경기 일정 및 결과</h1>
				<h2 data-aos="fade-left" data-aos-delay="300">1달 기준으로 요약된 정보를 볼 수 있습니다.</h2>
			</div>
			<!--container-fluid end-->
		</div>
	</section>

	<!--Services-->
	<section class="services">
		<div class="container">
			<h2>Competitions</h2>
			<div class="row">
				<div class="col-sm-12 col-12 box-1" data-aos="fade-up"
					data-aos-delay="300">
					<div class="row box">
						<div class="col-sm-1 col-12">
							<img src="resources/images/Premier_League_logo.png" height="70"
								width="60" aria-hidden="true">
						</div>
						<div class="col-sm-11 col-12">
							<br>
							<h3>
								<a href="https://www.premierleague.com/" target="_sub">Premier-League</a>
							</h3>
							<table style="text-align:center">
								<c:forEach items="${arr }" var="matches" begin="0" end="0">
									<c:forEach items="${matches }" var="data">
										<tr>
											<td width="100">${data.date }</td>
											<td width="250">${data.team1 }</td>
											<td width="100">${data.score_time }</td>
											<td width="250">${data.team2 }</td>
										</tr>
									</c:forEach>
								</c:forEach>
							</table>
						</div>
					</div>
				</div>
				<div class="col-sm-12 col-12 box-2" data-aos="fade-up"
					data-aos-delay="300">
					<div class="row box">
						<div class="col-sm-1 col-12">
							<img src="resources/images/Serie_A_logo.png" height="70"
								width="60" aria-hidden="true">
						</div>
						<div class="col-sm-11 col-12">
							<br>
							<h3>
								<a href="http://www.legaseriea.it/it" target="_sub">Serie-A</a>
							</h3>
							<table style="text-align:center">
								<c:forEach items="${arr }" var="matches" begin="1" end="1">
									<c:forEach items="${matches }" var="data">
										<tr>
											<td width="100">${data.date }</td>
											<td width="250">${data.team1 }</td>
											<td width="100">${data.score_time }</td>
											<td width="250">${data.team2 }</td>
										</tr>
									</c:forEach>
								</c:forEach>
							</table>
						</div>
					</div>
				</div>
				<div class="col-sm-12 col-12 box-2" data-aos="fade-up"
					data-aos-delay="300">
					<div class="row box">
						<div class="col-sm-1 col-12">
							<img src="resources/images/Primera_Division_logo.png" height="70"
								width="60" aria-hidden="true">
						</div>
						<div class="col-sm-11 col-12">
							<br>
							<h3>
								<a href="https://www.laliga.es/" target="_sub">Primera-Division</a>
							</h3>
							<table style="text-align:center">
								<c:forEach items="${arr }" var="matches" begin="2" end="2">
									<c:forEach items="${matches }" var="data">
										<tr>
											<td width="100">${data.date }</td>
											<td width="250">${data.team1 }</td>
											<td width="100">${data.score_time }</td>
											<td width="250">${data.team2 }</td>
										</tr>
									</c:forEach>
								</c:forEach>
							</table>
						</div>
					</div>
				</div>
				<div class="col-sm-12 col-12 box-2" data-aos="fade-up"
					data-aos-delay="300">
					<div class="row box">
						<div class="col-sm-1 col-12">
							<img src="resources/images/Bundesliga_logo.png" height="70"
								width="60" aria-hidden="true">
						</div>
						<div class="col-sm-11 col-12">
							<br>
							<h3>
								<a href="https://www.bundesliga.com/de/bundesliga" target="_sub">Bundesliga</a>
							</h3>
							<table style="text-align:center">
								<c:forEach items="${arr }" var="matches" begin="3" end="3">
									<c:forEach items="${matches }" var="data">
										<tr>
											<td width="100">${data.date }</td>
											<td width="250">${data.team1 }</td>
											<td width="100">${data.score_time }</td>
											<td width="250">${data.team2 }</td>
										</tr>
									</c:forEach>
								</c:forEach>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
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
	<script src="resources/js/animate.js"></script>
	<script src="resources/js/custom.js"></script>
</body>

</html>
