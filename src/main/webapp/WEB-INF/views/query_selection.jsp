<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<script type="text/javascript">
function open_window(url, name) {
    window.open(url, name, "width=800, height=600");
}
</script>


<div class="starter-template">
 	<div class="r">
      <ul class="heading-text">
      	<li>Bitte waehlen Sie im Folgendem die gewuenschte Auswertung aus, welche ausgefuehrt werden soll</li>
      	<li>Mit Hilfe der Filter-Optionen koennen Sie die Liste der Abfragen einschraenken</li>
      	<li>In der Favoriten-Liste finden Sie Ihre am Haeufigsten benutzten Abfragen</li>
      </ul>
	</div>
 	<br>

<!--
<p class="text-center">Fortschritt der Bearbeitung</p>
<div class="progress">
  <div class="progress-bar progress-bar-striped active" role="progressbar" aria-valuenow="10" aria-valuemin="0" aria-valuemax="100" style="width: 10%;">
    10%
  </div>
</div>

<ol class="breadcrumb">
  <li class="active">Auswahl der Auswertung</li>
  <li>Parametereingabe</li>
  <li>In Bearbeitung</li>
  <li>Resultat</li>
</ol>
-->

<div class="row">
	<!-- FILTER -->
	<div class="col-md-4">
		<div class="panel panel-default equalpanels">
			<div class="panel-heading"><b>Filter fuer die Auswertungen</b></div>
			<div class="panel-body">
				Bitte waehlen Sie die gewuenschten Filter Optionen aus, um die Liste der Auswertungen weiter unten einzuschraenken.
			</div>
				<form>
					<div class="form-group">
						Bereich:
						<select class="form-control">
							<c:forEach items="${bereicheList}" var="bereich">
								<option>${bereich}</option>
							</c:forEach>
						</select>
						Erstell-Datum:
						<select class="form-control">
							<c:forEach items="${erstelltList}" var="datum">
								<option>${datum}</option>
							</c:forEach>
						</select>
					</div>
				</form>
		</div>
	</div>
	<!-- FAV LIST -->
	<div class="col-md-8">
		<div class="panel panel-default equalpanels">
			<div class="panel-heading"><b>Favorisierte Auswertungen</b></div>
			<div class="panel-body">
				Dies sind Ihre meist verwendeten Auswertungen.
			</div>
			  <!-- Table -->
			  <div class="overflow-table-fav">
				  <table class="table table-hover table-striped" data-link="row">
				  	<thead>
				  		<tr><th>AWID</th><th>Text</th><th>Art</th><th>Erstellt am</th><th>Bereich</th></tr>
				  	</thead>
				  	<tbody data-link="row" class="rowlink">
				  		<tr>
					  		<td><a href="<c:url value="/query_selected/${queryList[0].awid}"/>" onclick="open_window(this.href, 'query_selected_<c:out value="${queryList[0].awid}" />'); return false;" ><c:out value="${queryList[0].awid}" /></a></td> 
							<td><c:out value="${queryList[0].text}" /></td>
							<td><c:out value="${queryList[0].art}" /></td>
							<td><c:out value="${queryList[0].erstellt}" /></td>
							<td><c:out value="${queryList[0].bereich}" /></td>
						</tr>
						<tr>
					  		<td><a href="<c:url value="/query_selected/${queryList[1].awid}"/>" onclick="open_window(this.href, 'query_selected_<c:out value="${queryList[1].awid}" />'); return false;" ><c:out value="${queryList[1].awid}" /></a></td> 
							<td><c:out value="${queryList[1].text}" /></td>
							<td><c:out value="${queryList[1].art}" /></td>
							<td><c:out value="${queryList[1].erstellt}" /></td>
							<td><c:out value="${queryList[1].bereich}" /></td>
						</tr>
				  	</tbody>
				  </table>
			</div>
		</div>
	</div>
</div>
<div class="row">
	<!-- LISTE -->
	<div class="col-md-12">
		<div class="panel panel-default">
			<div class="panel-heading"><b>Auswertungen</b></div>
			<div class="panel-body">
				Eine Liste aller verfuegbaren Queries
			</div>
			  <!-- Table -->
			  <!-- <div class="overflow-table"> -->
			  <table class="table table-hover table-striped" data-link="row">
			  	<thead>
			  		<tr><th>AWID</th><th>Text</th><th>Erstellt am</th><th>Bereich</th></tr>
			  	</thead>
			  		<tbody data-link="row" class="rowlink">
			  			<!-- CURRENTLY LIMITED TO 10 QUERIES FOR TESTING PURPOSES !!! -->
			  			<c:set var="count" value="0" scope="page" />
				  		<c:forEach items="${queryList}" var="query">
				  			<c:if test="${count < 10}">
							<tr>
								<td><a href="<c:url value="/query_selected/${query.awid}"/>" onclick="open_window(this.href, 'query_selected_<c:out value="${query.awid}" />'); return false;" ><c:out value="${query.awid}" /></a></td> 
								<td><c:out value="${query.text}" /></td>
								<td><c:out value="${query.erstellt}" /></td>
								<td><c:out value="${query.bereich}" /></td>
							</tr>
							<c:set var="count" value="${count + 1}" scope="page"/>
							</c:if>
						</c:forEach>
			  		</tbody>
			  </table>
			  <!-- </div> -->
		</div>
	</div>
