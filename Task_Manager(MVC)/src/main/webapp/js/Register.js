$(document).ready(function() {

	// hide the msesage after some time on each page
	setTimeout(function() {
		$('#msg').hide();
	}, 1000);


	$("#username").blur(function() {  
	    var username = $("#username").val().trim();
	    if (username.length > 2) {
	        $.ajax({
	            type: "GET",
	            url: "/Task_Manager/checkUsername",
	            data: { username: username }, 
	            success: function(response) {
	                console.log("Response:", response); // Debugging
	                
	                if (response.trim() === "exists") { // Username exists
	                    $("#usernameMsg").text("Username is already taken!").removeClass("text-success").addClass("text-danger");
						$("#username").val("");
	                } else if (response.trim() === "not-exists") { // Username available
	                    $("#usernameMsg").text("Username is available!").removeClass("text-danger").addClass("text-success");
	                } else {
	                    $("#usernameMsg").text("Unexpected response!").addClass("text-warning");
	                }
	            },
	            error: function(xhr) {
	                console.log("Error:", xhr);
	                $("#usernameMsg").text("Error while checking username.").addClass("text-danger");
	            }
	        });
	    } else {
	        $("#usernameMsg").text("Enter at least 3 characters.").addClass("text-danger");
	    }
	});

});




