package com.phoebus.abfragen.persistence;

import java.util.List;

import com.phoebus.abfragen.model.Query;

public interface QueryRepository {

	final static String FIND_ALL_QUERIES = "SELECT AW_AWID, AW_TEXT, AW_ART, AW_BENUTZER, AW_ERSTELLT, AW_BEREICH " + 
										   "FROM ausw_auswertungen a WHERE a.aw_regelmaessig = 'J'";
	
	final static String FIND_ONE_QUERY = "SELECT * FROM ausw_auswertungen a WHERE a.AW_AWID = ?";
	
	List<Query> findAll();
	Query findOneById(final int id);
	
}
