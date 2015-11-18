package com.phoebus.abfragen.web;


import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.phoebus.abfragen.model.Query;
import com.phoebus.abfragen.persistence.QueryRepository;

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
		
		model.addAttribute("bereicheList", getSortedAndDistinctLists(queries, "bereich"));
		model.addAttribute("erstelltList", getSortedAndDistinctLists(queries, "erstellt"));
		
		return "query_selection";
	}
	
	
	/* HELPER METHODS */
	
	private List<String> getSortedAndDistinctLists(List<Query> queries, String attribut) {
		
		List<String> resultList = new ArrayList<>();
		String tmp = "";
		
		for(Query query : queries) {
			if("bereich".equals(attribut)) {
				tmp = query.getBereich();
			} else if("erstellt".equals(attribut)) {
				tmp = query.getErstellt();
			}
			if(!resultList.contains(tmp)) {
				resultList.add(tmp);
			}
		}
		
		Collections.sort(resultList);
		
		return resultList;
	}
}
