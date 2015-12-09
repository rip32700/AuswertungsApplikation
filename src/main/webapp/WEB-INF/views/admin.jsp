<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>

<div class="starter-template">
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
								<td><form:input  id="awid" path="awid"/></td>
							</tr>
							<tr>
								<td>Titel:</td>
								<td><form:input  id="text" path="text"/></td>
							</tr>
							
							<tr>
								<td>Art:</td>
								<td><form:input  id="art" path="art"/></td>
							</tr>
							<tr>
								<td>Bereich:</td>
								<td><form:input  id="bereich" path="bereich"/></td>
							</tr>
							<tr>
								<td>SQL Befehl:</td>
								<td><form:input  id="sql" path="sql"/></td>
							</tr>
							<!-- 
								<tr>
									<td><form:errors path="*" /></td>
								</tr>
							 -->
				</table>
				<button type="submit" class="btn btn-primary btn-lg">Weiter</button>
		  </form:form>
	</div>
</div>