package com.phoebus.abfragen.web;


import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.RequestContextUtils;

import com.phoebus.abfragen.domain.Query;
import com.phoebus.abfragen.repository.QueryRepository;
import com.phoebus.abfragen.utils.ValidationUtil;

@Controller
public class AdminController {

	private QueryRepository repository;
	
	@Inject
	public AdminController(final QueryRepository repository) {
		this.repository = repository;
	}
	
	@RequestMapping(value="/admin")
	public String admin(final Model model, final HttpServletRequest request) {
		SimpleDateFormat sdf = new SimpleDateFormat("dd.MM.yyyy");
		
		// if redirected 
		Map<String, ?> inputFlashmap = RequestContextUtils.getInputFlashMap(request);
		if(inputFlashmap != null) {
			model.addAttribute("query", (Query) inputFlashmap.get("query"));
			model.addAttribute("errorMessage", (String) inputFlashmap.get("errorMessage"));
			model.addAttribute("showErrorMessage", true);
		} else {
			//original request (not redirected)
			model.addAttribute("query", new Query());
			model.addAttribute("showErrorMessage", false);
		}
		
		model.addAttribute("currentDate", sdf.format(Calendar.getInstance().getTime()));
		model.addAttribute("queryAdded", false);
		
		return "admin";
	}
	
	@RequestMapping(value="/admin/new_query")
	public String newQuery(final Query query, final Model model, final RedirectAttributes redirectAttributes) {
		
		List<String> invalidInputFields = ValidationUtil.validateQuery(query);
		if(!invalidInputFields.isEmpty()) {
			//validation failed
			redirectAttributes.addFlashAttribute("query", query);
			redirectAttributes.addFlashAttribute("errorMessage", ValidationUtil.buildErrorMessageForInvalidFormFields(invalidInputFields));
			return "redirect:/admin/";
		}
		
		// insert new query into database
		repository.insertQuery(query);
		
		model.addAttribute("queryAdded", true);
		return "admin";
	}

}
