<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<div class="starter-template">
 	<div class="r">
      <ul class="heading-text">
      	<li>Bitte geben Sie im Folgendem die gewuenschte Parameter fuer die ausgewaehlte Query ein</li>
      </ul>
	</div>
 	<br>

<p class="text-center">Fortschritt der Bearbeitung</p>
<div class="progress">
  <div class="progress-bar progress-bar-striped active" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 40%;">
    <!-- <span class="sr-only">40% Complete</span>  -->
    40%
  </div>
</div>


<ol class="breadcrumb">
  <li>Auswahl der Auswertung</li>
  <li class="active">Parametereingabe</li>
  <li>In Bearbeitung</li>
  <li>Resultat</li>
</ol>

<div class="panel panel-default">
	  <!-- Default panel contents -->
	  <div class="panel-heading">Eingabe-Werte</div>
	  <div class="panel-body">
			Bitte geben Sie Ihre benoetigten Parameter ein.
	  </div>
		
		<br/>
		<form method="post">
		<table class="table">
		
			<c:set var="count" value="0" scope="page" />
			<c:forEach items="${boundVariables}" var="boundVar">
				
				
				<tr>
				    <c:if test="${count %2 == 1}">
				    	<div class="form-group form-inline">
				    </c:if>
					
					<td><label for="<c:out value='${boundVar}'/>"><c:out value='${boundVar}'/></label></td>
					<td><input type="text" class="form-control" id="<c:out value='${boundVar}'/>"/></td>
					
					 <c:if test="${count %2 == 1}">
				    	</div>
				    </c:if>
					
				</tr>
				<c:set var="count" value="${count + 1}" scope="page"/>
			</c:forEach>
		</table>
		</form>
</div>

<form method="post" action="<c:url value="/parameter_selected" />">
	<button type="submit" class="btn btn-default btn-lg">Weiter</button>
</form>
<br/>
<br/>
