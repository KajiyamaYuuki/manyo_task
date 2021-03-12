module TasksHelper
  def button_text
    if action_name == 'new' || action_name == 'create'
      'タスクを登録する'
    elsif action_name == 'edit' || action_name == 'update'
      'タスクを更新'
    end
  end

  def sort_order(column, title, hash_param = {})
    direction = column == sort_column && sort_direction == 'asc' ? 'desc' : 'asc'
    link_to title, { sort: column, direction: direction }.merge(hash_param), class: "sort_header"
  end
end
