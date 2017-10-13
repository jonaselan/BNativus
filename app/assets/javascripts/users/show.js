$(document).on('turbolinks:load', function() {
  if (!(page.controller() === 'users' && page.action() === 'show')) { return; }
  console.log('ss');
  
  var WIN_TOP = (screen.height / 2) - (350 / 2);
  var WIN_LEFT = (screen.width / 2) - (520 / 2);

  function shareOnFacebook(link){
    window.open("https://www.facebook.com/sharer/sharer.php?u="+ encodeURIComponent(link), "pop", "width=600, height=400, scrollbars=no, top="+WIN_TOP+", left="+ WIN_LEFT);
    return false;
  }

  function shareOnTwitter(link){
    var text = "Replace this with your text";
    window.open('http://twitter.com/share?url='+encodeURIComponent(link)+'&text='+encodeURIComponent(text), '', 'left='+WIN_LEFT+',top='+WIN_TOP+',width=600,height=450,personalbar=0,toolbar=0,scrollbars=0');
  }

});
