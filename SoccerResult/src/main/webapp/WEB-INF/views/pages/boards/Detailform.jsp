<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>
<html lang="en">

<head>
<%@ include file="../../includes/header.jsp"%>
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
					<form>
						<div>
							<div align="center">
								<table>
									<tr>
										<th>Title</th>
										<td width="600" align="center">${dto.title }</td>
									</tr>
									<tr>
										<th>Wirter</th>
										<td align="center">${dto.writer }</td>
									</tr>
									<tr>
										<th>Content</th>
										<td valign="top" height="200">${dto.content }</td>
									</tr>
									<tr>
										<td colspan="2" align="right"><input type="password"
											name="password" id="password" placeholder="비밀번호"> <input
											type="button" id="btnUpdate" name="btnUpdate" value="수정">
											<input type="button" id="btnDelete" name="btnDelete"
											value="삭제"></td>
									</tr>
									<tr>
										<td colspan="2" align="center"><input type="button"
											onclick="btnReply(${dto.groups },${dto.levels },${dto.steps })"
											value="답글쓰기"></td>
									</tr>
								</table>
							</div>
						</div>
					</form>
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
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
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
	<script>
	$(document).ready(function() {
		$("#btnUpdate").click(function() {
			$.ajax({
				url : "passcheck",
				type : "post",
				data : {
					"seq" : "${dto.seq }",
					"password" : $("#password").val(),
				},
				success : function(data) {
					if (data == "1") {
						location.href = "Updateform?seq=${dto.seq }";
					} else {
						alert("비밀번호가 틀렸습니다.");
					}
				}
			});
		})
		$("#btnDelete").click(function() {
			$.ajax({
				url : "passcheck",
				type : "post",
				data : {
					"seq" : "${dto.seq }",
					"password" : $("#password").val(),
				},
				success : function(data) {
					if (data == "1") {
						location.href = "delete?seq=${dto.seq }";
					} else {
						alert("비밀번호가 틀렸습니다.");
					}
				}
			});
		})
	})
	function btnReply(groups, levels, steps) {
		location.href = "Replyform?groups="+groups+"&levels="+levels+"&steps="+steps;
	}
	</script>
</body>

</html>
