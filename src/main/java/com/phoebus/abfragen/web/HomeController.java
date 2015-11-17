package com.phoebus.abfragen.web;


import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.phoebus.abfragen.model.Query;
import com.phoebus.abfragen.persistence.QueryRepository;
import com.phoebus.abfragen.service.BoundVarFilter;
import com.phoebus.abfragen.service.ExcelReportView;

@Controller
public class HomeController {
	
	private QueryRepository repository;

	@Inject
	public HomeController(QueryRepository repository) {
		this.repository = repository;
	}
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String querySelection(final Model model) {
		List<Query> queries = repository.findAll();
		model.addAttribute("queryList", queries);
		
		return "query_selection";
	}
	
	@RequestMapping(value = "/query_selected", method = RequestMethod.POST)
	public String querySelected(final Model model) {
		
		//save query
		
		// get selected query and find prepared string, filter bound variables
		// just for testing purpose:
		List<String> boundVars = BoundVarFilter.getBoundVariables("SELECT a.an_antragsnr, a.an_produktkz, a.an_zahlbeitrag FROM antraege a " + 
				"WHERE a.an_persnr = :personennummer AND a.an_beginn = :beginn AND a.an_stoergrundkz " + 
                "= :status AND a.an_teilantragsnr = 0;");
		model.addAttribute("boundVariables", boundVars);
		
		return "parameter_selection";
	}
	
	@RequestMapping(value = "/parameter_selected", method = RequestMethod.POST)
	public String paramterSelected(final Model model) {
		
		//save paramters
		
		return "processing";
	}
	
	/*
	@RequestMapping(value = "/query_selected", method = RequestMethod.GET)
	public String querySelected(final Model model) {
		
		List<Query> queries = repository.findAll();
		model.addAttribute("queryList", queries);
		
		List<String> boundVars = BoundVarFilter.getBoundVariables("SELECT a.an_antragsnr, a.an_produktkz, a.an_zahlbeitrag FROM antraege a " + 
										"WHERE a.an_persnr = :personennummer AND a.an_beginn = :beginn AND a.an_stoergrundkz " + 
				                        "= :status AND a.an_teilantragsnr = 0;");
		model.addAttribute("boundVariables", boundVars);
		
		return "home";
	}
	*/
	
	@RequestMapping(value = "/", method = RequestMethod.POST)
	public String process(final Model model) {
		return "processing";
	}
	
	@RequestMapping(value = "/downloadExcel", method = RequestMethod.GET)
    public ModelAndView downloadExcel() {
		return new ModelAndView(new ExcelReportView(), "queryList", repository.findAll());
    }    
}
