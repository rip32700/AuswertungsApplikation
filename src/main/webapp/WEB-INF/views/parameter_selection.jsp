<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>  -->
<%@ page session="false" %>

<div class="starter-template">
<div id="paramterSelection">
    <div class="r">
      <ul class="heading-text">
      	<li>Bitte geben Sie im Folgendem die gewuenschte Parameter fuer die ausgewaehlte Query ein</li>
      </ul>
	</div>
 	<br>
	<div class="panel panel-default">
		  <!-- Default panel contents -->
		  <div class="panel-heading">Eingabe-Werte</div>
		  <div class="panel-body">
				Bitte geben Sie Ihre benoetigten Parameter ein.
		  </div>
			
			<br/>
			<form method="post" action="<c:url value="/parameter_selected" />">
			<table class="table">
				<c:forEach items="${boundVariables}" var="boundVar">
					
					<div class="form-group form-inline">
						<tr>
							<td><label for="<c:out value='${boundVar}'/>"><c:out value='${boundVar}'/></label></td>
							<td><input type="text" class="form-control" id="<c:out value='${boundVar}'/>"/></td>
						</tr>
					</div>
				</c:forEach>
			</table>
			</form>
	</div>
		<button onclick="sendId()" class="btn btn-primary btn-lg">Weiter</button>
	
</div>
<div id="processingDiv">
	<h2 class="text-center"> Anfrage wird bearbeitet</h2>
	<h2 class="text-center"><img src='<c:url value="/resources/images/ajax-loader.gif" />'/></span></h2>
</div>

<div id="resultDiv">
	<div class="r">
      <ul class="heading-text">
      	<li>Ihre Abfrage wurde erfolgreich bearbeitet</li>
      	<li>Im Folgendem finden Sie eine Vorschau der ersten paar Zeilen des Ergebnisses</li>
      	<li>Das vollstaendige Ergebnis koennen Sie durch einen Klick des Download-Buttons im Excel-Format abspeichern</li>
      </ul>
	</div>
 	<br>
	<p id="response">
		
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
	</p>
</div>


<script type="text/javascript">
	
	var stompClient = null;
	connect();

	
    function setConnected(connected) {
    	document.getElementById('processingDiv').style.visibility = 'hidden';
        document.getElementById('resultDiv').style.visibility = 'hidden';//connected ? 'visible' : 'hidden';
        document.getElementById('response').innerHTML = '';
    }
    
    function connect() {
    	var url = "/abfragen/query/" + ${query.awid};
        var socket = new SockJS(url);
        stompClient = Stomp.over(socket); 
        stompClient.connect({}, function(frame) {
            setConnected(true);
            console.log('Connected: ' + frame);
            
            var url = '/topic/query/' + ${query.awid};
            stompClient.subscribe(url, function(query){
                showQuery(JSON.parse(query.body).sql);
            });
        });
    }
    
    function disconnect() {
        if (stompClient != null) {
            stompClient.disconnect();
        }
        setConnected(false);
        console.log("Disconnected");
    }
    
    function sendId() {
    	
    	document.getElementById('processingDiv').style.visibility = 'visible';
    	$("#paramterSelection").remove();
    	
        var id = ${query.awid};
        var url = "/app/query/" + ${query.awid};
        stompClient.send(url, {}, JSON.stringify({ 'id': id }));
    }
    
    function showQuery(message) {
    	
    	document.getElementById('resultDiv').style.visibility = 'visible';
    	$("#processingDiv").remove();
    	
        var response = document.getElementById('response');
        var p = document.createElement('p');
        p.style.wordWrap = 'break-word';
        p.appendChild(document.createTextNode(message));
        response.appendChild(p);
        
        
    }
</script>

</div>
<br/>
<br/>
