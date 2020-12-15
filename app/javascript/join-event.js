$(function() {
  $('#JoinEvent').click(function(event) {
    if(!confirm('本当にこのイベントに申し込みますか？')){
      // キャンセルの処理
      alert("イベントへの申込みをキャンセルしました。（次は申し込んでね♡）")
      return false; // 処理を終了する
    } else {
      // OKの処理
      alert("イベントへの申込みが完了しました！");
    }
  });
});