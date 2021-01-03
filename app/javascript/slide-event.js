const { css } = require("jquery");

$(document).on('turbolinks:load', function() {
  // turbolinksを無効化したい処理
  $(function() {
    //イベントの件数
    let count = $("#slide li").length
  
    //現在表示されているイベント（最初は一番目のイベント）
    let current = 1;
  
    //次に表示するイベント
    let next = 2;
  
    //フェードイン・フェードアウトのインターバル
    let interval = 5000;
  
    //フェードイン・フェードアウトのスピード
    let duration = 600;
  
    //タイマー用の変数
    let timer;
  
    //一番目のイベント以外は非表示に
    $("#slide li:not(:first-child)").hide();
  
    //3000ミリ秒(変数intervalの値)ごとにsliderTimer()関数を実行
    timer = setInterval(slideTimer, interval);
    //sliderTimer()関数
    function slideTimer() {
      //現在のイベントをフェードアウト
      $("#slide li:nth-child(" + current + ")").fadeOut(duration);
      //次をイベントをフェードイン
      $("#slide li:nth-child(" + next + ")").fadeIn(duration);
      //変数currentの新しい値:変数nextのもとの値
      current = next;
      //変数nextの新しい値:変数currentの新しい値+1
      next = ++next;
      //変数nextの値がイベントの総数を超える場合は1に戻す
      if(next > count) {
        next = 1;
      }
    }
  });
});