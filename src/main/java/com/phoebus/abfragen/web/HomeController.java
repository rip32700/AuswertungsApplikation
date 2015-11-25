package com.phoebus.abfragen.web;


import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.phoebus.abfragen.model.Query;
import com.phoebus.abfragen.persistence.QueryRepository;
import com.phoebus.abfragen.utils.BoundVarFilter;
import com.phoebus.abfragen.utils.ListUtil;

@Controller
public class HomeController {
	
	private QueryRepository repository;

	@Inject
	public HomeController(QueryRepository repository) {
		this.repository = repository;
	}
	
	/**
	 * home window with selection of the query
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(final Model model) {
		
		// list for all queries
		List<Query> queries = repository.findAll();
		model.addAttribute("queryList", queries);
		
		// lists for filter
		model.addAttribute("bereicheList", ListUtil.getSortedAndDistinctLists(queries, "bereich"));
		model.addAttribute("erstelltList", ListUtil.getSortedAndDistinctLists(queries, "erstellt"));
		
		return "home";
	}
	
	/**
	 * invoked when a query was selected in the home view
	 * @param model
	 * @param awid
	 * @return
	 */
	@RequestMapping(value = "/query_selected/{awid}", method = RequestMethod.GET)
	public String querySelected(@PathVariable(value="awid") final int awid, final Model model) {
		
		// get the selected query
		Query query = repository.findOneById(awid);
		
		// get all bound variables
		List<String> boundVars = BoundVarFilter.getBoundVariables(query.getSql());
		
		// put objects into the model for usage in JSP
		model.addAttribute("boundVariables", boundVars);
		model.addAttribute("query", query);
		
		return "parameter_selection";
	}
}
