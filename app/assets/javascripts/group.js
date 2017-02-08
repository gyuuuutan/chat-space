$(function() {
  // ユーザー検索情報を追加していく関数
  function buildSeacrhedUserHTML(user) {
    var html =
      '<div class="chat-group-user clearfix">' +
        '<p class="chat-group-user__name">' +
            user.name +
        '</p>' +
        '<a id="chat-group-user__add-button" user_name="' + user.name + '" user_id="' + user.id + '">追加</a>' +
      '</div>';
    return html
  }
  // 追加したユーザーを表示していく関数
  function buildAddedUserHTML(name, id) {
    var html =
      '<div class="chat-group-user clearfix">' +
        '<input type="hidden" name="chat_group[user_ids][]" id="chat_group_user_ids_' + id + '" value="' + id + '">' +
        '<p class="chat-group-user__name">' +
            name +
        '</p>' +
        '<a id="chat-group-user__delete-button">削除</a>' +
      '</div>';
    return html
  }
  // ユーザー検索
  $('#user-search-form').keyup(function() {
    $.ajax({
      type: 'GET',
      url: '/users.json',
      data: { name: $(this).val() },
      dataType: 'json'
    })
    .done(function(users) {
      var insertHTML = '';

      users.forEach(function(user){
        insertHTML += buildSeacrhedUserHTML(user);
      });

      $('#user-search-result').append(insertHTML);
    })
    .fail(function(users) {
      alert('エラーが発生しました');
    });
  });
  // ユーザーをグループメンバーに追加
  $('#user-search-result').on('click', '#chat-group-user__add-button', function() {
    var $this = $(this);
    var name = $this.attr('user_name');
    var id = $this.attr('user_id');
    var insertHTML = buildAddedUserHTML(name, id);
    $('#user-add-list').append(insertHTML);
    // 追加したユーザーを検索結果一覧から削除
    $this.parent('.chat-group-user').remove();
  });
  // ユーザーをグループメンバーから削除
  $('#user-add-list').on('click', '#chat-group-user__delete-button', function() {
    $(this).parent('.chat-group-user').remove();
  });
});
