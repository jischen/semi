
<%@page import="beans.dao.ShowDao"%>
<%@page import="beans.dto.ShowDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/template/header.jsp"></jsp:include>

<%
	
%>


<link rel="stylesheet" type="text/css" href="../base.css">
<style>
.showinsert {
	background-color: lightgray;
}

.show_form {
	width: 300px;
	margin: auto;
	border: 1px;
	background-color: whitesmoke;
}

.submitclick {
	width: 200px;
}

.submitclick {
	width: 200px;
	height: 30px;
}

.showform:hover {
	background-color: aliceblue;
}
</style>
</head>

<body>
	<div id="dh-content" style="margin-left: 320px">
		<form action="show_insert.do" method="post">
			<h2>상영시간 등록</h2>

			<div class="show_form">

				<div class="showinsert">
					<div class="showname">
						<label id="show_insert">영화 이름</label>
						<div class="showback">
							<input type="text" class="showform" name="movie_name"
								placeholder="상영관 이름">

						</div>
					</div>
				</div>
				<div class="showinsert">

					<div class="showno">
						<label id="show_insert">상영관 이름</label>
						<div class="showback">
							<input type="text" class="showform" name="theater_name"
								placeholder="상영관 번호">
						</div>

					</div>
				</div>

				<div class="showinsert">
					<div class="movieshowtime">
						<label id="show_insert">상영관 시작시간</label>
						<div class="showback">
							<input type="text" class="showform" name="show_start"
								placeholder="2017-01-01 00:00:00">
						</div>

					</div>

					<div>
						<input type="submit" class="submitclick" value="등록">

					</div>
				</div>
			</div>
		</form>
	</div>
</body>

<jsp:include page="/template/footer.jsp"></jsp:include>