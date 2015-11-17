package com.phoebus.abfragen.model;

public class Query {

	private String awid;
	private String text;
	private String art;
	private String benutzer;
	private String erstellt;
	private String bereich;
	
	public Query(String awid, String text, String art, String benutzer, String erstellt, String bereich) {
		super();
		this.awid = awid;
		this.text = text;
		this.art = art;
		this.benutzer = benutzer;
		this.erstellt = erstellt;
		this.bereich = bereich;
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

	@Override
	public String toString() {
		return "Query [awid=" + awid + ", text=" + text + ", art=" + art + ", benutzer=" + benutzer + ", erstellt="
				+ erstellt + ", bereich=" + bereich + "]";
	}
}
