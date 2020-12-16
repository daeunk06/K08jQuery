<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page trimDirectiveWhitespaces="true" %>
 <!--
 	페이지 상단에 불필요한 공백을 제거하기 위해 사용되는 지시어로
 	안드로이드에서 서버와 통신할때 가끔 공백때문에 오류가 발생하는
 	경우가 있으므로 반드시 제거시켜주는것이 좋다.
   -->
 <%
 request.setCharacterEncoding("UTF-8");
 
 String msg = request.getParameter("msg");
 String varStr = request.getParameter("varStr");
 String today =
		 new SimpleDateFormat("yyyy-mm-dd hh:mm:ss").format(new Date());
 out.println("<h2>메세지:"+msg+"</h2>");
 out.println("<h2>varStr:"+varStr+"</h2>");
 out.println("<h2>오늘날짜:"+today+"</h2>");
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../common/bootstrap4.5.3/css/bootstrap.css" />
<script src="../common/jquery/jquery-3.5.1.js"></script>
</head>
<body>

</body>
</html>