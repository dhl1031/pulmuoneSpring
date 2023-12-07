package org.pro.pulmuone;

import java.util.List;

import org.pro.pulmuone.domain.product.ProductsDTO;
import org.pro.pulmuone.mapper.main.MainMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/")
public class HomeController {
	
	@Autowired
	private MainMapper mainMapper;
	
	public HomeController() {
		super();
	}
	@RequestMapping("index")
	public String home(Model model) throws Exception {
		List<ProductsDTO> mainbestlist = this.mainMapper.get();		
		model.addAttribute("mainbestlist", mainbestlist );
		return "home.index";
	}
}
