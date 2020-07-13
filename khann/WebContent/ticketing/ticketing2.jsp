<%@page import="beans.dao.ShowDao"%>
<%@page import="beans.dto.ShowDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	
<%
	request.setCharacterEncoding("UTF-8");
	int movie_no = Integer.parseInt(request.getParameter("movie_no"));
	// 영화번호로 영화 상영일자를 반환하는 메소드를 만들어서 상영일자를 반환받아요.
	
	ShowDao sdao = new ShowDao();
	List<ShowDto> list = sdao.startList(movie_no); 
	System.out.println(list.size());
	
	for(ShowDto sdto : list){
		System.out.println(sdto.getShow_start().substring(0, 10));
		
	}
	
	
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
         	  
              
              minDate:setDate, 
              
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
   
   <input type="text" class="picker" >
    
    
   	
   	<input type="submit" value="선택" >
   </form>
</body>
<jsp:include page="/template/footer.jsp"></jsp:include>