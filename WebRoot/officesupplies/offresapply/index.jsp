<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/system/returnapi/api.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
<link rel="stylesheet" href="<%=contextPath%>/system/styles/ztree/zTreeStyle/zTreeStyle.css" type="text/css">
<script type="text/javascript" src="<%=contextPath%>/system/jsall/ztree/jquery.ztree.core-3.5.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>办公用品信息管理</title>
<style type="text/css">
	html,body{
		width: 100%;
		height: 99%;
		margin: 0px;
		padding: 0px;
	}
	.left{
		width: 20%;
		height: 100%;
		float: left;
		border-right:solid #ADD8E6 1px; 
	}
	.right{
		width: 79.9%;
		height: 100%;
		float: left;
		border: none;
	}
</style>
</head>
<body>
	<div class="left" style="overflow:none;">
		<iframe id="left" scrolling='auto' frameborder='0'  style="border: none;width: 100%;height: 100%;" src="left.jsp" ></iframe>
	</div>
	<div class="right">
		<iframe id="right" scrolling='auto' frameborder='0'  style="border: none;width: 100%;height: 100%;" src="right.jsp" ></iframe>
	</div>
</body>
</html>