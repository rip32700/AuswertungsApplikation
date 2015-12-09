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
	</p>
</div>


<script type="text/javascript">
	$(document).ready(function(){
		
		//before async task start
		$('#processingDiv').show();
		$('#resultDiv').hide();
		
		$.get("startAjax2", function (data, status) {
			//alert("Data: " + data + "\nStatus: " + status);
			
			$('#processingDiv').hide();
			$('#resultDiv').show();
			$('#resultDiv').html('The result: ' + data);
			
		});    
	});
</script>

</div>
<br/>
<br/>