</div>


<!--  !!!!!! ALTERNATIVE LAYOUT !!!!!! 


<div class="row">
	<!-- LISTE 
	<div class="col-md-9">
		<div class="panel panel-default">
			<div class="panel-heading"><b>Auswertungen</b></div>
			<div class="panel-body">
				Eine Liste aller verfuegbaren Queries
			</div>
			  <!-- Table 
			  <!-- <div class="overflow-table"> 
			  <table class="table table-hover table-striped" data-link="row">
			  	<thead>
			  		<tr><th>AWID</th><th>Text</th><th>Erstellt am</th><th>Bereich</th></tr>
			  	</thead>
			  		<tbody data-link="row" class="rowlink">
			  			<!-- CURRENTLY LIMITED TO 10 QUERIES FOR TESTING PURPOSES !!! 
			  			<c:set var="count" value="0" scope="page" />
				  		<c:forEach items="${queryList}" var="query">
				  			<c:if test="${count < 10}">
							<tr>
								<td><a href="<c:url value="/query_selected/${query.awid}"/>" onclick="open_window(this.href, 'query_selected_<c:out value="${query.awid}" />'); return false;" ><c:out value="${query.awid}" /></a></td> 
								<td><c:out value="${query.text}" /></td>
								<td><c:out value="${query.erstellt}" /></td>
								<td><c:out value="${query.bereich}" /></td>
							</tr>
							<c:set var="count" value="${count + 1}" scope="page"/>
							</c:if>
						</c:forEach>
			  		</tbody>
			  </table>
			  <!-- </div> 
		</div>
	</div>
	<!-- FILTER 
	<div class="col-md-3">
		<div class="panel panel-default ">
			<div class="panel-heading"><b>Filter fuer die Auswertungen</b></div>
			<div class="panel-body">
				Bitte waehlen Sie die gewuenschten Filter Optionen aus, um die Liste der Auswertungen weiter unten einzuschraenken.
			</div>
				<form>
					<div class="form-group">
						Bereich:
						<select class="form-control">
							<c:forEach items="${bereicheList}" var="bereich">
								<option>${bereich}</option>
							</c:forEach>
						</select>
						Erstell-Datum:
						<select class="form-control">
							<c:forEach items="${erstelltList}" var="datum">
								<option>${datum}</option>
							</c:forEach>
						</select>
					</div>
				</form>
		</div>
	</div>
	<!-- FAV LIST 
	<div class="col-md-3">
		<div class="panel panel-default">
			<div class="panel-heading"><b>Favorisierte Auswertungen</b></div>
			<div class="panel-body">
				Dies sind Ihre meist verwendeten Auswertungen.
			</div>
			  <!-- Table 
			  <div class="overflow-table-fav">
				  <table class="table table-hover table-striped" data-link="row">
				  	<thead>
				  		<tr><th>AWID</th><th>Text</th><th>Art</th><th>Erstellt am</th><th>Bereich</th></tr>
				  	</thead>
				  	<tbody data-link="row" class="rowlink">
				  		<tr>
					  		<td><a href="<c:url value="/query_selected/${queryList[0].awid}"/>" onclick="open_window(this.href, 'query_selected_<c:out value="${queryList[0].awid}" />'); return false;" ><c:out value="${queryList[0].awid}" /></a></td> 
							<td><c:out value="${queryList[0].text}" /></td>
							<td><c:out value="${queryList[0].art}" /></td>
							<td><c:out value="${queryList[0].erstellt}" /></td>
							<td><c:out value="${queryList[0].bereich}" /></td>
						</tr>
						<tr>
					  		<td><a href="<c:url value="/query_selected/${queryList[1].awid}"/>" onclick="open_window(this.href, 'query_selected_<c:out value="${queryList[1].awid}" />'); return false;" ><c:out value="${queryList[1].awid}" /></a></td> 
							<td><c:out value="${queryList[1].text}" /></td>
							<td><c:out value="${queryList[1].art}" /></td>
							<td><c:out value="${queryList[1].erstellt}" /></td>
							<td><c:out value="${queryList[1].bereich}" /></td>
						</tr>
				  	</tbody>
				  </table>
			</div>
		</div>
	</div>
</div>

-->


</div>
<br/>
<br/>
