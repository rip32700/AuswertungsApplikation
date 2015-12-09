package com.phoebus.abfragen.repository;

import javax.inject.Inject;

import org.springframework.jdbc.core.JdbcOperations;

public class BoundVariableRepositoryImpl implements BoundVariableRepository {

	private final static String GET_TYPE_BY_NAME = "SELECT AU_TYP FROM AU_PARAMETER WHERE AU_PARAMNAME = ?";
	private final static String GET_BEZEICHNUNG_BY_NAME = "SELECT AU_BEZEICHNUNG FROM AU_PARAMETER WHERE AU_PARAMNAME = ?";

	
	private JdbcOperations jdbcOperations;
	
	@Inject
	public BoundVariableRepositoryImpl(JdbcOperations jdbcOperations) {
		this.jdbcOperations = jdbcOperations;
	}

	@Override
	public String getTypeByName(String name) {
		return jdbcOperations.queryForObject(GET_TYPE_BY_NAME, (rs, rowNum) -> {
			return new String(rs.getString("AU_TYP"));
		}, name);
	}

	@Override
	public String getBezeichnungByName(String name) {
		return jdbcOperations.queryForObject(GET_BEZEICHNUNG_BY_NAME, (rs, rowNum) -> {
			return new String(rs.getString("AU_BEZEICHNUNG"));
		}, name);
	}
	
}
