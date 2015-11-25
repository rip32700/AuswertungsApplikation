package com.phoebus.abfragen.utils;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

import com.phoebus.abfragen.model.BoundVariable;

public class BoundVariableUtil {

	public static List<BoundVariable> getBoundVariables(final String stmt) {
		List<String> boundVars = Arrays.asList(stmt.split(" "));
		boundVars = boundVars.stream().filter(s -> s.startsWith(":")).map(s -> s.substring(1)).distinct().collect(Collectors.toList());
		
		List<BoundVariable> returnList = new ArrayList<>();
		for(String var : boundVars) {
			returnList.add(new BoundVariable(var, ""));
		}
		
		return returnList;
	}

	public static String resolvePreparedStatement(String sql, List<BoundVariable> variableList) {

		//strip new line for javascript
		sql = sql.replace("\n", " ");
		return sql;
	}
	
	
}
