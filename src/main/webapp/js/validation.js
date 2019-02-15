$(document).ready(function() {

	$("#newUserForm").validate({

		rules : {
				userName : {
					required : true
				},
				password : {
					required : true,
					minlength : 8,
					capitals : true,
				},
				confirmPassword : {
					required : true,
					equalTo : "#password"
				}
			},
		messages : {
				password : {
					minlength : "Password must be at least 8 characters long.",
					capitals : "Password must contain a capital letter.",
				},
				confirmPassword : {
					equalTo : "Passwords do not match"
				}
			},
			errorClass : "error"
		});
	
	$("#changePasswordForm").validate({

		rules : {
				password : {
					required : true,
					minlength : 8,
					capitals : true,
				},
				confirmPassword : {
					required : true,
					equalTo : "#password"
				}
			},
		messages : {
				password : {
					minlength : "Password must be at least 8 characters",
					capitals : "Password must contain a capital letter.",
				},
				confirmPassword : {
					equalTo : "Passwords do not match"
				}
			},
			errorClass : "error",
			validClass : "valid"
	});
	
	$("#changeDL").validate({
		
		rules : {
				newDL : {
					required : true
				},
				confirmDL : {
					required : true,
					equalTo : "#newDL"
				}
			},
		messages : {
				newDL : {
				
				},
				confirmDL : {
					equalTo: "Drivers licenses must match."
				}	
			},
			errorClass : "error",
			validClass : "valid"
		})
		
	$("#returnTool").validate({
		
		rules : {
				toolId : {
					required : true,
					number : true
				}
			},
		messages : {
				toolId : {
					number: "Tool ID must be a number."
				}	
			},
			errorClass : "error",
			validClass : "valid"
		})		
	});

$.validator.addMethod('capitals', function(thing) {
	return thing.match(/[A-Z]/);
}, "Password must contain a capital letter.");