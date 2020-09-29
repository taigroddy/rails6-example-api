json.(user, :id, :email, :name, :phone, :address, :is_admin)
json.token user.generate_jwt