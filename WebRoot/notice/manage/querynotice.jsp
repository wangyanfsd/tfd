<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/system/returnapi/api.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>公告查询</title>
<link rel="stylesheet" type="text/css" href="<%=stylePath%>/notice/notice.css"></link>
<script type="text/javascript" charset="utf-8"
	src="<%=contextPath%>/system/jsall/My97DatePicker/WdatePicker.js"></script>
	<script type="text/javascript" src="<%=contextPath%>/system/jsall/sysall/code.js"></script>
<script type="text/javascript" src="<%=contextPath%>/notice/manage/js/querynotice.js"></script>
<style type="text/css">
.icontop-basic_hover{
line-height:20px;
background: url(<%=imgPath%>/notice/infofind.png) no-repeat;
background-position: 0px 6px;
}
</style>
</head>
<body>
<div class="top_info" style="height: 40px;">
<div class="top_info_left icontop-basic_hover">
<span class="title_name" style="font-size: 16px;line-height: 40px;" >公告查询
</span>
</div>
</div>
		<div id="bigdiv" style="margin-top: 10px;">
	<div class="list-group-item"  style="padding: 0px;margin-left: 15%;width: 70%;cursor: auto;">
					<form enctype="multipart/form-data" id="form1" name="form1">
						<table class="table table-striped table-condensed">
						<tr align="center">
						<td colspan="2" style="background-color: white;">输入查询条件</td>
						</tr>
							<tr>
								<td>类型：</td>
								<td>
									<div class="col-xs-5">
									<div id="noticeType">
									</div>
									</div></td>
							</tr>
							<tr>
								<td >发布状态：</td>
								<td >
									<div class="col-xs-5">
										<select name="noticeStatus" class="form-control" id="noticeStatus">
											<option value="" selected>全部</option>
											<option value="0">未发布</option>
											<option value="1">已发布</option>
										</select>
									</div>
								</td>
							</tr>
							<tr>
								<td >审批状态：</td>
								<td>
									<div class="col-xs-5">
										<select name="approvalStatus" class="form-control" id="approvalStatus">
											<option value="" selected>全部</option>
											<option value="0">未审批</option>
											<option value="1">审批通过</option>
											<option value="2">审批未通过</option>
										</select>
									</div>
								</td>
							</tr>
							<tr>
								<td >标题：</td>
								<td >
									<div class="col-xs-5">
										<input class="form-control " type="text" name="noticeTitle"
											id="noticeTitle" size="33" maxlength="100" class="BigInput"
											value="">
									</div>
								</td>
							</tr>
							<tr>
								<td >发布日期：</td>
								<td >
									<div class="col-xs-5">
										<input class="form-control " type="text" id="starttime" readonly="readonly" style="cursor: pointer;"
											name="starttime" size="12" maxlength="10" value=""
											onClick="WdatePicker()" />
									</div>
									<div style="float: left;">&nbsp;至：&nbsp;</div>
									<div class="col-xs-5">
										<input class="form-control " readonly="readonly" style="float: left;cursor: pointer;" type="text"
											id="endtime" name="endtime" size="12" maxlength="10"
											class="BigInput" value="" onClick="WdatePicker()" />
									</div>
									</div>
								</td>
							</tr>
							<tr>
								<td >内容：</td>
								<td >
									<div class="col-xs-5">
										<input class="form-control " type="text" id="noticeContent"
											name="noticeContent" size="33" maxlength="200" class="BigInput"
											value="">
									</div>
								</td>
							</tr>
							<tr>
								<td  >操作：</td>
								<td>
								<input type="radio"name="OPERATION" id="OPERATION1" value="1" checked>&nbsp;查询&nbsp;
									<input type="radio" name="OPERATION" id="OPERATION2" value="2">&nbsp;删除&nbsp;
									 <input type="radio" name="OPERATION" id="OPERATION3"value="3">
									 &nbsp;导出excel文件
								</td>
							</tr>
							<tr align="center">
								<td colspan="2"><input
									type="button" value="确定" class="btn btn-primary"
									onclick="handle();">&nbsp;&nbsp; <input type="reset"
									value="重置" class="btn btn-default">&nbsp;&nbsp;</td>
							</tr>
						</table>
					</form>
	</div>
	</div>
	<div id="table" style="display: none;width: 100%;">
		<div style="float:left; width: 100%;line-height: 50px;,margin-top: 5px;">
			<input type="button" value="返回查询页面" class="btn btn-primary"
				onclick="returnquery();">
		</div>
		</br>
		<div id="myTable" name="myTable"></div>
	</div>
</body>
</html>