<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<div class="starter-template">
 	<div class="text-center">
      <h1>Abfragen Applikation</h1>
      <p class="lead">
		Beschreibung der Applikation...  
	  </p>
	</div>
</div>
 <br>
 
<div class="panel panel-default col-md-11 col-md-offset-1">
	  <!-- Default panel contents -->
	  <div class="panel-heading">Filter fuer Abfragen</div>
	  <!--<div class="panel-body">
		<p>Beschreibung</p>
	  </div>
		-->
		<br/>
		<form>
		<table class="table">
			<tr><div class="form-group form-inline">
				<td>
					<label for="exampleInputEmail1">Paramter 1</label>
				</td>
				<td>
					<input type="email" class="form-control" id="exampleInputEmail1" placeholder="">
				</td>
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
				<td>
					<label for="exampleInputEmail1">Paramter 5</label>
				</td>
				<td>
					<input type="email" class="form-control" id="exampleInputEmail1" placeholder="">
				</td>
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
			<tr><div class="form-group form-inline">
				<td>
					<label for="exampleInputEmail1">Paramter 9</label>
				</td>
				<td>
					<input type="email" class="form-control" id="exampleInputEmail1" placeholder="">
				</td>
				<td>
					 <div class="checkbox">
						<label>
						  <input type="checkbox"> Paramter 10
						</label>
					 </div>
				</td>
				<td>
					 <div class="checkbox">
						<label>
						  <input type="checkbox"> Paramter 11
						</label>
					 </div>
				</td>
				<td>
					 <div class="checkbox">
						<label>
						  <input type="checkbox"> Paramter 2
						</label>
					 </div>
				</td>
			</div><tr>
		</table>
		</form>
</div>

<div class="panel panel-default  col-md-11 col-md-offset-1">
	  <!-- Default panel contents -->
	  <div class="panel-heading">Favoriten</div>
	  <!--<div class="panel-body">
		<p>Beschreibung</p>
	  </div>
		-->
	  <!-- Table -->
	  <div class="overflow-table-fav">
	  <table class="table table-hover">
		<thead><td><b>Beschreibung</b></td><td><b>Art / Typ</b></td><td><b>Bereich</b></td><td><b>Erstellt am</b></td></thead>
		<tr><td><a href="#">Abfrage 1<a/></td><td>...</td><td>...</td><td>...</td></tr>
		<tr><td><a href="#">Abfrage 2<a/></td><td>...</td><td>...</td><td>...</td></tr>
		<tr><td><a href="#">Abfrage 3<a/></td><td>...</td><td>...</td><td>...</td></tr>
	  </table>
	  </div>
</div>
	
<div class="panel panel-default  col-md-11 col-md-offset-1">
	  <!-- Default panel contents -->
	  <div class="panel-heading">Abfragen</div>
	  <!--<div class="panel-body">
		<p>Beschreibung</p>
	  </div>
		-->
	  <!-- Table -->
	  <div class="overflow-table">
	  <table class="table table-hover">
		<thead><td><b>AWID</b></td><td><b>Text</b></td><td><b>Art</b></td><td><b>Benutzer</b></td><td><b>Erstellt</b></td><td><b>Bereich</b></td></thead>
		
		<c:forEach items="${queryList}" var="query">
			<tr><td><a href="#"><c:out value="${query.awid}" /></a></td><td><c:out value="${query.text}" /></td><td><c:out value="${query.art}" /></td><td><c:out value="${query.benutzer}" /></td><td><c:out value="${query.erstellt}" /></td><td><c:out value="${query.bereich}" /></td></tr>
		</c:forEach>
		
	  </table>
	  </div>
</div>
	
<div class="panel panel-default col-md-11 col-md-offset-1">
	  <!-- Default panel contents -->
	  <div class="panel-heading">Eingabe-Werte</div>
	  <!--<div class="panel-body">
		<p>Beschreibung</p>
	  </div>
		-->
		<br/>
		<form method="post">
		<table class="table">
		
			<c:set var="count" value="0" scope="page" />
			<c:forEach items="${boundVariables}" var="boundVar">
				
				
				<tr>
				    <c:if test="${count %2 == 1}">
				    	<div class="form-group form-inline">
				    </c:if>
					
					<td><label for="<c:out value='${boundVar}'/>"><c:out value='${boundVar}'/></label></td>
					<td><input type="text" class="form-control" id="<c:out value='${boundVar}'/>"/></td>
					
					 <c:if test="${count %2 == 1}">
				    	</div>
				    </c:if>
					
				</tr>
				<c:set var="count" value="${count + 1}" scope="page"/>
			</c:forEach>
			<tr>
				<td><button type="submit" class="btn btn-default">Submit</button></td>
			<tr>
		</table>
		</form>
</div>


<div class="panel-group">
	<div class="panel panel-default col-md-11 col-md-offset-1">
		<div class="panel-heading">
			History  <a data-toggle="collapse" data-target="#collapse1" href="#collapse1"><span class="glyphicon glyphicon-chevron-down" aria-hidden="true"></span></a>
		</div>
		<div id="collapse1" class="panel-collapse collapse">
			<div class="panel-body">
			  <!-- Table -->
			  <table class="table table-hover">
				<thead><td><b>AFID</b></td><td><b>Datum</b></td><td><b>Download</b></td></thead>
				<tr><td><a href="#">12345<a/></td><td>XX.XX.XXXX</td><td><button type="submit" class="btn btn-default">Download</button></td></tr>
				<tr><td><a href="#">57634<a/></td><td>XX.XX.XXXX</td><td><button type="submit" class="btn btn-default">Download</button></td></tr>
				<tr><td><a href="#">67367<a/></td><td>XX.XX.XXXX</td><td><button type="submit" class="btn btn-default">Download</button></td></tr>
			  </table>
			 </div>
		</div>
	</div>
</div>

<div class="panel panel-default  col-md-11 col-md-offset-1">
	  <!-- Default panel contents -->
	  <div class="panel-heading">History</div>
	  <!--<div class="panel-body">
		<p>Beschreibung</p>
	  </div>
		-->
	  <!-- Table -->
	  <table class="table table-hover">
		<thead><td><b>AFID</b></td><td><b>Datum</b></td><td><b>Download</b></td></thead>
		<tr><td><a href="#">12345<a/></td><td>XX.XX.XXXX</td><td><button type="submit" class="btn btn-default">Download</button></td></tr>
		<tr><td><a href="#">57634<a/></td><td>XX.XX.XXXX</td><td><button type="submit" class="btn btn-default">Download</button></td></tr>
		<tr><td><a href="#">67367<a/></td><td>XX.XX.XXXX</td><td><button type="submit" class="btn btn-default">Download</button></td></tr>
	  </table>
	  
	  <!-- for ajax: <a data-toggle="modal" href="history.html" data-target="#history"></a> -->
</div>
