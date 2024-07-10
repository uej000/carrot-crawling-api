<%@ page import="java.util.ArrayList" %>
<%@ page import="com.cmsoft.crawling.dto.CrawlDto" %>
<%@ page import="com.cmsoft.crawling.crawl.Crawling" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="kr">
<head>
    <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
    <meta charset="UTF-8">
    <title>리스트</title>
    <style>
        /* 스타일 시트 내용은 여기에 붙여넣으세요 */
    </style>
</head>
<body>
<h1>크롤링 데이터</h1>
<%--ssr 방식--%>
<%
    Crawling crawler = new Crawling();
    ArrayList<CrawlDto> list = crawler.crawl();
    String html_tag = "<table><tr><th><제목></th><th><가격></th><th><위치></th><th><관심></th><th><채팅 수></th></tr>";
    if (list != null && !list.isEmpty()) {
        for (CrawlDto dto : list) {
            html_tag += "<tr>";
            html_tag += "<td>" + dto.getTitle() + "</td>";
            html_tag += "<td>" + dto.getPrice() + "</td>";
            html_tag += "<td>" + dto.getLocation() + "</td>";
            html_tag += "<td>" + dto.getInterest() + "</td>";
            html_tag += "<td>" + dto.getChatCount() + "</td>";
            html_tag += "</tr>";
        }
        html_tag += "</table>";
    } else {
        html_tag = "<p>회원 데이터가 없습니다.</p>";
    }
%>
<%= html_tag %>
<div class="button-container">
    <input type="button" class="btn" value="데이터삽입" id="insertbtn">
    <input type="button" class="btn" value="데이터목록" id="databtn"  onclick="location.href='/data'">
</div>
<script>
    <%--  csr 방식--%>
    $(document).ready(function() {
        $('#insertbtn').on('click', function () {
            var title = $('#title').val();
            var price = $('#price').val();
            var location = $('#location').val();
            var interest = $('#interest').val();
            var chatCount = $('#chatCount').val();

            $.ajax({
                url: '/insert',
                method: 'POST',
                data: {
                    title : title,
                    price : price,
                    location : location,
                    interest : interest,
                    chatCount : chatCount
                },
                dataType: 'text',
                success: function(response) {
                    // 서버로부터의 응답에 따라 적절한 동작 수행
                    location.href="datalist"; // 페이지 새로고침
                },
                error: function(xhr, status, error) {
                    // 에러 처리
                    console.error(xhr.responseText);
                }
            });
        });
    });
</script>
</body>
</html>