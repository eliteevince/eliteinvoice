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
		<!-- <script type="text/javascript">
			$(function(){
				populateInvoice("invoiceTable");
			});			
			
			//localized variables
			var editUrl = "/invoice/edit";
			var viewUrl = "/invoice/view";
			//delete model popup variables
			var deleteUrl = "/invoice/delete";
   			var menuLabel = '<spring:message code="invoice.label" var="invoice"/>';
			var modalHeader = '<spring:message code="common.modal.delete.label" arguments="${invoice}"/>';
			var modalBody = '<spring:message code="common.modal.delete.body" arguments="${invoice}"/>';
			var modalConfirm = '<spring:message code="common.modal.delete.label" arguments="${invoice}"/>';
			var modalCancel = '<spring:message code="common.label.cancel"/>';
			var deleteSuccessMessage = '<spring:message code="common.message.delete.success" arguments="${invoice}"/>';
			var deleteErrorMessage = '<spring:message code="common.message.delete.error" arguments="${invoice}"/>';
		</script> -->
		<script type="text/javascript">
		$(document).ready(function(){
    		 $('#model_delete_button').click(function(){
    			$('input[type=checkbox]').each(function() {
	   			    var values = $('input:checkbox:checked').map(function () {
	   			    	  return this.value;
	   			    	}).get();
    				$.ajax({
    					type :"POST",
    					url : "/invoice/delete",
    					data : "values="+ values,
    					success : function(data) {	
    						//$("#tabel").reload();
    						location.reload();
    	                }
    				});
    			});
    			$('#modal').modal('toggle');
    			$(function(){ 
    		        var $message = $('<div>').addClass('alert alert-success').html('<div><strong>Products has been deleted Successfully.</strong></div>');
    		        $("#messages").after($message);
    		        $message.fadeToggle(3000);
    		    });
    			return false;
    		});
    	});  
    	
		</script>
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
				        	<header class="header bg-white b-b clearfix">
				        	<c:if test="${!empty successMsg }">
					        	<div class="alert alert-success">
					        		<a class="close" data-dismiss="alert">×</a>  
									<strong>${successMsg}</strong>
					        	</div>
					      	</c:if>
							<div class="messages" id="messages"></div>
			                  <div class="row m-t-sm">
			                    <div class="col-sm-8 m-b-xs">
			                 	    <div class="btn-group">
			                        <a href="#modal" data-toggle="modal"><button type="button" class="btn btn-sm btn-default" title="Remove"><i class="fa fa-trash-o"></i></button></a>
			                      </div>
			                      <a href="/invoice/add" class="btn btn-sm btn-default"><i class="fa fa-plus"></i> Create</a>
			                    </div>
			                    <div class="col-sm-4 m-b-xs">
			                      <div class="input-group">
			                        <input type="text" class="input-sm form-control" placeholder="Search">
			                        <span class="input-group-btn">
			                          <button class="btn btn-sm btn-default" type="button">Go!</button>
			                        </span>
			                      </div>
			                    </div>
			                  </div>
			                </header>
			                <section class="scrollable wrapper w-f">
		                  	<section class="panel panel-default">
		                    <div class="table-responsive">
		                      <table class="table table-striped m-b-none">
		                        <thead>
		                          <tr>
		                            <th width="20"><input type="checkbox"></th>
		                            <th width="20"></th>
		                            <th><spring:message code="invoice.label.reference"/></th>
		                            <th><spring:message code="invoice.label.discount"/></th>												
									<th><spring:message code="invoice.label.shipping"/></th>
									<th><spring:message code="invoice.label.invoicetype"/></th>
									<th><spring:message code="invoice.label.invoicestatus"/></th>
									<th><spring:message code="invoice.label.customer"/></th>
									<th><spring:message code="invoice.label.company"/></th>
									<th class="icon"><spring:message code="common.label.edit"/></th>
		                            <th width="30"></th>
		                          </tr>
		                        </thead>
		                        <tbody>
		                        <c:set var="count" value="0"></c:set> 
		                        <c:forEach items="${invoices}" var="invoice">
		                          <c:set var="count" value="${count + 1}"></c:set>
		                          <tr>
		                            <td><input type="checkbox" id="id" name="id" value="${invoice.id}"></td>
		                            <td><a href="/invoice/view/${invoice.id}" data-toggle="modal"><i class="fa fa-search-plus"></i></a></td>
		                            <td>${invoice.refNo}</td>
		                            <td>${invoice.discount}</td>
		                            <td>${invoice.shipping}</td>
		                            <td>${invoice.invoiceType.name}</td>
		                            <td>${invoice.invoiceStatus.name}</td>
		                            <td>${invoice.customer.firstname} ${invoice.customer.lastname}</td>
		                            <td>${invoice.company.name}</td>
		                            <td>
		                            	<a href="/invoice/edit/${invoice.id}"><button class="btn"><i class="fa fa-edit"></i></button></a>
		                            </td>
		                            <td>
		                              <a href="#" class="active" data-toggle="class"><i class="fa fa-check text-success text-active"></i><i class="fa fa-times text-danger text"></i></a>
		                            </td>
		                          </tr>
		                          </c:forEach>
		                        </tbody>
		                      </table>
		                    </div>
		                  </section>
		                </section>
		                </section>
		                <footer class="footer bg-white b-t">
		                  <div class="row text-center-xs">
		                    <div class="col-md-6 hidden-sm">
		                      <p class="text-muted m-t">Showing 20-30 of ${count}</p>
		                    </div>
		                    <div class="col-md-6 col-sm-12 text-right text-center-xs">                
		                      <ul class="pagination pagination-sm m-t-sm m-b-none">
		                        <li><a href="#"><i class="fa fa-chevron-left"></i></a></li>
		                        <li class="active"><a href="#">1</a></li>
		                        <li><a href="#">2</a></li>
		                        <li><a href="#">3</a></li>
		                        <li><a href="#">4</a></li>
		                        <li><a href="#">5</a></li>
		                        <li><a href="#"><i class="fa fa-chevron-right"></i></a></li>
		                      </ul>
		                    </div>
		                  </div>
		                </footer>
						</section>
					</section>
				</section>
			</section>
		</section>
		<div class="modal fade" id="modal">
		    <div class="modal-dialog">
		      <div class="modal-content">
		        <div class="modal-header">
		          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		          <h4 class="modal-title">Delete Records</h4>
		        </div>
		        <div class="modal-body">
		          <p>Delete All Selected Items.</p>
		          <section class="panel panel-default m-l-n-md  m-r-n-md m-b-none">
		            <header class="panel-heading">
		              <center><h4>Are You Sure ?</h4></center>
		            </header>
		          </section>
		        </div>
		        <div class="modal-footer">
		          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
		          <button type="button" id="model_delete_button" class="btn btn-info" data-dismiss="modal">Delete</button>
		        </div>
		      </div><!-- /.modal-content -->
		    </div><!-- /.modal-dialog -->
		  </div>
 	</body>
</html>