json.status :success

json.extract! @users, :id, :first_name,:last_name,:date,:email,:password :created_at, :updated_at

json.url user_url(user, format: :json)