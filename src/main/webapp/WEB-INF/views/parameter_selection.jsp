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
 	
 	 <c:if test="${showErrorMessage}">
 	 	<div class="text-center">
		  	<h4><span class="label label-danger"><c:out value="${errorMessage}"/></span></h4>
		</div>
		<br/>
		<br/>
	</c:if>
	
	<div class="panel panel-default">
		  <!-- Default panel contents -->
		  <div class="panel-heading">Eingabe-Werte</div>
		  <div class="panel-body">
				Bitte geben Sie Ihre benoetigten Parameter ein.
		  </div>
			
		  <br/>
		  
		  <form:form action="/abfragen/parameter_selected" method="post" modelAttribute="boundVariablesWrapper" onsubmit="return validateForm()" name="paramter_form">
		  		<form:input type="hidden" path="awid"/>
			  	<table class="table">
			  		<c:set var="counter" value="0" scope="page" />
					<c:forEach varStatus="count" items="${boundVariablesWrapper.variableList}" var="boundVar" begin="0">
							<tr>
								<td><c:out value="${boundVar.bezeichnung}"/>:</td>
								    <form:input type="hidden" path="variableList[${count.index}].name"/>
								    <form:input type="hidden" path="variableList[${count.index}].bezeichnung"/>
								    <form:input type="hidden" path="variableList[${count.index}].type"/>
								<td><form:input  id="input${counter}" path="variableList[${count.index}].value" value="${variableList[count.index].value}"/></td>
								<td><form:errors path="variableList[${count.index}].value" /></td>
							</tr>
						<c:set var="count" value="${counter + 1}" scope="page"/>
					</c:forEach>
				</table>
				</div>
				<button type="submit" class="btn btn-primary btn-lg">Weiter</button>
		  </form:form>
				
		  		
		<!-- 
		  <form  method="post"  onsubmit="return validateForm()" name="paramter_form2">
		  		<input name="test" />
		  		<button type="submit" class="btn btn-primary btn-lg">Weiter</button>
		  </form>
		 -->
</div>

<script type="text/javascript">
	function validateForm() {
	    //var x = document.forms["paramter_form"]["${boundVariablesWrapper.variableList[count.index].value}"].value; 
	    
	    var length = parseInt("${counter}");
	    var failed = false;
	    
	    for(i = 0; i <= length; i++) {
	    	var x = document.getElementById("input" + "${counter}").value;
	    	if(!x.length) {
		    	failed = true;
		    }
	    }
		
	    if(failed) {
	    	alert("Bitte fuellen Sie alle Parameter aus!");
	    	return true;//false;
	    }
	    
	    return true;
	}
</script>
<br/>
<br/>
</div>

