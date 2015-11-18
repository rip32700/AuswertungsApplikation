package com.phoebus.abfragen.model;

public class BoundedQuery {

	private String boundedVariable;

	public BoundedQuery(String boundedVariable) {
		super();
		this.boundedVariable = boundedVariable;
	}

	public String getBoundedVariable() {
		return boundedVariable;
	}

	public void setBoundedVariable(String boundedVariable) {
		this.boundedVariable = boundedVariable;
	}

	@Override
	public String toString() {
		return "BoundedQuery [boundedVariable=" + boundedVariable + "]";
	}
	
}
