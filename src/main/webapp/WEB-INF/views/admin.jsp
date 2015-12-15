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
	 	
 	 	<div class="text-center">
 	 		<c:choose>
 	 			<c:when test="${showErrorMessage}">
 	 				<h4><span id='errorMsg' class="label label-danger"><c:out value="${errorMessage}"/></span></h4>
 	 			</c:when>
 	 			<c:otherwise>
 	 				<h4><span id='errorMsg' class="label label-danger"></span></h4>
 	 			</c:otherwise>
 	 		</c:choose>
		</div>
		<br/>
		<br/>
		
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
									<td><form:input  size="35" id="awid" path="awid" value="${query.awid}" /></td>
									<td><div id="awidError" style="color:red;"></div></td>
								</tr>
								<tr>
									<td>Titel:</td>
									<td><form:input  size="35" id="text" path="text" value="${query.text}"/></td>
									<td><div id="textError" style="color:red;"></div></td>
								</tr>
								<tr>
									<td>Beschreibung:</td>
									<td><form:textarea style="resize:none" id="beschreibung" row="5" cols="32" path="beschreibung" value="${query.beschreibung}"/></td>
									<td><div id="beschreibungError" style="color:red;"></div></td>
								</tr>
								<tr>
									<td>Art:</td>
									<td><form:input  size="35" id="art" path="art" value="${query.art}"/></td>
									<td><div id="artError" style="color:red;"></div></td>
								</tr>
								<tr >
									<td>Bereich:</td>
									<td><form:input  size="35" id="bereich" path="bereich" value="${query.bereich}"/></td>
									<td><div id="bereichError" style="color:red;"></div></td>
								</tr>
								<tr>
									<td>SQL Befehl:</td>
									<td><form:textarea style="resize:none" id="sql" row="5" cols="32" path="sql" value="${query.sql}" /></td>
									<td><div id="sqlError" style="color:red;"></div></td>
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

<script type="text/javascript">
	function validateForm() {
		
		var failed = false;

		if(!validateElement('awid', 'Bitte geben Sie eine Auswertungs ID ein.')) 
			failed = true;
		if(!validateElement('text', 'Bitte geben Sie einen Titel ein.'))
			failed = true;	
		if(!validateElement('beschreibung', 'Bitte geben Sie eine Beschreibung ein.'))
			failed = true;
		if(!validateElement('art', 'Bitte geben Sie die Art der Auswertung ein.'))
			failed = true;
		if(!validateElement('bereich', 'Bitte geben Sie den Bereich ein.'))
			failed = true;
		if(!validateElement('sql', 'Bitte geben Sie einen SQL Befehl ein.'))
			failed = true;
		
		if(failed) {
			document.getElementById('errorMsg').innerHTML = "Bitte fuellen Sie alle Felder aus.";
		}

		return !failed;
	}
	
	function validateElement(name, message) {
		var element = document.getElementById(name);
		if(!element.value.length) {
			element.setAttribute("required", "required");
			document.getElementById(name + "Error").innerHTML = message;
			return false; // failed
		} else {
			element.removeAttribute("required");
			document.getElementById(name + "Error").innerHTML = "";
			return true; // not failed
		} 
	}
</script>