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
})

$(document).on('turbolinks:load', function() {
  loadPopovers();
})







