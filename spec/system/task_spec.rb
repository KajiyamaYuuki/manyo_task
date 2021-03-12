require 'rails_helper'
RSpec.describe 'タスク管理機能', type: :system do
  describe '新規作成機能' do
    context 'タスクを新規作成した場合' do
      it '作成したタスクが表示される' do
        visit new_task_path
        fill_in 'タスク名', with: 'task1'
        fill_in '詳細', with: 'task1'
        click_on 'タスクを登録する'
        visit tasks_path
        expect(page).to have_content 'task1'
      end
    end
  end
  describe '一覧表示機能' do
    let!(:task1) { FactoryBot.create(:task, title: 'task1', expired_at: '2021-03-31 23:59:59') }
    let!(:task2) { FactoryBot.create(:task, title: 'task2') }
    before { visit tasks_path }
    context '一覧画面に遷移した場合' do
      it '作成済みのタスク一覧が表示される' do
        expect(page).to have_content 'task2' && 'task1' && 'test_content'
      end
    end
    context 'タスクが作成日時の降順に並んでいる場合' do
      it '新しいタスクが一番上に表示される' do
        task_list = all('#task_row')
        expect(task_list[0]).to have_content 'task2'
        expect(task_list[1]).to have_content 'task1'
      end
    end
    context '終了期限をソートしたい場合' do
      it '終了期限が近い順に上から表示される' do
        click_on '終了期限'
        task_list = all('#task_row')
        expect(task_list[0]).to have_text '2021-03-31 23:59:59'
        expect(task_list[1]).to have_text '2021-12-31 23:59:59'
      end
    end
  end
  describe '詳細表示機能' do
    context '任意のタスク詳細画面に遷移した場合' do
      it '該当タスクの内容が表示される' do
        task = FactoryBot.create(:task)
        visit tasks_path
        click_on '詳細'
        expect(page).to have_content 'test_title'
      end
    end
  end
end
