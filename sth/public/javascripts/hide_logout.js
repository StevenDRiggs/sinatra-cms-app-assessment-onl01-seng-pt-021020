let loc = document.location.pathname;

if ( loc == '/' || loc == '/signup' || loc == '/login' || loc == '/logout' ) {
  let logout = document.querySelector('#logout');
  logout.hidden = true;
  logout.disabled = true;
}
