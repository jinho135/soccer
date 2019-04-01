<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!doctype html>
<html lang="en">

<head>
<%@ include file="../../includes/header.jsp"%>
<script type="text/javascript">
	
</script>
</head>

<body>
	<!--Section-1-->
	<section class="section-1">
		<div class="jumbotron d-flex align-items-center">
			<div class="gradient"></div>
			<div class="container-fluid content">
				<h1 data-aos="fade-right" data-aos-delay="300">게시판</h1>
				<h2 data-aos="fade-left" data-aos-delay="300">많은 이용 바랍니다.</h2>
			</div>
			<!--container-fluid end-->
		</div>
	</section>

	<!-- Contact section Start -->
	<div id="contact">
		<div class="container">
			<h3>Board</h3>
		</div>
		<div class="container py-5">
			<div class="row" data-aos="fade-up" data-aos-delay="300">
				<div class="col-md-12">
					<div class="form-group row">
						<hr>
						<div align="center">
							<form action="boardUpdate?seq=${dto.seq }" name="frm" method="post">
								<table>
									<tr>
										<td>작성자</td>
										<td><input type="text" name="writer"
											value="${dto.writer }"></td>
									</tr>
									<tr>
										<td>비밀번호변경</td>
										<td><input type="password" name="password"
											value="${dto.password }"></td>
									</tr>
									<tr>
										<td>제목</td>
										<td><input type="text" name="title" value="${dto.title }"></td>
									</tr>
									<tr>
										<td>내용</td>
										<td><textarea name="content" rows="20" cols="50">${dto.content }</textarea>
									</tr>
									<tr>
										<td colspan="2"><input type="submit" value="수정"></td>
									</tr>
								</table>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Contact section Ended -->

	<section class="section-7">
		<!-- Footer -->
		<%@ include file="../../includes/footer.jsp"%>
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
