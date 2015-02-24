json.array!(@users) do |user|
  json.extract! user, :id, :name, :mail, :date_of_birth, :actual_weight, :ideal_weight, :size, :in_diet, :like_diet, :cv
  json.url user_url(user, format: :json)
end
