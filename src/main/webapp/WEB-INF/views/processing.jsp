<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<div class="starter-template">
 	<div class="r">
	</div>
	 <br>

<p class="text-center">Fortschritt der Bearbeitung</p>
<div class="progress">
  <div class="progress-bar progress-bar-striped active" role="progressbar" aria-valuenow="70" aria-valuemin="0" aria-valuemax="100" style="width: 70%;">
    <!-- <span class="sr-only">10% Complete</span>  -->
    70%
  </div>
</div>

<ol class="breadcrumb">
  <li>Auswahl der Auswertung</li>
  <li>Parametereingabe</li>
  <li class="active">In Bearbeitung</li>
  <li>Resultat</li>
</ol>
<br/>
<br/>
<h2 class="text-center"> Anfrage wird bearbeitet</h2>
<h2 class="text-center"><img src='<c:url value="/resources/images/ajax-loader.gif" />'/></span></h2>
	
<br/>
<br/>
</div>
