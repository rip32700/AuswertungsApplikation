<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ page session="false" %>

<div class="starter-template">
 	
	<c:choose>
		<c:when test="${!queryAdded}">
		<div class="r">
	      <p class="text-center heading-text">
	      	Dies ist die Admin Seite. Auf dieser koennen Sie neue Auswertungen hinzufuegen.
	      </p>
		</div>
	 	<br>
	 	
	 	 <c:if test="${showErrorMessage}">
	 	 	<div class="text-center">
			  	<h4><span class="label label-danger"><c:out value="${errorMessage}"/></span></h4>
			</div>
			<br/>
			<br/>
		</c:if>
		
		<div class="col-md-8 col-md-offset-2">
		<div class="panel panel-default">
			  <!-- Default panel contents -->
			  <div class="panel-heading">Neue Auswertung</div>
			  <div class="panel-body">
					Bitte geben Sie im Folgendem alle Informationen ein, um eine neue Auswertung anzulegen.
			  </div>
			  <br/>
			  
			  <form:form action="/abfragen/admin/new_query" method="post" modelAttribute="query" onsubmit="return validateForm()" name="new_query_form">
				  	<table class="table">
								<tr>
									<td>Auswertungs ID:</td>
									<td><form:input  size="35" id="awid" path="awid" value="${query.awid}"/></td>
								</tr>
								<tr>
									<td>Titel:</td>
									<td><form:input  size="35" id="text" path="text" value="${query.text}"/></td>
								</tr>
								<tr>
									<td>Beschreibung:</td>
									<td><form:textarea style="resize:none" row="5" cols="32" path="beschreibung" value="${query.beschreibung}"/></td>
								</tr>
								<tr>
									<td>Art:</td>
									<td><form:input  size="35" id="art" path="art" value="${query.art}"/></td>
								</tr>
								<tr >
									<td>Bereich:</td>
									<td><form:input  size="35" id="bereich" path="bereich" value="${query.bereich}"/></td>
								</tr>
								<tr>
									<td>SQL Befehl:</td>
									<td><form:input  size="35" id="sql" path="sql" value="${query.sql}"/></td>
								</tr>
								
								<security:authentication property="principal.username" var="loginName"/>
								
								<form:input type="hidden" path="erstellt" value="${currentDate}"/>
								<form:input type="hidden" path="benutzer" value="${loginName}"/>
					</table>
					</div>
					<button type="submit" class="btn btn-primary btn-lg">Weiter</button>
			  </form:form>
		</div>
		</c:when>
		<c:otherwise>
			<div class="r">
		      <p class="text-center heading-text">
		      	Die neue Auswertung wurde erfolgreich hinzugefuegt.
		      </p>
		      <br/>
		      <div class="col-md-offset-5">
			      <form action="/abfragen">
			      	<button type="submit" class="btn btn-primary btn-lg">Zurueck zur Uebersicht</button>
			      </form>
		      </div>
			</div>
		 	<br>
		</c:otherwise>
		</c:choose>
		
	
	
	
	
	
</div>