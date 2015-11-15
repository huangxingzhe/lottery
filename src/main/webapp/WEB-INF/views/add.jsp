<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib  prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!doctype html public "-//w3c//dtd xhtml 1.0 transitional//en" "http://www.w3.org/tr/xhtml1/dtd/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>打奖必中</title>
<link href="../../css/style.css" type=text/css rel=stylesheet>
<style type="text/css">
	.content{
	border: solid #cde6ff;
	border-width: 0px 1px 1px 0px;
	padding: 8px 0px;
	text-align: center;
	width:33px;
	}
	#head td{font-weight:bold }
</style>
	  <style type="text/css">
.mask{position: absolute;
        top: 0px; 
        left: 0px; 
        filter: alpha(opacity=50);
        -moz-opacity:0.5;   
        opacity:0.5; 
        background-color: #ffffff;
        z-index: 2; 
        display: none;}
    
 /*  弹出基本资料div */
div.sample_popup {height:auto; border: 1px solid #327eca; width: 300px;  } 
div.menu_form_header{ 

 background: url('../images/baseInfo/titleBG.gif') repeat-x;

} 
div.sample_popup div.menu_form_header 
{ 
 
  border-bottom: 0px; 
  cursor: default; 
   width:100%;
  height:      22px; 
  line-height: 22px; 
  vertical-align: middle; 
  text-decoration: none; 
  font-family: "Times New Roman", Serif; 
  font-weight: 800; 
  font-size: 13px; 
  color: #206040; 
} 
div.menu_form_body 
{ 
 
  width:100%; 
  height:150px;
  font-size:12px;
  background-color:#218868;
} 
div.sample_popup input.menu_form_exit 
{ 
  float: right; 
  margin: 4px 5px 0px 0px; 
  cursor: pointer; 
} 
.center{ margin-right: auto;
margin-left: auto;
background:#218868;
vertical-align:middle;
line-height:200px;
text-align:center;
font-weight:bold;
}

</style>
<script type="text/javascript">

var DivWindow= function(popup/*最外层div id*/,popup_drag/*拖动div id*/,popup_exit/*退出按钮id*/ ,exitButton/*触发服务器端退出按钮id*/,varwidth,varheight,zindex){
 this.popup =popup ; //窗口名称
  this.popup_drag=popup_drag;
 this.height =varheight ; //窗口高度，并没用来设置窗口高度宽度，用来定位在屏幕的位置
 this.width =varwidth ; //窗口宽度
        this.popup_exit=popup_exit;
        this.exitButton=exitButton;
        this.zindex=zindex;      
 this.init = function(){ //初始化窗口
  
  
  this.popupShow();
  //this.startDrag(); //设置拖动
  
  //this.setCommond(); //设置关闭
  //DivWindow.ArrayW.push(document.getElementById(this.popup)); //存储窗口到数组

 };this.init();
};





//设定窗口优先级
DivWindow.prototype.setTop = function(){
 document.getElementById(this.popup).onclick = 
 document.getElementById(this.popup).onmousedown = 
 function(){
  for(var i=0;i<DivWindow.ArrayW.length;i++)
  {
   DivWindow.ArrayW[i].style.zIndex = 1;
  }
  this.style.zIndex = 100;
 }; 
};
//显示
DivWindow.prototype.popupShow=function() 
{       
        var  element   = document.getElementById(this.popup); 
        element.style.position   = "absolute"; 
        element.style.visibility = "visible"; 
        element.style.display    = "block"; 
        element.style.width=this.width;
        element.style.height='auto';
        element.style.left = (window.screen.width - this.width)/2+"px";
         element.style.top  =20+"px";
        element.style.zIndex=this.zindex;
} 

function close(){
	$("#popDetail").text("");
	$("#popup").hide();
}
</script>
</head>

<body>
	<div class=searchzone>
	<form id="form" action="add.do" method="post">
     <table>
     <tr style="margin:5px;">
      <td height="30" class="tx-l bold" >期数:
      	<select name="startNo" id="startNo">
      		<option value="">--请选择期数--</option>
      		<option value="1763" <c:if test="${lot.startNo==1763}">selected</c:if>>1763</option>
      		<option value="1764" <c:if test="${lot.startNo==1764}">selected</c:if>>1764</option>
      		<option value="1765" <c:if test="${lot.startNo==1765}">selected</c:if>>1765</option>
      		<option value="1766" <c:if test="${lot.startNo==1766}">selected</c:if>>1766</option>
      		<option value="1767" <c:if test="${lot.startNo==1767}">selected</c:if>>1767</option>
      		<option value="1768" <c:if test="${lot.startNo==1768}">selected</c:if>>1768</option>
      		<option value="1769" <c:if test="${lot.startNo==1769}">selected</c:if>>1769</option>
      		<option value="1770" <c:if test="${lot.startNo==1770}">selected</c:if>>1770</option>
      		<option value="1771" <c:if test="${lot.startNo==1771}">selected</c:if>>1771</option>
      		<option value="1772" <c:if test="${lot.startNo==1772}">selected</c:if>>1772</option>
      		<option value="1773" <c:if test="${lot.startNo==1773}">selected</c:if>>1773</option>
      		<option value="1774" <c:if test="${lot.startNo==1774}">selected</c:if>>1774</option>
      		<option value="1775" <c:if test="${lot.startNo==1775}">selected</c:if>>1775</option>
      		<option value="1776" <c:if test="${lot.startNo==1776}">selected</c:if>>1776</option>
      		<option value="1777" <c:if test="${lot.startNo==1777}">selected</c:if>>1777</option>
      		<option value="1778" <c:if test="${lot.startNo==1778}">selected</c:if>>1778</option>
      	</select>
      </td>
      <td class="tx-l"><input type="submit" value="统计" />&nbsp;&nbsp;<input type="button" onclick="javascript:$('input[type=text]').attr('value','');" value="清空" /></td>
      <td class="tx-l" colspan="4" style="text-align:right;"><input type="text" name="searchContent" value="" id="searchContent"><input type="button" id="search" value="搜索" /></td>
     </tr>
     <tr>
     	<td width="10%">
     		<table>
     			 <tr>
					  <td height="30" class="tx-c bold">数据名称</td>
				 </tr>
				 <tr>
				 	<td><input name="dataName" type="text" value="${lot.dataName}"  id="dataName" class="dtext2" /></td>
				 </tr>
				 <tr>
				 	<td><input name="dataName" type="text" value="${lot.dataName}"  id="dataName" class="dtext2" /></td>
				 </tr>
				  <tr>
				  	<td><input name="dataName" type="text" value="${lot.dataName}"  id="dataName" class="dtext2" /></td>
				 </tr>
				  <tr>
				  	<td><input name="dataName" type="text" value="${lot.dataName}"  id="dataName" class="dtext2" /></td>
				 </tr>
				  <tr>
				  	<td><input name="dataName" type="text" value="${lot.dataName}"  id="dataName" class="dtext2" /></td>
				 </tr>
     		</table>
     	</td>
     	<td width="15%">
     		<table>
     			<tr>
     			</tr>
     			<tr>
     				<td height="30" class="tx-r bold" style="padding-right:20%;">千位</td>
     			</tr>
     			<tr>
     				<td><input type="radio" name="qianRadio1" value="1" <c:if test="${lot==null ||lot.qianRadio1==1}">checked</c:if>>默认
			          <input type="radio" name="qianRadio1" value="2" <c:if test="${lot.qianRadio1==2}">checked</c:if>>杀数
			      	 <input name="qian" type="text" value="${lot.qian}"  id="qian" class="dtext" />
			        </td>
     			</tr>
     			<tr>
     				 <td><input type="radio" name="qianRadio2" value="1" <c:if test="${lot==null ||lot.qianRadio2==1}">checked</c:if>>默认
			          <input type="radio" name="qianRadio2" value="2" <c:if test="${lot.qianRadio2==2}">checked</c:if>>杀数
			      	  <input name="qian" type="text" value="${lot.qian}"  id="qian" class="dtext" />
			      </td>
     			</tr>
     			<tr>
     				<td><input type="radio" name="qianRadio3" value="1" <c:if test="${lot==null ||lot.qianRadio3==1}">checked</c:if>>默认
			          <input type="radio" name="qianRadio3" value="2" <c:if test="${lot.qianRadio3==2}">checked</c:if>>杀数
			      	  <input name="qian" type="text" value="${lot.qian}"  id="qian" class="dtext" />
			      </td>
     			</tr>
     			<tr>
     				<td><input type="radio" name="qianRadio4" value="1" <c:if test="${lot==null ||lot.qianRadio4==1}">checked</c:if>>默认
			          <input type="radio" name="qianRadio4" value="2" <c:if test="${lot.qianRadio4==2}">checked</c:if>>杀数
			      	  <input name="qian" type="text" value="${lot.qian}"  id="qian" class="dtext" />
			        </td>
     			</tr>
     			<tr>
     				<td><input type="radio" name="qianRadio5" value="1" <c:if test="${lot==null ||lot.qianRadio5==1}">checked</c:if>>默认
			          <input type="radio" name="qianRadio5" value="2" <c:if test="${lot.qianRadio5==2}">checked</c:if>>杀数
			      	  <input name="qian" type="text" value="${lot.qian}"  id="qian" class="dtext" />
			        </td>
     			</tr>  
     		</table>
     	</td>
     	<td style="border-right:1px #cccccc solid;padding-left:2px;"></td>
     	<td width="15%">
     		<table>
     			<tr>
     				<td height="30" class="tx-r bold" style="padding-right:20%;">百位</td>
     			</tr>
     			<tr>
     				<td><input type="radio" name="baiRadio1" value="1" <c:if test="${lot==null ||lot.baiRadio1==1}">checked</c:if>>默认 
			          <input type="radio" name="baiRadio1" value="2" <c:if test="${lot.baiRadio1==2}">checked</c:if>>杀数
			      	  <input name="bai" type="text" value="${lot.bai}"  id="bai" class="dtext" />
			      </td>
     			</tr>
     			<tr>
     				<td><input type="radio" name="baiRadio2" value="1" <c:if test="${lot==null ||lot.baiRadio2==1}">checked</c:if>>默认 
			          <input type="radio" name="baiRadio2" value="2" <c:if test="${lot.baiRadio2==2}">checked</c:if>>杀数
			      	 <input name="bai" type="text" value="${lot.bai}"  id="bai" class="dtext" />
			      </td>
     			</tr>
     			<tr>
     				 <td><input type="radio" name="baiRadio3" value="1" <c:if test="${lot==null ||lot.baiRadio3==1}">checked</c:if>>默认 
			          <input type="radio" name="baiRadio3" value="2" <c:if test="${lot.baiRadio3==2}">checked</c:if>>杀数
			      	  <input name="bai" type="text" value="${lot.bai}"  id="bai" class="dtext" />
			      </td>
     			</tr>
     			<tr>
     				  <td><input type="radio" name="baiRadio4" value="1" <c:if test="${lot==null ||lot.baiRadio==1}">checked</c:if>>默认 
			          <input type="radio" name="baiRadio4" value="2" <c:if test="${lot.baiRadio==2}">checked</c:if>>杀数
			      	  <input name="bai" type="text" value="${lot.bai}"  id="bai" class="dtext" />
			      </td>
     			</tr>
     			<tr>
     				 <td><input type="radio" name="baiRadio5" value="1" <c:if test="${lot==null ||lot.baiRadio5==1}">checked</c:if>>默认 
		          <input type="radio" name="baiRadio5" value="2" <c:if test="${lot.baiRadio5==2}">checked</c:if>>杀数
		      	  <input name="bai" type="text" value="${lot.bai}"  id="bai" class="dtext" />
		     	  </td>
     			</tr>
     		</table>
     	</td>
     	<td style="border-right:1px #cccccc solid;padding-left:2px;height:80%;"></td>
     	<td width="15%">
     		<table>
     			<tr>
     				<td height="30" class="tx-r bold" style="padding-right:20%;">十位</td>
     			</tr>
     			<tr>
     				 <td><input type="radio" name="shiRadio1" value="1" <c:if test="${lot==null ||lot.shiRadio1==1}">checked</c:if>>默认
			          <input type="radio" name="shiRadio1" value="2" <c:if test="${lot.shiRadio1==2}">checked</c:if>>杀数
			      	  <input name="shi" type="text" value="${lot.shi}"  id="shi" class="dtext" />
			      </td>
     			</tr>
     			<tr>
     				<td><input type="radio" name="shiRadio2" value="1" <c:if test="${lot==null ||lot.shiRadio3==1}">checked</c:if>>默认
			          <input type="radio" name="shiRadio2" value="2" <c:if test="${lot.shiRadio2==2}">checked</c:if>>杀数
			      	  <input name="shi" type="text" value="${lot.shi}"  id="shi" class="dtext" />
			      </td>
     			</tr>
     			<tr>
     				<td><input type="radio" name="shiRadio3" value="1" <c:if test="${lot==null ||lot.shiRadio3==1}">checked</c:if>>默认
			          <input type="radio" name="shiRadio3" value="2" <c:if test="${lot.shiRadio3==2}">checked</c:if>>杀数
			      	  <input name="shi" type="text" value="${lot.shi}"  id="shi" class="dtext" />
			      </td>
     			</tr>
     			<tr>
     				<td><input type="radio" name="shiRadio4" value="1" <c:if test="${lot==null ||lot.shiRadio4==1}">checked</c:if>>默认
			          <input type="radio" name="shiRadio4" value="2" <c:if test="${lot.shiRadio4==2}">checked</c:if>>杀数
			      	  <input name="shi" type="text" value="${lot.shi}"  id="shi" class="dtext" />
			      </td>
     			</tr>
     			<tr>
     				 <td><input type="radio" name="shiRadio5" value="1" <c:if test="${lot==null ||lot.shiRadio5==1}">checked</c:if>>默认
			          <input type="radio" name="shiRadio5" value="2" <c:if test="${lot.shiRadio5==2}">checked</c:if>>杀数
			      	  <input name="shi" type="text" value="${lot.shi}"  id="shi" class="dtext" />
			      </td>
     			</tr>
     		</table>
     	</td>
     	<td style="border-right:1px #cccccc solid;padding-left:2px;height:80%"></td>
     	<td width="15%">
     		<table>
     			<tr>
     			  <td height="30" class="tx-r bold" style="padding-right:20%;">个位</td>
     			</tr>
     			<tr>
     				 <td><input type="radio" name="gewRadio1" value="1" <c:if test="${lot==null ||lot.gewRadio1==1}">checked</c:if>>默认 
			          <input type="radio" name="gewRadio1" value="2" <c:if test="${lot.gewRadio1==2}">checked</c:if>>杀数
			      	  <input name="gew" type="text" value="${lot.gew}"  id="gew" class="dtext" />
			      </td>
     			</tr>
     			<tr>
     				<td><input type="radio" name="gewRadio2" value="1" <c:if test="${lot==null ||lot.gewRadio2==1}">checked</c:if>>默认 
			          <input type="radio" name="gewRadio2" value="2" <c:if test="${lot.gewRadio2==2}">checked</c:if>>杀数
			      	  <input name="gew" type="text" value="${lot.gew}"  id="gew" class="dtext" />
			      </td>
     			</tr>
     			<tr>
     				 <td><input type="radio" name="gewRadio3" value="1" <c:if test="${lot==null ||lot.gewRadio3==1}">checked</c:if>>默认 
			          <input type="radio" name="gewRadio3" value="2" <c:if test="${lot.gewRadio3==2}">checked</c:if>>杀数
			      	  <input name="gew" type="text" value="${lot.gew}"  id="gew" class="dtext" />
			      </td>
     			</tr>
     			<tr>
     				<td><input type="radio" name="gewRadio4" value="1" <c:if test="${lot==null ||lot.gewRadio4==1}">checked</c:if>>默认 
			          <input type="radio" name="gewRadio4" value="2" <c:if test="${lot.gewRadio4==2}">checked</c:if>>杀数
			      	  <input name="gew" type="text" value="${lot.gew}"  id="gew" class="dtext" />
			      </td>
     			</tr>
     			<tr>
     				<td><input type="radio" name="gewRadio5" value="1" <c:if test="${lot==null ||lot.gewRadio5==1}">checked</c:if>>默认 
		          <input type="radio" name="gewRadio5" value="2" <c:if test="${lot.gewRadio5==2}">checked</c:if>>杀数
		      	  <input name="gew" type="text" value="${lot.gew}"  id="gew" class="dtext" />
		    	  </td>
     			</tr>
     		</table>
     	</td>
     	<td width="25%">
     		<!-- <form id="remarkForm" action="add/remark.do" method="post" style="padding-top:70px;"> -->
		  		<div style="padding-top:40px;"><textarea rows="8" cols="40" name="content"  id="remark">${remark.content}</textarea>
		  		<input type="hidden" value="${remark.id}" name="id" id="remarkId"/>
		  		<input type="button" value="保存" id="saveBtn"/>
		  		</div>
		  	<!-- </form> -->
     	</td>
     </tr>
  </table>
  </form>
  </div>
	<div class=listzone id="loadResult" style="display:none;"></div>
	<!-- <div class=listzone id="searchResult" style="display:none;"></div> -->
	<div class=listzone id="history" style="display:none;"></div>
	<br/>
	<br/>
	<br/>
	<br/>
	<script type="text/javascript" src="../../js/jquery-1.8.0.min.js"></script>
	<script type="text/javascript" src="../../js/jquery.form.js"></script>
	<script type="text/javascript" src="../../js/jquery.validate.min.js"></script>
	<script language="javascript" type="text/javascript">
	  $(function(){
           	jQuery("#form").validate({
       			rules: {
       				startNo:"required"
       			},
       			messages: {
       				startNo: "请选择期数"
       			},
       			submitHandler: function(form) {
       				$("#submit").attr("disabled", true); 
       				jQuery(form).ajaxSubmit({  
       	                type:"post",  //提交方式  
       	                dataType:"json", //数据类型  
       	                url:"add.do",
       	                success:function(data){ //提交成功的回调函数  
       	                    var json = eval(data);
       	                	if(json.ret==1000){
       	                		$("#popDetail").html(json.msg);
           	                	new DivWindow('popup','popup_drag','popup_exit','exitButton','500','700',4);
           	                	setTimeout('close()',500);
       	                		//alert(json.msg);
       	                		loadCountResult();
       	                		history();
       	                		$("input[type=text]").attr("value","");
       	                		//$('#form')[0].reset()
       	                	}
       	                	else{
       	                		alert(json.msg);
       	                	}
       	                }  
       	            });
       			}
       		});
           	$("#saveBtn").click(function(){
           		var remark = $("#remark").val();
           		var remarkId = $("#remarkId").val();
           		$.post("add/remark.do",{content:remark,id:remarkId},function(data){
	           		var json = eval(data);
	             	if(json.ret==1000){
	             		alert(json.msg);
	             	}else{
	             		alert(json.msg);
	             	}
           		},"json")
           		
           	});
           	$("#search").click(function(){
           		  var startNo = $("#startNo").val();
           		  var dataName = $("#searchContent").val();
           		  if(startNo==''||dataName==''){
           			  alert("期数和搜索内容不能为空");
           			  return false;
           		  }
        		  var params = {dataName:dataName,startNo:startNo};
        		  $("#history").load("search.do",params);
        		  $("#history").show();
           	});
         	/* jQuery("#remarkForm").validate({
       			submitHandler: function(form) {
       				jQuery(form).ajaxSubmit({  
    	                type:"post",  //提交方式  
    	                dataType:"json", //数据类型  
    	                url:"add/remark.do",
    	                success:function(data){ //提交成功的回调函数  
    	                    var json = eval(data);
    	                	if(json.ret==1000){
    	                		alert(json.msg);
    	                	}else{
    	                		alert(json.msg);
    	                	}
    	                }  
    	            });
       			}
       		}); */
        	
	            		
	    });  
	  
	  function loadCountResult(){
		  var params = {startNo:$("#startNo").val()};
		  $("#loadResult").load("list.do",params);
		  $("#loadResult").show();
	  }
	  function history(){
		  var params = {startNo:$("#startNo").val()};
		  $("#history").load("history.do",params);
		  $("#history").show();
	  }
	</script>

<div class="sample_popup"     id="popup" style="visibility: hidden; display: none;"> 
<div class="menu_form_body" > 
 <div id="popDetail" class="center">
 </div>
</div>
</div>
</body>
</html>
