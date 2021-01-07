// $(document).on('turbolinks:load', function() {
//   // turbolinksを無効化したい処理
//   $('#js-comment-form').on('submit', function(e) {
//     e.preventDefault();
//     // console.log(this)
//     let formData = new FormData(this);
//     let url = $(this).attr('action')
//     $.ajax({
//       url: url,
//       type: "POST",
//       data: formData,
//       dataType: 'json',
//       processData: false,
//       contentType: false
//     })
//   });
// });