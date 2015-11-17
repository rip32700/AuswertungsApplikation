package com.phoebus.abfragen.persistence;

import java.util.List;

import javax.inject.Inject;

import org.springframework.jdbc.core.JdbcOperations;

import com.phoebus.abfragen.model.Query;

public class QueryRepositoryImpl implements QueryRepository {

	private JdbcOperations jdbcOperations;
	
	@Inject
	public QueryRepositoryImpl(JdbcOperations jdbcOperations) {
		this.jdbcOperations = jdbcOperations;
	}
	
	@Override
	public List<Query> findAll() {
		return jdbcOperations.query(FIND_ALL_QUERIES, (rs, rowNum) -> {
			return new Query(
					rs.getString("AW_AWID"),
					rs.getString("AW_TEXT"),
					rs.getString("AW_ART"),
					rs.getString("AW_BENUTZER"),
					rs.getString("AW_ERSTELLT"),
					rs.getString("AW_BEREICH")
					);
		});
	}
	
	@Override
	public Query findOneById(final int id) {
		return jdbcOperations.queryForObject(FIND_ONE_QUERY, (rs, rowNum) -> {
			return new Query(rs.getString("AW_AWID"), rs.getString("AW_SQL"), "", "", "", "");
		}, id);
	}

}
