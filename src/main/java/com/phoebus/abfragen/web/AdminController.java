package com.phoebus.abfragen.web;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.phoebus.abfragen.domain.Query;

@Controller
public class AdminController {

	@RequestMapping(value="/admin")
	public String admin(final Model model) {
		model.addAttribute("query", new Query());
		return "admin";
	}
	
	@RequestMapping(value="/admin/new_query")
	public String newQuery(final Query query) {
		
		System.out.println("Query-Titel: " + query.getText());
		
		return "redirect:/";
	}
}
