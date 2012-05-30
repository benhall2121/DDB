// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

jQuery.ajaxSetup({ 
  'beforeSend': function(xhr) {xhr.setRequestHeader("Accept", "text/javascript")}
})

$(document).ready(function() {
		
  $('.fake_password_field').focus(function(){
  	$(this).hide();
  	$('.real_password_field').show().focus();
  });

  $('.real_password_field').blur(function(){
  	if($(this).val() == ''){
  	  $(this).hide();
  	  $('.fake_password_field').show();
  	}
  });

});

function FauxPlaceholder() {
  if(!ElementSupportAttribute('input','placeholder')){
  	$('.show_if_placeholder_not_supported').show();
  }
}

function ElementSupportAttribute(elm, attr) {
  var test = document.createElement(elm);
  return attr in test;
}






