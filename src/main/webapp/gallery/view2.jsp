
<%@page import="domain.BoardVO"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
request.setCharacterEncoding("UTF-8");

BoardVO vo = (BoardVO) request.getAttribute("vo");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세보기 화면</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>
<body style=margin:100;>
	<h3>
	홈화면 > 게시판 글 상세보기
	</h3>
	<hr>
	<form id="frm" action="" method="" >
		<input type="hidden" name="num" id="num" value="<%=vo.getNum()%>">
		<input type="hidden" name="realSaveFileName" value="<%=vo.getRealSaveFileName()%>">

		<div>
			<span>제목 : </span> <input style="width: 450px; border: 0 solid black"
				type="text" name="title" value="<%=vo.getTitle()%>"
				disabled="disabled" >
		</div>
		<hr>
		<div>
			<span>내용</span><br>
			<textarea style="resize: none;" rows="10" cols="100" name="content" disabled="disabled"><%=vo.getContent()%></textarea>


		</div>
		<hr>
		<div>
			<span>작성자</span> <input style="width: 450px; border: 0 solid black"
				type="text" name="writer" value="<%=vo.getWriter()%>"
				disabled="disabled">
		</div>

		<hr>
		<div>
			<span> 첨부파일 : </span> <a
				href="download.jsp?rsfn=<%=vo.getRealSaveFileName()%>&rfn=<%=vo.getRealFileName()%>"><%=vo.getRealFileName()%></a>
		</div>

		<br>
		<button class="btn btn-default" type="button" onclick="location.href='list'" >목록</button>
		<button class="btn btn-default" type="button" id="btn_modi">수정</button>
		<button class="btn btn-danger" type="button"  id="btn_del" >삭제</button>
	</form>

	<script>
		$(document).ready(function() {
			$("#btn_modi").on("click", function(e) {
				e.preventDefault();

					$("#frm").attr("method","get");
					$("#frm").attr("action","update");
					$("#frm").submit();

			});
		
			$("#btn_del").on("click", function(e) {
				e.preventDefault();

				if (confirm("삭제하시겠습니까?")) {
					$("#frm").attr("method","post");
					$("#frm").attr("action","delete");
					$("#frm").submit();
				}

			});
		});
	</script>
</body>
</html>