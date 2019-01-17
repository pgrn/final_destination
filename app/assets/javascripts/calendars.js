function loadPopovers() {
  for (let e of $('[data-toggle="popover"]')) {
    $(e).popover({
      html: true,
      content: e.querySelector('.popup-content')
    })
  }
}

$(document).ready(function() {
  loadPopovers();

  $('#modal-window').on('shown.bs.modal', function () {
    $(ClientSideValidations.selectors.forms).validate();
  });

})

$(document).on('turbolinks:load', function() {
  loadPopovers();
})



