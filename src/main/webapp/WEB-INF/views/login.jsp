<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>

<div class="starter-template">
 	<br>
	<div class="col-md-5 col-md-offset-3">
		<div class="panel panel-default equalpanels">
			<div class="panel-heading"><b>Bitte Loggen Sie sich ein</b></div>
			<div class="panel-body">
				<br/>
				<c:if test="${param.error == 1}">
					<div class="text-center">
					  	<h4><span class="label label-danger">Ungueltiger Benutzername und/oder Passwort.</span></h4>
					</div>
				</c:if>
			    
                </div>
				<form name="f" action="<c:url value="/login" />" method="post" onsubmit="return validateForm()">
					<table class="table">
						<tr><td>User:</td><td><input id="username" type="text" name="username" value="" /></td><td><div id="userError" style="color:red;"></div></td></tr>
						<tr><td>Passwort:</td><td><input id="password" type="password" name="password" value="" /></td><td><div id="passwordError" style="color:red;"></div></td></tr>
						<tr> </tr>
						<tr><td></td><td><button type="submit" class="btn btn-primary">Einloggen</button></td></tr>
					</table>
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
				</form>
			</div>
		</div>	
	</div>

<script type="text/javascript">
	function validateForm() {
		
		var failed = false;

		if(!validateElement('username', 'Bitte geben Sie einen Benuzternamen ein.')) 
			failed = true;
		if(!validateElement('password', 'Bitte geben Sie ein Passwort ein.'))
			failed = true;	
		
		//if(failed) {
		//	document.getElementById('errorMsg').innerHTML = "Bitte fuellen Sie alle Felder aus.";
		//}

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