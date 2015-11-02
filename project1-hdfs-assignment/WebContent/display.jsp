<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Kalyan Hadoop Training @ ORIENIT</title>
<script src="js/jquery-1.11.1.js" type="text/javascript"></script>
<script type="text/javascript" src="ajax.js"></script>
<style>	
	body {
		background: #eedfcc url(images/bg3.jpg) no-repeat center top;
		-webkit-background-size: cover;
		-moz-background-size: cover;
		background-size: cover;
	}
	.container > header h1,
	.container > header h2 {
		color: #fff;
		text-shadow: 0 1px 1px rgba(0,0,0,0.5);
	}
	.middle{
		border-radius: 5px; 
		border-width: 5px; 
		border-color: lime;
		font-size: large;
	}
	.header {
		border-radius: 5px; 
		border-width: 5px; 
		border-color: purple; 
		text-align: center;
	}
</style>
</head>
<body>
<div class="container">
	<form name="hdfs-display">
		<fieldset class="header">
		<h1>Kalyan Hadoop Training @ ORIENIT : Project-1 Assignment</h1>
		</fieldset>
		<br>
		<fieldset class="middle">
			<h4>Go to Assignments <a href="index.html">Go ...</a></h4>
			Enter HDFS Path: <input type="text" id="ipath"/><input type="button" id="path" value="go"/>
		</fieldset>
		<br /> <br />
		<fieldset class="middle">
			<legend>Display the HDFS Data</legend>
			<br />
			<input type="text" id="iparent"/><input type="button" id="parent" value="parent"/>
			<br />
			<div id="display"></div>
		</fieldset>
	</form>
</div>
</body>
</html>