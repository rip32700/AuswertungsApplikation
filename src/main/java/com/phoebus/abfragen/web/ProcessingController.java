package com.phoebus.abfragen.web;

import java.util.List;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ConcurrentMap;

import javax.inject.Inject;
import javax.validation.Valid;

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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.phoebus.abfragen.domain.BoundVariablesWrapper;
import com.phoebus.abfragen.domain.Query;
import com.phoebus.abfragen.domain.ResultObject;
import com.phoebus.abfragen.repository.QueryRepository;
import com.phoebus.abfragen.utils.BoundVariableUtil;
import com.phoebus.abfragen.utils.ExcelReportView;

@Controller
public class ProcessingController {

	private QueryRepository repository;
	
	private ConcurrentMap<Integer, String> awidToSqlMap = new ConcurrentHashMap<Integer, String>();
	
	@Inject
	public ProcessingController(final QueryRepository repository) {
		this.repository = repository;
	}
	
	@MessageMapping("/query/{queryId}")
    @SendTo("/topic/query/{queryId}")
    public List<List<String>> processQuery(@DestinationVariable final String queryId, final String jsonString) throws InterruptedException, ParseException {
    	
		//parse JSON object
    	//JSONObject jsonObject = (JSONObject) new JSONParser().parse(jsonString);
    	
    	//execute the final SQL statement and send result to view
		String sqlStmt = awidToSqlMap.get(Integer.parseInt(queryId));
		List<List<String>> results = repository.executeQuery(sqlStmt);
		
    	// simulated delay
        Thread.sleep(4000); 
        
        return results;
    }
	
	@RequestMapping(value = "/exportResultAsExcel", method = RequestMethod.POST)
    public ModelAndView downloadExcel(@ModelAttribute("resultObject") final ResultObject resultObject, final Model model) {
		model.addAttribute("resultObject", resultObject);
		model.addAttribute("queryTitle", repository.findOneById(resultObject.getAwid()).getText());
		return new ModelAndView(new ExcelReportView(), "model", model);
    }
	
	@RequestMapping(value="/parameter_selected")
	public String processing(@Valid @ModelAttribute("boundVariablesWrapper") final BoundVariablesWrapper boundVariablesWrapper, final Model model, final RedirectAttributes redirectAttributes) {
		
		/* 
		 * form input validation
		 * if parameters for query available, validate them
		 * if validation fails, redirect 
		 */
		if(boundVariablesWrapper.getVariableList() != null && !boundVariablesWrapper.getVariableList().isEmpty()) {
			List<String> invalidVars = BoundVariableUtil.validateFormInput(boundVariablesWrapper);
			//check for invalid input
			if(!invalidVars.isEmpty()) {
				 redirectAttributes.addFlashAttribute("boundVariablesWrapper", boundVariablesWrapper);
				 redirectAttributes.addFlashAttribute("errorMessage", buildErrorMessageForParameterForm(invalidVars));
				 return "redirect://query_selected/" + boundVariablesWrapper.getAwid();
			}
		}
		
		//get the query and build up correct sql stmt that is saved in the query map
		Query query = repository.findOneById(boundVariablesWrapper.getAwid());
		awidToSqlMap.put(boundVariablesWrapper.getAwid(), BoundVariableUtil.resolvePreparedStatement(query.getSql(), boundVariablesWrapper.getVariableList()));
		
		// put ready-to-use query query into the model for usage in JSP
		model.addAttribute("query", query);
		
		// put empty result object into model to be filled
		model.addAttribute("resultObject", new ResultObject());
		
		return "processing";
	}
	
	private String buildErrorMessageForParameterForm(List<String> invalidParamters) {
		
		// build error message
		 String errorMessage = "Die Eingaben der Paramter ";
		 int i = 1;
		 for (String var : invalidParamters) {
			 if(i == invalidParamters.size())
				 errorMessage += var;
			 else
				 errorMessage += var + ", ";
			 i++;
		 }
		 errorMessage += " ist fehlerhaft.\nBitte uerberpruefen Sie Ihre Eingaben.";
		 
		 return errorMessage;
	}
}
