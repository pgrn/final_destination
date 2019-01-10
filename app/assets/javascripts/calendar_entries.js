$( document ).ready(function() {
  $('#all-day-checkbox').click(function() {
    $("div#end-time-input").toggle(this.click);
  });
});