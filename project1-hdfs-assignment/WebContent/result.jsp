<%@page import="org.apache.commons.io.FileUtils"%>
<%@page import="org.apache.hadoop.fs.FileUtil"%>
<%@page import="org.apache.hadoop.fs.FSDataInputStream"%>
<%@page import="org.apache.hadoop.fs.BlockLocation"%>
<%@page import="org.apache.hadoop.io.IOUtils"%>
<%@page import="java.io.ByteArrayInputStream"%>
<%@page import="java.io.DataInputStream"%>
<%@page import="org.apache.hadoop.fs.FileStatus"%>
<%@page import="org.apache.hadoop.fs.Path"%>
<%@page import="java.net.URI"%>
<%@page import="org.apache.hadoop.fs.FileSystem"%>
<%@page import="org.apache.hadoop.conf.Configuration"%>
<%@page import="java.io.File"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.FileNotFoundException"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.util.Properties"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Kalyan Hadoop Training @ ORIENIT</title>
</head>
<body>
	<%
		String context = config.getServletContext().getContextPath();
		String contextPath = config.getServletContext().getRealPath(File.separator);
		Properties properties = new Properties();
		try {
			properties.load(new FileInputStream(contextPath + "/kalyan.properties"));
		} catch (Exception e) {
		}
		String namenode = (String) properties.get("namenode");

		boolean isparent = Boolean.parseBoolean(request.getParameter("isparent"));
		String path = request.getParameter("path");
		String file = namenode + path;

		Configuration conf = new Configuration();
		FileSystem fs = FileSystem.get(URI.create(file), conf);
		try {
			Path actualpath = isparent ? new Path(file).getParent() : new Path(file);

			FileStatus[] listStatus = fs.listStatus(actualpath);
			String parent = actualpath.toString().replaceAll(namenode, "");
			
			if(!fs.getFileStatus(actualpath).isDir()){
				out.write("Content of the file");
				out.println("<br>");
			} else {
				if(listStatus.length == 0){
					out.write("Empty Directory");
					out.println("<br>");
				}
				for (FileStatus fileStatus : listStatus) {
					String name = fileStatus.getPath().getName();
					String mypath = parent + "/" + name;
					mypath = mypath.replaceAll("//", "/");

					String type = fileStatus.isDir() ? "dir" : "file" ;
					String size = FileUtils.byteCountToDisplaySize(fileStatus.getLen());
					short replication = fileStatus.getReplication();
					String blocksize = FileUtils.byteCountToDisplaySize(fileStatus.getBlockSize());
					String owner = fileStatus.getOwner();
	%>
		            <a href='#' onclick=mycall('<%=mypath%>')><%=name%></a>
		            <br>
	<%
				}
			}
		} catch (Exception e) {
			out.println("input path is wrong : " + path);
		}
	%>
    

	<script type="text/javascript">
		function mycall(name) {
			$.get('result.jsp', {
				path : name
			}, function(responseText) {
				$('#display').html(responseText);
				$('#ipath').val(name);
				$('#iparent').val(name);
			});
		}
	</script>
</body>
</html>