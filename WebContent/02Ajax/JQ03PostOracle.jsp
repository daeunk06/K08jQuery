<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../common/bootstrap4.5.3/css/bootstrap.css" />
<script src="../common/jquery/jquery-3.5.1.js"></script>
</head>
<script>
$(function(){
	/* 
	jquery에서 제공하는 ajax관련 메소드
	3. $.post90
		: http post방식으로 서버로 요청할 때 사용한다.
		$.get()메소드와 요청방식만 다를 뿐 사용법은 완전히 동일하다.
	*/
	$('#btnLogin2').click(function(){
		//요청할 서버의 url
		var s_url = "./common/03PostLoginOracle.jsp";
		/*
			form태그의 하위태그들은 name속성을 통해 json으로 
			조립해 준다 전송할 폼값이 많을 경우 주로 사용한다.
		*/
		var s_params =$('#loginFrm').serialize();
		$.post(
			s_url,
			s_params,
			//인자 3 요청후 성공시 실행되는 콜백 메소드
			function(responseData){
				console.log(responseData);
				/*
				서버로부터 받은 콜백데이터가 json형태일때는 파싱을 위해 
				아래 함수를 사용해야한다. */
				var d = JSON.parse(responseData);
		
				if(d.result==1){
					//json에 포함된 html값을 얻어와서 삽입
					alert(d.message);
					$('#loginFrm').html(d.html);
					//로그인 버튼 숨김처리
					$('#btnLogin2').hide();
				}
				else{
					alert(d.message);
				}
				$('#jsonDisplay').text(responseData);
			}
		);
	});
	
});
function checkFrm(){
	var f = document.getElementById("loginFrm");
	f.method = "post";
	f.action = "./common/03PostLoginOracle.jsp";
}
</script>
<body>
<div class="container">
	<h2>$.post() 메소드 사용하기</h2>	
	<h3>로그인 구현하기 - JDBC연동O(오라클사용)</h3>
	<div class="row" id="loginTable">
		<form id="loginFrm" onsubmit="return checkFrm();">
			<table class="table table-bordered">
				<tr>
					<td>아이디</td>
					<td>
						<input type="text" id="user_id" 
							name="user_id" value="kosmo" />
					</td>
				</tr>
				<tr>
					<td>패스워드</td>
					<td>
						<input type="password" id="user_pw" 
							name="user_pw" value="1234" />
					</td>
				</tr>
			</table>
			<button type="submit" class="btn btn-danger" 
				id="btnLogin1">
				로그인하기(HTML의submit사용)</button>
			&nbsp;&nbsp;
			<button type="button" class="btn btn-success" 
				id="btnLogin2">
				로그인하기(jQuery의 $.post()사용)</button>
		</form>
	</div>
	<br/>
	<div class="row" id="jsonDisplay">
		JSON 데이터를 뿌려봅시다
	</div>
</div>	
</body>

</html>