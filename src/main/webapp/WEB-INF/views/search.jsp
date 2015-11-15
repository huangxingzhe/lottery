<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<style>
<!--
TD.content2{border:solid #cde6ff; border-width:0px 1px 1px 0px; padding:8px 0px;text-align:center;font-weight:bold;width:80px;}

-->
</style>
<script>
function del(id){
	if(confirm("确定要删除该记录？")){
		$.getJSON("delete.do",{id:id},function(data){
			 var json = eval(data);
	        	if(json.ret==1000){
	        		$("#popDetail").html(json.msg);
	            	new DivWindow('popup','popup_drag','popup_exit','exitButton','500','700',4);
	            	setTimeout('close()',300);
	            	$("#lotId"+id).remove();
	            	loadCountResult();
	        	}
	        	else{
	        		alert(json.msg);
	        	}
		});
	}
}
</script>
	<div class=listzone>
	<table height="30" cellspacing="0" cellpadding="0" width="100%" border="0">
		<tbody>
			<tr>
				<td align="left" colspan="3">
					搜索結果：
				</td>
			</tr>
		</tbody>
		</table>
	 <table>
          	<tr><td class="content2">编号<td class="content2" >名称</td><td class="content2" >类型</td><td class="content2" >位置</td>
          		<td class="content2">0</td><td class="content2">1</td><td class="content2">2</td><td class="content2">3</td>
				<td class="content2">4</td><td class="content2">5</td><td class="content2">6</td><td class="content2">7</td>
				<td class="content2">8</td><td class="content2">9</td>
				<td class="content2">操作</td>
			</tr>
			<c:forEach items="${lots}" var="lot" varStatus="st">
			<tr bgcolor="#FFFFFF" onmouseover="this.bgColor='#f2f9fd'" onmouseout="this.bgColor='#FFFFFF'" id="lotId${lot.id}">
			<td class="content2">${st.index+1}</td>
			<td class="content">${lot.dataName}</td>
			<td class="content">
				<c:if test="${lot.radio==1}">默认</c:if>
				<c:if test="${lot.radio==2}">杀数</c:if>
			</td>
			<td class="content">
				<c:if test="${lot.type==1}">千位</c:if>
				<c:if test="${lot.type==2}">百位</c:if>
				<c:if test="${lot.type==3}">十位</c:if>
				<c:if test="${lot.type==4}">个位</c:if>
			</td>
			<td class="content">${lot.zero}</td>
			<td class="content">${lot.one}</td>
			<td class="content">${lot.two}</td>
			<td class="content">${lot.three}</td>
			<td class="content">${lot.four}</td>
			<td class="content">${lot.five}</td>
			<td class="content">${lot.six}</td>
			<td class="content">${lot.seven}</td>
			<td class="content">${lot.eight}</td>
			<td class="content">${lot.nine}</td>
			<td class="content"><a href="###" onclick="del(${lot.id});">刪除</a></td>
			</tr>
			</c:forEach>
		  </table>
</div>
