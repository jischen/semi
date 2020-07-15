<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/base.css">

<body style="margin-top:100px">


	 <div class="login-wrap">
	 <div id="login-logo">
				<a href="/khann/index.jsp"> <img
					src="<%=request.getContextPath()%>/img/logo2.png" width="200" height="200">
				</a>
				<h1>로그인</h1>
</div>
<hr>
<div style="text-align:left;color:gray;"><a class="decox" href="<%=request.getContextPath()%>">홈</a>>로그인</div>

	 

		
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
		
			
            
            <div  style="text-align:left">
            <ul>
            <li>
			<a class="decox" href="http://localhost:8080/khann/member/find_id.jsp">아이디/비밀번호 찾기</a>
			</li>
			<li>
			<button class="button-form" type="button"
			onclick="location.href='../member/join_term_check.jsp' ">회원가입</button>
			</li>
			</ul>
			<br>
			</div>
				</form>
				<hr>
  
   		 <div>
		<!-- 가입 버튼 -->


		</div>
	
</div>
</body>






