// let loc = document.location.pathname;

if ( loc == '/' || loc == '/signup' || loc == '/login' || loc == '/logout' || loc == '/index') {
  let main = document.querySelector('#main');
  main.hidden = true;
  main.disabled = true;
}