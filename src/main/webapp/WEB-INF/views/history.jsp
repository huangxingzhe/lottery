<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<style type="text/css">
body,ul,li{margin: 0;padding: 0;font: 12px normal "宋体", Arial, Helvetica, sans-serif;list-style: none;}
a{text-decoration: none;color: #000;font-size: 14px;}

#tabbox{ width:100%; overflow:hidden; margin:0 auto;}
.tab_conbox{border: 1px solid #999;border-top: none;}
.tab_con{ display:none;height:250px; overflow:auto;}

.tabs{height: 32px;border-bottom:1px solid #999;border-left: 1px solid #999;width: 100%;}
.tabs li{width:100px;height:31px;line-height:31px;font-weight:bold;text-align:center;float:left;border:1px solid #999;border-left:none;margin-bottom: -1px;background: #e0e0e0;overflow: hidden;position: relative;}
.tabs li a {display: block;padding: 0 20px;border: 1px solid #fff;outline: none;}
.tabs li a:hover {background: #ccc;}	
.tabs .thistab,.tabs .thistab a:hover{background: #fff;border-bottom: 1px solid #fff;}

.tab_con {padding:12px;font-size: 14px; line-height:175%;}
TD.content2{border:solid #cde6ff; border-width:0px 1px 1px 0px; padding:8px 0px;text-align:center;font-weight:bold;width:80px;}
</style>
<script type="text/javascript">
$(document).ready(function() {
	jQuery.jqtab = function(tabtit,tab_conbox,shijian) {
		$(tab_conbox).find("li").hide();
		$(tabtit).find("li:first").addClass("thistab").show(); 
		$(tab_conbox).find("li:first").show();
	
		$(tabtit).find("li").bind(shijian,function(){
		  $(this).addClass("thistab").siblings("li").removeClass("thistab"); 
			var activeindex = $(tabtit).find("li").index(this);
			$(tab_conbox).children().eq(activeindex).show().siblings().hide();
			return false;
		});
	
	};
	/*调用方法如下：*/
	//$.jqtab("#tabs","#tab_conbox","click");
	
	$.jqtab("#tabs2","#tab_conbox2","mouseenter");
	
});
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
	<div id="tabbox">
   
    <ul class="tabs" id="tabs2">
       <li>千位</li>
       <li>百位</li>
       <li>十位</li>
       <li>个位</li>
    </ul>
    <ul class="tab_conbox" id="tab_conbox2">
    	
        <li class="tab_con">
          <table>
          	<tr ><td class="content2">编号<td class="content2" >名称</td><td class="content2" >类型</td>
          		<td class="content2">0</td><td class="content2">1</td><td class="content2">2</td><td class="content2">3</td>
				<td class="content2">4</td><td class="content2">5</td><td class="content2">6</td><td class="content2">7</td>
				<td class="content2">8</td><td class="content2">9</td>
				<td class="content2">操作</td>
			</tr>
			<c:forEach items="${qian}" var="lot" varStatus="st">
			<tr bgcolor="#FFFFFF" onmouseover="this.bgColor='#f2f9fd'" onmouseout="this.bgColor='#FFFFFF'" id="lotId${lot.id}">
			<td class="content2">${st.index+1}</td>
			<td class="content">${lot.dataName}</td>
			<td class="content">
				<c:if test="${lot.radio==1}">默认</c:if>
				<c:if test="${lot.radio==2}">杀数</c:if>
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
        </li>
            
        <li class="tab_con">
        	<table>
        	<tr><td class="content2">编号<td class="content2">名称</td><td class="content2" >类型</td>
        		<td class="content2">0</td><td class="content2">1</td><td class="content2">2</td><td class="content2">3</td>
				<td class="content2">4</td><td class="content2">5</td><td class="content2">6</td><td class="content2">7</td>
				<td class="content2">8</td><td class="content2">9</td>
				<td class="content2">操作</td>
			</tr>
			<c:forEach items="${bai}" var="lot" varStatus="st">
			<tr bgcolor="#FFFFFF" onmouseover="this.bgColor='#f2f9fd'" onmouseout="this.bgColor='#FFFFFF'" id="lotId${lot.id}">
			<td class="content">${st.index+1}</td><td class="content">${lot.dataName}</td>
			<td class="content">
				<c:if test="${lot.radio==1}">默认</c:if>
				<c:if test="${lot.radio==2}">杀数</c:if>
			</td>
			<td class="content">${lot.zero}</td><td class="content">${lot.one}</td><td class="content">${lot.two}</td><td class="content">${lot.three}</td><td class="content">${lot.four}</td><td class="content">${lot.five}</td>
			<td class="content">${lot.six}</td><td class="content">${lot.seven}</td><td class="content">${lot.eight}</td><td class="content">${lot.nine}</td>
			<td class="content"><a href="###" onclick="del(${lot.id});">刪除</a></td>
			</tr>
			</c:forEach>
			</table>
        </li>
    
        <li class="tab_con">
        	<table>
        	<tr><td class="content2">编号<td class="content2">名称</td><td class="content2" >类型</td>
        		<td class="content2">0</td><td class="content2">1</td><td class="content2">2</td><td class="content2">3</td>
				<td class="content2">4</td><td class="content2">5</td><td class="content2">6</td><td class="content2">7</td>
				<td class="content2">8</td><td class="content2">9</td>
				<td class="content2">操作</td>
			</tr>
			<c:forEach items="${shi}" var="lot" varStatus="st">
			<tr bgcolor="#FFFFFF" onmouseover="this.bgColor='#f2f9fd'" onmouseout="this.bgColor='#FFFFFF'" id="lotId${lot.id}">
			<td class="content">${st.index+1}</td><td class="content">${lot.dataName}</td>
			<td class="content">
				<c:if test="${lot.radio==1}">默认</c:if>
				<c:if test="${lot.radio==2}">杀数</c:if>
			</td>
			<td class="content">${lot.zero}</td><td class="content">${lot.one}</td><td class="content">${lot.two}</td><td class="content">${lot.three}</td><td class="content">${lot.four}</td><td class="content">${lot.five}</td>
			<td class="content">${lot.six}</td><td class="content">${lot.seven}</td><td class="content">${lot.eight}</td><td class="content">${lot.nine}</td>
			<td class="content"><a href="###" onclick="del(${lot.id});">刪除</a></td>
			</tr>
			</c:forEach>
			</table>
        </li>
    
        <li class="tab_con">
        	<table>
        	<tr><td class="content2">编号<td class="content2">名称</td><td class="content2" >类型</td>
        		<td class="content2">0</td><td class="content2">1</td><td class="content2">2</td><td class="content2">3</td>
				<td class="content2">4</td><td class="content2">5</td><td class="content2">6</td><td class="content2">7</td>
				<td class="content2">8</td><td class="content2">9</td>
				<td class="content2">操作</td>
			</tr>
			<c:forEach items="${gew}" var="lot" varStatus="st">
			<tr bgcolor="#FFFFFF" onmouseover="this.bgColor='#f2f9fd'" onmouseout="this.bgColor='#FFFFFF'" id="lotId${lot.id}">
			<td class="content">${st.index+1}</td><td class="content">${lot.dataName}</td>
			<td class="content">
				<c:if test="${lot.radio==1}">默认</c:if>
				<c:if test="${lot.radio==2}">杀数</c:if>
			</td>
			<td class="content">${lot.zero}</td><td class="content">${lot.one}</td><td class="content">${lot.two}</td><td class="content">${lot.three}</td><td class="content">${lot.four}</td><td class="content">${lot.five}</td>
			<td class="content">${lot.six}</td><td class="content">${lot.seven}</td><td class="content">${lot.eight}</td><td class="content">${lot.nine}</td>
			<td class="content"><a href="###" onclick="del(${lot.id});">刪除</a></td>
			</tr>
			</c:forEach>
			</table>
        </li>
    </ul>
</div>
</div>
