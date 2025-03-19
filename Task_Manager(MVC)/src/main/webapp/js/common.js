$(document).ready(function(){
	
	let daysToAdd = Math.ceil(Math.random()*100); // Change this to the number of days you want to add
	let date = new Date();
	date.setDate(date.getDate() + daysToAdd); // Add days

	$("#deadline").val(date.toISOString().split('T')[0]);
				
				$.ajax({
						  url: 'https://dummyjson.com/todos/'+Math.ceil(Math.random()*100),
						  dataType: 'json',
						  success: function(data) {
						    console.log(data);
						    $("#title").val(data.todo);
						      $("#description").val(data.completed.toString()?"Completed : "+data.todo:"Not Completed"+data.todo);
						  }
						});
			
						
						
						
						  			
		
});
	

