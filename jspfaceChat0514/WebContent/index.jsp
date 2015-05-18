<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>index.jsp</title>
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<!-- <script src="js/http.js"></script> -->
<script>
//receive
	//push Client설정
	console.log("typeof:"+typeof(EventSource));
	if(typeof(EventSource) != "undefined"){ //push를 받을 수 있는 브라우저인지 판단 (타입오브 -> 객체의 타입확인)
	var eventSource = new EventSource("chatload.jsp");
	// EventSource EventListener의 종류
	// onmessage : 서버가 보낸 push 메세지가 수신되면 발생(리스너)
	// onerror : 서버가 보낸 push에서 에러가 발생되었을 때 발생
	// onopen : 서버가 연결이 되었을 때 발생
	eventSource.onmessage = function(event){ //리스너형식으로 돌아가고 있는 콜백함수
		<% System.out.println("체크1");%>
		$("#target").html("<div style='background:orange'>"+event.data+"</div>");
		<% System.out.println("체크5");%>
	};
	}else{
		$("#target").html("해당 브라우저는 지원이 안됩니다.")
	}

	
// Ajax로 사용자의 데이터를 보내는 쪽 
//사용자가 입력한 내용을 서버에 저장
	$(function(){
		$("form").submit(function(){
			var fdata = {
					u_id:encodeURIComponent($("#u_id").val()),
					chat:encodeURIComponent($("#chat").val())};
			$.ajax({ //ajax로 보냄
				type:"POST", //헤더에 넣어서보냄 (URL로 안보임)
				url:"chat_add.jsp",
				data:fdata
			});
			return false;//서브밋후에 페이지가 안바뀌도록 false리턴
		});
	});
//실시간 받기 위해서 함수를 정의(폴링)
// 	function loadData(){
// 		sendRequest("chatload.jsp", null, res, "get")
// 	}
// 	function res(){
// 		if(xhr.readyState==4 && xhr.status == 200){
			
// 			document.getElementById("target").innerHTML=xhr.responseText;
			
// 		}
// 	}
// 	var inter = setInterval(function(){
// 		loadData();
// 	}, 500)
</script>
</head>
<body>
<div id="warp">
	<form method="post" action="chat_add.jsp" name="cform"	id="cform">
		<input type="text" id="u_id" name="u_id" required="required" placeholder="이름이나아이디">	
		<input type="text" id="chat" name="chat" required="required" placeholder="대화내용">
		<input type="submit" id="send" value="글작성">
	</form>
	<div id="target"></div>
</div>
</body>
</html>