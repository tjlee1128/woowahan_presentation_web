json.id @user.user_id
json.email @user.email
json.password @user.password
json.fullname @user.fullname
json.team_id @user.team_id
json.team_name @user.get_team_name(@user.team_id)