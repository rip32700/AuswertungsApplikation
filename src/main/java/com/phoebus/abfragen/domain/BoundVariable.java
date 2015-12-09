package com.phoebus.abfragen.domain;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotEmpty;

public class BoundVariable {

	private String name;
	private String bezeichnung;
	@NotNull
	@Size(min=1)
	@NotEmpty(message = "Bitte geben Sie diesen Paramter ein.")
	private String value;
	private String type;
	
	public BoundVariable() {
		
	}
	public BoundVariable(String name, String bezeichnung, String value, String type) {
		this.name = name;
		this.bezeichnung = bezeichnung;
		this.value = value;
		this.type = type;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getValue() {
		return value;
	}
	public void setValue(String value) {
		this.value = value;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getBezeichnung() {
		return bezeichnung;
	}
	public void setBezeichnung(String bezeichnung) {
		this.bezeichnung = bezeichnung;
	}

	@Override
	public String toString() {
		return "BoundVariable [name=" + name + ", bezeichnung=" + bezeichnung + ", value=" + value + ", type=" + type + "]";
	}
	
}
