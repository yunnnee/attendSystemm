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
<%
CommDAO dao = new CommDAO();
String id = request.getParameter("id");
HashMap m = dao.select("select * from notice where id="+Integer.parseInt(id)).get(0);
 %>
<body>
<form action="/kaoqinmsys/kaoqinmsys?ac=upnotice" name="f1" method="post" >
<input type="hidden" id="id" name="id" value="<%=m.get("id") %>" />
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td><table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#a8c7ce" onMouseOver="changeto()"  onmouseout="changeback()">
      <tr>
        <td height="31" align="center" bgcolor="#FFFFFF" class="STYLE19" colspan="2"><label><strong>编辑公告信息</strong></label></td>
        </tr>
      <tr>
      	<td height="15" align="center" bgcolor="#FFFFFF" class="STYLE19">标题</td>
        <td height="15"  bgcolor="#FFFFFF" class="STYLE19">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input type="text" id="title" name="title" size="40" value="<%=m.get("title") %>"/></td>
      </tr>
      <tr>
      	<td height="15" align="center" bgcolor="#FFFFFF" class="STYLE19">内容</td>
        <td height="15" align="center" bgcolor="#FFFFFF" class="STYLE19">
        <textarea name="content" cols="60" rows="5"><%= m.get("content")%></textarea></td>
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
   function checkk()
   {
    if(f1.oldpass.value=="")
   {
   alert("请输入原密码");
   return;
   }
   if(f1.upass.value=="")
   {
   alert("请输入新密码");
   return;
   }
   if(f1.repass.value!=f1.upass.value)
   {
   alert("两次密码输入不一致");
   return;
   }
   }
   </script>
   
   <script language="javascript">
<%
String error = (String)request.getAttribute("error");
if(error!=null)
{
%>
alert("原密码错误");
<%}%>
</script>
<script language="javascript">
<%
String suc = (String)request.getAttribute("suc");
if(suc!=null)
{
%>
alert("操作成功");
parent.location.replace("/kaoqinmsys/admin/notice.jsp");
<%}%>
</script>

<script language="javascript">
<%
String ersuc = (String)request.getAttribute("ersuc");
if(ersuc!=null)
{
%>
alert("操作成功");
parent.location.replace("/kaoqinmsys/admin/notice.jsp");
<%}%>
</script>
