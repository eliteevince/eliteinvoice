/************************************ common ************************************/
$(function() {    
    //To fade out success messages
    $(".alert-success").delay(2000).fadeOut("slow");

    //To add close button after error messages
    $(".alert-error").append("<a class='close' data-dismiss='alert'>X</a>");

    //To display dialog modal from server side
    displayModalFromServer();
});


//To get constant value by key
function getConstantValueByKey(constantsObj, row, column) {
    if (constantsObj.hasOwnProperty(row)) {
        for (key in constantsObj[row]) {
            if (constantsObj[row][key][column]) {
                return constantsObj[row][key][column];
            }
        }
    }
    return "";
}

/*function displayViewDataTable(tableId) {

    var dataTableObject = {
    	"sDom": "<'row'<'col-sm-6'l><'col-sm-6'f>r>t<'row'<'col-sm-6'i><'col-sm-6'p>>",
        "sPaginationType": "full_numbers",
        "bSort": false,
        "bDestroy": true, // To initialize data table again
        "bServerSide": true,
        "bAutoWidth": true,
        "fnInitComplete": function() {
            this.fnAdjustColumnSizing();
        },
        "fnDrawCallback": function() {
            dataTablesOnCompleteEvent();
        },
        "fnRowCallback": function(nRow, aData, iDisplayIndex) {
        	nRow.id = tableId + "_" + aData.id;
            return nRow;
        },
    };

    $("#" + tableId).dataTable(dataTableObject);
}*/

//display DataTables
var dataTableObj = "";
function displayDataTable(tableId, ajaxUrl, aoColumnsArray, filter, columnFilterObject) {
	var tableName = tableId.replace("Table", '');
    var dataTableObject = {
    	"responsive": true,        
        "sPaginationType": "full_numbers",
        "bSort": false,
        "bDestroy": true, // To initialize data table again
        "bServerSide": true,        
        "sAjaxSource": ajaxUrl,
        "dom": "<'row'<'col-sm-12'f>>t<'row'<'col-sm-4'l><'col-sm-4'i><'col-sm-4'p>>",
        "fnInitComplete": function() {
            this.fnAdjustColumnSizing();
            /*$("#" + tableId).parents(".row").prev(".row").children().find(".dataTables_length").append("<button type=\"button\" class=\"btn btndelete btn-sm btn-default\" title=\"Remove\"><i class=\"fa fa-trash-o\"></i></button>");
            $("#" + tableId).parents(".row").prev(".row").children().find(".dataTables_length").append("<a href=\"/"+tableName+"/add\" class=\"btn addbtn btn-sm btn-default\"><i class=\"fa fa-plus\"></i> "+addUrl+"</a>");
            $("#" + tableId).parent().removeClass("col-sm-12").addClass("panel panel-default");
        	$("#" + tableId).parents(".row").addClass("scrollable wrapper w-f");
        	$("#" + tableId).parents(".row").prev(".row").addClass("header bg-white b-b clearfix");
        	$("#" + tableId).parents(".row").next(".row").addClass("footer bg-white b-t");*/
            
            //nareshbhai
            $("div.dataTables_wrapper > div").addClass("bg-white b-b clearfix b-t footer");
            $("div.dataTables_wrapper > div:first").removeClass("b-t footer");
            $(".dataTables_wrapper .row .col-sm-12 >").append("<span class='col-sm-2'><button type=\"button\" class=\"btn btndelete btn-sm btn-default\" title=\"Remove\"><i class=\"fa fa-trash-o\"></i></button><a href=\"/"+tableName+"/add\" class=\"btn addbtn btn-sm btn-default\"><i class=\"fa fa-plus\"></i> "+addUrl+"</a></span>");
        	$(".btndelete").prop("disabled", "disabled"); 
        	console.log(dataTableObj);
        },
        "fnDrawCallback": function() {
        	$(".btndelete").prop("disabled", "disabled");
        	if(dataTableObj.fnSettings().aoData.length === 0) {
        		$('#headerCheckbox').attr("disabled", "disabled");
    	    } else {
    	    	$('#headerCheckbox').prop("checked", "");
    	    }
            dataTablesOnCompleteEvent();
        },
        "fnRowCallback": function(nRow, aData, iDisplayIndex) {
        	/*if(nRow % 2 == 1){
        		 $(nRow).removeClass("odd");
        	}*/
        	nRow.id = tableId + "_" + aData.id;
            return nRow;
        },
        "aoColumns": aoColumnsArray
    };
    dataTableObj = $("#" + tableId).dataTable(dataTableObject);
}


