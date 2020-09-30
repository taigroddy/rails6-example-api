json.success true
json.data @users do |user|
    json.partial! 'users/user_not_token', user: user
end