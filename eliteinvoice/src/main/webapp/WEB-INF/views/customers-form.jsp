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
						<jsp:param value="customers" name="selected"/>
					</jsp:include>
					<section id="content">
				    	<section class="vbox">
				        	<section class="scrollable padder">
							<ul class="breadcrumb no-border no-radius b-b b-light pull-in">
				                <li><a href="/dashboard"><i class="fa fa-home"></i>Home</a></li>
				                <li><a href="#">UI kit</a></li>
				                <li><a href="#">Table</a></li>
				                <li class="active"><spring:message code="navtabs.customers"/></li>
			              	</ul>
			              	<div class="row">
				                <div class="col-sm-12">
				                	<form:form method="POST" commandName="customer" action="/customers" class="form-horizontal" data-validate="parsley">				                  
				                    <form:hidden path="id"/>
				                    <section class="panel panel-default">
			                    	<header class="panel-heading">
			                        	<div>
			                        		<strong>
			                        			<c:if test="${action == 'add'}"><spring:message code="common.label.add"/></c:if> <c:if test="${action == 'edit'}"><spring:message code="common.label.edit"/></c:if> <spring:message code="customers.label.customer"/>
			                        		</strong>
			                        	</div>
			                      	</header>
				                    <div class="panel-body">
				                        <div class="form-group">
				                          <label class="col-sm-3 control-label"><spring:message code="customers.label.firstname"/></label>
				                          <div class="col-sm-9">
				                            <spring:message code="customers.label.firstname" var="firstname"/>
				                            <form:input type="text" path="firstname" class="form-control" placeholder="${firstname}" data-required="true"/>
				                          </div>
				                        </div>
				                        <div class="line line-dashed line-lg pull-in"></div>
				                        <div class="form-group">
				                          <label class="col-sm-3 control-label"><spring:message code="customers.label.lastname"/></label>
				                          <div class="col-sm-9">
				                            <spring:message code="customers.label.lastname" var="lastname"/>
				                            <form:input type="text" path="lastname" class="form-control" placeholder="${lastname}" data-required="true"/>
				                          </div>
				                        </div>				                       
				                        <div class="line line-dashed line-lg pull-in"></div>
				                        <div class="form-group">
				                          <label class="col-sm-3 control-label"><spring:message code="customers.label.email"/></label>
				                          <div class="col-sm-9">
				                          	<spring:message code="customers.label.email" var="email"/>
				                            <form:input type="text" path="email" class="form-control" data-type="email" data-required="true" placeholder="${email}"/>    
				                          </div>
				                        </div>
				                        <div class="line line-dashed line-lg pull-in"></div>
				                        <div class="form-group">
				                          <label class="col-sm-3 control-label"><spring:message code="customers.label.phone"/></label>
				                          <div class="col-sm-9">
				                          	<spring:message code="customers.label.phone" var="phone"/>
				                            <form:input type="text" path="phone" class="form-control" data-type="digits" data-required="true" placeholder="${phone}"/>    
				                          </div>
				                        </div>
				                        <div class="line line-dashed line-lg pull-in"></div>
				                        <div class="form-group">
				                          <label class="col-sm-3 control-label"><spring:message code="customers.label.address"/></label>
				                          <div class="col-sm-9">
				                          	<spring:message code="customers.label.address" var="address"/>
				                            <form:input type="text" path="address" class="form-control" data-required="true" placeholder="${address}"/>    
				                          </div>
				                        </div>
				                        <div class="line line-dashed line-lg pull-in"></div>
				                        <div class="form-group">
				                          <label class="col-sm-3 control-label"><spring:message code="customers.label.postcode"/></label>
				                          <div class="col-sm-9">
				                          	<spring:message code="customers.label.postcode" var="postcode"/>
				                            <form:input type="text" path="postcode" class="form-control" data-required="true" placeholder="${postcode}"/>    
				                          </div>
				                        </div>
				                        <div class="line line-dashed line-lg pull-in"></div>
				                        <div class="form-group">
				                          <label class="col-sm-3 control-label"><spring:message code="customers.label.city"/></label>
				                          <div class="col-sm-9">
				                          	<spring:message code="customers.label.city" var="city"/>
				                            <form:input type="text" path="city" class="form-control" data-required="true" placeholder="${city}"/>    
				                          </div>
				                        </div>
				                        <div class="line line-dashed line-lg pull-in"></div>
				                        <div class="form-group">
				                          <label class="col-sm-3 control-label"><spring:message code="customers.label.state"/></label>
				                          <div class="col-sm-9">
				                          	<spring:message code="customers.label.state" var="state"/>
				                            <form:input type="text" path="state" class="form-control" data-required="true" placeholder="${state}"/>    
				                          </div>
				                        </div>
				                        <div class="line line-dashed line-lg pull-in"></div>
				                        <div class="form-group">
				                          <label class="col-sm-3 control-label"><spring:message code="customers.label.country"/></label>
				                          <div class="col-sm-9">
				                          	<spring:message code="customers.label.country" var="country"/>
				                            <form:input type="text" path="country" class="form-control" data-required="true" placeholder="${country}"/>    
				                          </div>
				                        </div>
				                      </div>
				                      <footer class="panel-footer text-right bg-light lter">
				                        	<a type="button" class="btn btn-danger bottom-margin" href="/customers"><spring:message code="common.label.cancel"/></a>
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