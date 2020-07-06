<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/template/header.jsp"></jsp:include>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>쿠팡 로그인</title>
    <style>
        * {
            box-sizing: border-box;
        }
        .login-wrap {
            width:460px;
            text-align: center;
            margin: 0px auto;
        }
        
        /* 태그 4개를 한 번에 부른다 */
        .form-input {
            width:100%;
            margin: 10px 0px;
            padding:10px;
            font-size: 17px;
            font-family: 고딕;
        }
        
        /* 공통점이 아닌 차이점은 각각의 영역에 구현 */
        .login-id {
            padding-left: 50px;
            
            background-image: url("https://placehold.it/35x35");
            background-repeat: no-repeat;
            background-size: 35px;
            background-position: 4px 4px;
        }
        .login-pw {
            padding-left: 50px;
            
            background-image: url("https://placehold.it/35x35");
            background-repeat: no-repeat;
            background-size: 35px;
            background-position: 4px 4px;
        }
        .login-submit {
            color: white;
            background-color: dodgerblue;
            border-width: 1px;
            border-style: solid;
            border-color: black;
        }
        .login-button {
            background-color: white;
            border-width: 1px;
            border-style: solid;
            border-color: black;
        }
        .login-checkbox-wrap{
            text-align: left;
        }
    </style>
</head>
<body>
    <div class="login-wrap">
        <!-- 제목 -->
        <h1 class="logo">
            <font color="maroon">cou</font
            ><font color="red">p</font
            ><font color="orange">a</font
            ><font color="lightgreen">n</font
            ><font color="lightskyblue">g</font>
        </h1>        
        
        <!-- 폼 -->
        <form action="?" method="post">
            <!-- 아이디 입력창 -->
            <input class="form-input login-id" type="text" name="member_id" required>

            <!-- 비밀번호 입력창 -->
            <input class="form-input login-pw" type="password" name="member_pw" required>                                    
            
            <!-- 
            자동로그인 선택 체크박스 
            - 여러 항목으로 구성된 경우 div 등으로 감싸 한 덩어리로 묶어준다
            -->
            <div class="login-checkbox-wrap">
            <input class="login-checkbox" type="checkbox" name="autologin"> 자동로그인
            </div>
            
            <!-- 로그인 버튼 -->
            <input class="form-input login-submit" type="submit" value="로그인">
        </form>
        
        <hr>
        
        <!-- 가입 버튼 -->
        <input class="form-input login-button" type="button" value="회원가입">
        
        <!-- 쿠팡 저작권 글자 : 글자는 무조건 태그 내에 사용 -->
        <div class="login-copyright">
            &copy; Coupang Corp. All right reserved.            
        </div>
        
    </div>
</body>
</html>

<div align="center">
	
	<h2>로그인</h2>
	
	<form action="login.do" method="post">
		<table border="0">
			<tbody>
				<tr>
					<td>
						<input type="text" name="member_id" required>
					</td>
				</tr>
				<tr>
					<td>
						<!-- paddind으로 그림넣기 --><input type="password" name="member_pw" required>
					</td>
				</tr>
			</tbody>
			<tfoot>
				<tr align="center">
					<td colspan="3">
						<input type="submit" value="Login">
					</td>
				</tr>
				<tr align="center">
					<td colspan="2">
						<a href="http://localhost:8080/khann/member/find_Id.jsp">아이디가 기억나지 않습니다</a>
						<br>
						<a href="#">비밀번호가 기억나지 않습니다</a>
					</td>
				</tr>
			</tfoot>
		</table>
	</form>	
	
	<%if(request.getParameter("error") != null){%>
		<!-- 오류 메시지는 페이지에 error라는 파라미터가 있을 경우만 출력 -->
		<h6><font color="#FF0000">입력하신 로그인 정보가 맞지 않습니다</font></h6>
	<%} %>
	
</div>

<jsp:include page="/template/footer.jsp"></jsp:include>






