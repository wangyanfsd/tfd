<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/system/returnapi/api.jsp" %> 
<% 
String path=request.getParameter("path");
String privFlag = request.getParameter("privFlag");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
<title>图片浏览</title>
 <script type="text/javascript">
 var privFlag = "<%=privFlag%>";
 var path = "<%=path%>";
 </script>
</head>
<body>
<img src="<%=contextPath%>/com/system/filetool/UpImgTool/getImgActByDisk.act?path=<%=path%>"/>
</body>
</html>