package com.phoebus.abfragen.utils;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import com.phoebus.abfragen.model.Query;

public class ListUtil {

	/**
	 * create list of given attribute from entire list
	 * and remove duplicates as well as sort the new list
	 * @param queries
	 * @param attribut
	 * @return
	 */
	public static List<String> getSortedAndDistinctLists(List<Query> queries, String attribut) {
		
		List<String> resultList = new ArrayList<>();
		String tmp = "";
		
		for(Query query : queries) {
			
			//filter desired attribute
			if("bereich".equals(attribut)) {
				tmp = query.getBereich();
			} else if("erstellt".equals(attribut)) {
				tmp = query.getErstellt();
			}
			
			//check for duplicates
			if(!resultList.contains(tmp)) {
				resultList.add(tmp);
			}
		}
		
		Collections.sort(resultList);
		
		return resultList;
	}
	
}
