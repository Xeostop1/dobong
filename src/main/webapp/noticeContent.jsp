<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
	<html>
	<head>
		<meta charset="utf-8">
		<title>공지사항</title>
		<style type="text/css">
			td{
				border: 1px solid #ccc;
			}
		</style>
	</head>
	<body>
	<h1>내용 확인페이지</h1>
		   
		 <table>
				<th colspan="3">내용 </th>
				<th colspan="2">작성일자 </th>
				<th colspan="1">글쓴이 </th>
				<th>수정 </th>
				<th>삭제 </th>
					<tr> 
						<td colspan="4"> ${content.getContent() }</td>
						<td>${content.getWritingtime() }</td>
						<c:if test="${!empty loginUser.id }">
							<td>${loginUser.id}</td>
							<td>
								<a href="NoticeUpdateServlet?number=${noticeList.getNumber()}"> 
									<input type="button" value="수정">
								</a>
							</td>
							<td>
								<input type="hidden" value=${content.getNumber() }>
								<a href="NoticeDeleteServlet?number=${content.getNumber() }">
									<input type="button" value="삭제">
								</a>
							</td>
						</c:if>
					</tr>
		</table>
		<br>
		<form action="searchServlet">
			<select name="select"> 
				<option value="1" selected>전체</option>
				<option value="2">내용</option> 
				<option value="3" >제목</option>
				<option value="4" >글쓴이</option>
			</select>
			<input name="searchValue">
			<input type="submit" value="검색">
		</form>
		 <BR><a href="NoticeServlet">뒤로가기</a>
		
	</body>
</html>