window.addEventListener("load", function() {
  function toggleNav() {
    const body = document.body;
    const btn = document.getElementById('js-button');
    const blackEffect = document.getElementById('black-effect');
   
    btn.addEventListener('click', function() {
      body.classList.toggle('nav-open-main');
    });
    blackEffect.addEventListener('click', function() {
      body.classList.remove('nav-open-main');
    });
  }
  toggleNav();
});