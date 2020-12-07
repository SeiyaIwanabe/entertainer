window.addEventListener("load", function() {
  function toggleNav() {
    let body = document.body;
    let hamburger = document.getElementById('js-hamburger');
    let blackBg = document.getElementById('js-black-bg');
  
    hamburger.addEventListener('click', function() {
      body.classList.toggle('nav-open');
    });
    blackBg.addEventListener('click', function() {
      body.classList.remove('nav-open');
    });
  }
  toggleNav();
});