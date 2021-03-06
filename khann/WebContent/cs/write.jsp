<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
		document.querySelector('#sample'),
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

<article class="w-90 cl">
	<div class="row"><h2>게시글 작성</h2></div>
	<form action="write.do" method="post" onsubmit="return formCheck();">
	<div class="row">
		<input type="hidden" name="cs_no"
			value="<%=request.getParameter("cs_no")%>">
		<table class="table table-border">
			<tbody>
				<tr>
					<th>말머리</th>
					<td><select name="cs_head">
							<option value="">말머리 선택</option>
							<option value="영화예매">영화예매</option>
							<option value="회원제도">회원제도</option>
							<option value="회원정보">회원정보</option>
							<option value="카드할인">카드할인</option>
							<option value="기타">기타</option>
					</select></td>
				</tr>
				<tr>
					<th>제목</th>
					<td><input type="text" name="cs_title" size="90%" required></td>
				</tr>

				<tr>
					<th>내용</th>
					<td><textarea name="cs_content" rows="15" cols="77"
							id="sample"></textarea>
				</tr>
			</tbody>
		</table>
	</div>
	<!-- 작성 버튼 -->
	<div class="row center"><input class="form-btn form-inline" type="submit" value="작성"></div>
	</form>
</article>

<jsp:include page="/template/footer.jsp"></jsp:include>