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
		
		<!-- <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css" /> -->
		<!-- <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
		<script src="http://code.jquery.com/ui/1.10.2/jquery-ui.js"></script> -->
 
		 <script type="text/javascript">
		 
		 $(document).ready(function(){
			 
			 $(document).delegate('#table input:checkbox', 'change', function() {
				  $("#delete").prop("disabled", $('#table input:checkbox:checked').length == 0);
			 });

     		 $('#model_delete_button').click(function() {
    			    var values = $('.id:checked').map(function () {
    			    	return this.value;
    			    	}).get();
     				
    			    $.ajax({
     					type :"POST",
     					url : "/companies/delete",
     					data : "values="+ values,
     					success : function(data) {
     					//	$("#tabel").load(url, "#tabel");
     						$("#companyTable").reload();
     					//	$("#tabel").replaceWith($('#tabel', $(html)));
     					//	$("#tabel").html(data);
     					//	 $("#scrollablepadder").html(data);
     	                }
     				});

     			$('#modal').modal('toggle');
     			
     			 $(function(){ 
     		        var $message = $('<div>').addClass('alert alert-success').html('<div><strong>Companies has been deleted Successfully.</strong></div>');
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
						<jsp:param value="companies" name="selected"/>
					</jsp:include>
					<section id="content">
				    	<section class="vbox">
				    	<section class="scrollable padder" id="scrollablepadder">
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
			                         <a href="#modal" data-toggle="modal"><button id="delete" type="button" class="btn btn-sm btn-default" title="Remove" disabled="true"><i class="fa fa-trash-o"></i></button></a>
			                      </div>
			                      <a href="/companies/add" class="btn btn-sm btn-default"><i class="fa fa-plus"></i> <spring:message code="common.label.crete"/></a>
			                    </div>
			                    <div class="col-sm-4 m-b-xs">
			                      <div class="input-group">
			                        <input type="text" class="input-sm form-control" placeholder="Search">
			                        <span class="input-group-btn">
			                          <button class="btn btn-sm btn-default" type="button"><spring:message code="common.label.go"/></button>
			                        </span>
			                      </div>
			                    </div>
			                  </div>
			                </header>
			                <section class="scrollable wrapper w-f">
		                  	<section class="panel panel-default">
		                    <div class="table-responsive" id="table">
		                      <table id="companyTable" class="table table-striped m-b-none">
		                        <thead>
		                          <tr>
		                            <th width="20"><input type="checkbox" id="selecctall"></th>
		                            <th width="20"></th>
		                            <th><spring:message code="companies.label.name"/></th>
									<th><spring:message code="companies.label.email"/></th>												
									<th><spring:message code="companies.label.phone"/></th>
									<th><spring:message code="companies.label.address"/></th>
									<th><spring:message code="companies.label.postcode"/></th>
									<th><spring:message code="companies.label.city"/></th>
									<th><spring:message code="companies.label.state"/></th>
									<th><spring:message code="companies.label.country"/></th>
									<th><spring:message code="companies.label.logoimage"/></th>
									<th class="icon"><spring:message code="common.label.edit"/></th>
		                          </tr>
		                        </thead>
		                        <tbody>
		                        <c:set var="count" value="0"></c:set>
		                        <c:forEach items="${companies}" var="company">
		                          <c:set var="count" value="${count + 1}"></c:set>
		                          <tr>
		                            <td><input type="checkbox" class="id" value="${company.id}"/></td>
		                            <td><a href="" data-toggle="modal"><i class="fa fa-search-plus"></i></a></td>
		                            <td>${company.name}</td>
		                            <td>${company.email}</td>
		                            <td>${company.phone}</td>
		                            <td>${company.address}</td>
		                            <td>${company.postcode}</td>
		                            <td>${company.city}</td>
		                            <td>${company.state}</td>
		                            <td>${company.country}</td>
		                            <td>${company.logoImage}</td>
		                            <td>
		                            	<a href="/companies/edit/${company.id}"><button class="btn"><i class="fa fa-edit"></i></button></a>
		                            </td>
		                            <!-- <td>
		                              <a href="#" class="active" data-toggle="class"><i class="fa fa-check text-success text-active"></i><i class="fa fa-times text-danger text"></i></a>
		                            </td> -->
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
		          <h4 class="modal-title"><spring:message code="delete.modal.header"/></h4>
		        </div>
		        <div class="modal-body">
		          <p><spring:message code="delete.modal.content"/></p>
		          <section class="panel panel-default m-l-n-md  m-r-n-md m-b-none">
		            <header class="panel-heading">
		              <center><h4><spring:message code="delete.modal.message"/></h4></center>
		            </header>
		          </section>
		        </div>
		        <div class="modal-footer">
		          <button type="button" class="btn btn-default" data-dismiss="modal"><spring:message code="common.label.cancel"/></button>
		          <button type="button" id="model_delete_button" class="btn btn-info" data-dismiss="modal"><spring:message code="common.label.delete"/></button>
		        </div>
		      </div><!-- /.modal-content -->
		    </div><!-- /.modal-dialog -->
		  </div>
 		</body>
</html>