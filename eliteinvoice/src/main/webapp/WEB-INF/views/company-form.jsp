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
						<jsp:param value="companies" name="selected"/>
					</jsp:include>
					<section id="content">
				    	<section class="vbox">
				        	<section class="scrollable padder">
							<ul class="breadcrumb no-border no-radius b-b b-light pull-in">
				                <li><a href="/dashboard"><i class="fa fa-home"></i>Home</a></li>
				                <li><a href="#">UI kit</a></li>
				                <li><a href="#">Table</a></li>
				                <li class="active"><spring:message code="navtabs.companies"/></li>
			              	</ul>
			              	<div class="row">
				                <div class="col-sm-12">
				                	<form:form method="POST" commandName="company" action="/companies" class="form-horizontal" data-validate="parsley">				                  
				                    <form:hidden path="id"/>
				                    <section class="panel panel-default">
			                    	<header class="panel-heading">
			                        	<div>
			                        		<strong>
			                        			<c:if test="${action == 'add'}"><spring:message code="common.label.add"/></c:if> <c:if test="${action == 'edit'}"><spring:message code="common.label.edit"/></c:if> <spring:message code="companies.label.company"/>
			                        		</strong>
			                        	</div>
			                      	</header>
				                    <div class="panel-body">
				                        <div class="form-group">
				                          <label class="col-sm-3 control-label"><spring:message code="companies.label.name"/></label>
				                          <div class="col-sm-9">
				                            <spring:message code="companies.label.name" var="name"/>
				                            <form:input type="text" path="name" class="form-control" placeholder="${name}" data-required="true"/>
				                          </div>
				                        </div>
				                        <div class="line line-dashed line-lg pull-in"></div>
				                        <div class="form-group">
				                          <label class="col-sm-3 control-label"><spring:message code="companies.label.email"/></label>
				                          <div class="col-sm-9">
				                          	<spring:message code="companies.label.email" var="email"/>
				                            <form:input type="text" path="email" class="form-control" data-type="email" data-required="true" placeholder="${email}"/>    
				                          </div>
				                        </div>
				                        <div class="line line-dashed line-lg pull-in"></div>
				                        <div class="form-group">
				                          <label class="col-sm-3 control-label"><spring:message code="companies.label.phone"/></label>
				                          <div class="col-sm-9">
				                          	<spring:message code="companies.label.phone" var="phone"/>
				                            <form:input type="text" path="phone" class="form-control" data-type="digits" data-required="true" placeholder="${phone}"/>    
				                          </div>
				                        </div>
				                        <div class="line line-dashed line-lg pull-in"></div>
				                        <div class="form-group">
				                          <label class="col-sm-3 control-label"><spring:message code="companies.label.address"/></label>
				                          <div class="col-sm-9">
				                          	<spring:message code="companies.label.address" var="address"/>
				                            <form:input type="text" path="address" class="form-control" data-required="true" placeholder="${address}"/>    
				                          </div>
				                        </div>
				                        <div class="line line-dashed line-lg pull-in"></div>
				                        <div class="form-group">
				                          <label class="col-sm-3 control-label"><spring:message code="companies.label.postcode"/></label>
				                          <div class="col-sm-9">
				                          	<spring:message code="companies.label.postcode" var="postcode"/>
				                            <form:input type="text" path="postcode" class="form-control" data-required="true" placeholder="${postcode}"/>    
				                          </div>
				                        </div>
				                        <div class="line line-dashed line-lg pull-in"></div>
				                        <div class="form-group">
				                          <label class="col-sm-3 control-label"><spring:message code="companies.label.city"/></label>
				                          <div class="col-sm-9">
				                          	<spring:message code="companies.label.city" var="city"/>
				                            <form:input type="text" path="city" class="form-control" data-required="true" placeholder="${city}"/>    
				                          </div>
				                        </div>
				                        <div class="line line-dashed line-lg pull-in"></div>
				                        <div class="form-group">
				                          <label class="col-sm-3 control-label"><spring:message code="companies.label.state"/></label>
				                          <div class="col-sm-9">
				                          	<spring:message code="companies.label.state" var="state"/>
				                            <form:input type="text" path="state" class="form-control" data-required="true" placeholder="${state}"/>    
				                          </div>
				                        </div>
				                        <div class="line line-dashed line-lg pull-in"></div>
				                        <div class="form-group">
				                          <label class="col-sm-3 control-label"><spring:message code="companies.label.country"/></label>
				                          <div class="col-sm-9">
				                          	<spring:message code="companies.label.country" var="country"/>
				                            <form:input type="text" path="country" class="form-control" data-required="true" placeholder="${country}"/>    
				                          </div>
				                        </div>
				                        <div class="line line-dashed line-lg pull-in"></div>
				                        <div class="form-group">
				                          <label class="col-sm-3 control-label"><spring:message code="companies.label.logoimage"/></label>
				                          <div class="col-sm-9">
				                          	<spring:message code="companies.label.logoimage" var="logoImage"/>
				                          	 	 <form:input type="file" class="filestyle" path="logoImage"  data-icon="false" data-classButton="btn btn-default" data-classInput="form-control inline input-s" />
				                           <%--  <form:input type="text" path="logoImage" class="form-control" data-required="true" placeholder="${logoImage}"/>     --%>
				                          </div>
				                        </div>
				                      </div>
				                      <footer class="panel-footer text-right bg-light lter">
				                        	<a type="button" class="btn btn-danger bottom-margin" href="/companies"><spring:message code="common.label.cancel"/></a>
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