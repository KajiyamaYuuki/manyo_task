ActiveRecord::Schema.define(version: 2021_03_09_061215) do
  enable_extension 'plpgsql'
  create_table 'tasks', force: :cascade do |t|
    t.string 'title', null: false
    t.text 'content', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end
end
