<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>
<html lang="en">

<head>
<%@ include file="../includes/header.jsp"%>
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
					<form>
						<div class="form-group row">
							<hr>
							<div align="center">
								<table>
									<tr>
										<th width="100">번호</th>
										<th width="500">제목</th>
										<th width="100">작성자</th>
										<th width="150">작성일</th>
										<th width="100">조회</th>
									</tr>
									<c:forEach items="${boardlist }" var="lists">
										<tr>
											<td>${lists.seq }</td>
											<td><c:forEach begin="2" end="${lists.levels }" step="1">
													&nbsp;&nbsp;
												</c:forEach> <c:if test="${lists.levels!=0 }">
													<img src="resources/images/re.gif">
												</c:if> <c:if test="${fn:length(lists.title)<=20 }">
													<a href="detail?seq=${lists.seq }">${lists.title }</a>
												</c:if> <c:if test="${fn:length(lists.title)>20 }">
													<a href="detail?seq=${lists.seq }">${fn:substring(lists.title ,0,20)
														}...</a>
												</c:if></td>
											<td>${lists.writer }</td>
											<td>${lists.regdate }</td>
											<td>${lists.hitcount }</td>
										</tr>
									</c:forEach>
								</table>
								<div align="right">
									<input type="button" value="글쓰기"
										onclick="location.href='Writeform'">
									<div align="center">
										<div align="center">
											<form action="list" method="post">
												<select id="field" name="field">
													<option value="title">제목</option>
													<option value="content">본문</option>
													<option value="writer">작성자</option>
												</select> <input type="text" id="word" name="word"> <input
													type="submit" value="검색">
											</form>
										</div>
									</div>
								</div>
								<div align="center">
									<!-- 이전 -->
									<c:if test="${startpage>blockpage }">
										<a
											href="/soccer/board?pageNum=${startpage-blockpage}&field=${field }&word=${word }">[이전]</a>
									</c:if>
									<!-- 페이지출력 -->
									<c:forEach begin="${startpage }" end="${endpage }" var="i">
										<c:if test="${i==currentPage }">
				${i }
			</c:if>
										<c:if test="${i!=currentPage }">
											<a
												href="/soccer/board?pageNum=${i }&field=${field }&word=${word }">[${i }]</a>
										</c:if>
									</c:forEach>
									<!-- 다음 -->
									<c:if test="${endpage<totpage }">
										<a
											href="/soccer/board?pageNum=${endpage+1}&field=${field }&word=${word }">[다음]</a>
									</c:if>
								</div>
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
