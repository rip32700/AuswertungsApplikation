<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>

<div class="starter-template">
 	<br>
	<div class="col-md-4 col-md-offset-3">
		<div class="panel panel-default equalpanels">
			<div class="panel-heading"><b>Bitte Loggen Sie sich ein</b></div>
			<div class="panel-body">
				<br/>
				<form action="<c:url value="/login" />" method="post">
					<table class="table">
						<tr><td>User:</td><td><input type="text" name="username" value="" /></td></tr>
						<tr><td>Passwort:</td><td><input type="password" name="password" value="" /></td></tr>
						<tr> </tr>
						<tr><td></td><td><button type="submit" class="btn btn-primary">Einloggen</button></td></tr>
					</table>
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
				</form>
			</div>
		</div>	
	</div>
</div>