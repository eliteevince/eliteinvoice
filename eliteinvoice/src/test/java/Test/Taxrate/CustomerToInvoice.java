package Test.Taxrate;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.eliteinvoice.core.model.Customer;
import com.eliteinvoice.core.model.Invoice;
import com.eliteinvoice.core.service.CustomerService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:datasource-context.xml" })
public class CustomerToInvoice {

	@Resource
	private CustomerService customerService;
	
	@Test
	public void test() {
		Customer customre = customerService.findById(1);
		System.out.println("Customer First Name ==========> " +customre.getFirstname());
		
		for(Invoice invoice : customre.getInvoice())
		{
			System.out.println("Invoice Ref No. : " + invoice.getRefNo());
		}
	}
}
