function sendErrorRegistration(){
	console.log("sdfdssd");
	var errorInfo = $('#form-error-reg').serialize();
	$.ajax({
		url: "registrate_error.cfc",
		type: "post",
		data: errorInfo,
		dataType: "html",
		success: function(response){
			$('.status-area').html(response);
			console.log(response);
		}
	});
}