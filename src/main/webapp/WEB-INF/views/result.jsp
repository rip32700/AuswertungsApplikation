<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>


<div class="starter-template">
	<div class="r">
      <ul class="heading-text">
      	<li>Ihre Abfrage wurde erfolgreich bearbeitet</li>
      	<li>Im Folgendem finden Sie eine Vorschau der ersten paar Zeilen des Ergebnisses</li>
      	<li>Das vollstaendige Ergebnis koennen Sie durch einen Klick des Download-Buttons im Excel-Format abspeichern</li>
      </ul>
	</div>
 	<br>

<p class="text-center">Fortschritt der Bearbeitung</p>
<div class="progress">
  <div class="progress-bar progress-bar-striped active" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100" style="width: 100%;">
    <!-- <span class="sr-only">10% Complete</span>  -->
    100%
  </div>
</div>

<ol class="breadcrumb">
  <li><a href="<c:url value="/" />">Auswahl der Auswertung</a></li>
  <li>Parametereingabe</li>
  <li>In Bearbeitung</li>
  <li class="active">Resultat</li>
</ol>
<br/>
	
	
	<div class="panel panel-default">
	  <!-- Default panel contents -->
	  <div class="panel-heading"><b>Vorschau der Abfrage</b></div>
	  <!-- Table -->
		  <table class="table table-hover">
			<thead><td><b>Header1</b></td><td><b>Header2</b></td><td><b>Header3</b></td><td><b>Header3</b></td></thead>
			<tr><td>data1_1</td><td>data1_2</td><td>data1_3</td><td>data1_4</td></tr>
			<tr><td>data2_1</td><td>data2_2</td><td>data2_3</td><td>data2_4</td></tr>
			<tr><td>data3_1</td><td>data3_2</td><td>data3_3</td><td>data3_4</td></tr>
			<tr><td>data3_1</td><td>data3_2</td><td>data3_3</td><td>data3_4</td></tr>
			<tr><td>data3_1</td><td>data3_2</td><td>data3_3</td><td>data3_4</td></tr>
			<tr><td>data3_1</td><td>data3_2</td><td>data3_3</td><td>data3_4</td></tr>
			<tr><td>data3_1</td><td>data3_2</td><td>data3_3</td><td>data3_4</td></tr>
			<tr><td>data3_1</td><td>data3_2</td><td>data3_3</td><td>data3_4</td></tr>
		  </table>
		  <br/><br/><br/><br/>
		  <form class="text-center" action="/abfragen/downloadExcel">
				<button type="submit" class="btn btn-default btn-lg btn-block">
					<span class="glyphicon glyphicon-download-alt" aria-hidden="true"></span>
					Download
				</button>
			</form>
		  <br/><br/>
</div>

</div>
