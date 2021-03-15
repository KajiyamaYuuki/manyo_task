FactoryBot.define do
  factory :task do
    title { 'test_title' }
    content { 'test_content' }
    expired_at { '2021-12-31 23:59:59' }
  end
  factory :second_task do
    title { 'task2' }
    content { 'task2' }
    expired_at { '2021-01-31 23:59:59' }
  end
end
