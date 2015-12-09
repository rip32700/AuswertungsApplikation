<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
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
		
	<div class="panel panel-default" id="container">
		<div class="panel-heading"><b>Result</b></div>
		<div class="panel-body">
			<form:form action="/abfragen/exportResultAsExcel" method="post" modelAttribute="resultObject" name="download_result_form">
				<form:input type="hidden" path="awid"    id="awid"/>
				<form:input type="hidden" path="columns" id="columns"/>
				<form:input type="hidden" path="rows"    id="rows" />
				<p id="response"> </p>
			</form:form>
		</div>
	</div>
		 
</div>

<script type="text/javascript">
	
	document.getElementById("container").style.visibility = 'hidden';
	var stompClient = null;
	var is_connected = false;
	
	connect();
	
	// wait for connection to be established before 
	// calling send function, otherwise illegal state
	var millisecondsToWait = 300;
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
                showResult(result.body); 
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
        
        var url = "/app/query/" + ${query.awid};
        stompClient.send(url, {}, JSON.stringify({ 'id': id }));
    }
    
    function showResult(message) {
    	
    	document.getElementById("container").style.visibility = 'visible';
    	
    	// extract column names and rows
    	var tmp = message.split("],");
    	var tmpColumns = tmp[0].replace(/\[|\"/g, '');				//used again later on
    	var tmpRows    = tmp[1].replace(/\[|\",\"|\]|\"/g, '');		//used again later on
    	var columns = tmpColumns.split(',');
    	var rows = tmpRows.split(';')
					  	
    	var tableDiv = createTable(columns, rows);
    	
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
        p.appendChild(tableDiv);
        response.appendChild(p);
        
        // setup form elements
        document.getElementById("columns").value = tmpColumns; // unsplit columns
        document.getElementById("rows").value = tmpRows;    // unsplit rows
        document.getElementById("awid").value = ${query.awid};
        var buttonDiv = createDownloadButton();
        response.appendChild(buttonDiv);
    }
    
    function createTable(columns, rows) {
    	
    	// wrapper for table
    	var tableDiv = document.createElement('div');
    	tableDiv.setAttribute('id', 'tableDiv');
    	tableDiv.setAttribute('class', 'result-overflow-table');
    	
    	var table = document.createElement('table');
    	table.setAttribute('class', 'table table-hover table-striped');

    	var column, row, entry;
    	
    	// table head
    	var thead = document.createElement('thead');
    	var theadrow = document.createElement('tr');
    	columns.forEach(function(column) {
    	  var th = document.createElement('th');
    	  th.appendChild(document.createTextNode(column));
    	  theadrow.appendChild(th);
    	});
    	thead.appendChild(theadrow);

    	// table rows
    	var tbody = document.createElement('tbody');
    	rows.forEach(function(row) {
    		if(row) { // only if row contains a string
    			var entries = row.split('#');
    	    	  var tr = document.createElement('tr');
    	    	  entries.forEach(function(entry) {
    	    		//entry = entry.replace('null', ''); // eliminate null values	
    	    	    var td = document.createElement('td');
    	    	    td.appendChild(document.createTextNode(entry));
    	    	    tr.appendChild(td);
    	    	  });
   	    	  	tbody.appendChild(tr);
    		}
    	});

    	//finish table
    	table.appendChild(thead);
    	table.appendChild(tbody);
    	tableDiv.appendChild(table);
    	
    	return tableDiv;
    }
    
    function createDownloadButton() {
    	
    	var buttonDiv = document.createElement('div');
    	buttonDiv.setAttribute('class', 'text-center');
    	buttonDiv.setAttribute('id', 'buttonDiv');
        
        var button = document.createElement('button');
        var text = document.createTextNode("Download");
        button.appendChild(text);
        button.setAttribute('class', 'btn btn-default btn-lg btn-block');
        button.setAttribute('type', 'submit');
        button.setAttribute('value', 'Download');
        var span = document.createElement('span');
        span.setAttribute('class', 'glyphicon glyphicon-download-alt');
        span.setAttribute('aria-hidden', 'true');
        button.appendChild(span);
        
        buttonDiv.appendChild(button);
        
        return buttonDiv;
    }
</script>

</div>
<br/>
<br/>
