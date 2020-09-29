json.success true
json.data do |json|
    json.partial! 'users/user', user: current_user
end