package com.phoebus.abfragen.domain;

import java.util.List;

public class BoundVariablesWrapper {

	private int awid;
	
	private List<BoundVariable> variableList;

	public int getAwid() {
		return awid;
	}
	
	public void setAwid(int awid) {
		this.awid = awid;
	}
	
	public List<BoundVariable> getVariableList() {
		return variableList;
	}

	public void setVariableList(List<BoundVariable> variableList) {
		this.variableList = variableList;
	}
	
}
