
<%@page import="beans.dto.TheaterDto"%>
<%@page import="beans.dao.TheaterDao"%>
<%@page import="beans.dto.MovieDto"%>
<%@page import="beans.dao.MovieDao"%>
<%@page import="beans.dto.MemberDto"%>
<%@page import="beans.dto.ShowDto"%>
<%@page import="beans.dao.ShowDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>


<%
   int show_no = Integer.parseInt(request.getParameter("show_no"));

MemberDto user = (MemberDto) session.getAttribute("userinfo");
boolean isLogin = user != null;

ShowDao sdao = new ShowDao();
ShowDto sdto = sdao.get(show_no);

//movie_no   

MovieDao mdao = new MovieDao();
MovieDto mdto = mdao.get(sdto.getMovie_no());

TheaterDao tdao = new TheaterDao();
TheaterDto tdto = tdao.get(sdto.getTheater_no());
%>

<jsp:include page="/template/header.jsp"></jsp:include>

<link rel="stylesheet" type="text/css" href="../css/base.css">
<style>
article {
   border: 2px solid black;
   height: 200px;
}

.sedit {
   width: 200px;
   font-weight: 700;
   background-color: firebrick;
}
</style>
</head>
<body>




   <div id="dh-content" style="margin-left: 320px">
      <form action="show_content.do" method="post">



         <h2>상영 등록이 완료되었습니다!</h2>

         <div>

            <br>

            <div class="sedit">영화제목</div>
            <div>
               <%=mdto.getMovie_name()%>

            </div>

            <div class="sedit">상영관 이름</div>
            <div>
               <%=tdto.getTheater_name()%>
            </div>

            <div class="sedit">상영 시작시간</div>

            <div><%=sdto.getShow_start()%>
            </div>
         </div>


         <div>
            <%
               if (isLogin) {
            %>
            <div>
               <a
                  href="/khann/show/show_list.jsp">상영리스트 확인하기</a>
            </div>
            <div>
               <a href="/khann/show/show_edit.jsp?show_no=<%=sdto.getShow_no()%>">수정하기</a>
            </div>
            <div>
               <a
                  href="/khann/show/show_delete.jsp?show_no=<%=sdto.getShow_no()%>">삭제하기</a>
            </div>
            <%
               }
            %>
         </div>
   </div>

   </form>

   </div>
</body>
</html>

<jsp:include page="/template/footer.jsp"></jsp:include>