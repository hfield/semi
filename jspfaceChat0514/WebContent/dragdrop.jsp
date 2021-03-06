<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<style>
	#div1, #div2{
		float: left;
		width: 100px;
		height: 35px;
		marigin: 10px;
		padding: 10px;
		border: 1px solid #aaaaaa;
		
	}
</style>
<script>
	function allowDrop(ev){
		ev.preventDefault();
	}
	function drag(ev){
		ev.dataTransfer.setData("text", ev.target.id);
	}
	function drop(ev){
		ev.preventDefault();
		var data = ev.dataTransfer.getData("text");
		ev.target.appendChild(document.getElementById(data));
	}
</script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%-- draggable="true" : 드래그 할 요소에 추가
	 draggable : 해당 요소를 Drag 가능 상태로 만들려면 true로 설정한다.
	 ondragstart : Drag가 시작될 때 호출된다.
	 ondrag : Drag시 발생
	 ondragend : Drag가 종료될 때 호출된다.
	 ondrop : Drag된 데이터가 놓여질 때 호출된다.
	 
	 기본적으로 데이터 요소는 다른 요소에 놓여질 수 없다.
	 놓기를 가능하게 하기 위해서는 반드시 요소의 기본 핸들링을 막아야한다.
	 event.preventDefault() 메소드를 호출함으소써 기본핸들링을 막아 해당 요소에 놓여질 수 있게 만든다.
	 
	 ondragover : Drag된 데이터를 놓을 장소를 지정한다.
	 ondragenter : Drag된 데이터가 해당구역에 들어오게 될 경우 호출된다.
	 ondragleave : Drag된 데이터가 해당 구역에서 벗어나게 될 경우 호출된다.
 --%>
	<div id="div1" ondrop="drop(event)" ondragover="allowDrop(event)">
		<img src="img/nba.jpg" draggable="true" ondragstart="drag(event)" id="drag1" width="88" height="31">
	</div>
	
	<div id="div2" ondrop="drop(event)" ondragover="allowDrop(event)"></div>
</body>
</html>