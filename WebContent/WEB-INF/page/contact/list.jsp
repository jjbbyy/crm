<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ include file="/commons/common.jsp" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<script type="text/javascript">
	 $(function(){
		$("img[id^='delete-']").click(function(){
			var lenght=$("#size").val;
			if(lenght=1){
				alert("该联系人不能被删除");
				window.location.reload();
			}
		})
	}) 

</script>
<head>
	<title>联系人管理</title>
</head>

<body>

	<div class="page_title">
		联系人管理
	</div>
	<div class="button_bar">

		<button class="common_button" onclick="window.location.href='${ctp}/contact/?customerid=${customer.id }'">
			新建
		</button>
		<button class="common_button" onclick="javascript:history.go(-1);">
			返回
		</button>
	</div>
	
	<form action="${ctp}/contact/list" method="post">
		<table class="query_form_table" border="0" cellPadding="3"
			cellSpacing="0">
			<tr>
				<th>
					客户编号
				</th>
				<td>${customer.no}</td>
				<th>
					客户名称
				</th>
				<td>${customer.name}</td>
			</tr>
		</table>
		<!-- 列表数据 -->
		<br />
		
		<c:if test="${page != null && page.totalElments > 0 }">
			<table class="data_list_table" border="0" cellPadding="3"
				cellSpacing="0">
				<tr>
					<th>
						姓名
					</th>
					<th>
						性别
					</th>
					<th>
						职位
					</th>
					<th>
						办公电话
					</th>
					<th>
						手机
					</th>
					<th>
						备注
					</th>
					<th>
						操作
					</th>
				</tr>
	
				<c:forEach var="contact" items="${page.content }">
					<tr>
						<td class="list_data_text">
							${contact.name}
						</td>
						<td class="list_data_text">
							${contact.sex}
						</td>
						<td class="list_data_text">
							${contact.position}
						</td>
						<td class="list_data_text">
							${contact.tel}
						</td>
						<td class="list_data_text">
							${contact.mobile}
						</td>

						<td class="list_data_ltext">
							${contact.memo}
						</td>
						<td class="list_data_op">
							<img onclick="window.location.href='${ctp}/contact/${contact.id}'" 
								title="编辑" src="${ctp }/static/images/bt_edit.gif" class="op_button" />
							<img id="delete-${contact.id }" onclick="window.location.href='${ctp}/contact/${contact.id }?&customerid=${customer.id }&_method=delete'" 
								title="删除" src="${ctp }/static/images/bt_del.gif" class="op_button" />
						</td>
					</tr>
				</c:forEach>
			</table>
			
							<input type="hidden" id="size" value="${fn:length(page.content) }">
		</c:if>
		<c:if test="${page == null || page.totalElments == 0 }">
			没有任何数据
		</c:if>
	</form>
</body>
</html>