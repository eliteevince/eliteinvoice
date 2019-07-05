<jsp:include page="../includes/header.jsp" />
	<h1> This is from jstl_template1_en.jsp </h1>
	<jsp:include page="../jstl/${page.url}.jsp" flush="true"/>
<jsp:include page="../includes/footer.jsp" />