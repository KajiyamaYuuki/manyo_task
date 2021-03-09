module TasksHelper
  def button_text
    if action_name == 'new' || action_name == 'create'
      'タスクを登録する'
    elsif action_name == 'edit' || action_name == 'update'
      'タスクを更新'
    end
  end
end
