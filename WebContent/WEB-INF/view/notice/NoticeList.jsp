<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="poly.util.CmmUtil" %>
<%@ page import="poly.dto.NoticeDTO" %>
<%@ page import="java.util.List"%>   
<%@ page import="java.util.ArrayList"%> 
<%@ page import="java.util.HashMap"%>    
<%
session.setAttribute("SESSION_USER_ID", "USER01"); //세션 강제 적용, 로그인된 상태로 보여주기 위함
String SESSION_USER_ID = CmmUtil.nvl((String)session.getAttribute("SESSION_USER_ID"));

List<NoticeDTO> rList =	(List<NoticeDTO>)request.getAttribute("rList");

//게시판 조회 결과 보여주기
if (rList==null){
	rList = new ArrayList<NoticeDTO>();
	
}

%>        
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>공지 리스트</title>
<script type="text/javascript">

//상세보기 이동
function doDetail(seq){
	location.href="/notice/NoticeInfo.do?nSeq="+ seq;
}

</script>	
</head>
<body>
<form name="f" method="post" action="/notice/NoticeReg2.do" target= "ifrPrc" onsubmit="return doSubmit(this);">
<h2>공지사항</h2>
<hr/>
<br/>

<table border="1" width="600px">
<tr>
	<td width="100" align="center">순번</td>
	<td width="200" align="center">제목</td>
	<td width="100" align="center">조회수</td>
	<td width="100" align="center">등록자</td>
	<td width="100" align="center">등록일</td>
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
		<input type="submit" value="답글등록">
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
<a href="/notice/NoticeReg.do">[글쓰기]</a>
<a href="/notice/NoticeDelete.do">[삭제]</a>

</body>
</html>