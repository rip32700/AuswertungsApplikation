package com.phoebus.abfragen.web;

import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractController;

import com.phoebus.abfragen.persistence.QueryRepository;

@Controller
public class QueryProcessController extends AbstractController{

	private QueryRepository repository;

	@Inject
	public QueryProcessController(final QueryRepository queryRepository) {
		this.repository = queryRepository;
	}
	
	@Override
	@RequestMapping(value="/process")
	protected ModelAndView handleRequestInternal(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ExecutorService executorService = Executors.newSingleThreadExecutor();
		Future<String> queryTask = executorService.submit( () -> {
			return processQuery();
		});
		
		ModelAndView model;
		if(queryTask.isDone()) 
			model = new ModelAndView("result", "report", queryTask.get());
		else 
			model = new ModelAndView("processing");

		return model;
	}

	protected String processQuery() throws InterruptedException {
		
		String sql = "";
		
		/*...*/
		
		return null;
	}

}
