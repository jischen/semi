<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 중복검사 </title>



</head>
<body>
	<div style="text-align: center">
		<h3>아이디 중복확인</h3>
		<form method="post" action="id_overlap_check.do">
			아이디 : <input type="text" name="request_id" maxlength="20" autofocus>
			<input type="submit" value="중복확인">
		</form>
		<div>아이디는 5~20자 영문 또는 숫자만 입력해주세요</div>
	</div>
	<script>
		function blankCheck(f) {
			var id = f.id.value;
			if (id.length < 5 || id.length<21) {
				alert("아이디는 5자 이상  20이하로 입력해주십시오.");
				return false;
			}//if end
			return true;
		}//blankCheck() end
	</script>
	
		<%if(request.getParameter("no") != null){ %>
	<h4 align="center"><font color="red">  는 사용이 불가능합니다.</font></h4>
	
	<%} %>
	
	
		<%if(request.getParameter("ok") != null){ %>
	<h4 align="center">  사용이가능합니다.</font></h4>
	

	<%} %>
	
	
</body>
</html>