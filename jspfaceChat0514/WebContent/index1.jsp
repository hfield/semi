<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>index.jsp</title>
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script src="js/http.js"></script>
<script>
//사용자가 입력한 내용을 서버에 저장
	$(function(){
		$('#send').click(function(){
			var fdata = {
					u_id:$("#u_id").val(),
					chat:$("#chat").val()};
			$.ajax({
				type:"POST",
				url:"chat_add.jsp",
				data:fdata
			});
			
		});
	});
//실시간 받기 위해서 함수를 정의
	function loadData(){
		sendRequest("chatload.jsp", null, res, "get")
	}
	function res(){
		if(xhr.readyState==4 && xhr.status == 200){
			document.getElementById("target").innerHTML=xhr.responseText;
			
		}
	}
	var inter = setInterval(function(){
		loadData();
	}, 500)
</script>
</head>
<body>
<div id="warp">
	<form method="post" action="chat_add.jsp" name="cform"	id="cform">
		<input type="text" id="u_id" name="u_id" required="required" placeholder="이름이나아이디">	
		<input type="text" id="chat" name="chat" required="required" placeholder="대화내용">
		<input type="button" id="send" value="글작성">
	</form>
	<div id="target"></div>
</div>
</body>
</html>