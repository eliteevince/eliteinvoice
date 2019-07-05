<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE HTML>
<html class="app">
	<head>
		<title></title>		
		<jsp:include page="includes/common_css_js.jsp"/>		
	</head>
	<body>
		<section class="vbox">
			<jsp:include page="includes/header.jsp"/>
	        <section>
	        	<section class="hbox stretch">
	        		<jsp:include page="includes/nav-tabs-main.jsp">
						<jsp:param value="dashboard" name="selected"/>
					</jsp:include>
					<section id="content">
				          <section class="vbox">          
				            <section class="scrollable padder">
				              <ul class="breadcrumb no-border no-radius b-b b-light pull-in">
				                <li class="active"><i class="fa fa-home"></i> Home</li>
				              </ul>
				              <div class="m-b-md">
				                <h3 class="m-b-none">Welcome</h3>
				                 <h3 class="m-b-none">EliteInvoice</h3>
				              </div>
				            </section>                  
				          </section>
				          <a href="#" class="hide nav-off-screen-block" data-toggle="class:nav-off-screen" data-target="#nav"></a>
				        </section>
				</section>
	        </section>		
		</section>
	</body>
</html>