package com.phoebus.abfragen.utils;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

import com.phoebus.abfragen.domain.BoundVariable;
import com.phoebus.abfragen.domain.BoundVariablesWrapper;

public class BoundVariableUtil {

	public static List<BoundVariable> getBoundVariables(final String stmt) {
		List<String> boundVars = Arrays.asList(stmt.split(" "));
		boundVars = boundVars.stream().filter(s -> s.startsWith(":")).map(s -> s.substring(1).trim()).distinct().collect(Collectors.toList());
		
		List<BoundVariable> returnList = new ArrayList<>();
		for(String var : boundVars) {
			returnList.add(new BoundVariable(var, "Mandaten-Nummer", null, "Text"));
			//returnList.add(new BoundVariable(var, repository.getBezeichnungByName(var), null, repository.getTypeByName(var)));
		}
		
		return returnList;
	}

	public static String resolvePreparedStatement(String sql, List<BoundVariable> variableList) {

		//resolve bound variables
		if(variableList != null && !variableList.isEmpty()) {
			for(BoundVariable var : variableList) {
				if("Text".equals(var.getType())) {
					sql = sql.replace(":" + var.getName(), "'" + var.getValue() + "'");
				} else if("Zahl".equals(var.getType())) {
					sql = sql.replace(":" + var.getName(), "'" + var.getValue() + "'");
				}
			}
		}
		
		return sql;
	}
	
	public static List<String> validateFormInput(BoundVariablesWrapper boundVariablesWrapper) {
		
		List<String> list = new ArrayList<>();
		
		for(BoundVariable var : boundVariablesWrapper.getVariableList()) {
			if (var.getValue() == null || var.getValue().isEmpty() || /*for testing*/ "test".equals(var.getValue())) {
				list.add(var.getBezeichnung());
			}
		}
		
		return list;
	}
	
}
