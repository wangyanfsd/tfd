<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/system/returnapi/api.jsp" %>
<%
	String diskId = request.getParameter("diskId");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
<title>公共资源</title>
<link rel="stylesheet" type="text/css" href="<%=stylePath%>/tabs/style.css"></link> 
<script type="text/javascript" src="<%=contextPath%>/system/jsall/tabs/tabs.js"></script>
<script type="text/javascript" src="<%=contextPath%>/system/jsall/jqueryui/jquery.layout-latest.js"></script>
<script type="text/javascript">
var diskId = "<%=diskId%>";
function doInit(){
	$("body").layout({
		name:"outerLayout",
		north:{
			size:35,
			slidable:false,
			resizable:false,
			spacing_open:0,
			spacing_closed:0
		}
	});
	$.addTab("tabs","tabs-content",{url:contextPath+"/system/publicdisk/permission/accessPriv.jsp?diskId="+diskId,title:"访问权限",active:true});
	$.addTab("tabs","tabs-content",{url:contextPath+"/system/publicdisk/permission/managePriv.jsp?diskId="+diskId,title:"管理权限",active:false});
	$.addTab("tabs","tabs-content",{url:contextPath+"/system/publicdisk/permission/newPriv.jsp?diskId="+diskId,title:"新建权限",active:false});
	$.addTab("tabs","tabs-content",{url:contextPath+"/system/publicdisk/permission/downPriv.jsp?diskId="+diskId,title:"下载/打印权限",active:false});
	$.addTab("tabs","tabs-content",{url:contextPath+"/system/publicdisk/permission/allPriv.jsp?diskId="+diskId,title:"批量设置",active:false});
}
</script>
</head>
<body onload="doInit();" style="padding-top:5px;">
<div id="tabs" class="pane tfd_tab_header ui-layout-north"></div>
<div id="tabs-content" class="pane ui-layout-center"></div>
</body>
</html>