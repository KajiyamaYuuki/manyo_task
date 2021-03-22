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

  factory :task4, class: Task do
    title { 'task4' }
    content { 'task4' }
    expired_at { '2021-04-30 23:59:59' }
    status {'未着手'}
    # association :task_user
  end

  factory :task5, class: Task do
    title { 'task5' }
    content { 'task5' }
    expired_at { '2021-05-31 23:59:59' }
    status {'着手中'}
    # association :task_user
  end
  factory :task6, class: Task do
    title { 'task6' }
    content { 'task6' }
    expired_at { '2021-06-30 23:59:59' }
    status {'未着手'}
    # association :task_user
  end
  factory :task7, class: Task do
    title { 'task7' }
    content { 'task7' }
    expired_at { '2021-07-31 23:59:59' }
    status {'着手中'}
    # association :task_user
  end
  factory :tas8, class: Task do
    title { 'task8' }
    content { 'task8' }
    expired_at { '2021-08-31 23:59:59' }
    status {'未着手'}
    # association :task_user
  end

end
