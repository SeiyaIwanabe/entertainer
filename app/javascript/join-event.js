$(document).on('turbolinks:load', function() {
  // turbolinksを無効化したい処理
  $(function(){
    $('#js-JoinEvent').on('click',function(){
      $('.js-modal-bg').fadeIn();
      $('.modal-content').fadeIn();
      return false;
    });
    //閉じるボタンが押された場合はデフォルトのlinkの効果をキャンセル
    $('#js-modal-close').on('click',function(){
      $('.js-modal-bg').fadeOut();
      $('.modal-content').fadeOut();
      return false;
    });
    //黒背景を押したらモーダルを閉じる
    $(".js-modal-bg").on('click', function() {
      $('.js-modal-bg').fadeOut();
      $('.modal-content').fadeOut();
    });
  });
});