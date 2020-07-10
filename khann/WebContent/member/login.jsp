<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="/template/header.jsp"></jsp:include>


<style>
* {
	box-sizing: border-box;
}

.login-wrap {
	width: 460px;
	text-align: center;
	margin: 0px auto;
}

/* 태그 4개를 한 번에 부른다 */
.form-input {
	width: 100%;
	margin: 10px 0px;
	padding: 10px;
	font-size: 17px;
	font-family: 고딕;
}

/* 공통점이 아닌 차이점은 각각의 영역에 구현 */
.login-id {
	padding-left: 50px;
	background-image:
		url("https://cdn.icon-icons.com/icons2/1248/PNG/256/user_84308.png");
	background-repeat: no-repeat;
	background-size: 35px;
	background-position: 4px 4px;
}

.login-pw {
	padding-left: 50px;
	background-image:
		url("https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcThsF5jb5cpiZ_PVtF0peEBGIhFjNyNXq7jlQ&usqp=CAU");
	background-repeat: no-repeat;
	background-size: 35px;
	background-position: 4px 4px;
}

.login-submit {
	color: #9D3434;
	background-color: dodgerblue;
	border-width: 1px;
	border-style: solid;
	border-color: black;
}

.login-button {
	background-color: ;
	border-width: 1px;
	border-style: solid;
	border-color: black;
}

.login-checkbox-wrap {
	text-align: left;
}
</style>


	 <div class="login-wrap">
		<h1>로그인</h1>
		
		<form action="login.do" method="post">
			<!-- 아이디 입력창 -->
			<input class="form-input login-id" type="text" name="member_id"
				required>

			<!-- 비밀번호 입력창 -->
			<input class="form-input login-pw" type="password" name="member_pw"
				required>
			<%
				if (request.getParameter("error") != null) {
			%>
			<!-- 오류 메시지는 페이지에 error라는 파라미터가 있을 경우만 출력 -->
			<h4>
				<font color="#FF0000">입력하신 로그인 정보가 맞지 않습니다</font>
			</h4>
			<%
				}
			%>
	
            
			<div class="login-checkbox-wrap">
				<input class="login-checkbox" type="checkbox" name="autologin">
				자동로그인
			</div>
			
			<div>
			<!-- 로그인 버튼 -->
			<input class="form-input login-submit" type="submit" value="로그인">
		</div>	
					</form>
		
			
            
            <div align="center">
			<a href="http://localhost:8080/khann/member/find_id.jsp">아이디 찾기</a> <a
				href="#">비밀번호 찾기 </a> <br>
			</div>
				</form>
				<hr>
   
   		 <div>
		<!-- 가입 버튼 -->
		<button class="form-input login-button" type="button"
			onclick="location.href='../member/join_term_check.jsp' ">회원가입</button>

		</div>
	
		
  </div>
	


<jsp:include page="/template/footer.jsp"></jsp:include>






