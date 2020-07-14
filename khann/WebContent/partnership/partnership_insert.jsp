<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>

<jsp:include page="/template/header.jsp"></jsp:include>

<div id="dh-content2">


    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/emailjs-com@2.4.1/dist/email.min.js"></script>
    <script type="text/javascript">
        (function() {
            // emailJS 유저 
            emailjs.init("user_75hRUFqFtsTmd6FTBXPKf");
        })();
    </script>
    <script type="text/javascript">
        window.onload = function() {

            // form id, #contact-form 안에 있는 것들 전송
            document.getElementById('contact-form').addEventListener('submit', function(event) {
                event.preventDefault();
                // generate the contact number value
                this.contact_number.value = Math.random() * 100000 | 0;
                // 서비스 id, 이메일 템플릿
                emailjs.sendForm('cinemakhann', 'template_HkdZ1sV5', this);
            });
        }
    </script>
</head>

<body>

    <div align="center">

        <h2>제휴문의</h2>


        <form id="contact-form">
            <table border="0">
                <tbody>
                    <tr>
                        <th>회사명</th>
                        <td>
                            <input type="text" name="company_name">

                        </td>
                    </tr>
                    <tr>
                        <th>문의자명</th>
                        <td>
                            <input type="text" name="contact_name">
                        </td>
                    </tr>
                    <tr>
                        <th>연락처</th>
                        <td>
                            <input type="text" name="contact_number">
                        </td>
                    </tr>
                    <tr>
                        <th>이메일</th>
                        <td>
                            <input type="text" name="contact_mail">
                        </td>
                    </tr>
                    <tr>
                        <th>제목</th>
                        <td>
                            <input type="text" name="title">
                        </td>
                    </tr>

                    <tr>
                        <th>내용</th>
                        <td>
                            <textarea name="message_html"></textarea></td>
                    </tr>
                <tfoot>
                    <tr>
                        <th colspan="2">
                            <input type="submit" value="Send"> </th>
                    </tr>
                </tfoot>
            </table>
        </form>
    </div>
</body></html>









</div>


<jsp:include page="/template/footer.jsp"></jsp:include>