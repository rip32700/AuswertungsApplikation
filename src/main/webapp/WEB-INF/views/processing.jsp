<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>  -->
<%@ page session="false" %>

<div class="starter-template">

<div id="processingDiv">
	<h2 class="text-center"> Anfrage wird bearbeitet</h2>
	<h2 class="text-center"><img src='<c:url value="/resources/images/ajax-loader.gif" />'/></span></h2>
</div>

<div id="resultDiv">
   
	<div class="r" id="response_heading">
	</div>
 	<br>
	<p id="response">
		<!-- 
		<div class="panel panel-default">
		  <!-- Default panel contents 
		  <div class="panel-heading"><b>Vorschau der Abfrage</b></div>
		  <!-- Table 
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
		   -->
	</p>
</div>


<script type="text/javascript">
	
	var stompClient = null;
	var is_connected = false;
	
	connect();
	
	// wait for connection to be established before 
	// calling send function, otherwise illegal state
	var millisecondsToWait = 200;
	setTimeout(function() {
	    // Whatever you want to do after the wait
		sendId();
	}, millisecondsToWait);
	
	
    function setConnected(connected) {
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
            stompClient.subscribe(url, function(result){
                showQuery(result.body);   //showQuery(JSON.parse(query.body).sql);
            });
        });
        
        is_connected = true;
    }
    
    function disconnect() {
        if (stompClient != null) {
            stompClient.disconnect();
        }
        setConnected(false);
        console.log("Disconnected");
    }
    
    function sendId() {
    	
        var id = ${query.awid};
        var sql = "${query.sql}";
        
        
        var url = "/app/query/" + ${query.awid};
        stompClient.send(url, {}, JSON.stringify({ 'id': id, 'sql' : sql }));
    }
    
    function showQuery(message) {
    	
    	document.getElementById('resultDiv').style.visibility = 'visible';
    	$("#processingDiv").remove();
    	
    	var response_heading = document.getElementById('response_heading');
        var response = document.getElementById('response');
        
        var ul = document.createElement('ul');
        ul.setAttribute('class', 'heading-text');
        var li1 = document.createElement('li');
        li1.appendChild(document.createTextNode('Ihre Abfrage wurde erfolgreich bearbeitet'));
        ul.appendChild(li1);
        var li2 = document.createElement('li');
        li2.appendChild(document.createTextNode('Im Folgendem finden Sie eine Vorschau der ersten paar Zeilen des Ergebnisses'));
        ul.appendChild(li2);
        var li3 = document.createElement('li');
        li3.appendChild(document.createTextNode('Das vollstaendige Ergebnis koennen Sie durch einen Klick des Download-Buttons im Excel-Format abspeichern'));
        ul.appendChild(li3);
        response_heading.appendChild(ul);
        
        var p = document.createElement('p');
        p.style.wordWrap = 'break-word';
        p.appendChild(document.createTextNode(message));
        response.appendChild(p);
        
       
        
    }
</script>

</div>
<br/>
<br/>
