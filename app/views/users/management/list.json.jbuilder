json.success true
json.data @users do |user|
    json.partial! 'users/user', user: user
end