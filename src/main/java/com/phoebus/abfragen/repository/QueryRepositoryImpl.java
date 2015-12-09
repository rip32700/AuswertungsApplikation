package com.phoebus.abfragen.repository;

import java.sql.ResultSetMetaData;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.jdbc.core.JdbcOperations;

import com.phoebus.abfragen.domain.Query;

public class QueryRepositoryImpl implements QueryRepository {

	private final static String FIND_ALL_QUERIES = "SELECT AW_AWID, AW_TEXT, AW_ART, AW_BENUTZER, AW_ERSTELLT, AW_BEREICH, AW_SQL " + 
			   									   "FROM ausw_auswertungen a WHERE a.aw_regelmaessig = 'J'"; // restrict for logged in user

	private final static String FIND_ONE_QUERY = "SELECT * FROM ausw_auswertungen a WHERE a.AW_AWID = ?";
	
	private final static String INSERT_QUERY = "";

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
					rs.getString("AW_BEREICH"),
					rs.getString("AW_SQL")
					);
		});
	}
	
	@Override
	public Query findOneById(final long id) {
		return jdbcOperations.queryForObject(FIND_ONE_QUERY, (rs, rowNum) -> {
			return new Query(rs.getString("AW_AWID"), rs.getString("AW_TEXT"), rs.getString("AW_ART"), 
							 rs.getString("AW_BENUTZER"), rs.getString("AW_ERSTELLT"), rs.getString("AW_BEREICH"), 
							 rs.getString("AW_SQL"));
		}, id);
	}

	@Override
	public void insertQuery(final Query query) {
		jdbcOperations.update(INSERT_QUERY);
	}

	@Override
	public List<List<String>> executeQuery(final String sql) {
		
		List<List<String>> resultList = new ArrayList<List<String>>();
		
		final List<String> columnNames = new ArrayList<>();
		List<String> rows = new ArrayList<>();
		
		// fetch rows from the database
		rows = jdbcOperations.query(sql, (rs, rowNum) -> {
			
			// get all column names (just once, if it is empty)
			if(columnNames.isEmpty()) {
				ResultSetMetaData rsmd = rs.getMetaData();
				for(int i = 1; i < rsmd.getColumnCount(); i++) {
					columnNames.add(rsmd.getColumnName(i));
				}
			}
			
			// create result string (concatenation of all column values)
			String result = "";
			for(String column : columnNames) {
				result += rs.getString(column) + "#";
			}
			
			// add delimiter for splitting in javascript later on
			result += ";";
			
			return result ;
		});
		
		resultList.add(columnNames);
		resultList.add(rows);
		return resultList;
	}
	
}
