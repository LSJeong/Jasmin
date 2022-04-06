package co.jasmin.prj.info.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class InfoController {

	@RequestMapping("/location.do")
	public String location() {
		return "info/location";
	}
	
	@RequestMapping("/rules.do")
	public String rules() {
		return "info/rules";
	}
	
	@RequestMapping("/tutorial.do")
	public String tutorial() {
		return "info/tutorial";
	}
}
