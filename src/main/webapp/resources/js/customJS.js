/**
 * 
 */

function openLink(id, url) {
    jQuery.get('open.html?id='+id, function(data) { 
      if(data == 'OK') {
        window.open(url);
      } 
    }, 'text');
}