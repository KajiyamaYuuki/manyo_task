require 'rails_helper'
RSpec.describe 'ユーザー機能', type: :system do
  before do
    visit root_path
  end
  describe 'ユーザー新規登録機能' do
    context 'はじめてアプリケーションを利用する' do
      it 'ユーザーが新規登録できる' do
        click_on 'users-new__sign_up'
        fill_in 'users-new__user-name', with: 'testuser'
        fill_in 'users-new__user-email', with: 'testuser@email.com'
        fill_in 'users-new__user-password', with: 'testtest'
        fill_in 'users-new__user-password_confirmation', with: 'testtest'
        click_on 'users-new__user-create'
        expect(
          find_by_id("users-show__user-name")
        ).to have_content 'testuser'
      end
    end
  end
  describe 'ログイン機能' do
    before do
      user = FactoryBot.create(:user1)
      fill_in 'sessions-new__email', with: 'user1@email.com'
      fill_in 'sessions-new__password', with: '11111111'
      click_on 'sessions-new__log_in'
    end
    context 'ユーザーがログインできること' do
      it '既存のユーザーでログインする' do
        expect(page).to have_content 'タスク一覧'
      end
    end
    context 'ユーザーがマイページに飛べること' do
      it 'マイページに遷移する' do
        click_on 'users__my_page'
        expect(
          find_by_id("users-show__user-name")
        ).to have_content 'user1'
      end
    end
    context '他人のマイページに飛ぼうとした際、タスク一覧を表示する' do
      it '他人のマイページに飛ぼうとする' do
        FactoryBot.create(:user2)
        visit user_path(2)
        expect(page).to have_content 'タスク一覧'
      end
    end
    context 'ログアウトできること' do
      it 'ログイン中のユーザーをログアウトする' do
        click_on 'users__log_out'
        expect(page).to have_content 'Log in'
      end
    end
  end
  describe 'ページ遷移のテスト' do
    context 'ユーザーはログインしないとタスク一覧を見ることができないこと' do
      it 'ユーザーがログインせずタスク一覧画面に飛ぼうとしたとき、ログイン画面に遷移する' do
        visit tasks_path
        expect(page).to have_content 'ログインしてください'
      end
    end
  end
  describe '管理画面のテスト' do
    before do
      admin_user = FactoryBot.create(:admin_user)
      fill_in 'sessions-new__email', with: 'admin@email.com'
      fill_in 'sessions-new__password', with: 'adminadmin'
      click_on 'sessions-new__log_in'
    end
    context '管理者は管理画面にアクセスできること' do
      it '管理画面にアクセスすると管理画面に遷移する' do
        click_on 'admin_users__index'
        expect(page).to have_content '管理画面'
      end
    end
    context '管理者はユーザーの新規登録ができること' do
      it '管理者権限でユーザーの新規登録をする' do
        click_on 'admin_users__create_user'
        fill_in 'admin-user__new-name',	with: 'new_user'
        fill_in 'admin-user__new-email',	with: 'new_user@email.com'
        fill_in 'admin-user__new-password',	with: 'newusernewuser'
        fill_in 'admin-user__new-password_confirmation',	with: 'newusernewuser'
        click_on 'admin-user__create'
        expect(page).to have_content 'new_user'
      end
    end
    context '管理者はユーザーの詳細画面にアクセスできること' do
      it '管理者画面からユーザーの詳細画面に遷移する' do
        user1 = FactoryBot.create(:user1)
        click_on 'admin_users__index'
        click_on "admin-user-index__user-show-#{user1.id}"
        expect(page).to have_content user1.name
      end
    end
    context '管理者はユーザーの編集画面からユーザーを編集できること' do
      it '管理者画面からユーザーの編集をする' do
        user2 = FactoryBot.create(:user2)
        click_on 'admin_users__index'
        click_on "admin-user-index__user-edit-#{user2.id}"
        fill_in 'admin-user__edit-name',	with: 'edit_user'
        fill_in 'admin-user__edit-email',	with: 'edit_user@email.com'
        fill_in 'admin-user__edit-password',	with: 'edituseredituser'
        fill_in 'admin-user__edit-password_confirmation',	with: 'edituseredituser'
        click_on 'admin-user__update'
        expect(page).to have_content 'edit_user'
      end
    end
    context '管理者はユーザーを削除できること' do
      it '管理者画面からユーザーを削除する' do
        user2 = FactoryBot.create(:user2)
        click_on 'admin_users__index'
        click_on "admin-user-index__user-destroy-#{user2.id}"
        expect(page).not_to have_content user2.name
      end
    end
  end
end
