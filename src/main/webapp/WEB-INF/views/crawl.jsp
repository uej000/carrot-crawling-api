<%@ page import="java.util.ArrayList" %>
<%@ page import="com.cmsoft.crawling.dto.CrawlDto" %>
<%@ page import="com.cmsoft.crawling.crawl.Crawling" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
    <meta charset="UTF-8">
    <title>리스트</title>
    <style>
        /* 스타일 시트 내용은 여기에 붙여넣으세요 */
    </style>
</head>
<body>
<h1>리스트</h1>
<%--ssr 방식--%>
<%
    Crawling crawler = new Crawling();
    ArrayList<CrawlDto> list = crawler.crawl();
    String html_tag = "<table><tr><th><제목></th><th><가격></th><th><지역></th><th><관심 수></th><th><채팅 수></th></tr>";
    if (list != null && !list.isEmpty()) {
        for (CrawlDto crawlDto : list) {
            html_tag += "<tr>";
            html_tag += "<td>" + crawlDto.getTitle() + "</td>";
            html_tag += "<td>" + crawlDto.getPrice() + "</td>";
            html_tag += "<td>" + crawlDto.getLocation() + "</td>";
            html_tag += "<td>" + crawlDto.getInterest() + "</td>";
            html_tag += "<td>" + crawlDto.getChatCount() + "</td>";
            html_tag += "</tr>";
        }
        html_tag += "</table>";
    } else {
        html_tag = "<p>데이터가 없습니다.</p>";
    }
%>
<%= html_tag %>
<div class="button-container">
    <input type="button" class="btn" value="데이터삽입" id="insertbtn">
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
                    location.reload(); // 페이지 새로고침
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
