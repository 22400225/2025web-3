<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("UTF-8");
    String id = request.getParameter("id");

    String writer = request.getParameter("writer");
    String password = request.getParameter("password");
    String category = request.getParameter("category");
    String title = request.getParameter("title");
    String content = request.getParameter("content");

    System.out.println("수정할 ID: " + id);
    System.out.println("새 제목: " + title);
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>수정 완료</title>
    <style>
        body { font-family: sans-serif; margin: 20px; }
        .container { border: 1px solid #ccc; padding: 20px; border-radius: 8px; max-width: 600px; }
        pre { background-color: #f4f4f4; padding: 10px; border-radius: 4px; white-space: pre-wrap; }
    </style>
</head>
<body>

<div class="container">
    <h2>게시글 수정 완료 (ID: <%= id %>)</h2>
    <p>
        아래 내용으로 데이터 수정 요청이 완료되었습니다.
        (나중에 이 데이터는 DB에서 ID를 기준으로 UPDATE 됩니다.)
    </p>
    <hr>
    <p><strong>작성자:</strong> <%= writer %></p>
    <p><strong>비밀번호:</strong> <%= password %> (확인용)</p>
    <p><strong>카테고리:</strong> <%= category %></p>
    <p><strong>제목:</strong> <%= title %></p>
    <p><strong>내용:</strong></p>
    <pre><%= content %></pre>

    <br>
    <a href="list.jsp">[목록으로 돌아가기]</a>
    <a href="view.jsp?id=<%= id %>">[수정된 글 확인하기]</a>
</div>

</body>
</html>