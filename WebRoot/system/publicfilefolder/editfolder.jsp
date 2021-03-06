<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/system/returnapi/api.jsp" %> 
<%
	String folderId = request.getParameter("folderId");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新建公共资源</title>
<style type="text/css">
	.add_content{height:80%;width:60%;position:absolute;top:50px;left:20%;}
</style>
</head>
<body>
<form id="form1" name="form1" class="form-horizontal" >
	<div class="add_content" >
		<div class="list-group" style="margin-bottom: 0px;">
   <a class="list-group-item active">
      <h5 class="list-group-item-heading">
         修改文件夹
      </h5>
   </a>
   <div class="panel-body" style="border:none;box-shadow:none;" >
   <table class="table table-striped"  >
   <tr>
<td width="15%">排序号:</td>
<td><div class="col-xs-8 form-group" ><input class="form-control " type="text" id="folderNo" name="folderNo" /></div><input type="hidden" id="folderId" /></td>
</tr>
<tr>
<td width="15%">共享目录名称:</td>
<td><div class="col-xs-8 form-group" ><input class="form-control " type="text" id="folderName" name="folderName"  /></div></td>
</tr>
</table>
</div>
</div>
 <div align="right">
 <input type=submit id="btn_ok" class="btn btn-success" value="确定" >
<button type="button" id="btn_back" class="btn btn-default">返回</button>
   </div>
</div>
</form>
</body>
<script type="text/javascript">
$('#form1').bootstrapValidator({
	message: '这不是一个有效的值',
	container: 'tooltip',
    feedbackIcons: {
        valid: 'glyphicon glyphicon-ok',
        invalid: 'glyphicon glyphicon-remove',
        validating: 'glyphicon glyphicon-refresh'
    },
	fields: {
		folderNo: {
            validators: {
            	container: 'popover',
                notEmpty: {
                    message: '排序号不能为空'
                },
                integer:{
    				message:'排序号只能为整数'
    			}
            }
        },
        folderName: {
            validators: {
            	container: 'popover',
                notEmpty: {
                    message: '文件夹名称不能为空'
                }
            }
        }
	}
}).on('success.form.bv',function(e){
	 e.preventDefault();
		
     // Get the form instance
     var $form = $(e.target);

     // Get the BootstrapValidator instance
     var bv = $form.data('bootstrapValidator');
     editFolder();
}); 
var folderId = "<%=folderId%>";
$(function(){
	var requestUrl= '<%=contextPath%>/tfd/system/folder/act/FolderAct/getFolderById.act';
	$.ajax({
			url:requestUrl,
			data:{folderId:encodeURIComponent(folderId),isPublic:'1'},
			dataType:"json",
			async:false,
			error:function(e){
				alert(e.message);
			},
			success:function(data){
				$('#folderId').val(data.id);
				$('#folderNo').val(data.folderNo);
				$('#folderName').val(data.name);
			}
	});
	$('#btn_back').click(function(){
		history.go(-1);
		return false;
	})
});

function editFolder(){
		var requestUrl= '<%=contextPath%>/tfd/system/folder/act/FolderAct/updateFolder.act';
		$.ajax({
				url:requestUrl,
				data:{
					folderId:$('#folderId').val(),
					folderNo:$('#folderNo').val(),
					folderName:$('#folderName').val(),
					isPublic:'1'
				},
				dataType:"json",
				async:false,
				error:function(e){
					alert(e.message);
				},
				success:function(data){
					if(data=='1'){
						top.layer.msg('修改成功');
					}
				}
		});
}
</script>
</html>