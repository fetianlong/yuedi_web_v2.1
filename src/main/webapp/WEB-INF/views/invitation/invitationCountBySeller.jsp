<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ include file="../home/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<style type="text/css">
body {background-color: white;}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script src="${ctx}/demo/js/laydate/laydate.js"></script>
<title>悦迪管理平台</title>
<script type="text/JavaScript">
$(document).ready(function () {
	
	$("#invitationSubmit").click(function(){
		 $('#invitation').submit();
	});
	//查询重置
	$("#reset").click(function(){
		$("#pid").val("");
	});
}); 
</script>
</head>
<body>
    <div class="breadcrumbs">
    	<a href="#">${titleName}</a>
        <span>邀请码统计</span>
    </div><!-- breadcrumbs -->
	<!--角色管理-->
    <div class="yaop-info mainav activity-gl ">
        <div class="menu2-info act-z"> 
			<form class="form_default" id="invitation" name="invitationForm" style="margin-top:23px; margin-left:16px;">
				<c:if test="${mypid == '3'}">
				<input type="hidden" name="mypid" value="${mypid }" />
				<label>申请机构</label>
				<c:set var="sellerPid" value="${pid}"></c:set>
				<select name="pid" id="pid" >
					<option value="">-----请选择-----</option>
				  <c:forEach items="${sellerList}" var="seller">
					<option value="${seller.id}" <c:if test="${seller.id eq sellerPid}">selected="selected"</c:if>>${seller.name}</option>
				  </c:forEach>
				</select>
				</c:if>
				<div class="sTableOptions" style="background:none; border:none; float:right; margin-right:25%; margin-top:-9px;">
					<a id="invitationSubmit" class="button" style=" margin-right:10px;"><span>查询</span></a>
					<a id="reset" class="button"><span>重置</span></a>
				</div>
				<input type="hidden" value="${parentId}" id="parentId" name="parentId"/>
			</form> 
        	<div class="sTableOptions" style="margin-left:16px; margin-top:20px;">
<!-- 	            <a id="deleteKnowledge" class="button delete"><span>删除</span></a> -->
<%-- 	            <a id="addInvitation" href="" class="iconlink2" style="float:right; margin-right:10px;"><img src="${ctx}/demo/images/icons/small/black/plus.png" class="mgright5" alt=""> <span>单个新增</span></a>       --%>
	            <a id="addInvitationBySeller" href="${ctx}/invitation/add?parentId=${parentId}&titleName=新增机构的邀请码数量" class="iconlink2" style="float:right; margin-right:10px;"><img src="${ctx}/demo/images/icons/small/black/plus.png" class="mgright5" alt=""> <span>多个新增</span></a>      
	        </div>
        
	        <div id="listview" class="sTableWrapper" style=" margin-left:16px;">       
	            <table cellpadding="0" cellspacing="0" class="sTableHead" width="100%" style="text-align:center;">
	                <colgroup>
	                    <col class="head0" width="3%" />
	                    <col class="head1" width="10%" />
	                    <col class="head0" width="10%" />
	                    <col class="head1" width="10%" />
	                    <col class="head0" width="10%" />
	<!--                     <col class="head1" width="10%" /> -->
	                </colgroup>
	                <tr>
	                    <td width="3%" align="center"><input type="checkbox" class="checkall" /></td>
	                    <td width="10%">申请机构</td>
	<!-- 					<td width="10%">生成日期</td> -->
	                    <td width="10%">邀请码总数</td>
	                    <td width="10%">邀请码已用数</td>
	                    <td width="10%">邀请码剩余数</td>
	                </tr>
	            </table>
	         </div>
	         <div class="sTableWrapper" style=" margin-left:16px;">
				<table cellpadding="0" cellspacing="0" class="sTable" width="100%" style=" text-align:center;">
					<colgroup>
						<col class="con0" width="3%" />
						<col class="con1" width="10%" />
						<col class="con1" width="10%" />
						<col class="con1" width="10%" />
						<col class="con0" width="10%" />
	<!-- 					<col class="con1" width="10%" /> -->
					</colgroup>
				  <c:forEach items="${listCount}" var="listvar">
				  	<tr>
						<td><input id="knowledgeChecked" name="" type="checkbox" value="${listvar.id}" /></td>
						<td>${listvar.name}</td>
	<%-- 					<td><fmt:formatDate value="${listvar.ctime}" type="both"/></td> --%>
						<td>
							${listvar.allCount}
						</td>
						<td>${listvar.yetCount}</td>
						<td>${listvar.residueCount}</td>
					</tr>
				  </c:forEach>
					
				</table>
	        </div>
	        <tags:pagination page="${pageData}" paginationSize="10"/>
	    </div>
    
    	<br clear="all" />
    
	</div><!--maincontent-->
	<br />
	
</body>
</html>