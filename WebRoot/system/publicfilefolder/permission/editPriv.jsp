<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/system/returnapi/api.jsp" %> 
<%
	String folderId = request.getParameter("folderId");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="<%=contextPath%>/system/styles/ztree/zTreeStyle/zTreeStyle.css" type="text/css">
<script type="text/javascript" src="<%=contextPath%>/system/jsall/ztree/jquery.ztree.core-3.5.js"></script>
<script type="text/javascript" charset="utf-8" src="<%=contextPath%>/system/jsall/selectorg/showModalDialog.js"></script>
<script type="text/javascript" src="<%=contextPath%>/system/jsall/selectorg/selectuser/selectuser.js"></script>
<script type="text/javascript" src="<%=contextPath%>/system/jsall/selectorg/selectdept/selectdept.js"></script>
<script type="text/javascript" src="<%=contextPath%>/system/jsall/selectorg/selectpriv/selectpriv.js"></script>

<script type="text/javascript" src="<%=contextPath%>/system/publicdisk/js/disk.js"></script>

<title>设置权限</title>
<style type="text/css">
	.add_content{height:80%;width:600px;position:absolute;top:50px;left:10%;}
</style>
</head>
<body>
	<div class="add_content" >
		<div class="list-group" style="margin-bottom: 0px;">
   <a class="list-group-item active">
      <h5 class="list-group-item-heading">
         设置编辑权限<input type="hidden" id="folderId" />
      </h5>
   </a>
   <div class="panel-body" style="border:none;box-shadow:none;" >
  <table class="table table-striped"  >
   <tr>
<td width="15%">授权部门:</td>
<td>
<textarea  name="deptPriv" id="deptPriv" style="display: none;"></textarea>
<textarea  name="deptName" readonly="readonly" id="deptName"  class="form-control" style="height:100px;width:330px;float:left;" ></textarea>
<input type="button" style="margin-top:66px;margin-left:10px;float:left;" class="btn btn-default" value="添加部门" onclick="deptinit(['deptPriv','deptName']);" />
<input type="button" style="margin-top:66px;margin-left:10px;float:left;" class="btn btn-default" value="清空" onclick="clearDept();"/></td>
</tr>
<tr>
<td width="15%">授权角色:</td>
<td><textarea   id="userPriv" name="userPriv" style="display:none;"></textarea>
<textarea  id="userPrivName" name="userPrivName" readonly="readonly" class="form-control" style="height:100px;width:330px;float:left;" ></textarea>
<input type="button" style="margin-top:66px;margin-left:10px;float:left;" class="btn btn-default" value="添加角色" onclick="privinit(['userPriv','userPrivName']);" />
<input type="button" style="margin-top:66px;margin-left:10px;float:left;" class="btn btn-default" value="清空" onclick="clearPriv();"/></td>
</tr>
<tr>
<td width="15%">授权人员:</td>
<td><textarea  name="accountId" id="accountId" style="display: none;" ></textarea>
<textarea  name="userName" readonly="readonly" id="userName" class="form-control" style="height:100px;width:330px;float:left;" ></textarea>
	<input type="button" style="margin-top:66px;margin-left:10px;float:left;" class="btn btn-default" value="添加人员" onclick="userinit(['accountId','userName']);"/>
	<input type="button" style="margin-top:66px;margin-left:10px;float:left;" class="btn btn-default" value="清空" onclick="clearUser();"/></td>
</tr>
</table>
</div>
</div>
 <div align="right">
 <button type="button" id="btn_ok" class="btn btn-success">确定</button>
<button type="button" id="btn_back" class="btn btn-default">返回</button>
   </div>
</div>
<div id="modaldialog"></div>
</body>
<script type="text/javascript">
var folderId = "<%=folderId%>";
$(function(){
	var requestUrl= '<%=contextPath%>/tfd/system/folder/act/FolderAct/getPriv.act';
	$.ajax({
			url:requestUrl,
			data:{folderId:encodeURIComponent(folderId),privId:'2',isPublic:'1'},
			dataType:"json",
			async:false,
			error:function(e){
				alert(e.message);
			},
			success:function(data){
				$('#folderId').val(data.folderId);
				$('#deptPriv').val(data.editDept);
				$('#deptName').val(data.editDeptName);
				$('#userPriv').val(data.editPriv);
				$('#userPrivName').val(data.editPrivName);
				$('#accountId').val(data.editUser);
				$('#userName').val(data.editUserName);
			}
	});
	$('#btn_ok').click(function(){
 		var requestUrl= '<%=contextPath%>/tfd/system/folder/act/FolderAct/updatePriv.act';
 		$.ajax({
 				url:requestUrl,
 				data:{
 					folderId:$('#folderId').val(),
 					privId:'2',
 					Dept:$('#deptPriv').val(),
 					Priv:$('#userPriv').val(),
 					User:$('#accountId').val()
 				},
 				dataType:"json",
 				async:false,
 				error:function(e){
 					alert(e.message);
 				},
 				success:function(data){
 					if(data=='1'){
 						top.layer.msg('设置成功');
 					}
 				}
 		});
 	});
	$('#btn_back').click(function(){
		history.go(-1);
		return false;
	})
});
</script>
</html>