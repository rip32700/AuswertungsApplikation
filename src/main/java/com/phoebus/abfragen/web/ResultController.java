package com.phoebus.abfragen.web;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.phoebus.abfragen.persistence.QueryRepository;
import com.phoebus.abfragen.service.ExcelReportView;

@Controller
public class ResultController {

	private QueryRepository repository;

	@Inject
	public ResultController(QueryRepository repository) {
		this.repository = repository;
	}
	
	@RequestMapping(value = "/result")
	public String result(final Model model) {
		return "result";
	}
	
	@RequestMapping(value = "/downloadExcel", method = RequestMethod.GET)
    public ModelAndView downloadExcel() {
		return new ModelAndView(new ExcelReportView(), "queryList", repository.findAll());
    }    
}
