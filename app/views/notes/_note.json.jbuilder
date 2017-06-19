json.extract! note, :id, :user_id, :title, :text, :toDate, :status, :icon, :color, :created_at, :updated_at
json.url note_url(note, format: :json)
