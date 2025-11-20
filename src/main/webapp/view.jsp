<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
    public class Post {
        private int id;
        private String title;
        private String writer;
        private int view;
        private String createdDate;
        private String content;
        private String category;

        public Post(int id, String title, String writer, String category, String content, int view, String createdDate) {
            this.id = id;
            this.title = title;
            this.writer = writer;
            this.category = category;
            this.content = content;
            this.view = view;
            this.createdDate = createdDate;
        }

        // Getter 메소드들
        public int getId() { return id; }
        public String getTitle() { return title; }
        public String getWriter() { return writer; }
        public String getCategory() { return category; }
        public String getContent() { return content; }
        public int getView() { return view; }
        public String getCreatedDate() { return createdDate; }
    }
%>

<%
    String idParam = request.getParameter("id");
    int id = 1;
    if (idParam != null && !idParam.isEmpty()) {
        id = Integer.parseInt(idParam);
    }
    Post post = new Post(
            id,
            "ID " + id + "번 글 상세 보기",
            "Sally",                               // 작성자
            "free",                                // 카테고리
            "ID " + id + "번 글의 상세 내용입니다.\n" +
                    "줄바꿈도 잘 표시됩니다.\n\n" +
                    "데이터베이스가 연결되면 이 자리에 실제 글 내용이 표시됩니다.",
            31,
            "2025-11-31"
    );
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title><%= post.getTitle() %></title>
    <style>
        body { font-family: sans-serif; margin: 20px; }
        .container { max-width: 800px; margin: auto; }
        .post-header { border-bottom: 1px solid #ddd; padding-bottom: 10px; }
        .post-meta { font-size: 0.9em; color: #666; }
        .post-content { padding: 20px 0; min-height: 200px; white-space: pre-wrap; /* 줄바꿈 표시 */ }
        .button-area { text-align: right; border-top: 1px solid #ddd; padding-top: 15px; }
        .btn { padding: 8px 12px; text-decoration: none; background-color: #007bff; color: white; border: none; border-radius: 4px; cursor: pointer; margin-left: 5px;}
        .btn-secondary { background-color: #6c757d; }
        .btn-danger { background-color: #dc3545; }
    </style>
</head>
<body>

<div class="container">

    <div class="post-header">
        <h3>[<%= post.getCategory() %>] <%= post.getTitle() %></h3>
        <div class="post-meta">
            <span>작성자: <%= post.getWriter() %></span> |
            <span>작성일: <%= post.getCreatedDate() %></span> |
            <span>조회수: <%= post.getView() %></span>
        </div>
    </div>

    <div class="post-content">
        <%= post.getContent() %>
    </div>

    <div class="button-area">
        <a href="list.jsp" class="btn btn-secondary">목록</a>

        <a href="edit.jsp?id=<%= post.getId() %>" class="btn">수정</a>
        <a href="delete_ok.jsp?id=<%= post.getId() %>"
           class="btn btn-danger"
           onclick="return confirm('정말 삭제하시겠습니까?');">삭제</a>
    </div>

</div>

</body>
</html>