//To fire an event on data table display complete
function dataTablesOnCompleteEvent() {	
	activateToolTip();
}


//To display dialog modal from server side
function displayModalFromServer() {
	$("table").on("click", ".server_modal_dialog", function(e) {
		e.preventDefault();
		var href = $(this).attr("href");
		if (href.indexOf("#") == 0) {
			$(href).modal("open");
		} else {
			$.get(href, function(data) {
				$(".modal").remove();
				var modalHtml = "<div class='modal fade'>";
				modalHtml += "	<div class='modal-dialog'>";
				modalHtml += "		<div class='modal-content'>";
				modalHtml += data;
				modalHtml += "		</div>";
				modalHtml += "	</div>";
				modalHtml += "</div>";
				$("body").append(modalHtml);
				$(".modal").modal();
			});
		}
	});
} //displayModalFromServer - End of Function


//To delete record
$(function() {
    //Button Delete event
    /*$("table").on("click", "button.btndelete", function() {
        var tableId = $(this).closest("table").attr("id");
        var trObj = $(this).parent().parent();
        var recordId = trObj.attr("id").split(tableId + "_")[1];
        var callback = function() {
            //to delete record
            var URL = deleteUrl + "/" + recordId;
            $.ajax({
                url: URL,
                success: function(data) {
                    if (!data) {
                        displayMessage("danger", deleteErrorMessage, false);
                    } else {                    	
                        displayMessage("success", deleteSuccessMessage, false);
                        trObj.remove();
                        checkForNoRecords(tableId);
                        if (window.deleteEventCallbackFunction) {
                            setTimeout(function() {
                                deleteEventCallbackFunction();
                            }, 2000);
                        }
                    }
                }
            });
        };
        confirmModal(modalHeader, modalBody, modalConfirm, modalCancel, callback);
    });*/
	
	$(document).delegate('table input:checkbox', 'change', function() {
		var total = $('input[type="checkbox"]').length;
		var totalChecked = $('table input:checkbox:checked').length;
		$(".btndelete").prop("disabled", totalChecked === 0);
		if (totalChecked === 1) {
			if ($('table input:checkbox:checked').val() === "on") {
				$(".btndelete").prop("disabled", "disabled");
				$('#headerCheckbox').prop("checked", "");
			}
		}		
		if(totalChecked === total - 1) {
			$('#headerCheckbox').prop("checked", "checked");
		}
	});
    
	//row color change, while datatabel checkbox checked
	$(document).delegate('table input:checkbox', 'change', function() {
		if($(this).is(":checked")) {
			if($(this).parent().hasClass("header-checkbox")) {
				$(this).closest("thead").next("tbody").find("tr").addClass("trBackground");
			} else {
				$(this).closest("tr").addClass("trBackground");
			}
	    } else {
	    	if($(this).parent().hasClass("header-checkbox")) {
				$(this).closest("thead").next("tbody").find("tr").removeClass("trBackground");
			} else {
				$(this).closest("tr").removeClass("trBackground");
			}
	    }
	});
	
	
    $(document).on("click", ".btndelete", function() {
        var values = "";
        var first = true;
    	/*var tableId = $(this).parents(".row").next(".row").find("table").attr("id");*/
        var tableId = $("table").attr("id"); //nareshbhai
        $('#'+ tableId +' tr').filter(':has(:checkbox:checked)').each(function(i, row) {
        	var $actualrow = $(row);
            $checkbox = $actualrow.find('input:checked');
            if(first) {
            	first = false;
            }else {
            	values+=",";
            }
            
            if($checkbox.val() === "on") {
            	first = true;
            }else {
            	values+=$checkbox.val();
            }
        });
        
        var callback = function() {
            //to delete record
            var URL = deleteUrl;
            $.ajax({
            	type :"POST",
				url : URL,
				data : "values="+ values,
                success: function() {
                	$('#headerCheckbox').prop("checked", "");
                    displayMessage("success", deleteSuccessMessage, false);
                    dataTableObj.fnReloadAjax();
                    checkForNoRecords(tableId);
                    if (window.deleteEventCallbackFunction) {
                        setTimeout(function() {
                            deleteEventCallbackFunction();
                        }, 2000);
                    }
                }
            });
        };
        confirmModal(modalHeader, modalBody, modalConfirm, modalCancel, callback);
    });
});

