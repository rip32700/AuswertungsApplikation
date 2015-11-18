package com.phoebus.abfragen.persistence;

import java.util.Arrays;
import java.util.List;
import java.util.concurrent.Future;

import javax.inject.Inject;

import org.springframework.jdbc.core.JdbcOperations;
import org.springframework.scheduling.annotation.Async;
import org.springframework.scheduling.annotation.AsyncResult;

import com.phoebus.abfragen.model.Query;

public class QueryRepositoryImpl implements QueryRepository {

	private final static String FIND_ALL_QUERIES = "SELECT AW_AWID, AW_TEXT, AW_ART, AW_BENUTZER, AW_ERSTELLT, AW_BEREICH, AW_SQL " + 
			   									   "FROM ausw_auswertungen a WHERE a.aw_regelmaessig = 'J'";

	private final static String FIND_ONE_QUERY = "SELECT * FROM ausw_auswertungen a WHERE a.AW_AWID = ?";

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
	public Query findOneById(final int id) {
		return jdbcOperations.queryForObject(FIND_ONE_QUERY, (rs, rowNum) -> {
			return new Query(rs.getString("AW_AWID"), "", "", "", "", "", rs.getString("AW_SQL"));
		}, id);
	}

	
//	@Override
//	@Async
//	public Future<List<Object>> executeQuery(String sql) {
//		
//		List<Object> results = jdbcOperations.query(sql, (rs, rowNum) -> {
//			return Arrays.asList(rs.getString("AWID"));
//		});
//		
//		try {
//			Thread.sleep(10000);
//		} catch (InterruptedException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		
//		return new AsyncResult<List<Object>>(results);
//	}

}
