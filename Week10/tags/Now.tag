<%@ tag language="java" pageEncoding="utf-8" body-content="empty" %>
<%@ tag import="java.util.Calendar" %>
<% Calendar c = Calendar.getInstance(); %>
<%= c.get(Calendar.YEAR) %>년 <%= c.get(Calendar.MONTH) + 1 %>월 <%= c.get(Calendar.DATE) %>일<br>
<hr>