//To check for no records
function checkForNoRecords(tableId) {
	var trCount = $("#" + tableId).find("tbody").find("tr").length;
	var thCount = $("#" + tableId).find("thead").find("th").length;
	if (trCount == 0) {
		$("#" + tableId).append('<tr><td colspan=' + thCount + '>No data available in table</td></tr>');
	}
} //End of function


//General function to display the message
function displayMessage(messageType, message, messageAppend) {	
	var msgDiv = '<div class="alert alert-' + messageType + ' ' + messageType + '"><a class="close" data-dismiss="alert">X</a>';
	msgDiv += message;
	msgDiv += '</div>';

	if (messageAppend) {
		$("#messages").append(msgDiv);
	} else {
		$("#messages").html(msgDiv);
	}
	$('html,body').animate({
		/*scrollTop: $(".panel-default").offset().top*/
		scrollTop: $(".table-striped").offset().top //nareshbhai
	}, 'slow');

	//To hide message
	$(".alert").delay(2000).fadeOut('slow');
} //End of function


//General delete model popup for delete record
function confirmModal(modalHeader, modalBody, modalConfirm, modalCancel, callback) {
    var confirmModal =
        $('<div class="modal fade">' +
            '<div class="modal-dialog">' +
            	'<div class="modal-content">' +
            		'<div class="modal-header">' +
            			'<button data-dismiss="modal" class="close" type="button">x</button>' +
            			'<h3>' + modalHeader + '</h3>' +
            		'</div>' +
            		'<div class="modal-body">' +
            			'<p>' + modalBody + '</p>' +
            		'</div>' +
            		'<div class="modal-footer">' +
            			'<button class="btn btn-danger btn-small" data-dismiss="modal" aria-hidden="true">' + modalCancel + '</button>' +
            			'<button id="delete" data-dismiss="modal" class="btn btn-primary btn-small">' + modalConfirm + '</button>' +
            		'</div>' +
            	'</div>' +
            '</div>' +
           '</div>'
        );
    confirmModal.find('#delete').click(function(event) {
        confirmModal.modal('hide');
        callback();
    });
    confirmModal.modal('show');
}


//To populate dropdown
function populateDropdown(id, URL, dropdownObj, callback) {
    if (id && id.trim().length > 0) {
        $.getJSON(URL, function(data) {
            var options = [];
            $.each(data, function(key, val) {
                options.push('<option value="' + key + '">' + val + '</option>');
            });
            $(dropdownObj).append(options);
            if (callback && typeof(callback) === "function") {
                callback();
            }
        }).error(function() {});
    }
}


//To get json from the specified url
function getJsonData(id, URL, callback) {
    var result = [];
    //To stop asynchronous ajax calling
    $.ajaxSetup({
        async: false
    });
    if (id && id.trim().length > 0) {
        $.getJSON(URL, function(data) {
            result = data;
        }).error(function() {});
    }
    return result;
}


//Button tooltip
function activateToolTip() {
	/*$('.paginate_button .btn').tooltip('hide');
	$('.btn.btnview').tooltip('hide');
	$('.btn.btnedit').tooltip('hide');
	$('.btn.btndelete').tooltip('hide');	
	$('.btn.btnedit').attr('data-original-title', editButtonLabel);	
	$('.btn.btndelete').attr('data-original-title', deleteButtonLabel);*/
}


/************************************ customers ************************************/
//To populate customers
function populateCustomers(tableId) {
    //To get customers	
    var URL = restCustomerWsUrl + "/find-all";
    var aoColumnsArray = getAoColumnsArrayForCustomersDataTable();
    displayDataTable(tableId, URL, aoColumnsArray);
}

