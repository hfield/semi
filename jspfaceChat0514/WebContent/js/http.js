/**
 * 
 */
var xhr = null;
function getXMLHttpRequest() {
if(window.ActiveXObject) {
xhr = new ActiveXObject("Microsoft.XMLHTTP");
}else {//ie7이하 빼고 나머지 브라우저들
xhr = new XMLHttpRequest();
}
}
function sendRequest(url, param, callback, method) {
getXMLHttpRequest();
method = (method.toLowerCase() == 'get') ? 'GET' : 'POST';
param = (param == null || param == '') ? null : param;
if(method == 'GET' && param != null) {
url = url + '?' + param;
}
xhr.onreadystatechange = callback;
xhr.open(method, url, true);
xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
xhr.send(method == 'POST' ? param : null);
}