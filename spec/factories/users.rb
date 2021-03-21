FactoryBot.define do
  factory :user1, class: User do
    name { 'user1' }
    email { 'user1@email.com' }
    password { '11111111' }
    admin { 'false' }
  end

  factory :user2, class: User do
    name { 'user2' }
    email { 'user2@email.com' }
    password { '22222222' }
    admin { 'false' }
  end

  factory :admin_user, class: User do
    name { 'admin_user' }
    email { 'admin@email.com' }
    password { 'adminadmin' }
    admin { 'true' }
  end

  factory :task_user, class: User do
    name { 'task_test_user' }
    email { 'task_test_user@email.com' }
    password { 'tasktestuser' }
    admin { 'false' }
  end
end
