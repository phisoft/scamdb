import $ from "jquery";

$.ajaxSetup({
  contentType:"application/json; charset=utf-8",
  dataType:"json",
  beforeSend: function(xhr) {
    xhr.setRequestHeader('x-csrf-token', $("#csrf").val())
  }
})

$("#submit-search").click(function(e){
  $("#search-result").append("hello")
  e.preventDefault()
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

  var params = JSON.stringify({ "scammer" : data });
  $.post("/scammers", params, function(response, status, xhr) {
      console.log(response)
  })
})
