<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.HashSet"%>
<%@page import="java.util.List"%>
<%@page import="java.time.LocalDateTime"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>today.jsp</title>
</head>
<body>
	<h1>오늘 날짜를 출력해 주세요</h1>
	<%-- 오늘은 : 0000년, 00월, 00일   00시 00분00초 --%>
	<%
		LocalDateTime now = LocalDateTime.now();
	%>
	오늘은 :
	<%=now.getYear()%>년
	<%=now.getMonthValue()%>월
	<%=now.getDayOfMonth()%>일
	<%=now.getHour()%>시
	<%=now.getMinute()%>분
	<%=now.getSecond()%>초

	<hr>
	<%-- 1~10까지 수를 출력해보자 --%>
	<ul>
		<%
			for (int i = 1; i <= 10; i++) {
		%>
		<li><%=i%></li>
		<%
			}
		%>
	</ul>


	<%--
	구구단 테이블로 만들어보세요
	2*1=2 | 3*1=3 | 4*1=4 ...   9*1=9
	2*2=4 | 
	--%>
	<%!int sum;%>
	<table border="1" align="center" style="background-color: pink">
		<%
			for(int i = 1; i < 10; i++) {
		%>
		<tr>
			<%
				for(int j = 2; j < 10; j++) {
						sum = i * j;
			%>
			<td><%=j + "*" + i + " = " + sum%></td>
			<%
				}
			%>
		</tr>
		<%
			}
		%>
	</table><br>
	<hr>

	<%--
		set을 이용한 메서드
		getLottoNums()를 만들고
		getLottoNums() : 로또 번호 6개를 생성해서 Set객체에 담아 반환하는 메서드
		
		메서드를 호출하여 받은 로또번호를 이용하여
		화면에 번호 6개를 출력하세요
	--%>
	<%!
	public Set<Integer> getLottoNums(){
		// set객체 생성
		Set<Integer> lotto = new HashSet<Integer>();
		// 로또번호를 생성하여 set에 담는 내용을 구현
		while(lotto.size() < 6){
			int random = (int)(Math.random()*45+1);
			lotto.add(random);
		}
		return lotto;
	}
	%>
	<%=getLottoNums()%>
	<hr>
	<ul>
	<%
	/* lotto만은 지역변수이므로 사용할 수 없다 */
	Set<Integer> lottoNumbers = getLottoNums();
	for(int num : lottoNumbers){
		out.write("<li>"+num+"</li>");
	}
	%>
	</ul>
</body>
</html>