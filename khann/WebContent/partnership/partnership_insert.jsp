<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="UTF-8"%>


<script type="text/javascript"
   src="https://cdn.jsdelivr.net/npm/emailjs-com@2.4.1/dist/email.min.js"></script>
<script type="text/javascript">
        (function(){
           emailjs.init("user_75hRUFqFtsTmd6FTBXPKf");
        })();
    </script>
<script type="text/javascript">
        window.onload = function() {
            document.getElementById('contact-form').addEventListener('submit', function(event) {
                event.preventDefault();
                // generate the contact number value
                this.contact_number.value = Math.random() * 100000 | 0;
                emailjs.sendForm('cinemakhann', 'template_HkdZ1sV5', this)
                      .then(function(response){
                           location.href="/khann/partnership/partnership_insert_result.jsp"   
                         
                      });
            });
            
            
            
        }
    </script>

<style>


</style>



<jsp:include page="/template/header.jsp"></jsp:include>

<div id="dh-content2">


   <div align="center">
      <img src="<%=request.getContextPath()%>/img/partnerService.png"
         width="1140" height="350">


      <div style="background-color: #E9E9E9; width: 1140px">
         
         <form id="contact-form">
            <input type="hidden" name="contact_number"> <br>

            <table>
               <tr>
                  <td class="cl">회사명</td>
                  <td width="380"><input name="company_name" type="text"
                     size="50" maxlength="30"></td>
               </tr>
               <tr>
                  <td class="cl">문의자명</td>
                  <td width="380"><input name="contact_name" type="text"
                     size="50" maxlength="30"></td>
               </tr>
               <tr>
                  <td class="cl">연락처</td>
                  <td width="380"><input name="phone_number" type="text"
                     size="50" maxlength="30"></td>
               </tr>
               <tr>
                  <td class="cl">이메일</td>
                  <td width="380"><input name="contact_mail" type="text"
                     size="50" maxlength="30"></td>
               </tr>
               <tr>
                  <td class="cl">제목</td>
                  <td width="380"><input name="title" type="text" size="50"
                     maxlength="30"></td>
               </tr>

               <tr>
                  <td class="cl">내용</td>
                  <td height="30"><textarea style="resize: vertical"
                        name="message_html" cols="52" rows="15" wrap="VIRTUAL"></textarea></td>
               </tr>

            </table>

            <div class="row">
               <input type="submit" value="전송" style="padding:0.5rem">
            </div>
         </form>
         <br>

      </div>
   </div>









</div>


<jsp:include page="/template/footer.jsp"></jsp:include>