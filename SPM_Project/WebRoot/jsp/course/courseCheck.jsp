<%@ page language="java" import="java.util.*"
	contentType="text/html; 
charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<%
	//----------------------------------------------------------------
	//Project: SPM System (Client SubSystem) 
	// JSP Name  :courseIntro.jsp 
	// PURPOSE : 课程简介
	// HISTORY：
	//	Create：
	//  Modify：ChenTian    2015.11.07
	//  Copyright  : BUPTSSE   
	//-----------------------------------------------------------------
%>


<html>
<head>
<title>"教育部-IBM精品课程建设项目"软件项目管理课程</title>
<link href="css/fontStyle.css" rel="stylesheet" type="text/css" />
<link href="css/tableStyle.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<div class="article">
		<h1>教学视频进度查询</h1>
		<c:if test="${session.user.position=='1'}">
			<form action="editBasicInfo.do?name=kechengjianjie" method="post">
				<input type="submit" class="btn btn-default" value="内容修改">

			</form>
		</c:if>
		<div>
			<table>
				<thead>
					<tr>
						<th>学号</th>
						<th>进度</th>
					</tr>
				</thead>
				<tbody>
					<s:iterator value="#session.studentList" id="student">
						<tr>
							<td><s:property value="#student.getUserName()" /></td>
							<td><s:property value="#student.getVideoTime()" />%</td>
						</tr>
					</s:iterator>
				</tbody>
			</table>
		</div>
</body>
</html>





