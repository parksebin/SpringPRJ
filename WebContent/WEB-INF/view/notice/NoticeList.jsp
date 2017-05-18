<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="poly.util.CmmUtil" %>
<%@ page import="poly.dto.NoticeDTO" %>
<%@ page import="java.util.List"%>   
<%@ page import="java.util.ArrayList"%> 
<%@ page import="java.util.HashMap"%>    
<%
session.setAttribute("SESSION_USER_ID", "USER01"); //���� ���� ����, �α��ε� ���·� �����ֱ� ����
String SESSION_USER_ID = CmmUtil.nvl((String)session.getAttribute("SESSION_USER_ID"));

List<NoticeDTO> rList =	(List<NoticeDTO>)request.getAttribute("rList");

//�Խ��� ��ȸ ��� �����ֱ�
if (rList==null){
	rList = new ArrayList<NoticeDTO>();
	
}

%>        
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>���� ����Ʈ</title>
<script type="text/javascript">

//�󼼺��� �̵�
function doDetail(seq){
	location.href="/notice/NoticeInfo.do?nSeq="+ seq;
}

</script>	
</head>
<body>
<form name="f" method="post" action="/notice/NoticeReg2.do" target= "ifrPrc" onsubmit="return doSubmit(this);">
<h2>��������</h2>
<hr/>
<br/>

<table border="1" width="600px">
<tr>
	<td width="100" align="center">����</td>
	<td width="200" align="center">����</td>
	<td width="100" align="center">��ȸ��</td>
	<td width="100" align="center">�����</td>
	<td width="100" align="center">�����</td>
</tr>
<%
for (int i=0;i<rList.size();i++){
	NoticeDTO rDTO = rList.get(i);

	if (rDTO==null){
		rDTO = new NoticeDTO();
	}
	
%>
<tr>
<td>
<input type="checkbox" name="check">
</td>
	<td align="center">
	
<input type="text" width="200" name="title"><br/>
		<input type="submit" value="��۵��">
</td>
	<td align="center">
		<a href="javascript:doDetail('<%=CmmUtil.nvl(rDTO.getNotice_seq())%>');">
		<%=CmmUtil.nvl(rDTO.getTitle()) %></a>
	</td>
	<td align="center"><%=CmmUtil.nvl(rDTO.getRead_cnt()) %></td>
	<td align="center"><%=CmmUtil.nvl(rDTO.getUser_id()) %></td>
	<td align="center"><%=CmmUtil.nvl(rDTO.getReg_dt()) %></td>
</tr>
<%
}
%>
</table>
</form>
<a href="/notice/NoticeReg.do">[�۾���]</a>
<a href="/notice/NoticeDelete.do">[����]</a>

</body>
</html>