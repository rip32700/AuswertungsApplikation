package com.phoebus.abfragen.domain;

import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotEmpty;

public class Query {

	@NotNull @NotEmpty
	private String awid;
	@NotNull @NotEmpty
	private String text;
	@NotNull @NotEmpty
	private String art;
	@NotNull @NotEmpty
	private String benutzer;
	@NotNull @NotEmpty
	private String erstellt;
	@NotNull @NotEmpty
	private String bereich;
	@NotNull @NotEmpty
	private String sql;
	@NotNull @NotEmpty
	private String beschreibung;
	
	public Query() {
	}
	
	// without 'beschreibung'
	public Query(String awid, String text, String art, String benutzer, String erstellt, String bereich, String sql) {
		super();
		this.awid = awid;
		this.text = text;
		this.art = art;
		this.benutzer = benutzer;
		this.erstellt = erstellt;
		this.bereich = bereich;
		this.sql = sql;
	}
	
	// with 'beschreibung' for insertion
	public Query(String awid, String text, String beschreibung, String art, String benutzer, String erstellt, String bereich, String sql) {
		super();
		this.awid = awid;
		this.text = text;
		this.beschreibung = beschreibung;
		this.art = art;
		this.benutzer = benutzer;
		this.erstellt = erstellt;
		this.bereich = bereich;
		this.sql = sql;
	}
	
	public String getAwid() {
		return awid;
	}
	public void setAwid(String awid) {
		this.awid = awid;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public String getArt() {
		return art;
	}
	public void setArt(String art) {
		this.art = art;
	}
	public String getBenutzer() {
		return benutzer;
	}
	public void setBenutzer(String benutzer) {
		this.benutzer = benutzer;
	}
	public String getErstellt() {
		return erstellt;
	}
	public void setErstellt(String erstellt) {
		this.erstellt = erstellt;
	}
	public String getBereich() {
		return bereich;
	}
	public void setBereich(String bereich) {
		this.bereich = bereich;
	}
	public String getSql() {
		return sql;
	}
	public void setSql(String sql) {
		this.sql = sql;
	}
	public String getBeschreibung() {
		return beschreibung;
	}
	public void setBeschreibung(String beschreibung) {
		this.beschreibung = beschreibung;
	}

	@Override
	public String toString() {
		return "Query [awid=" + awid + ", text=" + text + ", art=" + art + ", benutzer=" + benutzer + ", erstellt="
				+ erstellt + ", bereich=" + bereich + ", sql=" + sql + "]";
	}
	
}
