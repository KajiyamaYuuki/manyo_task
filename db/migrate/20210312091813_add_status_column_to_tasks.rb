class AddStatusColumnToTasks < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :status, :text, default: '選択なし', null: false
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
