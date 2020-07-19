
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<jsp:include page="/template/header.jsp"></jsp:include>

<div>

	<div>
		<font class="cb" size="5"> KHANN</font>
	</div>
	<hr>

	<div>
		<pre class="cm">
  KHANN CINEMA는 2020년에 오픈한 신생 극장입니다. ^O^ 
  저희 극장에서는 항상 고객님들을 위한 이벤트를 준비하고 있습니다. 쾌적한 영화관람 환경을 위해서 항상
  노력하고 있습니다. 저희 KHANN CINEMA는 사회 소외계층  문화 지원 사업 국군장병 무료 관람등
  사회에 기여하기 위한 노력도 아끼지 않고 있습니다. 지역 주민들이 문화공간으로서  오래 오래 함께하고 싶습니다. 
  부디 많은 사랑과 관심 부탁드립니다. 찡끗 >__O  </pre>
	</div>


	<img src="<%=request.getContextPath()%>/img/cinemaintro.png">

	<div>
		<font class="cb" size="5"> 이용안내</font>
	</div>
	<hr>
	<table class="table table-bordered">
		<tbody>
			<tr>
				<td style=		"text-align: center;" bgcolor="#f5f5f5" width="20%"><span><b
						class="cm">상영작</b></span></td>
				<td bgcolor="#ffffff"><span class="cm">전국
						동시개봉 최신 영화</span></td>
			</tr>
			<tr>
				<td style="text-align: center;" bgcolor="#f5f5f5" width="20%"><span
					><b class="cm">관람료</b></span></td>
				<td bgcolor="#ffffff">
					<p>
						<span class="cm">2D(일반영화) : 6,000원</span>
					</p>
					<p>
						<span class="cm" >3D영화 : 8,000원</span>
					</p>
				</td>
			</tr>
			<tr>
				<td style="text-align: center;" bgcolor="#f5f5f5" width="20%"><span
					> <b class="cm">상영시간</b></span></td>
				<td bgcolor="#ffffff">
					<p>
						<span class="cm" >오전 10시 ~ 종영시</span>
					</p>
					<p>
						<span class="cm" >- 상영시작 시간과 종영시간은
							영화 및 상영 횟수에 따라 변동될 수 있음</span>
					</p>
				</td>
			</tr>
			<tr>
				<td style="text-align: center;" bgcolor="#f5f5f5" width="20%"><span
					><b class="cm">상영기간 및 요일</b></span></td>
				<td bgcolor="#ffffff"><span class="cm" >365일
						연중무휴</span></td>
			</tr>
			<tr>
				<td style="text-align: center;" bgcolor="#f5f5f5" width="20%"><span
					><b class="cm">휴관일</b></span></td>
				<td bgcolor="#ffffff">
					<p>
						<span class="cm">부득이 휴관하는 경우에는 별도
							공지</span>
					</p>
				</td>
			</tr>
		</tbody>
	</table>

</div>



<jsp:include page="/template/footer.jsp"></jsp:include>