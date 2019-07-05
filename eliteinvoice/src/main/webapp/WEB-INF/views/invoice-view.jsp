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
						<jsp:param value="invoice" name="selected"/>
					</jsp:include>
					<section id="content">
				    	<section class="vbox">
				    	
				        	<section class="scrollable padder">
				        	
			              	<header class="header b-b b-light hidden-print">
					              <button href="#" class="btn btn-sm btn-info pull-right" onClick="window.print();">Print</button>
					              <p>Invoice</p>
            				</header>
            				<section class="scrollable wrapper">
				              <i class="fa fa-apple fa fa-3x"></i>
				              <div class="row">
				                <div class="col-xs-6">
				                  <h4>${invoice.company.name}</h4>
				                  <p>${invoice.company.address}  ${invoice.company.postcode}<br>
				                    ${invoice.company.city}, ${invoice.company.state}<br>
				                    ${invoice.company.country}
				                  </p>
				                  <p>
				                    Telephone:  ${invoice.company.phone}<br>
				                    E-Mail Id: ${invoice.company.email}
				                  </p>
				                </div>
				                <div class="col-xs-6 text-right">
				                  <p class="h4">#${invoice.company.id}</p>
				                  <h5>29th Mar 2013</h5>           
				                </div>
				              </div> 
				              <div class="well m-t">
                				<div class="row">
				                  <div class="col-xs-6">
				                    <strong>TO:</strong>
				                    <h4>${invoice.customer.firstname} ${invoice.customer.lastname} </h4>
				                    <p>
				                      ${invoice.customer.address}<br>
				                      ${invoice.customer.city} , ${invoice.customer.state} ${invoice.customer.postcode} <br>
				                      ${invoice.customer.country} <br>
				                      Phone: ${invoice.customer.phone} <br>
				                      Email: ${invoice.customer.email} <br>
				                    </p>
				                  </div>
				                  <div class="col-xs-6">
				               			<!--Ship to content column  -->
				                  </div>
				                </div>
				              </div> 
				              <p class="m-t m-b">Order date: <strong>26th Mar 2013</strong><br>
				                  Invoice status: <span class="label bg-success">${invoice.invoiceStatus.name}</span><br>
				                  Invoice Reference No: <strong>${invoice.refNo}</strong>
				              </p>
				              <div class="line"></div>
					              <table class="table">
					                <thead>
					                  <tr>
					                    <th>DESCRIPTION</th>
					                    <th width="140">UNIT PRICE</th>
					                    <th width="90">TOTAL</th>
					                  </tr>
					                </thead>
					                <tbody>
					                <c:set var="subtotal" value="0"></c:set>
					                <c:forEach items="${products}" var="product">
					                	<c:set var="subtotal" value="${subtotal + product.price}"></c:set>
						                  <tr>
						                    <td>${product.name}</td>
						                    <td>${product.price}</td>
						                    <td>${product.price}</td>
						                  </tr>
					                </c:forEach>
					                  <tr>
					                    <td colspan="3" class="text-right"><strong>Subtotal</strong></td>
					                    <td>${subtotal}</td>
					                  </tr>
					                  <tr>
					                    <td colspan="3" class="text-right no-border"><strong>Shipping</strong></td>
					                    <td>$0.00</td>
					                  </tr>
					                  <tr>
					                    <td colspan="3" class="text-right no-border"><strong>VAT Included in Total</strong></td>
					                    <td>$0.00</td>
					                  </tr>
					                  <tr>
					                    <td colspan="3" class="text-right no-border"><strong>Total</strong></td>
					                    <td><strong>$1607.00</strong></td>
					                  </tr>
					                </tbody>
					              </table>
				            </section>				
			              	<div class="row">
				                <div class="col-sm-12">
				                	<form:form method="POST" commandName="invoice" action="/invoice" class="form-horizontal" data-validate="parsley">				                  
				                    <form:hidden path="id"/>
				                    <section class="panel panel-default">
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