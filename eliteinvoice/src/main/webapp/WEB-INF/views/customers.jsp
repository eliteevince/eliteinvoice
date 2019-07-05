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
		<script type="text/javascript">
			$(function(){
				populateCustomers("customersTable");
			});			
			
			//localized variables
			var editUrl = "/customers/edit";
			var addUrl = '<spring:message code="common.label.add"/> <spring:message code="customers.label.customer"/>';
			var viewUrl = "/customers/view";
			
			//delete model popup variables
			var deleteUrl = "/customers/delete";
   			var menuLabel = '<spring:message code="customers.label.customer" var="customer"/>';
			var modalHeader = '<spring:message code="common.modal.delete.label" arguments="${customer}"/>';
			var modalBody = '<spring:message code="common.modal.delete.body" arguments="${customer}"/>';
			var modalConfirm = '<spring:message code="common.modal.delete.label" arguments="${customer}"/>';
			var modalCancel = '<spring:message code="common.label.cancel"/>';
			var deleteSuccessMessage = '<spring:message code="common.message.delete.success" arguments="${customer}"/>';
			var deleteErrorMessage = '<spring:message code="common.message.delete.error" arguments="${customer}"/>';
						
		</script>
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
							<c:if test="${!empty successMsg }">
					        	<div class="alert alert-success">
					        		<a class="close" data-dismiss="alert">×</a>  
									<strong>${successMsg}</strong>
					        	</div>
					      	</c:if>
							<div id="messages"></div>				
							<%-- <ul class="breadcrumb no-border no-radius b-b b-light pull-in">
				                <li><a href="/dashboard"><i class="fa fa-home"></i>Home</a></li>
				                <li><a href="#">UI kit</a></li>
				                <li><a href="#">Table</a></li>
				                <li class="active"><spring:message code="navtabs.customers"/></li>
			              	</ul> --%>
				            <div class="table-responsive">
			                	<table class="table table-striped m-b-none" id="customersTable">
			                    	<thead>
			                      		<tr>
					                        <th class="header-checkbox"><input id="headerCheckbox" type="checkbox"></th>
					                        <th><spring:message code="common.label.view"/></th>
					                        <th><spring:message code="customers.label.firstname"/></th>
											<th><spring:message code="customers.label.lastname"/></th>												
											<th><spring:message code="customers.label.email"/></th>
											<th><spring:message code="customers.label.phone"/></th>
											<th><spring:message code="customers.label.address"/></th>
											<th><spring:message code="customers.label.postcode"/></th>
											<th><spring:message code="customers.label.city"/></th>
											<th><spring:message code="customers.label.state"/></th>
											<th><spring:message code="customers.label.country"/></th>
									      	<th class="icon"><spring:message code="common.label.edit"/></th>
									      	<%-- <th class="icon"><spring:message code="common.label.delete"/></th> --%>
			                      		</tr>
			                    	</thead>
			                 	</table>
			                </div>
							</section>
						</section>
					</section>
				</section>
			</section>
		</section>
 	</body>
</html>