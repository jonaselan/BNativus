$(document).on('turbolinks:load', function() {
  if (!(page.controller() === 'home' && page.action() === 'index')) { return; }
  console.log('ready 2 go');
});
