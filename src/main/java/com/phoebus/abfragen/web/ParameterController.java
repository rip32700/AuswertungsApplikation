package com.phoebus.abfragen.web;

import java.util.List;
import java.util.concurrent.Callable;

import javax.inject.Inject;

import org.springframework.core.task.TaskExecutor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.phoebus.abfragen.model.BoundedQuery;
import com.phoebus.abfragen.model.Query;
import com.phoebus.abfragen.persistence.QueryRepository;
import com.phoebus.abfragen.service.BoundVarFilter;

@Controller
public class ParameterController {

	private QueryRepository repository;
	//private TaskExecutor taskExecutor;

	@Inject
	public ParameterController(QueryRepository repository /*, TaskExecutor taskExecutor*/) {
		this.repository = repository;
		//this.taskExecutor = taskExecutor;
	}
	
	@RequestMapping(value = "/parameter_selected", method = RequestMethod.POST)
	public String paramterSelected(/*@ModelAttribute("boundedQuery") BoundedQuery boundedQuery, */ final Model model) {
		
		//for testing
		int awid = 7;
		Query query = repository.findOneById(awid);
		System.out.println(awid);
		System.out.println(query.getSql());
		
		/*
		taskExecutor.execute(new Runnable() {
			
			@Override
			public void run() {
				repository.executeQuery(query.getSql());
			}
		});
		*/
		
		
		return "processing";
	}
	
	@RequestMapping(value = "/query_selected/{awid}", method = RequestMethod.GET)
	public String querySelected(final Model model, @PathVariable(value="awid") final int awid) {
		
		Query query = repository.findOneById(awid);
		String sql = query.getSql();
		List<String> boundVars = BoundVarFilter.getBoundVariables(sql);
		model.addAttribute("boundVariables", boundVars);
		model.addAttribute("query", query);
		
		// to be filled by jsp
		//model.addAttribute(new BoundedQuery(""));
		
		return "parameter_selection";
	}
}



/*
 * 
 for jsp:
 
 
		<!-- 
		<form:form method="post" action="<c:url value="/parameter_selected" />" commandName="boundedQuery">
		<table class="table">
			<c:forEach items="${boundVariables}" var="boundVar">
				
				<div class="form-group form-inline">
					<tr>
						<td><label for="<c:out value='${boundVar}'/>"><c:out value='${boundVar}'/></label></td>
						<td><form:input type="text" class="form-control" path="boundedVariable"/></td>
					</tr>
				</div>
			</c:forEach>
		</table>
</div>

	<input type="submit"   value="Weiter"/>
</form:form>

 -->
 * 
 */
