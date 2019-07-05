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
								<ul class="breadcrumb no-border no-radius b-b b-light pull-in">
					                <li><a href="/dashboard"><i class="fa fa-home"></i>Home</a></li>
					                <li><a href="#">UI kit</a></li>
					                <li><a href="#">Table</a></li>
					                <li class="active"><spring:message code="navtabs.invoice"/></li>
				              	</ul>
				              	<div class="row">
					                <div class="col-sm-12">
					                	<form:form method="POST" commandName="invoice" action="/invoice" class="form-horizontal" data-validate="parsley">				                  
					                    	<form:hidden path="id"/>
					                    	<section class="panel panel-default">
				                    			<header class="panel-heading">
						                        	<div>
						                        		<strong>
						                        			<c:if test="${action == 'add'}"><spring:message code="common.label.add"/></c:if> <c:if test="${action == 'edit'}"><spring:message code="common.label.edit"/></c:if> <spring:message code="invoice.label"/>
						                        		</strong>
						                        	</div>
				                      			</header>
					                    		<div class="panel-body">
					                        		<div class="form-group">
					                          			<label class="col-sm-3 control-label"><spring:message code="invoice.label.reference"/></label>
								                        <div class="col-sm-9">
								                            <spring:message code="invoice.label.reference" var="refno"/>
								                            <form:input type="text" path="refNo" class="form-control" placeholder="${refno}" data-required="true"/>
								                        </div>
					                        		</div>
						                        	<div class="line line-dashed line-lg pull-in"></div>
						                        	<div class="form-group">
						                          		<label class="col-sm-3 control-label"><spring:message code="invoice.label.discount"/></label>
														<div class="col-sm-9">
														 	<spring:message code="invoice.label.discount" var="discount"/>
															<form:input type="text" path="discount" class="form-control" data-type="number" placeholder="${discount}" data-required="true"/>
														</div>
						                        	</div>				                       
						                        	<div class="line line-dashed line-lg pull-in"></div>
						                        	<div class="form-group">
						                         		<label class="col-sm-3 control-label"><spring:message code="invoice.label.shipping"/></label>
						                          		<div class="col-sm-9">
						                          			<spring:message code="invoice.label.shipping" var="shipping"/>
						                            		<form:input type="text" path="shipping" class="form-control" data-required="true" placeholder="${shipping}"/>    
						                          		</div>
						                        	</div>
						                        	<div class="line line-dashed line-lg pull-in"></div>
						                        	<div class="form-group">
														<label class="col-sm-3 control-label"><spring:message code="invoice.label.invoicetype"/></label>
														<div class="col-sm-9">
														 	   <form:select path="invoiceType.id" class="form-control m-b">
																	<form:options items="${invoiceTypes}" itemLabel="name" itemValue="id"/>
															   </form:select>
														</div>
						                        	</div>
						                        	<div class="line line-dashed line-lg pull-in"></div>
						                       		<div class="form-group">
						                          		<label class="col-sm-3 control-label"><spring:message code="invoice.label.invoicestatus"/></label>
								                        <div class="col-sm-9">
															<form:select path="invoiceStatus.id" class="form-control m-b">
																<form:options items="${invoicestatus}" itemLabel="name" itemValue="id"/>
															</form:select>
								                          </div>
						                        	</div>
						                        	<div class="line line-dashed line-lg pull-in"></div>
						                        		<div class="form-group">
						                          			<label class="col-sm-3 control-label"><spring:message code="invoice.label.company"/></label>
						                          			<div class="col-sm-9">
																<form:select path="company.id" class="form-control m-b">
																	<form:options items="${listCompany}" itemLabel="name" itemValue="id"/> 
																</form:select>
						                          			</div>
						                        	</div>
						                        	<div class="line line-dashed line-lg pull-in"></div>
						                        	<div class="form-group">
						                          		<label class="col-sm-3 control-label"><spring:message code="invoice.label.customer"/></label>
						                          		<div class="col-sm-9">
						                           	    	<form:select path="customer.id" class="form-control m-b">
								                      			<form:options items="${listCustomers}" itemLabel="firstname" itemValue="id"/>
								                       		</form:select>
						                          		</div>
						                        	</div>
						                            <%--<div class="line line-dashed line-lg pull-in"></div>
						                        		<div class="form-group">
						                          			<label class="col-sm-3 control-label"><spring:message code="invoice.label.notes"/></label>
						                          			<div class="col-sm-9">
						                          				<spring:message code="invoice.label.notes" var="notes"/>
						                            			<form:textarea path="notes" class="form-control" rows="5" cols="30" data-required="true" placeholder="${notes}"></form:textarea>    
						                          			</div>
						                        	</div> --%>
													<footer class="panel-footer text-right bg-light lter">
													  	<a type="button" class="btn btn-danger bottom-margin" href="/invoice"><spring:message code="common.label.cancel"/></a>
														<button class="btn btn-primary bottom-margin" type="submit"><spring:message code="common.label.save"/></button>
													</footer>
					                      		</div>
					                        </section>
					                  	</form:form>
					                </div>
					            </div>
					            <jsp:include page="invoice_item.jsp"/>
					            <%-- <div class="row">
					                <div class="col-sm-12">
					                    <section class="panel panel-default">
					                    	<header class="panel-heading">
					                        	<div>
					                        		<strong>
					                        			 <spring:message code="invoice.label.invoiceitem"/>
					                        		</strong>
					                        		<span onclick="addMoreRows(this.form);">
					                        			<button id="addItem" class="btn btn-primary bottom-margin"><spring:message code="common.label.add"/></button>
					                        		</span>
					                        	</div>
					                      	</header>
											<div class="table-responsive">
												<form:form commandName="product">
												<table id="MyStretchGrid" class="table table-striped datagrid m-b-sm">
													<tr>
														<th><spring:message code="invoice.label.numberlabel"/></th>
														<th><spring:message code="products.label.product"/></th>
														<th><spring:message code="products.label.price"/></th>
														<th><spring:message code="products.label.quantity"/></th>
														<th><spring:message code="taxrate.label"/></th>
														<th><spring:message code="invoice.label.subtotal"/></th>
														<th></th>
													</tr>
													<tr id="rowCount1">
														<td>
															<select class="form-control m-b">
													        	<option value="product1">product1</option> 
													        	<option value="product2">product2</option>
												        	</select>
														         <form:select path="id" class="form-control m-b">
									                      			<form:options items="${products}" itemLabel="name" itemValue="id" />
									                       		</form:select>
														</td>
														<td>
															<input type="text" class="form-control" name="price"/>
															<input id="price" type="hidden" value="10000"/>
														</td>
														<td>
															<input type="text" class="form-control" name="quantity"/>
															<input id="quantity" type="hidden" value="10"/>
														</td>
														<td>
															<select class="form-control m-b">
													        	<c:forEach items="${taxrate}" var="taxrate"></c:forEach>
													        	<option value="10.10">10.10</option> 
													        	<option value="10.12">10.12</option>
												        	</select>	
														</td>
														<td id="subTotal">
														</td>
														<td class="col-sm-2">
															<a href="#" onclick="removeRow(1);">
																<button type="button" class="btn btndelete btn-sm btn-default" title="Remove">
																	<i class="fa fa-trash-o"></i>
																</button>
															</a>
														</td>
												</table>
												</form:form>
							                </div>
						                </section>
						            </div>
					            </div> --%>
							</section>
						</section>
					</section>
				</section>
			</section>
		</section>
 	</body>
</html>