package com.phoebus.abfragen.repository;

import java.util.List;

import com.phoebus.abfragen.domain.Query;

public interface QueryRepository {
	
	List<Query> findAll();
	Query findOneById(final long queryId);
	void insertQuery(final Query query);
	List<List<String>> executeQuery(final String sql);
}
