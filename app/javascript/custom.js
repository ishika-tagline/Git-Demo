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

      $.ajax({
          url: "/people/state/"+$(this).val(),
          method: "GET",
          datatype: "json",
          error: function (xhr, status, error) {
            console.error('AJAX Error: ' + status + error);
          },
          success: function (cities) {
              $("#person_city").empty();
              $("#person_city").append('<option>Select City</option>')
              cities.forEach(element => {
                $("#person_city").append('<option value="'+element.id+'"> '+element.name+'</option>')
              });
          }
      });
    });
});


  