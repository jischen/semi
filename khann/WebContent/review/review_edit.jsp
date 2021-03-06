<%@page import="beans.dto.MovieDto"%>
<%@page import="beans.dao.MovieDao"%>
<%@page import="beans.dto.MemberDto"%>
<%@page import="beans.dto.ReviewDto"%>
<%@page import="beans.dao.ReviewDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

     <% 
     
    
     int review_no=Integer.parseInt(request.getParameter("review_no")); 
     
     ReviewDao rdao= new ReviewDao();
     ReviewDto rdto=rdao.get(review_no);
     
   
    
   
    
    MovieDao mdao=new MovieDao();
    MovieDto mdto=mdao.get((rdto.getReview_movie()));
   
    %>

      <jsp:include page="/template/header.jsp"></jsp:include>
      <div id="dh-content" style="margin-left:320px">
      
  
   <link rel="stylesheet" type="text/css" href="../css/base.css">
   <head>
    <style>
       #revieweditlabel 
        {
            background-color: lightgray;
            
            
            
        }
        
        .revieweditform{
            border:1px;
            background-color:whitesmoke;
        }
        
    </style>
    
</head>
<body>
 
<form action=review_edit.do method="post">
	<div class="review_edit_form">
	
        <h2>리뷰 수정</h2>
        
            <div class="review_edit">
            	<div class="review_edit_num">
            	<label id="revieweditlabel">리뷰번호</label>
            	<input type="text" class="revieweditform" 
            		name="review_no"  value="<%=rdto.getReview_no()%>">
                </div>
                
                <div class="review_edit">
                    <div class="review_movie_form">
                       
                            <label  id="revieweditlabel">리뷰영화</label>
                            <input type="text" class="revieweditform" 
                            name="movie_name" value="<%=mdto.getMovie_name()%>" 
                            placeholder="리뷰영화">
                      
                    </div>

                    <div class="review_edit">
                        <div class="review_writer_form">
                       
                                <label  id="revieweditlabel">작성자ID</label>
                                <input type="text" class="revieweditform"
                                 name="review_writer" value="<%=rdto.getReview_writer()%>" 
                                 placeholder="작성자ID">
                            </div>
                     
                    </div>

                    <div class="review_edit">
                       
                            <label id="revieweditlabel">리뷰내용</label>
                            <br>
                            <textarea name="review_content" 
                           	 value="<%=rdto.getReview_content()%>" 
                             class="revieweditform" placeholder="수정할 내용을 입력해주세요." 
                             rows="7" cols="60">
                    		</textarea>
               			
              		 </div>
              		 
               <div class="review_score_form">
                    <label  id="revieweditlabel">리뷰점수</label>
                    <select name="review_score" >
						<option value="5점">5점</option>
						<option value="4점">4점</option>
						<option value="3점">3점</option>
						<option value="2점">2점</option>
						<option value="1점">1점</option>
					</select>
                </div>
                
				<div>   
					<a href="/khann/review/review_content.jsp?review_no=<%=rdto.getReview_no()%>">
					<input type="submit" value="수정완료"></a>
				</div>
				 
			</div>
		</div>
	</div>
        
</form>
        
       
    
        
</body>
    
         
</div>
<jsp:include page="/template/footer.jsp"></jsp:include>