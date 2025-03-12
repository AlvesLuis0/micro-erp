def load_json(table_name)
  path = Rails.root.join("db/seed/#{table_name}.json")
  JSON.load_file!(path)
end

def seed(model)
  table_name = model.table_name
  rows = load_json(model.table_name)
  puts("Loaded file #{table_name}.json")
  ids = rows.map { |row| row["id"] }
  registered_rows = model.where('id = ANY(ARRAY[?]::bigint[])', ids).pluck(:id)
  ids = ids.difference(registered_rows)
  rows = rows.filter { |row| ids.include?(row["id"]) }
  puts("Filtered resources #{table_name}")
  model.insert_all!(rows)
end

seed(State)
seed(City)
