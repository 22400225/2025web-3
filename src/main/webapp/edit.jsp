<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%!
    public class Post {
        private int id;
        private String title;
        private String writer;
        private int hit;
        private String createdDate;
        private String content; // 내용
        private String category; // 카테고리

        public Post(int id, String title, String writer, String category, String content, int hit, String createdDate) {
            this.id = id;
            this.title = title;
            this.writer = writer;
            this.category = category;
            this.content = content;
            this.hit = hit;
            this.createdDate = createdDate;
        }

        // Getter
        public int getId() { return id; }
        public String getTitle() { return title; }
        public String getWriter() { return writer; }
        public String getCategory() { return category; }
        public String getContent() { return content; }
        public int getHit() { return hit; }
        public String getCreatedDate() { return createdDate; }
    }
%>

<%
    // 1. (핵심) list.jsp에서 넘겨준 id 값을 받습니다. (예: edit.jsp?id=12)
    String idParam = request.getParameter("id");
    int id = 12; // 기본값 (혹시 id가 안 넘어올 경우 대비)
    if (idParam != null && !idParam.isEmpty()) {
        id = Integer.parseInt(idParam);
    }

    // 2. Mock Data 생성 (DB에서 "SELECT * FROM board WHERE id = ?"를 대신함)
    // 실제로는 id를 사용해 DB에서 데이터를 1건 조회해야 합니다.
    // 여기서는 id 값을 기반으로 가짜 데이터를 만듭니다.
    Post post = new Post(
            id,
            "ID " + id + "번 글의 기존 제목입니다.", // Mock 제목
            "Sally",                               // Mock 작성자
            "free",                                // Mock 카테고리
            "이것은 ID " + id + "번 글의 기존 내용입니다.\n" +
                    "수정 폼이므로 기존 내용이 이렇게 채워져 있어야 합니다.", // Mock 내용
            30,                                    // Mock 조회수
            "2024-10-31"                           // Mock 작성일
    );
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>글 수정</title>
    <style>
        body { font-family: sans-serif; margin: 20px; }
        form { border: 1px solid #ccc; padding: 20px; border-radius: 8px; max-width: 600px; }
        p { margin-bottom: 15px; }
        input[type="text"], input[type="password"], select, textarea {
            width: 100%;
            padding: 8px;
            box-sizing: border-box;
        }
        textarea { height: 150px; }
        input[readonly] { background-color: #eee; } /* 읽기 전용 필드 스타일 */
    </style>
</head>
<body>

<h2>글 수정</h2>
<p>게시판의 글을 수정합니다.</p>

<form action="edit_ok.jsp" method="post">

    <input type="hidden" name="id" value="<%= post.getId() %>">

    <p>
        <strong>작성자:</strong>
        <input type="text" name="writer" value="<%= post.getWriter() %>" readonly>
    </p>
    <p>
        <strong>비밀번호:</strong> (수정/삭제 시 필요)
        <input type="password" name="password" required placeholder="글 작성 시 사용한 비밀번호를 입력하세요">
    </p>
    <p>
        <strong>카테고리:</strong>
        <select name="category">
            <option value="notice" <% if("notice".equals(post.getCategory())) out.print("selected"); %> >공지사항</option>
            <option value="free" <% if("free".equals(post.getCategory())) out.print("selected"); %> >자유게시판</option>
            <option value="qna" <% if("qna".equals(post.getCategory())) out.print("selected"); %> >질문과답변</Goption>
        </select>
    </p>
    <p>
        <strong>제목:</strong>
        <input type="text" name="title" value="<%= post.getTitle() %>" required>
    </p>
    <p>
        <strong>내용:</strong>
        <textarea name="content" required><%= post.getContent() %></textarea>
    </p>

    <hr>
    <input type="submit" value="수정하기">
    <input type="button" value="목록으로" onclick="location.href='list.jsp'">
</form>

</body>
</html>