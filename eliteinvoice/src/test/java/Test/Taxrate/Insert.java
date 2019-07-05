package Test.Taxrate;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.eliteinvoice.core.model.Taxrate;
import com.eliteinvoice.core.model.Taxratetype;
import com.eliteinvoice.core.model.User;
import com.eliteinvoice.core.service.TaxrateService;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:datasource-context.xml" })
public class Insert {
	
	@Resource
	private TaxrateService taxrateService;

	@Test
	public void insert() {
		
		Taxrate taxrate = new Taxrate();
		taxrate.setName("name");
		taxrate.setRate(65);
		
		Taxratetype taxratetype = new Taxratetype();
		taxratetype.setId(1);
		
		taxrate.setTaxratetype(taxratetype);
		
		User user = new User();
		user.setId(1);
		
		taxrate.setCreatedBy(user);
		taxrate.setModifiedBy(user);
		
		taxrateService.insert(taxrate);
		System.out.println("Insertd Successfully...");
		
	}

}
