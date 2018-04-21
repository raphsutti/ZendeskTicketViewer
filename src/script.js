
// var username = $("input#username").val();
// var password = $("input#password").val();
$(document).ready(function(){
  
	var url = "https://firstorder.zendesk.com/api/v2/tickets.json";
	$.ajax({
		type:"GET",
		url: url,
    async: false,
    data: {username: "r.suttiyotin@gmail.com", password: "test1234"},
		dataType: "json",
		success: function(data){
			var result = data.items;
			// clear result
      $("#output").html("");
      
      // add json result
      $("#output").prepend(
        result
      );
		},
		error: function(errorMessage){
			alert("Error: " + errorMessage);
		}
	});
})

