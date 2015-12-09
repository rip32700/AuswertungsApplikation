package com.phoebus.abfragen.domain;

public class ResultObject {

	private int awid;
	private String columns;
	private String rows;
	
	public int getAwid() {
		return awid;
	}
	public void setAwid(int awid) {
		this.awid = awid;
	}
	public String getColumns() {
		return columns;
	}
	public void setColumns(String columns) {
		this.columns = columns;
	}
	public String getRows() {
		return rows;
	}
	public void setRows(String rows) {
		this.rows = rows;
	}
	
	@Override
	public String toString() {
		return "ResultObject [awid=" + awid + ", columns=" + columns + ", rows=" + rows + "]";
	}
	
}
