// $(function() {
//   $('#JoinEvent').click(function(event) {
//     if(!confirm('本当にこのイベントに申し込みますか？')){
//       // キャンセルの処理
//       alert("イベントへの申込みをキャンセルしました。（次は申し込んでね♡）")
//       return false; // 処理を終了する
//     } else {
//       // OKの処理
//       alert("イベントへの申込みが完了しました！");
//     }
//   });
// });

// document.addEventListener("turbolinks:load", function() {

//   var dialog = document.querySelector('dialog');

//   var open_btn = document.getElementById('JoinEvent');

//   var ok_btn = document.getElementById('ok');

//   var cancel_btn = document.getElementById('cancel');




//   open_btn.addEventListener('click', function () {

//     dialog.showModal();

//   }, false);




//   ok_btn.addEventListener('click', function () {

//     dialog.close(true);

//   }, false);

//   cancel_btn.addEventListener('click', function () {

//     dialog.close(false);

//   }, false);

//   dialog.addEventListener('close', function (event) {

//       alert(this.returnValue);

//   });
// });

// $(function() {
//   //背景とアラートボックスを非表示
//   $("#bg").hide();
  
//   //申し込むボタンをクリック
//   $("#JoinEvent").click(function() {
//     //背景とアラートボックスをフェードイン
//     $("#bg").fadeIn(300);
//   });
  
//   //申し込むをクリック
//   $("ok").click(function() {
//     //背景とアラートボックスをフェードアウト
//     $("#bg").fadeOut(300);
//   });
  
//   //キャンセルをクリック
//   $("#cancel").click(function() {
//     $("#bg").fadeOut(300);
//   });
// });
