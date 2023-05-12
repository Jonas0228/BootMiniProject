package boot.study.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ContactController {

	@GetMapping("/contact")
	public String contact()
	{
		return "/main/contact/mapcontact";
	}
}