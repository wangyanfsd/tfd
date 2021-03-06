<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/system/returnapi/api.jsp" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>工作流分类</title>
<link rel="stylesheet" href="<%=contextPath%>/system/styles/ztree/zTreeStyle/zTreeStyle.css" type="text/css">
<script type="text/javascript" src="<%=contextPath%>/system/jsall/ztree/jquery.ztree.core-3.5.js"></script> 
<script type="text/javascript">
var zNodes ;
$(function(){
	var requestUrl=contextPath+"/tfd/system/workflow/workflowtype/act/WorkFlowTypeAct/getWorkFlowTypeTreeAct.act";
	$.ajax({
		url:requestUrl,
		dataType:"json",
		data:{},
		async:false,
		error:function(e){
			alert(e.message);
		},
		success:function(data){
			zNodes=data;
			}
	});
});

var setting = {
			data: {
				simpleData: {
					enable: true
				}
				},
			callback:{
				onClick:editinfo
			}
		};
$(document).ready(function(){
			$.fn.zTree.init($("#workflowtree"), setting, zNodes);
		});
function editinfo(event, treeId, treeNode)
{
	if(treeNode.isParent)
		{
			parent["edit"].location=contextPath+"/system/workflow/flowsort/right.jsp?flowTypeId="+treeNode.id
		}
}
function add()
{
	parent["edit"].location=contextPath+"/system/workflow/flowsort/add.jsp"
	}
</script>
</head>
<body style="margin-top: 10px;">
<div class="list-group">
   <a class="list-group-item active">
      <h5 class="list-group-item-heading">
         流程设计分类
      </h5>
   </a>
   <div  class="list-group-item">
     <ul id="workflowtree" class="ztree"></ul>
   </div>
   <a class="list-group-item" onclick="add();">
      <h5 class="list-group-item-heading" align="center">
        新建流程分类
      </h5>
   </a>
</div>
</body>
</html>