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

  factory :user3, class: User do
    name { 'user3' }
    email { 'user3@email.com' }
    password { '33333333' }
    admin { 'false' }
  end

  factory :user4, class: User do
    name { 'user4' }
    email { 'user4@email.com' }
    password { '44444444' }
    admin { 'false' }
  end

  factory :user5, class: User do
    name { 'user5' }
    email { 'user5@email.com' }
    password { '55555555' }
    admin { 'false' }
  end

  factory :user6, class: User do
    name { 'user6' }
    email { 'user6@email.com' }
    password { '66666666' }
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
