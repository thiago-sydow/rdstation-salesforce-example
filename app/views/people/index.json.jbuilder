json.array!(@people) do |person|
  json.extract! person, :id, :last_name, :company, :email, :job_title, :phone, :website, :owner_id, :converted, :unread_by_owner
  json.url person_url(person, format: :json)
end
