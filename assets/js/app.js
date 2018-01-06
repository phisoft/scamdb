import $ from "jquery";

$.ajaxSetup({
  dataType: "json",
  beforeSend: function(xhr) {
    xhr.setRequestHeader('x-csrf-token', $("#csrf").val())
  }
})

$("#submit-search").click(function(e){
  e.preventDefault()
  var query = { query: $("#query").val() };
  $.get("/api/v1/check", query, function(response, status, xhr){
    var res = response.length > 0 ? 
      '<span class="risky"> Risky </span>' : 
      '<span class="clean"> Clean </span>' ;

    $("#search-result").html("Verdict: " + res);
  })
})

$("#form").hide();
$("#toggle-show-form").click(function(e){
  if($("#form").is(":hidden")){
    $("#form").show();
  }else{
    $("#form").hide();
  }
})

$("#submit-form").click(function(e){
  e.preventDefault()

  var data = {
    full_name: $("#full_name").val(),
    phone: $("#phone").val(),
    passport: $("#passport").val(),
    email: $("#email").val(),
    bank_name: $("#bank_name").val(),
    bank_account: $("#bank_account").val(),
    website: $("#website").val(),
    country: $("#country").val(),
    info: $("#info").val()
  }

  $("#form-error").html("Processing. Please wait .."); 

  $.post("/api/v1/scam", data)
   .done(function(data){
      $("#form-error").html("We received your submission. Thank you!"); 
      $("#form")[0].reset();
      //remove error msg after 1min
      setTimeout(function(){
        $("#form-error").html("");
      }, 2500)
      //reset error
      $("input").each(function(el){
        this.setCustomValidity("");
        this.checkValidity();
      })
    })
    .fail(function(xhr){
      console.log("failed", xhr.responseJSON);
      //reset
      $("input").each(function(el){
        this.setCustomValidity("");
        this.checkValidity();
      })
      //check valid
      $.each(xhr.responseJSON, function(k, item){
        console.log("Item", item)
        $("#" + item.field)[0].setCustomValidity(item.error);
        $("#" + item.field)[0].checkValidity();
        $("#form-error").html("At least one field has invalid value: " + item.field + " " +  item.error); 
      })
    })
})
