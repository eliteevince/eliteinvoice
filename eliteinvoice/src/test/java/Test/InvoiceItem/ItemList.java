package Test.InvoiceItem;


import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.eliteinvoice.core.model.Invoice;
import com.eliteinvoice.core.model.InvoiceItem;
import com.eliteinvoice.core.service.InvoiceItemService;
import com.eliteinvoice.core.service.InvoiceService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:datasource-context.xml" })
public class ItemList {

	@Autowired
	private InvoiceItemService invoiceItemService;
	
	@Autowired
	private InvoiceService invoiceService;
	
	//@Test
	public void getinvoice() {
		InvoiceItem invoiceItem = invoiceItemService.findByIdItem(4);
		System.out.println("Invoice Id ====" + invoiceItem.getInvoice().getId());
		System.out.println("Invoice Ref No. =====" + invoiceItem.getInvoice().getRefNo());
	}
	
	@Test
	public void itemlist() {
		
		Invoice invoice = invoiceService.findById(2);
		
		for(InvoiceItem invoiceItem : invoice.getInvoiceItem()){
			System.out.println("Invoice item Id ====== " + invoiceItem.getId());
			System.out.println("Invoice item Price =====" + invoiceItem.getPrice());
		}
	}
	

}
