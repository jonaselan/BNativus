$(document).on('turbolinks:load', function() {
  if (!(page.controller() === 'rooms' && (page.action() === 'edit' || page.action() === 'new'))) { return; }

  $('#btn-copy').click(function() {
    $('#link-room').select();
    document.execCommand("Copy");
  });
});
