package com.phoebus.abfragen.utils;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

public class BoundVarFilter {
	
	public static List<String> getBoundVariables(final String stmt) {
		List<String> boundVars = Arrays.asList(stmt.split(" "));
		boundVars = boundVars.stream().filter(s -> s.startsWith(":")).collect(Collectors.toList());
		return boundVars;
	}
	
}
