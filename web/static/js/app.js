import $ from "jquery";

$.ajaxSetup({
  beforeSend: function(xhr) {
    xhr.setRequestHeader('x-csrf-token', $("#csrf").val())
  }
})

$("#submit-search").click(function(e){
  e.preventDefault()
  var query = { query: $("#query").val() };
  $.get("/scammers", query, function(response, status, xhr){
    var res = response.data.length > 0 ? 
      '<span class="risky"> Risky </span>' : 
      '<span class="clean"> Clean </span>' ;

    $("#search-result").html("Verdict: " + res);
  })
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
  
  var params = { "scammer" : data };
  $.post("/scammers", params, function(response, status, xhr) {
        console.log(response)
  })
})
