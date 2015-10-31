json.array!(@ideas) do |idea|
  json.extract! idea, :id, :title, :user_id, :blurb, :reason, :goal, :implementation, :budget
  json.url idea_url(idea, format: :json)
end
