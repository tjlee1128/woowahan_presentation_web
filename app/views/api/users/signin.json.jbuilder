json.access_token @user.user_auths.last.access_token
json.user do
  json.id @user.id
  json.email @user.email
  json.password @user.password
  json.fullname @user.fullname
  json.team_id @user.team_id
end
