<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String id = request.getParameter("id");

    System.out.println("삭제 요청 ID: " + id);

%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>삭제 완료</title>
</head>
<body>
<script>
    alert("ID: <%= id %>번 게시글이 삭제되었습니다. (Mock)");
    location.href = "list.jsp";
</script>

<p>
    ID: <%= id %>번 게시글이 삭제되었습니다. (Mock)<br>
    <a href="list.jsp">목록으로 돌아가기</a>
</p>

</body>
</html>