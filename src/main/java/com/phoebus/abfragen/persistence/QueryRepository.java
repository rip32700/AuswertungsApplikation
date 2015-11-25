package com.phoebus.abfragen.persistence;

import java.util.List;
import java.util.concurrent.Future;

import com.phoebus.abfragen.model.Query;

public interface QueryRepository {
	
	List<Query> findAll();
	Query findOneById(final long queryId);
	void insertQuery(final Query query);
}