//To get aoColumnsArray for customers datatable
function getAoColumnsArrayForCustomersDataTable() {
    var aoColumnsArray = [{
    	"render": function(data, type, aData, meta) {      		
          	return '<input class="chk" type="checkbox" value="' + aData.id + '"/>';
       }
    }, {
      	"render": function(data, type, aData, meta) {      		
          	return '<a href="' + viewUrl + '/' + aData.id + '"><i class="fa fa-search-plus"></i></a>';
       }
    },{
        "mData": "firstname"
    }, {
        "mData": "lastname"
    }, {
        "mData": "email"
    }, {
        "mData": "phone"
    }, {
        "mData": "address"
    }, {
        "mData": "postcode"
    }, {
        "mData": "city"
    }, {
        "mData": "state"
    }, {
        "mData": "country"
    }, {
      	"render": function(data, type, aData, meta) {      		
          	return '<a href="' + editUrl + '/' + aData.id + '"><i class="fa fa-edit"></i></a>';
       }
  	}/*, {
  		"render": function(data, type, aData, meta) {
      		return '<button class="btn btndelete"><a class="delete-row" href="#"><i class="fa fa-trash-o"></i></a></button>';
      	}
  	}*/];
    return aoColumnsArray;
}

/*{
	"sDefaultContent": "",
	"fnRender": function(oObj) {
  	return '<a href="/customers/viewCustomer/' + oObj.aData.id + '"><button class="btn"><i class="fa fa-edit"></i></button></a>';
  	}
},*/
/************************************ taxrate ************************************/
function populateTaxrate(tableId) {
  var URL = restTaxrateWsUrl + "/find-all";
  var aoColumnsArray = getAoColumnsArrayForTaxrateDataTable();
  displayDataTable(tableId, URL, aoColumnsArray);
}

function getAoColumnsArrayForTaxrateDataTable() {
  var aoColumnsArray = [{
		"render": function(data, type, aData, meta) {      		
	      	return '<input type="checkbox" value="' + aData.id + '"/>';
	   }
  }, {
      "mData": "name"
  }, {
      "mData": "rate"
  }, {
      "mData": "taxratetype.name"
  },{
	  	"render": function(data, type, aData, meta) {      		
	      	return '<a href="' + editUrl + '/' + aData.id + '"><i class="fa fa-edit"></i></a>';
	   }
		}/*, {
			"render": function(data, type, aData, meta) {
	  		return '<button class="btn btndelete"><a class="delete-row" href="#"><i class="fa fa-trash-o"></i></a></button>';
	  	}
		}*/];
  return aoColumnsArray;
}

/************************************ products ************************************/
function populateProducts(tableId) {
var URL = restProductWsUrl + "/find-all";
var aoColumnsArray = getAoColumnsArrayForProductDataTable();
displayDataTable(tableId, URL, aoColumnsArray);
}

function getAoColumnsArrayForProductDataTable() {
var aoColumnsArray = [{
	"render": function(data, type, aData, meta) {      		
      	return '<input type="checkbox" value="' + aData.id + '"/>';
   }
},{
    "mData": "name"
}, {
    "mData": "price"
},{
  	"render": function(data, type, aData, meta) {      		
      	return '<a href="' + editUrl + '/' + aData.id + '"><i class="fa fa-edit"></i></a>';
  		}
}/*, {
		"render": function(data, type, aData, meta) {
  		return '<button class="btn btndelete"><a class="delete-row" href="#"><i class="fa fa-trash-o"></i></a></button>';
  	}
	}*/];
return aoColumnsArray;
}

/************************************ company ************************************/
function populateCompany(tableId) {
var URL = restCompanyWsUrl + "/find-all";
var aoColumnsArray = getAoColumnsArrayForPCompanyDataTable();
displayDataTable(tableId, URL, aoColumnsArray);
}

