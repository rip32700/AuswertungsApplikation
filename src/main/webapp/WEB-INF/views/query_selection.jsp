<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<div class="starter-template">
 	<div class="r">
      <ul class="heading-text">
      	<li>Bitte waehlen Sie im Folgendem die gewuenschte Auswertung aus, welche ausgefuehrt werden soll</li>
      	<li>Mit Hilfe der Filter-Optionen koennen Sie die Liste der Abfragen einschraenken</li>
      	<li>In der Favoriten-Liste finden Sie Ihre am Haeufigsten benutzten Abfragen</li>
      </ul>
	</div>
 	<br>

<p class="text-center">Fortschritt der Bearbeitung</p>
<div class="progress">
  <div class="progress-bar progress-bar-striped active" role="progressbar" aria-valuenow="10" aria-valuemin="0" aria-valuemax="100" style="width: 10%;">
    <!-- <span class="sr-only">10% Complete</span>  -->
    10%
  </div>
</div>

<ol class="breadcrumb">
  <li class="active">Auswahl der Auswertung</li>
  <li>Parametereingabe</li>
  <li>In Bearbeitung</li>
  <li>Resultat</li>
</ol>

<div class="panel panel-default ">
	<div class="panel-heading"><b>Filter fuer die Auswertungen</b></div>
	<div class="panel-body">
		Bitte waehlen Sie die gewuenschten Filter Optionen aus, um die Liste der Auswertungen weiter unten einzuschraenken.
	</div>
		<form>
		<table class="table">
			<tr><div class="form-group form-inline">
				<!-- 
				<td>
					<label for="exampleInputEmail1">Paramter 1</label>
				</td>
				<td>
					<input type="email" class="form-control" id="exampleInputEmail1" placeholder="">
				</td>
				 -->
				<td>
					 <div class="checkbox">
						<label>
						  <input type="checkbox"> Paramter 2
						</label>
					 </div>
				</td>
				<td>
					 <div class="checkbox">
						<label>
						  <input type="checkbox"> Paramter 3
						</label>
					 </div>
				</td>
				<td>
					 <div class="checkbox">
						<label>
						  <input type="checkbox"> Paramter 4
						</label>
					 </div>
				</td>
			</div><tr>
			<tr><div class="form-group form-inline">
				<!-- 
				<td>
					<label for="exampleInputEmail1">Paramter 5</label>
				</td>
				<td>
					<input type="email" class="form-control" id="exampleInputEmail1" placeholder="">
				</td>
				-->
				<td>
					 <div class="checkbox">
						<label>
						  <input type="checkbox"> Paramter 6
						</label>
					 </div>
				</td>
				<td>
					 <div class="checkbox">
						<label>
						  <input type="checkbox"> Paramter 7
						</label>
					 </div>
				</td>
				<td>
					 <div class="checkbox">
						<label>
						  <input type="checkbox"> Paramter 8
						</label>
					 </div>
				</td>
			</div><tr>
		</table>
		</form>
</div>

<div class="panel panel-default">
	<div class="panel-heading"><b>Favorisierte Auswertungen</b></div>
	<div class="panel-body">
		Dies sind Ihre meist verwendeten Auswertungen.
	</div>
	  <!-- Table -->
	  <div class="overflow-table-fav">
	  <table class="table table-hover table-striped" data-link="row">
	  	<thead>
	  		<tr><th>Beschreibung</th><th>Art / Typ</th><th>Bereich</th><th>Erstellt am</th></tr>
	  	</thead>
	  	<tbody data-link="row" class="rowlink">
	  		<tr><td><a href="">Abfrage 1</a></td><td>...</td><td>...</td><td>...</td></tr>
	  		<tr><td><a href="">Abfrage 2</a></td><td>...</td><td>...</td><td>...</td></tr>
	  		<tr><td><a href="">Abfrage 3</a></td><td>...</td><td>...</td><td>...</td></tr>
	  	</tbody>
	  </table>
	  </div>
</div>

<div class="panel panel-default">
	<div class="panel-heading"><b>Auswertungen</b></div>
	<div class="panel-body">
		Eine Liste aller verfuegbaren Queries
	</div>
	  <!-- Table -->
	  <div class="overflow-table">
	  <table class="table table-hover table-striped" data-link="row">
	  	<thead>
	  		<tr><th>AWID</th><th>Text</th><th>Art</th><th>Benutzer</th><th>Erstellt</th><th>Bereich</th></tr>
	  	</thead>
	  	<tbody data-link="row" class="rowlink">
	  		<c:forEach items="${queryList}" var="query">
				<tr><td><a href="<c:url value="/query_selected/"/>"><c:out value="${query.awid}" /></a></td><td><c:out value="${query.text}" /></td><td><c:out value="${query.art}" /></td><td><c:out value="${query.benutzer}" /></td><td><c:out value="${query.erstellt}" /></td><td><c:out value="${query.bereich}" /></td></tr>
			</c:forEach>
	  	</tbody>
	  </table>
	  </div>
	</div>
</div>

<form method="post" action="<c:url value="/query_selected" />">
	<button type="submit" class="btn btn-default btn-lg">Weiter</button>
</form>
<br/>
<br/>
