var COOKIENAME = "comp3006Project";
var COOKIEFORTIMEOUT ="isTimeOut";
var time = 15;


function logout(){
	//delete cookie;
    setCookie(COOKIENAME,"",-1);
	window.location.href = "login.html";
}

function setCookie(cname,cvalue,mins)
{
	var d = new Date();
	d.setTime(d.getTime()+(mins*60*1000));
	var expires = "expires="+d.toGMTString();
	document.cookie = cname + "=" + cvalue + "; " + expires;
}

function getCookie(cname)
{
var name = cname + "=";
var ca = document.cookie.split(';');
for(var i=0; i<ca.length; i++) 
  {
  var c = ca[i].trim();
  if (c.indexOf(name)==0) 
  	return c.substring(name.length,c.length);
}
return "";
}

function checkCookie()
{
	if(!getCookie(COOKIENAME)){
		setCookie(COOKIEFORTIMEOUT,1111,0.01);
		window.location = "login.html"
		return 
	}
	setCookie(COOKIENAME,getCookie(COOKIENAME),time);
}

function eraseCookie(cname) {
    setCookie(cname,"",-1);
}

function logout(){
	eraseCookie(COOKIENAME);
	window.location.href = "login.html";
}

function removeChild(tag){
	var temp = document.getElementById(tag);
	if(temp.childElementCount>2)
	{var child = temp.lastChild;
	temp.removeChild(child);}
}



	function getCourseList(sid){
	var list;
		$.ajax({
		url : 'test.php',
		type : 'post',
		async: false,
		data : {sid:sid,flag:"C"},
		success : function(data){
			list = data;
		},
		fail:function(){
			alert("failed");
		}
	});
	var parsed = JSON.parse(list);
	var arr = [];
	for(var x in parsed){
		arr.push(parsed[x]);}
		arr.pop();
	return arr;
	}


function getSubmissionList(sid){
	var list;
		$.ajax({
		url : 'test.php',
		type : 'post',
		async: false,
		data : {sid:sid,flag:"S"},
		success : function(data){
			list = data;
		},
		fail:function(){
			alert("failed");
		}
		});
	var parsed = JSON.parse(list);
	var arr = [];
	for(var x in parsed){
		arr.push(parsed[x]);}
		arr.pop();
	return arr;
}

function getSubmission(did,sid){
	var list;
		$.ajax({
		url : 'test.php',
		type : 'post',
		async: false,
		data : {did:did,flag:'R',sid:sid},
		success : function(data){
			list = data;
		},
		fail:function(){
			alert("failed");
		}
		});
	var parsed = JSON.parse(list);
	var arr = [];
	for(var x in parsed){
		arr.push(parsed[x]);}
		arr.pop();
	return arr;
}




//----------------------------------------------------------
