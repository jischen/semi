<%@page import="java.util.ArrayList"%>
<%@page import="beans.dao.ShowDao"%>
<%@page import="beans.dto.ShowDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	
<%
	request.setCharacterEncoding("UTF-8");
	int movie_no = Integer.parseInt(request.getParameter("movie_no"));

	
	//movie_no로 상영관 날짜 받아오고
	//ShowDao sdao = new ShowDao();
	//List<ShowDto> list = sdao.startList(movie_no); 
	//새로운 List를 만들고
	//List<String> dates = new ArrayList<>();
	//list에 있는 값을 dates에 담기
	
	//영화 시간 출력 확인
	//for(ShowDto sdto : list){
		
//		System.out.println(sdto.getShow_start());
	//}
	
	//session.setAttribute("moviedate", list);
	
	//System.out.println(list);
	
	
%>	
	
	
<jsp:include page="/template/header.jsp"></jsp:include>



<head>
    
    <script src="../css/moment.min.js"></script>
    <link rel="stylesheet" type="text/css" href="../css/lightpick.css">
    <script src="../css/lightpick.js"></script>
    
    <script>
        window.onload = function(){
          var options = {
              field:document.querySelector(".picker"),
              format: 'YYYY-MM-DD',
              
              numberOfMonths: 1,
         	  
              
              minDate:new Date(), 
              maxDate:moment(new Date()).add(7,'days'),             	
              
              
              inline:true,
              
          };
            
          var picker = new Lightpick(options);
        };
        
        function dateSelect(){
            
        }
        
        
    </script>
    
</head>
<body >
   <form action="ticketing3.jsp">
   <input type="hidden" value="<%=movie_no%>" name="movie_no">
   
   <input type="text" class="picker" name="select_date">
    
    
   	
   	<input type="submit" value="선택" >
   </form>
</body>
<jsp:include page="/template/footer.jsp"></jsp:include>