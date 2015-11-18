<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>  -->
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
		<form method="post" action="<c:url value="/parameter_selected" />">
		<table class="table">
			<c:forEach items="${boundVariables}" var="boundVar">
				
				<div class="form-group form-inline">
					<tr>
						<td><label for="<c:out value='${boundVar}'/>"><c:out value='${boundVar}'/></label></td>
						<td><input type="text" class="form-control" id="<c:out value='${boundVar}'/>"/></td>
					</tr>
				</div>
			</c:forEach>
		</table>
</div>
	<button type="submit" class="btn btn-primary btn-lg">Weiter</button>
</form>

</div>
<br/>
<br/>
