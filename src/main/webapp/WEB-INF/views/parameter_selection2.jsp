<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>

<div class="starter-template">
<div id="paramterSelection">
    <div class="r">
      <ul class="heading-text">
      	<li>Bitte geben Sie im Folgendem die gewuenschte Parameter fuer die ausgewaehlte Query ein</li>
      </ul>
	</div>
 	<br>
	<div class="panel panel-default">
		  <!-- Default panel contents -->
		  <div class="panel-heading">Eingabe-Werte</div>
		  <div class="panel-body">
				Bitte geben Sie Ihre benoetigten Parameter ein.
		  </div>
			
		  <br/>
		  
		  <form:form action="/abfragen/parameter_selected" method="post" modelAttribute="boundVariablesWrapper">
		  		<form:input type="hidden" path="awid"/>
			  	<table class="table">
			  		
					<c:forEach varStatus="count" items="${boundVariablesWrapper.variableList}" var="boundVar">
							<tr>
								<td><c:out value="${boundVar.name}"/></td>
								    <form:input type="hidden" path="variableList[${count.index}].name"/>
								<td><form:input path="variableList[${count.index}].value" /></td>
							</tr>
					</c:forEach>
				</table>
				</div>
		  		<button type="submit" class="btn btn-primary btn-lg">Weiter</button>
		  </form:form>
		
		
			
</div>

<script type="text/javascript">
	
</script>
<br/>
<br/>
</div>

