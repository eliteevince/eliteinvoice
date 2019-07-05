<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript">
		var rowCount = 1;
		function addMoreRows(frm) {
			rowCount ++;
			var recRow =  '<tr id="rowCount'+rowCount+'">'+
							'<td><select class="form-control m-b"><option value="product1">product1</option></select></td>'+
							'<td><input id="price'+rowCount+'" type="text" class="form-control price" data-raw-id='+rowCount+' name="price"/></td>'+
							'<td><input id="quantity'+rowCount+'" type="text" class="form-control quantity" data-raw-id='+rowCount+' name="quantity"/></td>'+
							'<td><select id="taxrate'+rowCount+'" class="form-control m-b taxrate" data-raw-id='+rowCount+'><option value="10.10">10.10</option></select></td>'+
							'<td id="subTotal'+rowCount+'" data-raw-id='+rowCount+'></td>'+
							'<td><a href="javascript:void(0);" onclick="removeRow('+rowCount+');"><button type=\"button\" class=\"btn btndelete btn-sm btn-default\" title=\"Remove\"><i class=\"fa fa-trash-o\"></i></button></a></td>'+
						  '</tr>';
			jQuery('#MyStretchGrid tbody').append(recRow);
		}

		function removeRow(removeNum) {
			jQuery('#rowCount'+removeNum).remove();
		}
		
		setTimeout(function(){
			$("#price1").trigger("change");
			$("#quantity1").trigger("change");
			$("#taxrate1").trigger("change");
		},500);
		
		$("body").delegate(".price , .quantity , .taxrate", "change", function(e) {
			var rawId = $(this).data("rawId");
			var price = $("#price"+rawId).val();
			var quantity = $("#quantity"+rawId).val();
			var taxrate = $("#taxrate"+rawId).val();
			var subTotal = price * quantity * taxrate;
			var total = subTotal;
			$("#subTotal"+rawId).html(""+subTotal+"");
			$("#total").html(""+total+"");
		});
		</script>
</head>
<body>
<div class="row">
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
				<form:form commandName="invoice">
				<table id="MyStretchGrid" class="table table-striped datagrid m-b-sm">
					<tr>
						<%-- <th><spring:message code="invoice.label.numberlabel"/></th> --%>
					<th><spring:message code="products.label.product"/></th>
					<th><spring:message code="products.label.price"/></th>
					<th><spring:message code="products.label.quantity"/></th>
					<th><spring:message code="taxrate.label"/></th>
					<th><spring:message code="invoice.label.subtotal"/></th>
					<th></th>
				</tr>
				<tr id="rowCount1">
					<td>
						<!-- <select class="form-control m-b">
				        	<option value="product1">product1</option> 
				        	<option value="product2">product2</option>
			        	</select> -->
					         <form:select path="id" class="form-control m-b">
			                   	<form:options items="${products}" itemLabel="name" itemValue="id" />
			                  </form:select>
					</td>
					<td>
						<%-- <form:input type="text" path="price" class="form-control" data-required="true"/> --%>
						<input id="price1" type="text"  data-raw-id="1" class="form-control price" name="price"/>
					</td>
					<td>
						<input id="quantity1" type="text" data-raw-id="1" class="form-control quantity" name="quantity"/>
						
					</td>
					<td>
						<select id="taxrate1" class="form-control m-b taxrate" data-raw-id="1">
				        	<option value="10.10">10.10</option> 
				        	<option value="10.12">10.12</option>
			        	</select>	
					</td>
					<td id="subTotal1">
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
           <div>
          	 	<spring:message code="invoice.label.total"></spring:message>: <span id="total"></span>
           </div>

           
          </section>
      </div>
     </div>
</body>
</html>