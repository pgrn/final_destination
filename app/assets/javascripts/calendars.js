$(
  loadPopovers()
)

$(document).on('turbolinks:load', function() {
  loadPopovers();
})

function loadPopovers() {
  for (let e of $('[data-toggle="popover"]')) {
    $(e).popover({
      html: true,
      content: e.querySelector('.popup-content')
    })
  }
}



