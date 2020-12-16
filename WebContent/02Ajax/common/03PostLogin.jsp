<%@page import="org.json.simple.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%
//폼값을 전송 받음
String user_id = request.getParameter("user_id");
String user_pw = request.getParameter("user_pw");

//JSP에서 JSON객체 혹은 배열을 생성하기 위해 확장라이브러리를 설치한 후
//해당 객체를 생성한다.
/* 
	JSONobject클래스 : json객체를 생성한다.
		key,value를 사용하는 map컬렉션과 사용법이 동일하다
	JSONArray클래스 : JSON 배열을 생성한다.
		index를 사용하는 list컬렉션과 사용법이 동일하다.
	
*/
JSONObject jsonObj = new JSONObject();
if(user_id.equals("kosmo")&&user_pw.equals("1234")){
	//json객체를 생성하기위해 put을 사용
	jsonObj.put("user_id",user_id);
	jsonObj.put("user_name","홍길동");
	jsonObj.put("user_pw",user_pw);
	jsonObj.put("result",1);//성공시 result를 1로 생성
}
else{
	//로그인 실패시 다른 정보없이 result만 0으로 생성
	jsonObj.put("result",0);
}
String jsonTxt = jsonObj.toJSONString();
out.println(jsonTxt);
%>
