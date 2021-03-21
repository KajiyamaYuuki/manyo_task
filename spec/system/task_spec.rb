require 'rails_helper'
RSpec.describe 'タスク管理機能', type: :system do
  before do
    visit root_path
    FactoryBot.create(:task_user)
    fill_in 'sessions-new__email', with: 'task_test_user@email.com'
    fill_in 'sessions-new__password', with: 'tasktestuser'
    click_on 'sessions-new__log_in'
  end
  describe '新規作成機能' do
    context 'タスクを新規作成した場合' do
      it '作成したタスクが表示される' do
        click_on 'tasks_new__create'
        fill_in 'タスク名', with: 'task1'
        fill_in '詳細', with: 'task1'
        click_on 'タスクを登録する'
        visit tasks_path
        expect(page).to have_content 'task1'
      end
    end
  end
  describe '一覧表示機能' do
    FactoryBot.create(:task1)
    FactoryBot.create(:task2)
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
        click_on "tasks-index__task-show-#{task.id}"
        expect(
          find_by_id("tasks-show__task-title")
        ).to have_content task.title
        expect(
          find_by_id("tasks-show__task-content")
        ).to have_content task.content
      end
    end
  end
  describe '検索機能' do
    before do
      FactoryBot.create(:task, title: "task")
      FactoryBot.create(:task1, title: "sample")
      FactoryBot.create(:task2)
      FactoryBot.create(:task3)
      visit tasks_path
    end
    context 'タイトルであいまい検索をした場合' do
      it "検索キーワードを含むタスクで絞り込まれる" do
        # タスクの検索欄に検索ワードを入力する (例: task)
        fill_in 'tasks-index__search-title', with: 'sample'
        # 検索ボタンを押す
        click_on 'tasks-index__search'
        expect(page).to have_text '2021-01-31 23:59:59'
      end
    end
    context 'ステータス検索をした場合' do
      it "ステータスに完全一致するタスクが絞り込まれる" do
        select '未着手', from: 'task[status]'
        click_on 'tasks-index__search'
        expect(page).to have_text '2021-01-31 23:59:59'
      end
    end
    context 'タイトルのあいまい検索とステータス検索をした場合' do
      it "検索キーワードをタイトルに含み、かつステータスに完全一致するタスク絞り込まれる" do
        fill_in 'tasks-index__search-title', with: 'task3'
        select '完了', from: 'task[status]'
        click_on 'tasks-index__search'
        expect(page).to have_content 'task3'
        expect(page).to have_text '2021-03-31 23:59:59'
      end
    end
  end
end
