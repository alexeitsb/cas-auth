$("#form_login").ready(function() {
  if ($("input#username").val() == "") {
    $("input#username").focus();
  } else {
    $("input#password").focus();
  }
});