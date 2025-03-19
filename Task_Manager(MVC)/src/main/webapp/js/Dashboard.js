$(document).ready(function() {

	// hide the msesage after some time on each page
	setTimeout(function() {
		$('#msg').hide();
	}, 1000);

	
	// total overdue task
	$.ajax({
	    url:"getOverdueTasks",
	    type:"GET",
	    success:function(count){
	        $("#overduetasks").text(count);
	    },
	    error:function(error,status,xhr){
	        alert("error occured while fetching count of todo")
	    }
	  });
	  
	  // completed tasks 
	  $.ajax({
	      url:"completedTasks",
	      type:"GET",
	      success:function(data,status,xhr){
	          
	              $("#completedtasks").text(data);
	          
	      },
	      Error:function(error,xhr,status){
	          alert("error occured while fetching count of todo")
	      }
	    })
	
	// ajax call to find total todos 
	
	        $.ajax({
	            url:"totaltask",
	            type:"GET",
	            success:function (response) {
	               $("#totaltasks").text(response);
	            }
	            
	        });
	    
		
		
		
		
	
		
		
		// ajax call to get random user details 
		$.ajax({

		      url:"https://dummyjson.com/users/6",
		      type:"GET",
		      dataType:"json",
		      success:function(user){
		          console.log(user);
		          $("#username").val(user.username);
		          $("#email").val(user.email);
		          $("#password").val(user.password);
		          
		      },
		      error:function (error,status,xhr) {
		          alert("error occured");
		      }
		    
		  });
		
		
		
		
		     

});




