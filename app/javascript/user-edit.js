const { css } = require("jquery");

document.addEventListener("turbolinks:load", function() {
  //ターボリンクスを無効に
  $(function() {
    //プロフィールボタンをクリック
    $("button").click(function() {
      $("nav").animate({"margin-bottom": 0}, 200);
      $("#nav-user-edit-close").css('display', 'block');
    });
  
    //labelをクリックしたらnavを閉じる
    $("#nav-user-edit-close").click(function() {
      $("nav").animate({"margin-bottom": -300}, 200);
      $(this).css('display', 'none');
    });
  });
})