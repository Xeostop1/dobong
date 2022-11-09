<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
		<head>
		<meta charset="UTF-8">
		<title>게시글 수정페이지</title>
	</head>
	<body>
		<h1>게시글 수정페이지</h1>
		<input type="hidden" name="number" value="${updateNotice.getNumber() }">
		
		
		
		
		
		<form action="NoticeUpdateServlet" method="post">
			<input name="id" type="hidden" value="${loginUser.id}">
			<input name="nickname" type="type" value="${updateNotice.getNickname()}">
			<input name="writingtime" type="type" value="${updateNotice.getWritingtime()}">
			
			<table>
				<tr>
					<th>타이틀</th>
					<td>
						<input type="text" name="title" value="${updateNotice.getTitle() }">
					</td>
				</tr>
				<tr>
					<th>내용</th>
					<td>
						<textarea rows="10" cols="90" name="content">
							${updateNotice.getContent() }
						</textarea>
					</td>
				</tr>
			</table>
			<input type="submit" value="수정하기">
			<input type="reset" value="다시작성">
			<input type="reset" value="목록보기" onclick="loction.href='NoticeServlet'">
		</form>
		
	</body>
</html>