function getAoColumnsArrayForPCompanyDataTable() {
var aoColumnsArray = [{
	"render": function(data, type, aData, meta) {      		
      	return '<input type="checkbox" class="checkbox" value="' + aData.id + '"/>';
   }
}, {
    "mData": "name"
}, {
    "mData": "email"
}, {
    "mData": "phone"
}, {
    "mData": "address"
}, {
    "mData": "postcode"
}, {
    "mData": "city"
}, {
    "mData": "state"
}, {
    "mData": "country"
}, {
    "mData": "logoImage"
},{
  	"render": function(data, type, aData, meta) {      		
      	return '<a href="' + editUrl + '/' + aData.id + '"><i class="fa fa-edit"></i></a>';
   }
	}/*, {
		"render": function(data, type, aData, meta) {
  		return '<button class="btn btndelete"><a class="delete-row" href="#"><i class="fa fa-trash-o"></i></a></button>';
  	}
	}*/];
return aoColumnsArray;
}

/************************************ invoice ************************************/
//To populate invoice
function populateInvoice(tableId) {
//To get invoice	
var URL = restInvoiceWsUrl + "/find-all";
var aoColumnsArray = getAoColumnsArrayForInvoiceDataTable();
displayDataTable(tableId, URL, aoColumnsArray);
}

//To get aoColumnsArray for invoice datatable
function getAoColumnsArrayForInvoiceDataTable() {
var aoColumnsArray = [{
	"render": function(data, type, aData, meta) {      		
      	return '<input type="checkbox" value="' + aData.id + '"/>';
   }
},{
  	"render": function(data, type, aData, meta) {      		
      	return '<a href="' + viewUrl + '/' + aData.id + '"><i class="fa fa-search-plus"></i></a>';
   }
},{
  "mData": "refNo"
}, {
  "mData": "discount"
}, {
  "mData": "shipping"
}, {
  "mData": "invoiceType.name"
}, {
  "mData": "invoiceStatus.name"
}, {
  "mData": "customer.firstname"
}, {
  "mData": "company.name"
},{
  	"render": function(data, type, aData, meta) {      		
      	return '<a href="' + editUrl + '/' + aData.id + '"><i class="fa fa-edit"></i></a>';
   }
	}/*, {
		"render": function(data, type, aData, meta) {
  		return '<button class="btn btndelete"><a class="delete-row" href="#"><i class="fa fa-trash-o"></i></a></button>';
  	}
	}*/];
return aoColumnsArray;
}

/************************************ users ************************************/
//To populate users
function populateUsers(tableId) {
//To get users	
var URL = restUserWsUrl + "/find-all";
var aoColumnsArray = getAoColumnsArrayForUsersDataTable();
displayDataTable(tableId, URL, aoColumnsArray);
}

//To get aoColumnsArray for users datatable
function getAoColumnsArrayForUsersDataTable() {
var aoColumnsArray = [{
	"render": function(data, type, aData, meta) {      		
      	return '<input type="checkbox" value="' + aData.id + '"/>';
   }
},{
    "mData": "username"
}, {
    "mData": "password"
},{
    "mData": "role.name"
},{
  	"render": function(data, type, aData, meta) {      		
      	return '<a href="' + editUrl + '/' + aData.id + '"><i class="fa fa-edit"></i></a>';
   }
	}/*, {
		"render": function(data, type, aData, meta) {
  		return '<button class="btn btndelete"><a class="delete-row" href="#"><i class="fa fa-trash-o"></i></a></button>';
  	}
	}*/];
return aoColumnsArray;
}

/********************************** customer view ********************************************/
function populateCustomerView(tableId, id){
	var URL = restCustomerWsUrl + "/find/"+id ;
//	var URL = restCustomerWsUrl + "/view" ;
	var aoColumnsArray = getAoColumnsArrayForCustomerViewDataTable();
	displayDataTable(tableId, URL, aoColumnsArray);
	setTimeout(function(){
		$(".table-responsive .footer").css({"position":"relative","width":"auto"});
	}, 500);
}
function getAoColumnsArrayForCustomerViewDataTable() {
	var aoColumnsArray = [{
	  "mData": "refNo"
	}, {
	  "mData": "discount"
	}, {
	  "mData": "shipping"
	}, {
	  "mData": "invoiceType.name"
	}, {
	  "mData": "invoiceStatus.name"
	},{
	  "mData": "company.name"
	}];
	return aoColumnsArray;
}