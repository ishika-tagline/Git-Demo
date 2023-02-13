document.getElementById("people_new_id").innerHTML = "Hello people";
document.getElementById("user_index_h1").innerHTML = "Hello Users";

$(document).ready(function(){
  console.log("click called................................")
    $("#people_new_id").click(function(){
      console.log("hide  called................................")
      $("#people_new_id").hide();
    });
});


  