json.array!(@tasks) do |task|
  json.extract! task, :description, :completed, :owner_id
  json.url task_url(task, format: :json)
end
