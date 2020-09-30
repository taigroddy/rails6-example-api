json.success true
json.data do |json|
    json.partial! 'users/user_not_token', user: @user
end