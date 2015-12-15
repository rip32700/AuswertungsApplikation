<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<script type="text/javascript">
function open_window(url, name) {
    window.open(url, name, "scrollbars=1, width=800, height=600");
}

$(document).ready(function(){
	
	var bereiche_selection;
	var erstellt_selection;
	
	// filter for "bereich" selection box
	$('#bereiche_select').change(function() {
		bereiche_selection = $(this).val();
		filterRows();	
	})
	
	// filter for "erstellt" selection box
	$('#erstellt_select').change(function() {
		erstellt_selection = $(this).val()
		filterRows();
	})
	
	function filterRows() {
		// filter table so that just rows containing the restriction are shown
		var rows = $('#auswertungen_table_body').find("tr");
		rows.hide();
		rows.filter(function(i, v) {
			var $t = $(this);
			
			//check which restrictions are set
			if (typeof bereiche_selection !== 'undefined' && typeof erstellt_selection !== 'undefined') {
				if($t.is(":contains('" + bereiche_selection + "')") && $t.is(":contains('" + erstellt_selection + "')")) {
					return true;
				}
			} else if (typeof bereiche_selection !== 'undefined') {
				if($t.is(":contains('" + bereiche_selection + "')")) {
					return true;
				}
			} else {
				if($t.is(":contains('" + erstellt_selection + "')")) {
					return true;
				}
			}
			
			return false;
		}).show();
	}
	
});
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
							<select class="form-control" id="bereiche_select">
								<c:forEach items="${bereicheList}" var="bereich">
									<option>${bereich}</option>
								</c:forEach>
							</select>
							Erstell-Datum:
							<select class="form-control" id="erstellt_select">
								<c:forEach items="${erstelltList}" var="datum">
									<option>${datum}</option>
								</c:forEach>
							</select>
						</div>
					</form>
					<form action="">
						<button type="submit" class="btn btn-primary">Filter zuruecksetzen</button>
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
						  		<td><a href="<c:url value="/query_selected/${queryList[3].awid}"/>" onclick="open_window(this.href, 'query_selected_<c:out value="${queryList[3].awid}" />'); return false;" ><c:out value="${queryList[3].awid}" /></a></td> 
						  		<!--   -->
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
				  		<tbody data-link="row" class="rowlink" id="auswertungen_table_body">
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
</div>