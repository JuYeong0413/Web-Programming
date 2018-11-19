<%@page contentType="text/html; charset=UTF-8" %>
<html>
<head>
<title>Q3-1</title>
</head>
<body>
<form action="Q3-2.jsp" method="post">
 아이디 : <input type="text" name="id"><br><br>
 회원님이 관심있는 스포츠를 선택하세요<br>
 축구<input type="checkbox" name="exercise" value="축구">
 농구<input type="checkbox" name="exercise" value="농구">
 야구<input type="checkbox" name="exercise" value="야구">
 골프<input type="checkbox" name="exercise" value="골프"><br><br>
 <input type="submit" value="확인">
 <input type="reset" value="취소">
 </form>
</body>
</html>