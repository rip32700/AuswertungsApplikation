package com.phoebus.abfragen.service;

//import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

public class BoundVarFilter {

	
	/*
	 * col: AW_SQL
	 * "SELECT a.an_antragsnr, a.an_produktkz, a.an_zahlbeitrag FROM antraege a " + 
										"WHERE a.an_persnr = :personennummer AND a.an_beginn = :beginn AND a.an_stoergrundkz " + 
				                        "= :status AND a.an_teilantragsnr = 0;
				                        
				                        List<String> sanitized = new ArrayList<>();
		for(String var : boundVars) {
			sanitized.add(var.substring(1, var.length()));
		}
	 * 
	 */
	
	public static List<String> getBoundVariables(final String stmt) {
		List<String> boundVars = Arrays.asList(stmt.split(" "));
		boundVars = boundVars.stream().filter(s -> s.startsWith(":")).collect(Collectors.toList());
		return boundVars;
	}
	
}
