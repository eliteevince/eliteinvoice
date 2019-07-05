<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE HTML>
<html class="app">
	<head>
		<title></title>       	
		<jsp:include page="includes/globals.jsp"/>
		<jsp:include page="includes/common_css_js.jsp"/>		
	</head>
 	<body> 	
		<section class="vbox">
			<jsp:include page="includes/header.jsp"/>
	        <section>
	        	<section class="hbox stretch">
	        		<jsp:include page="includes/nav-tabs-main.jsp">
						<jsp:param value="taxrate" name="selected"/>
					</jsp:include>
					<section id="content">
				    	<section class="vbox">
				        	<section class="scrollable padder">
							<ul class="breadcrumb no-border no-radius b-b b-light pull-in">
				                <li><a href="/dashboard"><i class="fa fa-home"></i>Home</a></li>
				                <li><a href="#">UI kit</a></li>
				                <li><a href="#">Table</a></li>
				                <li class="active"><spring:message code="navtabs.taxrate"/></li>
			              	</ul>
			              	<div class="row">
				                <div class="col-sm-12">
				                	<form:form method="POST" commandName="taxrate" action="/taxrate" class="form-horizontal" data-validate="parsley">				                  
				                    <form:hidden path="id"/>
				                    <section class="panel panel-default">
			                    	<header class="panel-heading">
			                        	<div>
			                        		<strong>
			                        			<c:if test="${action == 'add'}"><spring:message code="common.label.add"/></c:if> <c:if test="${action == 'edit'}"><spring:message code="common.label.edit"/></c:if> <spring:message code="taxrate.label"/>
			                        		</strong>
			                        	</div>
			                      	</header>
				                    <div class="panel-body">
				                        <div class="form-group">
				                          <label class="col-sm-3 control-label"><spring:message code="taxrate.label.name"/></label>
				                          <div class="col-sm-9">
				                            <spring:message code="taxrate.label.name" var="name"/>
				                            <form:input type="text" path="name" class="form-control" placeholder="${name}" data-required="true"/>
				                          </div>
				                        </div>
				                        <div class="line line-dashed line-lg pull-in"></div>
				                        <div class="form-group">
				                          <label class="col-sm-3 control-label"><spring:message code="taxrate.label.rate"/></label>
				                          <div class="col-sm-9">
				                          	<spring:message code="taxrate.label.rate" var="rate"/>
				                            <form:input type="text" path="rate" class="form-control" data-type="number" data-required="true" placeholder="${rate}"/>    
				                          </div>
				                        </div>
				                        <div class="line line-dashed line-lg pull-in"></div>
				                        <div class="form-group">
				                          <label class="col-sm-3 control-label"><spring:message code="taxrate.label.taxratetype"/></label>
				                          <div class="col-sm-9">
				                          	<c:forEach items="${taxratetypelist}" var="taxratetype">
				                          		<div class="radio">
				                          			<form:radiobutton path="taxratetype.id" value="${taxratetype.id}" />${taxratetype.name}
				                          		</div>
				                          	</c:forEach>
				                          </div>
				                        </div>
				                      </div>
				                      <footer class="panel-footer text-right bg-light lter">
				                        	<a type="button" class="btn btn-danger bottom-margin" href="/taxrate"><spring:message code="common.label.cancel"/></a>
											<button class="btn btn-primary bottom-margin" type="submit"><spring:message code="common.label.save"/></button>
				                      </footer>
				                    </section>
				                  </form:form>
				                </div>
				            </div>
							</section>
						</section>
					</section>
				</section>
			</section>
		</section>
 	</body>
</html>