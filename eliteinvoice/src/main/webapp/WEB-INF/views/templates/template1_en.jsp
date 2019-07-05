<jsp:include page="../includes/header.jsp" />
	<h1> This is from template1_en.jsp </h1>
	Content : ${page.content} 
	Parameter D : ${param.d}
	Session Attribute a : <%=session.getAttribute("a")%>
	<%session.setAttribute("a","b");%>
<jsp:include page="../includes/footer.jsp" />