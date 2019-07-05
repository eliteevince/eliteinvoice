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
						<jsp:param value="users" name="selected"/>
					</jsp:include>
					<section id="content">
				    	<section class="vbox">
				        	<section class="scrollable padder">
								<ul class="breadcrumb no-border no-radius b-b b-light pull-in">
					                <li><a href="/dashboard"><i class="fa fa-home"></i>Home</a></li>
					                <li class="active"><spring:message code="navtabs.users"/></li>
				              	</ul>
				              	<div class="row">
					                <div class="col-sm-12">
					                	<form:form method="POST" commandName="user" action="/users" class="form-horizontal" data-validate="parsley">				                  
					                    <form:hidden path="id"/>
					                    <section class="panel panel-default">
					                    	<header class="panel-heading">
					                        	<div>
					                        		<strong>
					                        			<c:if test="${action == 'add'}"><spring:message code="common.label.add"/></c:if> <c:if test="${action == 'edit'}"><spring:message code="common.label.edit"/></c:if> <spring:message code="users.label.user"/>
					                        		</strong>
					                        	</div>
					                      	</header>
						                    <div class="panel-body">
												<div class="form-group">
													<label class="col-sm-3 control-label"><spring:message code="users.label.username"/></label>
													<div class="col-sm-9">
														<spring:message code="users.label.username" var="username"/>
														<form:input type="text" path="username" class="form-control" placeholder="${username}" data-required="true"/>
													</div>
												</div>
												<div class="line line-dashed line-lg pull-in"></div>
													<div class="form-group">
														<label class="col-sm-3 control-label"><spring:message code="users.label.password"/></label>
													<div class="col-sm-9">
														<spring:message code="users.label.password" var="password"/>
														<form:input type="password" path="password" class="form-control" placeholder="${password}" data-required="true" id="pwd"/>
													</div>
												</div>
												<div class="line line-dashed line-lg pull-in"></div>
													<div class="form-group">
														<label class="col-sm-3 control-label"><spring:message code="users.label.confirmpassword"/></label>
													<div class="col-sm-9">
														<spring:message code="users.label.confirmpassword" var="confirmpassword"/>
														<input type="password" class="form-control" data-equalto="#pwd" placeholder="${confirmpassword}" data-required="true">      
													</div>
												</div>
												<div class="line line-dashed line-lg pull-in"></div>
													<div class="form-group">
														<label class="col-sm-3 control-label"><spring:message code="users.label.role"/></label>
													<div class="col-sm-9">
														<form:select path="role" class="form-control m-b">
															<form:options items="${role}" itemValue="id" itemLabel="name"/>															
														</form:select>
													</div>
												</div>
						                    </div>
						                    <footer class="panel-footer text-right bg-light lter">
												<a type="button" class="btn btn-danger bottom-margin" href="/users"><spring:message code="common.label.cancel"/></a>
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