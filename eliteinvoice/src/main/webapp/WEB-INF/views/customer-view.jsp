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
				//displayViewDataTable("customerViewTable");
				populateCustomerView("customerViewTable", "${customer.id}" );
				/* setTimeout(function() {
					$(".btndelete").remove();
				},50); */
			});
			$(document).ready(function(){    
			    $(".btndelete").remove();
			    $(".addbtn").remove();
			});
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
			              	<header class="header b-b b-light hidden-print">
					              <button href="#" class="btn btn-sm btn-info pull-right" onClick="window.print();">Print</button>
					              <p>Customer</p>
            				</header>
            				<div class="well m-t">
				                <div class="row">
				                  <div class="col-xs-6">
				                    <h4>${customer.firstname} ${customer.lastname}</h4>
				                    <p>
				                      Phone: ${customer.phone}<br>
				                      Email: ${customer.email}<br>
				                    </p>
				                  </div>
				                  <div class="col-xs-6">
				                    <h4>Address</h4>
				                    <p>
				                      ${customer.address} ${customer.postcode}<br>
				                      ${customer.city}, ${customer.state}<br>
				                      ${customer.address}<br>
				                    </p>
				                  </div>
				                </div>
				              </div>
				               <div class="line"></div>
				               <div class="table-responsive">
			                	<table class="table table-striped m-b-none" id="customerViewTable">
			                    	<thead>
			                      		<tr>
					                        <th><spring:message code="invoice.label.reference"/></th>
											<th><spring:message code="invoice.label.discount"/></th>												
											<th><spring:message code="invoice.label.shipping"/></th>
											<th><spring:message code="invoice.label.invoicetype"/></th>
											<th><spring:message code="invoice.label.invoicestatus"/></th>
											<th><spring:message code="invoice.label.company"/></th>
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