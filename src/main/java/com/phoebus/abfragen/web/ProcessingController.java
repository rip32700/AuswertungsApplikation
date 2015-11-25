package com.phoebus.abfragen.web;

import javax.inject.Inject;

import org.json.simple.parser.ParseException;
import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.phoebus.abfragen.model.Query;
import com.phoebus.abfragen.persistence.QueryRepository;
import com.phoebus.abfragen.utils.ExcelReportView;

@Controller
public class ProcessingController {

	private QueryRepository repository;
	
	@Inject
	public ProcessingController(final QueryRepository repository) {
		this.repository = repository;
	}
	
	@MessageMapping("/query/{queryId}")
    @SendTo("/topic/query/{queryId}")
    public Query processQuery(@DestinationVariable final String queryId) throws InterruptedException, ParseException {
    	
    	//get the query
    	Query query = repository.findOneById(Long.parseLong(queryId));
    	
    	// simulated delay
        Thread.sleep(7000); 
        
        return query;
    }
	
	@RequestMapping(value = "/downloadExcel", method = RequestMethod.GET)
    public ModelAndView downloadExcel() {
		return new ModelAndView(new ExcelReportView(), "queryList", repository.findAll());
    }
	
}
