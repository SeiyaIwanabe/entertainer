$(document).on('turbolinks:load', function() {
  // turbolinksを無効化したい処理
  $(function(){
    $(".alert").fadeOut(5000);
    $(".notice").fadeOut(5000);
  });
});