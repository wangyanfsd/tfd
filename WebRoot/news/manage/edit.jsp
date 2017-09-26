<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/system/returnapi/api.jsp" %> 
<%String newsId=request.getParameter("newsId"); %>
<%String status=request.getParameter("status"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
<title>新闻修改</title>
<script type="text/javascript" charset="utf-8" src="<%=contextPath%>/system/jsall/ckeditor_full/ckeditor.js"></script>
<script type="text/javascript" charset="utf-8" src="<%=contextPath%>/system/jsall/My97DatePicker/WdatePicker.js"></script>
<link rel="stylesheet" href="<%=contextPath%>/system/styles/ztree/zTreeStyle/zTreeStyle.css" type="text/css">
<script type="text/javascript" src="<%=contextPath%>/system/jsall/ztree/jquery.ztree.core-3.5.js"></script>
<script type="text/javascript" charset="utf-8" src="<%=contextPath%>/system/jsall/selectorg/showModalDialog.js"></script>
<script type="text/javascript" src="<%=contextPath%>/system/jsall/selectorg/selectuser/selectuser.js"></script>
<script type="text/javascript" src="<%=contextPath%>/system/jsall/selectorg/selectdept/selectdept.js"></script>
<script type="text/javascript" src="<%=contextPath%>/system/jsall/selectorg/selectpriv/selectpriv.js"></script>

<script type="text/javascript" src="<%=contextPath%>/system/jsall/swfupload/swfupload/swfupload.js"></script>
<script type="text/javascript" src="<%=contextPath%>/system/jsall/swfupload/js/swfupload.queue.js"></script>
<script type="text/javascript" src="<%=contextPath%>/system/jsall/swfupload/js/fileprogress.js"></script>
<script type="text/javascript" src="<%=contextPath%>/system/jsall/swfupload/js/handlers.js"></script>

<script type="text/javascript" src="<%=contextPath%>/system/jsall/fileupload/ajaxfileupload.js"></script>
<script type="text/javascript" src="<%=contextPath%>/system/jsall/fileupload/fileupload.js"></script>
<script type="text/javascript" src="<%=contextPath%>/system/jsall/sysall/code.js"></script>
<script type="text/javascript" src="<%=contextPath%>/system/jsall/sysall/messageunit.js"></script>
<script type="text/javascript" src="<%=contextPath %>/news/js/newspower.js"></script>
<script type="text/javascript" src="<%=contextPath %>/news/manage/js/edit.js"></script>
<script type="text/javascript">
var newsId='<%=newsId%>';
var newsstatus='<%=status%>';
var fromdata;
</script>
</head>
<body>
<form id="editnews" name="editnews"  class="form-horizontal">
<div class="list-group-item"  style="padding: 0px;cursor: auto;margin-left: 1%;width: 98%;">
<a style="cursor: auto;" class="list-group-item active">新闻修改</a>
<table class="table table-striped table-condensed">
<input type="hidden" id="approvalstaff" name="approvalstaff" />
<tr>
<td width="15%">新闻标题:
</td>
<td>
<div class="col-xs-4 form-group">
<input type="text" id="title" name="title" class="form-control"/>
</div>
</td>
</tr>
<tr>
<td>新闻类型:</td>
<td>
<div class="col-xs-4 form-group">
<div id="newstype"></div>
</div></td>
</tr>
<tr>
<td> 评论类型：</td>
<td>
<div class="col-xs-4">
<select id="commentStatus" name="commentStatus" class="form-control">
<option value="0" selected="selected">实名评论</option>
<option value="1">匿名评论</option>
<option value="2">禁止评论</option>
</select>
</div>
</td>
</tr>
<tr>
<td>查阅权限(部门):</br><a onclick="showother()" style="cursor: pointer;">更多授权方式</a></td>
<td>
<div class="col-xs-4 form-group">
<textarea rows="3" cols="40" name="deptPriv" id="deptPriv" style="display:none;" ></textarea>
<textarea rows="3" cols="40" name="deptName" readonly="readonly" id="deptName" class="form-control"></textarea></div>
<div style="margin-top: 40px;">
<a href="javascript:void(0)" onclick="deptinit(['deptPriv','deptName'],'false','deptNameval');">添加部门</a>
</div>
</td>
</tr>
<tbody style="display:none;" id="showother">
<tr>
<td style="width:15%;">查阅权限(人员):</td>
<td>
<div class="col-xs-4 form-group">
<textarea rows="3" cols="40" name="accountId" id="accountId" style="display:none;"></textarea>
<textarea rows="3" cols="40" name="userName" readonly="readonly" id="userName" class="form-control"></textarea></div>
<div style="margin-top: 40px;">
<a href="javascript:void(0)" onclick="userinit(['accountId','userName'],'false','deptNameval');">添加人员</a>
</div>
</td>
</tr>
<tr>
<td>查阅权限(角色):</td>
<td>
<input type="text" id="userPriv" name="userPriv" style="display:none;">
<div class="col-xs-4 form-group">
<input type="text" readonly="readonly" id="userPrivName" name="userPrivName" class="form-control"></div>
<div style="margin-top: 8px;">
<a href="javascript:void(0);" onclick="privinit(['userPriv','userPrivName'],'false','deptNameval');">添加角色</a>
</div>
</td>
</tr>
</tbody>
<tr>
<td>发布时间:</td>
<td>
<div class="col-xs-4"><input type="text" name="createTime" id="createTime" size="20" style="cursor: pointer;" readonly="readonly"
			onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" class="form-control"  placeholder="请输选择时间"></div>
<span style="float: left;margin-top: 8px;">结束时间：</span><div class="col-xs-4 form-group">
			<input type="text" name="endTime" id="endTime" size="20" readonly="readonly" style="cursor: pointer;"
			onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" class="form-control" placeholder="请选择时间"></div>
			<span style="float: left;color: red;margin-top: 8px;">为空时手动终止</span>
</td>
</tr>
<tr>
<td>是否置顶:</td>
<td><div class="col-xs-4"><input type="checkbox" id="top" name="top" value="1"></div></td>
</tr>
<tr>
<td>附件:</td>
<td><div id="attachDiv" name="attachDiv"></div></td>
</tr>
<tr>
<td>附件选择:</td>
<td>	

<div style="display: none;" class="fieldset flash" id="fsUploadProgress"></div>
<div style="display: none;" id="divStatus"></div>
<div>

	<a class="addfile"  href="javascript:void(0)">单附件
	<input type="file" onchange="fileUpLoad('news','attach');" hidefocus="true" size="1" id="fileattach" name="fileattach" class="addfile"></a>
	
	<input type="hidden" id="attachId" name="attachId"/>
	
	
	<a class="add_swfupload" href="javascript:void(0)">多附件<span id="attach"></span></a>
	<div style="display: none;"><a href="#"  id="btnCancel" onclick="swfu.cancelQueue();" disabled="disabled"  >取消上传</a></div>

</div>
</td>
</tr>
<tr>
<td colspan="2"> 
<div id="editor" name="editor" style="width:100%;height:200px;"></div>
<script type="text/javascript">CKEDITOR.replace('editor')</script>
</td>
</tr>
<tr>
  <td>提醒：</td>
  <td>
  <div id="smsdiv" name="smsdiv"></div>
  </td>
  </tr>
</table>
</div>
<div align="center">
<input type="submit" id="editbtn" class="btn btn-primary" value="发布"/>
<button type="button" class="btn btn-primary" onclick="updateNews();">保存</button>
<button type="button" class="btn btn-default" onclick="history.back();">返回</button>
</div>
   </form>
   <div id="modaldialog"></div>
</body>
<script type="text/javascript">
var editor = CKEDITOR.instances.editor;
var editorElement = CKEDITOR.document.getById( 'editor' );
$(document).ready(function() {
	$("#editnews").bootstrapValidator({
		 message: 'Pas valide',
		 container: 'tooltip',
		 feedbackIcons: {
		     valid: 'glyphicon glyphicon-ok',
		     invalid: 'glyphicon glyphicon-remove',
		     validating: 'glyphicon glyphicon-refresh'
		 },
		 fields: {
			 title: {
		         validators: {
		        	 container: 'popover',
		             notEmpty: {
		                 message: '不能为空'
		             }
		         }
		     },deptName: {
		         validators: {
		        	 container: 'popover',
		        	 callback: {
		                    message: '不能为空',
		                    callback: function(value, validator) {
		                    	if($("#deptName").val()!=""||$("#userName").val()!="" ||$("#userPrivName").val()!=""){
		                    		return true;
		                    	}else{
		                    		return false;
		                    	}
		                    }
		                }
		         }
		     },userPrivName: {
		         validators: {
		        	 container: 'popover',
		        	 callback: {
		                    message: '不能为空',
		                    callback: function(value, validator) {
		                    	if($("#deptName").val()!=""||$("#userName").val()!="" ||$("#userPrivName").val()!=""){
		                    		return true;
		                    	}else{
		                    		return false;
		                    	}
		                    }
		                }
		         }
		     },userName: {
		         validators: {
		        	 container: 'popover',
		        	 callback: {
		                    message: '不能为空',
		                    callback: function(value, validator) {
		                    	if($("#deptName").val()!=""||$("#userName").val()!="" ||$("#userPrivName").val()!=""){
		                    		return true;
		                    	}else{
		                    		return false;
		                    	}
		                    }
		                }
		         }
		     },newstype: {
		         validators: {
		        	 container: 'popover',
		             notEmpty: {
		                 message: '不能为空'
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
		     checkstatus();
			}); 
	});
</script>
</html>