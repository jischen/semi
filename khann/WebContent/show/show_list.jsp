<%@page import="beans.dto.ShowDto"%>
<%@page import="java.util.List"%>
<%@page import="beans.dao.ShowDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 상영 목록 -->


<% 

	ShowDao sdao=new ShowDao();
	List<ShowDto>list=sdao.getList();

	ShowDto edto=new ShowDto();
	
	
	

%>
<jsp:include page="/template/header.jsp"></jsp:include>
 <link rel="stylesheet" type="text/css" href="../base.css">
    <style>
        
      
        .showlist {
           
            margin: auto;
            padding: 1px;
            width: 400px;
            height: 30px;


        }

        .show_span {
            border: 1px solid black;
            background-color: firebrick;
            color: white;
            font-size: 16px;
        }
    </style>

</head>

<body>

    <div id="dh-content" style="margin-left:320px">
        	<form action="show_list.do" method="post">
	<h2>상영 리스트</h2>
       	<%for(ShowDto sdto:list) {%>
       
        <div class="show">
            <div class="showlist">

                <span class="show_span">상영번호</span>
                <%=sdto.getShow_no() %>
            </div>


            <div class="showlist">
                <span class="show_span">영화이름</span>
                <%=sdto.getMovie_no() %>
            </div>


            <div class="showlist">
                <span class="show_span">상영관이름</span>
                <%=sdto.getTheater_no() %>

            </div>


            <div class="showlist">
                <span class="show_span">시작시간</span>
              <%=sdto.getShow_start()%>     
                </div>

        </div>
               	<a href="/khann/index.jsp"><input type="button" value="홈으로 돌아가기"></a>
		<a href="/khann/show/show_insert.jsp"><input type="button" value="등록하러가기"></a>
                </form>
                
                
           <%} %>    
                </div>
       
          
    
</body></html>
<jsp:include page="/template/footer.jsp"></jsp:include>
    
    
    