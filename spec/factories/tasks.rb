FactoryBot.define do
  factory :task, class: Task do
    title { 'test_title' }
    content { 'test_content' }
    expired_at { '2021-12-31 23:59:59' }
    # association :task_user
  end

  factory :task1, class: Task do
    title { 'task1' }
    content { 'task1' }
    expired_at { '2021-01-31 23:59:59' }
    status {'未着手'}
    # association :task_user
  end

  factory :task2, class: Task do
    title { 'task2' }
    content { 'task2' }
    expired_at { '2021-02-28 23:59:59' }
    status {'着手中'}
    # association :task_user
  end

  factory :task3, class: Task do
    title { 'task3' }
    content { 'task3' }
    expired_at { '2021-03-31 23:59:59' }
    status {'完了'}
    # association :task_user
  end

end
