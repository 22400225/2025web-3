<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>

<%!
    // 1. Mock 데이터를 담을 간단한 Java 클래스 (POJO) 정의
    public class Post {
        private int id;
        private String title;
        private String writer;
        private int hit;
        private String createdDate;

        // 생성자
        public Post(int id, String title, String writer, int hit, String createdDate) {
            this.id = id;
            this.title = title;
            this.writer = writer;
            this.hit = hit;
            this.createdDate = createdDate;
        }

        // Getter 메소드들
        public int getId() { return id; }
        public String getTitle() { return title; }
        public String getWriter() { return writer; }
        public int getHit() { return hit; }
        public String getCreatedDate() { return createdDate; }
    }
%>

<%
    // 2. Mock 데이터 생성 (DB에서 SELECT * FROM board; 를 대신함)
    List<Post> postList = new ArrayList<>();
    postList.add(new Post(12, "Lorem Ipsum is simply dummy text of the printing...", "Sally", 30, "2024-10-31"));
    postList.add(new Post(11, "JSP Mock Data 테스트입니다.", "Admin", 15, "2024-10-30"));
    postList.add(new Post(10, "Railway 배포 성공! (과제 테스트)", "Gildong", 45, "2024-10-29"));
    postList.add(new Post(9, "게시판 기능 구현 중입니다.", "Sally", 22, "2024-10-28"));
    postList.add(new Post(8, "첫 번째 게시글입니다. 반갑습니다.", "Tester", 5, "2024-10-27"));
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시판 목록</title>
    <style>
        body { font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif; margin: 20px; }
        .container { max-width: 900px; margin: auto; }
        h2 { border-bottom: 2px solid #333; padding-bottom: 10px; }
        .toolbar { display: flex; justify-content: space-between; align-items: center; margin-bottom: 15px; }
        .search-bar { /* (검색 기능은 추후 구현) */ }
        .btn {
            padding: 8px 12px;
            text-decoration: none;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        table { width: 100%; border-collapse: collapse; font-size: 0.9em; }
        th, td { border-bottom: 1px solid #ddd; padding: 12px; text-align: left; }
        th { background-color: #f8f9fa; }
        td a { text-decoration: none; color: #333; }
        td a:hover { text-decoration: underline; }

        /* (중요) 텍스트 버튼 스타일을 위한 CSS입니다.
        */
        .menu-buttons .btn {
            padding: 5px 10px;    /* 버튼 크기 조절 */
            font-size: 0.8em;     /* 글자 크기 조절 */
            margin-left: 5px;     /* (중요) 버튼 간격 조절 */
            color: white;         /* 텍스트 버튼은 글자색을 흰색으로 */
        }
        .menu-buttons .btn:hover {
            text-decoration: none; /* 버튼 호버 시 밑줄 제거 */
            opacity: 0.9;
        }
        .btn-info { /* 수정 버튼 색상 */
            background-color: #17a2b8;
        }
        .btn-danger { /* 삭제 버튼 색상 */
            background-color: #dc3545;
        }

        .pagination { text-align: center; margin-top: 20px; }
    </style>
</head>
<body>
<div class="container">
    <h2>자유게시판</h2>

    <div class="toolbar">
        <div class="search-bar">
            <select name="searchBy">
                <option value="title">Search by</option>
                <option value="writer">작성자</option>
                <option value="content">내용</option>
            </select>
            <input type="text" name="query" size="30">
            <button type="submit" class="btn">Search</button>
        </div>
        <a href="write.html" class="btn">Add</a>
    </div>

    <table>
        <thead>
        <tr>
            <th>#</th>
            <th>title</th>
            <th>writer</th>
            <th>hit</th>
            <th>created_date</th>
            <th>Menu</th>
        </tr>
        </thead>
        <tbody>

        <% for (Post post : postList) { %>
        <tr>
            <td><%= post.getId() %></td>

            <td>
                <a href="view.jsp?id=<%= post.getId() %>">
                    <%= post.getTitle() %>
                </a>
            </td>

            <td><%= post.getWriter() %></td>
            <td><%= post.getHit() %></td>
            <td><%= post.getCreatedDate() %></td>

            <%--
              (수정) 아이콘 대신 텍스트 버튼 사용
            --%>
            <td class="menu-buttons">
                <a href="edit.jsp?id=<%= post.getId() %>" class="btn btn-sm btn-info">수정</a>
                <a href="delete_ok.jsp?id=<%= post.getId() %>"
                   class="btn btn-sm btn-danger"
                   onclick="return confirm('정말 삭제하시겠습니까? (id=<%= post.getId() %>)');">삭제</a>
            </td>
        </tr>
        <% } // end of for loop %>

        <% if (postList.isEmpty()) { %>
        <tr>
            <td colspan="6" style="text-align: center; padding: 20px;">게시물이 없습니다.</td>
        </tr>
        <% } %>

        </tbody>
    </table>

    <div class="pagination">
        <span></span>
    </div>
</div>
</body>
</html>