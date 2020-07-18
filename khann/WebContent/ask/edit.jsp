<%@page import="beans.dto.MemberDto"%>
<%@page import="beans.dto.AskDto"%>
<%@page import="beans.dao.AskDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int ask_no = Integer.parseInt(request.getParameter("ask_no"));
	AskDao adao = new AskDao();
	AskDto adto = adao.get(ask_no);
	
	MemberDto user = (MemberDto)session.getAttribute("userinfo");
	boolean isAdmin = user.getGrade().equals("관리자");
%>    

<!-- sun editor CDN -->
<link
	href="https://cdn.jsdelivr.net/npm/suneditor@latest/dist/css/suneditor.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/suneditor@latest/dist/suneditor.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/suneditor@latest/src/lang/ko.js"></script>
<script>
	window.addEventListener("load", function(){
		//에디터 생성
		window.editor = SUNEDITOR.create(
		//적용대상
		document.querySelector('#askedit'),
		//적용옵션
		{
			lang : SUNEDITOR_LANG['ko'],
			width : "100%",
			height : "250px",
			buttonList : [
					[ 'font', 'fontSize', 'formatBlock' ],
					[ 'bold', 'underline', 'italic', 'strike' ],
					[ 'fontColor', 'hiliteColor', 'outdent', 'indent', 'align',
							'table' ], [ 'fullScreen', 'codeView' ] ],

		});
	});
	
	//폼을 전송하기 전 수행할 함수
	//-true를 반환하면 전송을 하겠다는 의미
	function formCheck() {
		//console.log(editor);
		//console.log(editor.getContents());
		var content = editor.getContents();
		//console.log(content);

		if (!content || content == "<p><br></p>") {
			window.alert("내용을 반드시 작성하세요");
			return false;
		} else {
			var textarea = editor.getContext().element.originElement;
			textarea.value = content;

		}
		return true;
	}
</script>   
<jsp:include page="/template/header.jsp"></jsp:include>

<article class="w-90">
	<div class="row"><h2>게시글 수정</h2></div>
	
	<!-- 테이블 -->
	<form action="edit.do" method="post" onsubmit="return formCheck();">
	<div class="row">
		<input type="hidden" name="ask_no" value="<%=ask_no%>">
		<%if(!isAdmin){ %>
		<input type="hidden" name="ask_head" value="미답변">
		<%} %>
		<table class= "table table-border">
			<tbody>
				<%if(isAdmin){ %>
				<tr>
					<th>말머리</th>
					<td>
						<select name="ask_head">
							<option value="답변완료">답변완료</option>
							<option value="미답변">미답변</option>
						</select>
					</td>
				</tr>
				<%}%>
				<tr>
					<th>제목</th>
					<td>
						<input type="text" name="ask_title" size="75" required value="<%=adto.getAsk_title()%>">
					</td>
				</tr>
				<tr>
					<th>내용</th>
					<td>
						<textarea name="ask_content" id="askedit" rows="15" cols="77"><%=adto.getAsk_content()%></textarea>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
	
	<!-- 수정 버튼 -->
	<div class="row right">
		<input class="form-btn form-inline" type="submit" value="수정">
	</div>
	</form>
</article>

<jsp:include page="/template/footer.jsp"></jsp:include>