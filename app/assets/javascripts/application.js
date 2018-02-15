//= require underscore
//= require gmaps/google
//= require rails-ujs
//= require react
//= require react_ujs
//= require jquery
//= require jquery_ujs
//= require components
//= require moment
//= require fullcalendar
//= require bootstrap-datepicker
//= require_tree .
$(function() {
    $('input.datepicker').data({behaviour: "datepicker"}).datepicker({
      dateFormat: 'YYYY-MM-DD',
      autoclose: true
    });
});

