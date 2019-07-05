package Test.InvoiceItem;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.eliteinvoice.core.model.InvoiceItem;
import com.eliteinvoice.core.model.Product;
import com.eliteinvoice.core.model.Taxrate;
import com.eliteinvoice.core.service.InvoiceItemService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:datasource-context.xml" })
public class InvoiceItemTest {

	@Autowired
	private InvoiceItemService invoiceItemService;
	
	//@Test
	public void inset() {
		
		Product product = new Product();
		product.setId(1);
		Taxrate taxrate = new Taxrate();
		taxrate.setId(1);
		InvoiceItem invoiceItem = new InvoiceItem();
		invoiceItem.setId(3);
		invoiceItem.setPrice(300);
		invoiceItem.setQuantity(33);
		invoiceItem.setProduct(product);
		invoiceItem.setTaxrate(taxrate);
		invoiceItemService.insert(invoiceItem);
	}
	
	@Test
	public void findAllItem(){
		
		List<InvoiceItem> invoiceItemfind =  invoiceItemService.findAllItem();
		for(InvoiceItem invoiceItem : invoiceItemfind){
			System.out.println("invoice Item =========" + invoiceItem.getId());
		}
	}
	
	//@Test
	public void delete(){
		invoiceItemService.delete(3);
		System.out.println("deleted successfully.......");
	}
}
