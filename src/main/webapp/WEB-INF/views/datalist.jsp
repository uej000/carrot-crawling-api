<%@ page import="java.util.ArrayList" %>
<%@ page import="com.cmsoft.crawling.dto.CrawlDto" %>
<%@ page import="java.util.HashSet" %>
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
<h1>DB 데이터 리스트</h1>
<%--ssr 방식--%>

<%
    ArrayList<CrawlDto> list = null;
    String html_tag = "";
    String tempTitle = "";
    String templocation = "";
    HashSet<String> uniqueEntries = new HashSet<>();

    try {
        list = (ArrayList<CrawlDto>) request.getAttribute("crawlDtoList");
        if (list != null && !list.isEmpty()) {
            html_tag = "<table><tr><th>제목</th><th>가격</th><th>위치</th><th>관심</th><th>채팅 수</th></tr>";
            for (CrawlDto dto : list) {
                tempTitle = dto.getTitle();
                templocation = dto.getLocation();
                String uniqueKey = tempTitle + "|" + templocation;

                // Check if this title-location combination has already been seen
                if (!uniqueEntries.contains(uniqueKey)) {
                    uniqueEntries.add(uniqueKey);
                    html_tag += "<tr><td>" + tempTitle + "</td><td>" + dto.getPrice() + "</td><td>" + templocation + "</td><td>" + dto.getInterest() + "</td><td>" + dto.getChatCount() + "</td></tr>";
                }
            }
            html_tag += "</table>";
        }
    } catch (Exception e) {
        e.printStackTrace();
    }

%>
<%= html_tag %>
<div class="button-container">
    <input type="button" class="btn" value="데이터 크롤링" id="crawlbtn" onclick="location.href='crawl'">
</div>

</body>
</html>