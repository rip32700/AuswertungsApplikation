package com.phoebus.abfragen.utils;

import java.util.ArrayList;
import java.util.List;

import com.phoebus.abfragen.domain.BoundVariable;
import com.phoebus.abfragen.domain.BoundVariablesWrapper;
import com.phoebus.abfragen.domain.Query;

public class ValidationUtil {

	public static List<String> validateQuery(final Query query) {
		List<String> invalidInputFields = new ArrayList<>();
		
		if(!(query.getAwid() != null && !query.getAwid().isEmpty() && query.getAwid().matches("\\d+"))) {
			invalidInputFields.add("Auswertungs ID");
		} 
		if (!(query.getText() != null && !query.getText().isEmpty())) {
			invalidInputFields.add("Titel");
		}
		if (!(query.getBeschreibung() != null && !query.getBeschreibung().isEmpty())) {
			invalidInputFields.add("Beschreibung");
		}
		if (!(query.getArt() != null && !query.getArt().isEmpty())) {
			invalidInputFields.add("Art");
		}
		if (!(query.getBereich() != null && !query.getSql().isEmpty())) {
			invalidInputFields.add("Bereich");
		}
		if (!(query.getSql() != null && !query.getSql().isEmpty())) {
			invalidInputFields.add("SQL Befehl");
		} 

		return invalidInputFields;
	}
	
	public static List<String> validateBoundVariables(final BoundVariablesWrapper boundVariablesWrapper) {
		
		List<String> list = new ArrayList<>();
		
		for(BoundVariable var : boundVariablesWrapper.getVariableList()) {
			if (var.getValue() == null || var.getValue().isEmpty() || /*for testing*/ "test".equals(var.getValue())) {
				list.add(var.getBezeichnung());
			}
		}
		
		return list;
	}
	
	public static String buildErrorMessageForInvalidFormFields(final List<String> invalidInputFields) {
		
		 // build error message
		 String errorMessage = "Die Eingaben ";
		 if(invalidInputFields.size() == 1) 
			 errorMessage += "des Feldes ";
		 else
			 errorMessage += "der Felder ";
		 
		 int i = 1;
		 for (String var : invalidInputFields) {
			 if(i == invalidInputFields.size())
				 errorMessage += var;
			 else
				 errorMessage += var + ", ";
			 i++;
		 }
		 errorMessage += " ist fehlerhaft.\nBitte uerberpruefen Sie Ihre Eingaben.";
		 
		 return errorMessage;
	}
	
}
