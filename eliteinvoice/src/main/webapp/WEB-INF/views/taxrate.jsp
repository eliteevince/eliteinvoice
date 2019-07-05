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
				populateTaxrate("taxrateTable");
			});			
			
			//localized variables
			var editUrl = "/taxrate/edit";
			var addUrl = '<spring:message code="common.label.add"/> <spring:message code="taxrate.label"/>';
			
			//delete model popup variables
			var deleteUrl = "/taxrate/delete";
   			var menuLabel = '<spring:message code="taxrate.label" var="taxrate"/>';
			var modalHeader = '<spring:message code="common.modal.delete.label" arguments="${taxrate}"/>';
			var modalBody = '<spring:message code="common.modal.delete.body" arguments="${taxrate}"/>';
			var modalConfirm = '<spring:message code="common.modal.delete.label" arguments="${taxrate}"/>';
			var modalCancel = '<spring:message code="common.label.cancel"/>';
			var deleteSuccessMessage = '<spring:message code="common.message.delete.success" arguments="${taxrate}"/>';
			var deleteErrorMessage = '<spring:message code="common.message.delete.error" arguments="${taxrate}"/>';
						
		</script>
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
				                <li class="active"><spring:message code="navtabs.taxrate"/></li>
			              	</ul>
			              	<div class="m-b-md">
				            	<h3 class="m-b-none"><spring:message code="navtabs.taxrate"/></h3>
				            </div>
				            <section class="panel panel-default">
				            	<header class="panel-heading">
				                 	<spring:message code="navtabs.taxrate"/>				                
					                <a class="btn btn-primary bottom-margin" href="/taxrate/add">
										<i class="icon-plus-sign icon-white"></i>
										<spring:message code="common.label.add"/> <spring:message code="navtabs.taxrate"/>
									</a>
								</header>
				            </section> --%>
				            <div class="table-responsive">
			                	<table class="table table-striped m-b-none" id="taxrateTable">
			                    	<thead>
			                      		<tr>
			                      			<th class="header-checkbox"><input id="headerCheckbox" type="checkbox"></th>
					                        <th><spring:message code="taxrate.label.name"/></th>
											<th><spring:message code="taxrate.label.rate"/></th>												
											<th><spring:message code="taxrate.label.taxratetype"/></th>
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