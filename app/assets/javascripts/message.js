$(function() {
  // メッセージ送信情報を追加していく関数
  function buildHTML(message) {
    var html =
    '<li class="chat-message">' +
      '<p class="chat-message__name">' +
          message.name +
      '</p>' +
      '<p class="chat-message__time">' +
          message.time +
      '</p>' +
      '<p class="chat-message__body">' +
          message.body +
      '</p>' +
      '<br>' +
      '<img class="chat-message__image" src="' + message.image + '">' +
    '</li>'
    return html;
  }
  var form = $('#new_message');

  $('#new_message').on('submit', function(e) {
    // HTMLでの送信をキャンセル
    e.preventDefault();
    var $this = $(this);

    // フォームに入力された値を取得
    var fd = new FormData($this.get(0));

    $.ajax({
      type: form.attr('method'), // フォーム要素("post")を取得
      url: form.attr('action'), // フォーム要素("/chat_group/chat_group_id/messages")を取得
      data: fd,
      contentType : false,
      processData : false,
      dataType: 'json'
    })
    // サーバーから値が正しく返ってきた場合
    .done(function(data) {
      var html = buildHTML(data.message);
      $('.chat-messages').append(html);
      $this.val('');
    })
    // 正しく返ってこなかった場合
    .fail(function() {
      alert('メッセージを送信できません');
    });
  });
  // メッセージの自動更新
  setInterval(reload, 3000);
  function reload(){
    $.ajax({
      type: 'GET',
      url: form.attr('action'),
      dataType: 'json'
    })
    .done(function(messages) {
      $('.chat-message').remove();
      var insertHTML = '';
      messages.forEach(function(message) {
        insertHTML += buildHTML(message);
      });
      $('.chat-messages').append(insertHTML);
    })
    .fail(function() {
      alert('更新できません');
    });
  };
});
