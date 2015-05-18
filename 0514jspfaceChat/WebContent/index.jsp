<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>index.jsp</title>
<script src="//code.jquery.com/jquery-1.11.2.min.js"></script>
<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<!--  <script src="js/http.js"></script> -->
<script>
	// push Client 설정
	console.log("typeof:"+typeof(EventSource));
	if(typeof(EventSource) != "undefined"){ // push를 받을 수 있는 브라우저인지 판별
	var eventSource = new EventSource("chatload.jsp");
	// EventSource EventListener의 종류
	// onmessage : 서버가 보낸 push 메세지가 수신되면 발생
	// onerror : 서버가 보낸 push에서 에러가 발생되었을 때 발생
	// onopen : 서버가 연결이 되었을 때 발생
	
	eventSource.onmessage = function(event){
		$("#target").html("<div style='background:orange'>"+event.data+"</div>");
	};
	} else{
		$("#target").html("해당 브라우저는 지원이 안됩니다.")
	}
	
	// Ajax 로 사용자의 데이터를 보내는 쪽 - 어제와 동일!
	$(function(){
		$("form").submit(function(){
			var fdata = {
					u_id:encodeURIComponent($("#u_id").val()),
					chat:encodeURIComponent($("#chat").val())
					};
			
			$.ajax({ // ajax 사용
				type:"POST",
				url: "chat_add.jsp",
				data:fdata
			});
			return false;
		});
	});
</script>	
	
<%-- <script>
// 사용자가 입력한 내용을 서버에 저장
	$(function(){
		$("form").submit(function(){
			var fdata = {
					u_id:encodeURIComponent($("#u_id").val()),
					chat:encodeURIComponent($("#chat").val())
					};
			
			$.ajax({ // ajax 사용
				type:"POST",
				url: "chat_add.jsp",
				data:fdata
			});
			return false;
		});
	});
// 실시간 받기 위해서 함수를 정의
	function loadData(){
		sendRequest("chatload.jsp", null, res, "get");
	}
	function res(){
		if(xhr.readyState == 4 && xhr.status == 200){
			document.getElementById("target").innerHTML=xhr.responseText;
		}
	}
	var inter = setInterval(function(){
		loadData();
	}, 500);
</script> --%>
</head>
<body>
<div id="wrap">
	<form method="post" action="chat_add.jsp" name="cform" id="cform">
		<input type="text" id="u_id" name="u_id" required="required" placeholder="이름이나아이디">
		<input type="text" id="chat" name="chat" required="required" placeholder="대화내용">
		<input type="submit" id="send" value="글작성">
	</form>
	<div id="target"></div>
</div>
</body>
</html>