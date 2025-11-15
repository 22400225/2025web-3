<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("UTF-8");
    String writer = request.getParameter("writer");
    String password = request.getParameter("password");
    String category = request.getParameter("category");
    String title = request.getParameter("title");
    String content = request.getParameter("content");

    System.out.println("작성자: " + writer);
    System.out.println("제목: " + title);
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>작성 완료</title>
    <style>
        body { font-family: sans-serif; margin: 20px; }
        .container { border: 1px solid #ccc; padding: 20px; border-radius: 8px; max-width: 600px; }
        pre { background-color: #f4f4f4; padding: 10px; border-radius: 4px; white-space: pre-wrap; }
    </style>
</head>
<body>

<div class="container">
    <h2>과제 요구사항: 폼에서 받아온 데이터 출력</h2>
    <p>아래 데이터가 폼으로부터 성공적으로 전송되었습니다. (나중에 이 데이터는 DB에 저장됩니다.)</p>
    <hr>
    <p><strong>작성자:</strong> <%= writer %></p>
    <p><strong>비밀번호:</strong> <%= password %></p>
    <p><strong>카테고리:</strong> <%= category %></p>
    <p><strong>제목:</strong> <%= title %></p>
    <p><strong>내용:</strong></p>
    <pre><%= content %></pre>

    <br>
    <a href="list.jsp">[목록으로 돌아가기]</a>
</div>

</body>
</html>