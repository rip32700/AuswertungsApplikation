package com.phoebus.abfragen.repository;

public interface BoundVariableRepository {

	String getTypeByName(final String name);
	String getBezeichnungByName(final String name);
}
