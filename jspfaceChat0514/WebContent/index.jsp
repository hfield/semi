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
	//push Client����
	console.log("typeof:"+typeof(EventSource));
	if(typeof(EventSource) != "undefined"){ //push�� ���� �� �ִ� ���������� �Ǵ� (Ÿ�Կ��� -> ��ü�� Ÿ��Ȯ��)
	var eventSource = new EventSource("chatload.jsp");
	// EventSource EventListener�� ����
	// onmessage : ������ ���� push �޼����� ���ŵǸ� �߻�(������)
	// onerror : ������ ���� push���� ������ �߻��Ǿ��� �� �߻�
	// onopen : ������ ������ �Ǿ��� �� �߻�
	eventSource.onmessage = function(event){ //�������������� ���ư��� �ִ� �ݹ��Լ�
		<% System.out.println("üũ1");%>
		$("#target").html("<div style='background:orange'>"+event.data+"</div>");
		<% System.out.println("üũ5");%>
	};
	}else{
		$("#target").html("�ش� �������� ������ �ȵ˴ϴ�.")
	}

	
// Ajax�� ������� �����͸� ������ �� 
//����ڰ� �Է��� ������ ������ ����
	$(function(){
		$("form").submit(function(){
			var fdata = {
					u_id:encodeURIComponent($("#u_id").val()),
					chat:encodeURIComponent($("#chat").val())};
			$.ajax({ //ajax�� ����
				type:"POST", //����� �־���� (URL�� �Ⱥ���)
				url:"chat_add.jsp",
				data:fdata
			});
			return false;//������Ŀ� �������� �ȹٲ�� false����
		});
	});
//�ǽð� �ޱ� ���ؼ� �Լ��� ����(����)
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
		<input type="text" id="u_id" name="u_id" required="required" placeholder="�̸��̳����̵�">	
		<input type="text" id="chat" name="chat" required="required" placeholder="��ȭ����">
		<input type="submit" id="send" value="���ۼ�">
	</form>
	<div id="target"></div>
</div>
</body>
</html>