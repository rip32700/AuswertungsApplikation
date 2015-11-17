package com.phoebus.abfragen.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ResultController {

	@RequestMapping(value = "/result")
	public String result(final Model model) {
		return "result";
	}
	
	@RequestMapping(value = "/download")
	public String download(final Model model) {
		
		
		
		return "result";
	}
}
