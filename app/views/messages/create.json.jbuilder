json.message do |json|
  json.name @message.user.name
  json.time @message.created_at
  json.body @message.body
end
