package com.phoebus.abfragen.web;

import javax.inject.Inject;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.phoebus.abfragen.model.BoundVariablesWrapper;
import com.phoebus.abfragen.model.Query;
import com.phoebus.abfragen.persistence.QueryRepository;
import com.phoebus.abfragen.utils.BoundVariableUtil;
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
    public String processQuery(@DestinationVariable final String queryId, final String jsonString) throws InterruptedException, ParseException {
    	
		//parse JSON object
    	JSONObject jsonObject = (JSONObject) new JSONParser().parse(jsonString);
    	String finalSql = (String) jsonObject.get("sql");
		
    	//execute the final SQL statement and send result to view
    	String result = "<result>";
    	
    	// simulated delay
        Thread.sleep(2000); 
        
        return result;
    }
	
	@RequestMapping(value = "/downloadExcel", method = RequestMethod.GET)
    public ModelAndView downloadExcel() {
		return new ModelAndView(new ExcelReportView(), "queryList", repository.findAll());
    }
	
	@RequestMapping(value="/parameter_selected")
	public String processing(@ModelAttribute("boundVariablesWrapper") final BoundVariablesWrapper boundVariablesWrapper, final Model model) {
		
		//get the query and build up correct sql stmt
		Query query = repository.findOneById(boundVariablesWrapper.getAwid());
		query.setSql(BoundVariableUtil.resolvePreparedStatement(query.getSql(), boundVariablesWrapper.getVariableList()));
		
		// put ready-to-use query query into the model for usage in JSP
		model.addAttribute("query", query);
		
		return "processing";
	}
}
