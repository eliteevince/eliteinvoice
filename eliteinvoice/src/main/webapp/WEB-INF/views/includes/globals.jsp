<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<script type="text/javascript">
	//Theme Path
	var themePath = "/static/blue-moonV1.0.2/";
	//REST URLs
	var restCustomerWsUrl = "/customers";
	var restTaxrateWsUrl = "/taxrate";
	var restProductWsUrl = "/products";
	var restCompanyWsUrl = "/companies";
	var restInvoiceWsUrl = "/invoice";
	var restUserWsUrl = "/users";
	
	var editButtonLabel = '<spring:message code="common.label.edit"/>';
	var deleteButtonLabel = '<spring:message code="common.label.delete"/>';
	var first = '<spring:message code="common.tooltip.first"/>';
	var previous = '<spring:message code="common.tooltip.previous"/>';
	var next = '<spring:message code="common.tooltip.next"/>';
	var last = '<spring:message code="common.tooltip.last"/>';
</script>