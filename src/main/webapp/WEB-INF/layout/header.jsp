<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
	
<nav class="navbar navbar-default">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand"><span class="glyphicon glyphicon-signal" aria-hidden="true"></span> AUSWERTUNGS APPLIKATION</a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li><a href="<c:url value="/" />">Alle Auswertung</a></li>
        <security:authorize access="hasRole('ADMIN')">
      		<li><a href="<c:url value="/admin" />" class="navbar-right">Neue Auswertung anlegen</a>
      	</security:authorize>
        <!-- 
        <li><a href="<c:url value="/asyncTest"/>">AsyncTest</a></li>
        <li><a href="">Meine Historie</a></li>
        <li class="active"><a href="#">Link <span class="sr-only">(current)</span></a></li>
        <li><a href="#">Link</a></li>
         -->
      </ul>
      <ul class="nav navbar-nav navbar-right">
      	<security:authorize access="isAuthenticated()">
		    <li><a href="<c:url value="/logout" />" class="navbar-right">Ausloggen</a></li>
		</security:authorize>
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>