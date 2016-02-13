json.access_token @token
json.user do
  json.id @user.user_id
  json.email @user.email
  json.password @user.password
  json.fullname @user.fullname
  json.team_id @user.team_id
end
