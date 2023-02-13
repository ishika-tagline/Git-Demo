$(document).ready(function(){

  if(document.getElementById("people_new_id"))
  {
    document.getElementById("people_new_id").innerHTML = "Hello people";
  }

  if(document.getElementById("user_index_id"))
  { 
    document.getElementById("user_index_id").innerHTML="Hello user";
  }

  $("#person_city").prop("disabled", true);
    $("#person_state").change(function(){
      $("#person_city").prop("disabled", false);
    });
});


  