<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="common.CommDAO"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<style type="text/css">
<!--
body {
	margin-left: 3px;
	margin-top: 0px;
	margin-right: 3px;
	margin-bottom: 0px;
}
.STYLE19 {
	color: #344b50;
	font-size: 12px;
}
-->
</style>

<script>
var  highlightcolor='#d5f4fe';
//此处clickcolor只能用win系统颜色代码才能成功,如果用#xxxxxx的代码就不行,还没搞清楚为什么:(
var  clickcolor='#51b2f6';
function  changeto(){
source=event.srcElement;
if  (source.tagName=="TR"||source.tagName=="TABLE")
return;
while(source.tagName!="TD")
source=source.parentElement;
source=source.parentElement;
cs  =  source.children;
//alert(cs.length);
if  (cs[0].style.backgroundColor!=highlightcolor&&source.id!="nc"&&cs[0].style.backgroundColor!=clickcolor)
for(i=0;i<cs.length;i++){
	cs[i].style.backgroundColor=highlightcolor;
}
}

function  changeback(){
if  (event.fromElement.contains(event.toElement)||source.contains(event.toElement)||source.id=="nc")
return
if  (event.toElement!=source&&cs[0].style.backgroundColor!=clickcolor)
//source.style.backgroundColor=originalcolor
for(i=0;i<cs.length;i++){
	cs[i].style.backgroundColor="";
}
}

function  clickto(){
source=event.srcElement;
if  (source.tagName=="TR"||source.tagName=="TABLE")
return;
while(source.tagName!="TD")
source=source.parentElement;
source=source.parentElement;
cs  =  source.children;
//alert(cs.length);
if  (cs[0].style.backgroundColor!=clickcolor&&source.id!="nc")
for(i=0;i<cs.length;i++){
	cs[i].style.backgroundColor=clickcolor;
}
else
for(i=0;i<cs.length;i++){
	cs[i].style.backgroundColor="";
}
}
</script>


</head>

<body>
<form action="/kaoqinmsys/kaoqinmsys?ac=ccinfoadd" name="f1" method="post" onsubmit="return ck()">
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td><table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#a8c7ce" onMouseOver="changeto()"  onmouseout="changeback()">
      <tr>
        <td height="31" align="center" bgcolor="#FFFFFF" class="STYLE19" colspan="2"><label><strong>出差信息</strong></label></td>
        </tr>
      <tr>
      	<td height="15" align="center" bgcolor="#FFFFFF" class="STYLE19">人员</td>
        <td height="15"  bgcolor="#FFFFFF" class="STYLE19" align="left">
        <select id="empid" name="empid">
           	<option value="">请选择</option>
           	<% CommDAO dao = new CommDAO();
           	ArrayList<HashMap> l = (ArrayList<HashMap>)dao.select("select * from sysuser where delstatus='0' and role not in ('管理员')"); 
           	for(HashMap lm:l){%>
           	<option value="<%=lm.get("id") %>" ><%=lm.get("realname") %></option>
           	<%} %>
           </select></td>
      </tr>
      <tr>
      	<td height="15" align="center" bgcolor="#FFFFFF" class="STYLE19">出差开始日期</td>
        <td height="15" align="left" bgcolor="#FFFFFF" class="STYLE19">
        <input name="stime" id="stime"  type="text" size="30"  readonly="readonly" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});"/>
        <script type="text/javascript" src="/kaoqinmsys/commfiles/js/calendar/WdatePicker.js"></script>
        </td>
      </tr>
      <tr>
      	<td height="15" align="center" bgcolor="#FFFFFF" class="STYLE19">出差结束日期</td>
        <td height="15" align="left" bgcolor="#FFFFFF" class="STYLE19">
        <input name="etime" id="etime"  type="text" size="30"  readonly="readonly" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});"/>
        </td>
      </tr>
      <tr>
      	<td height="15" align="center" bgcolor="#FFFFFF" class="STYLE19">出差天数</td>
        <td height="15" align="left" bgcolor="#FFFFFF" class="STYLE19">
        <input name="ccnum" id="ccnum"  type="text" size="30"  />
        </td>
      </tr>
      <tr>
      	<td height="15" align="center" bgcolor="#FFFFFF" class="STYLE19">出差地点</td>
        <td height="15" align="left" bgcolor="#FFFFFF" class="STYLE19">
        <input name="ccaddr" id="ccaddr"  type="text" size="30"  />
        </td>
      </tr>
	   <tr>
        <td height="30" align="center" bgcolor="#FFFFFF" class="" colspan="2"><label>
          <input type="submit" name="Submit"  value="提交信息" />&nbsp;&nbsp;&nbsp;
          <input type="reset" name="Submit2" value="重新填写" />
</label></td>
        </tr>
    </table></td>
  </tr>
</table>
</form>
</body>
</html>
 <script type="text/javascript">

   function ck()
   {
   var reg=/^([1-9]\d*)$/;
    if(f1.empid.value==""){
	   alert("请选择人员");
	   return false;
   }
   if(f1.stime.value==""){
	   alert("请输入出差开始日期");
	   return false;
   }if(f1.etime.value==""){
	   alert("请输入出差结束日期");
	   return false;
   }if(f1.ccnum.value==""){
	   alert("请输入出差天数");
	   return false;
   }else if(reg.test(f1.ccnum.value)==false){
		alert("请输入正整数");
		return false;
	}
   if(f1.ccaddr.value==""){
	   alert("请输入出差地点");
	   return false;
   }
   }
   </script>
<script language="javascript">
<%
String suc = (String)request.getAttribute("suc");
if(suc!=null)
{
%>
alert("操作成功");
parent.location.replace("/kaoqinmsys/admin/ccinfo.jsp");
<%}%>
</script>


