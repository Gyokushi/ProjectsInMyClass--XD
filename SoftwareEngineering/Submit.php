<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="boundary.css">
	<script src = "Student.js"></script>
	<script src = "general.js"></script>
	<script src = "jquery-3.1.1.min.js"></script>
	<title>Student Assignment Submission System</title>
</head>
<body>
<div class="header">
	<h1 class="title">
    <span class="capital">S</span><span class="remain">tudent</span>
    <span class="capital">A</span><span class="remain">ssignment</span>
    <span class="capital">S</span><span class="remain">ubmission</span>
    <span class="capital">S</span><span class="remain">ystem</span>
	</h1>
	<span id = "header" style="position: absolute;right: 0px; top:60px;font-family: Arial Black; font-size:40px; color:var(--red)"></span>
</div>
<div class="navibar"><div id = "navibar"><input type="button" class = "buttonInNavi" onclick="logout()" value="LOGOUT" /></div>

</div>

<div class="detail">
<h1 align="center" id = "title"></h1>
<h1>Submission Status</h1>
<table >
  <tr>
    <td class="leftCol">Description</td>
    <td ><a id = 'des' ></a></td>
  </tr>
  <tr>
    <td class="leftCol">Grading Status</td>
    <td id = "gradingStatus"></td>
  </tr>
  <tr>
    <td class="leftCol">Due Date</td>
    <td id = "dueDate"></td>
  </tr>
  <tr>
    <td class="leftCol">Last Modified</td>
    <td id = "lastModified"></td>
  </tr>
  <tr>
    <td class="leftCol">Submission</td>
    <td> <a id = "submission"></a></td>
  </tr>
</table>
<hr>
<div id = "modifyArea">
</div>
</div>

<div class="master">
<h4 class="leftTitle">Course List</h4><br><br>
<div id="master"></div>
</div>


<script type="text/javascript">

	checkCookie();
	var sid = getCookie(COOKIENAME);
	var dragged = false;
	var modify = false;
	var did = '<?php if (isset($_GET["assign"])) echo $_GET["assign"];else echo 0 ?>';
	if (did == 0) 
		did = '<?php if (isset($_POST["did"])) echo $_POST["did"];else echo 0 ?>';
	document.getElementById('header').innerHTML = sid;
	courseList = getCourseList(sid);
	submission = getSubmission(did,sid);
		arrangeFormatForMaster(courseList,submission[0].cid);
		arrangeFormatForDetail(submission[0]);
		arrangeFormatNavibar();

	function arrangeFormatNavibar(){
		var temp = '';
		temp += '<form action = "mainPageStudent.php" method = "GET" onsubmit = "return check()">'
		temp += '<button type="submit" class = "buttonInNavi2" name = "returnCourse" value= 0 >HOME > </button>\
					<input type="submit" class = "buttonInNavi2" name = "returnCourse" value= \''+ submission[0].cid +'\' />';
		temp += '</form>';
		document.getElementById('navibar').innerHTML += temp;
	}

	function arrangeFormatForDetail(a){
		document.getElementById('des').setAttribute("href",'encode.py');
		document.getElementById('des').innerHTML = 'encode.py';
		document.getElementById('title').innerHTML = a.did;
		document.getElementById('gradingStatus').innerHTML = a.score? a.score :"NOT GRADING";
		document.getElementById('dueDate').innerHTML = a.dueDate;
		document.getElementById('lastModified').innerHTML = a.time;
		console.log(a.url)
		if(a.url){
			document.getElementById('submission').innerHTML = a.url;
			document.getElementById('submission').setAttribute("href",a.url);
		}
		else
			document.getElementById('submission').innerHTML = "Waiting for your submission...";
		writeLowerRright(modify);
	}
	

	function changeFlag(){
		modify = !modify;
		writeLowerRright();
	}

	function writeLowerRright(){
		var temp;
		if(!modify) {
			dragged = false;
			if(submission[0].dueDate-1111 > 0) {
				temp = '<button type="button" onclick = "changeFlag()" class="button2">Add Submission</button>'; 
				document.getElementById('modifyArea').innerHTML = temp; }
		} else {
			temp = '<div id="dropContainer" class="dropContainer">Drag and Drop XD</div> \
					<form id = "form" align="right" style="margin: 10px;" action="Submit.php" method="POST" enctype="multipart/form-data" onsubmit = "return uploading(\''+did+'\')"> \
  					<input  type="file" name = "submissionUpload" id="submissionUpload" required /><br> \
  					<button type="button" class="button2" onclick = "changeFlag()">Cancel</button> \
  					<button type="submit" name = "did" value = "'+ did+'" class="button2">Submit</button> \
  					</form>';
					document.getElementById('modifyArea').innerHTML = temp;
					addListener();
  		}
	}

	function addListener(){
			dropContainer.ondragover = dropContainer.ondragenter = function(evt) { evt.preventDefault(); };
			dropContainer.ondrop = function(evt) {
				dragged = true;
				console.log(dragged);
				submissionUpload.files= evt.dataTransfer.files;
				evt.preventDefault();
			}
			submissionUpload.onchange = function() {
				dragged = true;
			}
	}

	function arrangeFormatForMaster(courseList,selectedid){
	var temp = '';
	temp += '<form action = "mainPageStudent.php" method = "GET" onsubmit = "return check()">'
	courseList.forEach(function(rows){
		temp +=
		'<button type = "submit" name = "returnCourse" class="'+ (selectedid==rows.cid?'courseSelected':'courseUnselected') +'" value = "'+rows.cid+'">'+rows.cname+'</button>';
	})
	temp += '</form>';
	document.getElementById('master').innerHTML = temp;
	}


	function check(){
		if(dragged)
			alert('Save your changes first!');
		return !dragged;
	}


	function uploading(did){
		var temp = new FormData(document.getElementById("form"));
		$.ajax({
		url : 'test.php',
		type : 'post',
		async: false,
		data : temp,
		processData: false,  // tell jQuery not to process the data
		contentType: false,   // tell jQuery not to set contentType
		success : function(callback){
			alert('success!')
			 location.reload();
		},
		fail:function(){
			//alert("failed");
		}
		});
		return false;
}
</script>


</body>
</html>