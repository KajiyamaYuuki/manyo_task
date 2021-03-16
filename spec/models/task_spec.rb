require 'rails_helper'
describe 'タスクモデル機能', type: :model do
  describe 'バリデーションのテスト' do
    context 'タスクのタイトルが空の場合' do
      it 'バリデーションにひっかる' do
        task = Task.new(title: '', content: '失敗テスト')
        expect(task).not_to be_valid
      end
    end
    context 'タスクの詳細が空の場合' do
      it 'バリデーションにひっかかる' do
        task = Task.new(title: '失敗', content: '')
        expect(task).not_to be_valid
      end
    end
    context 'タスクのタイトルと詳細に内容が記載されている場合' do
      it 'バリデーションが通る' do
        task = Task.new(title: '失敗', content: '失敗テスト')
        expect(task).to be_valid
      end
    end
  end
  describe '検索機能' do
    # 必要に応じて、テストデータの内容を変更して構わない
    let!(:task) { FactoryBot.create(:task, title: 'task') }
    let!(:task1) { FactoryBot.create(:task1, title: "sample", content: 'sample') }
    let!(:task2) { FactoryBot.create(:task2) }
    let!(:task3) { FactoryBot.create(:task3) }
    context 'scopeメソッドでタイトルのあいまい検索をした場合' do
      it "検索キーワードを含むタスクが絞り込まれる" do
        # search_titleはscopeで提示したタイトル検索用メソッドである。メソッド名は任意で構わない。
        expect(Task.search_title('task').count).to eq 3
        expect(Task.search_title('sample').count).to eq 1
        expect(Task.search_title('test').count).to eq 0
      end
    end
    context 'scopeメソッドでステータス検索をした場合' do
      it "ステータスに完全一致するタスクが絞り込まれる" do
        expect(Task.search_status('着手中').count).to eq 1
        expect(Task.search_status('完了').count).to eq 1
        expect(Task.search_status('実行').count).to eq 0
      end
    end
    context 'scopeメソッドでタイトルのあいまい検索とステータス検索をした場合' do
      it "検索キーワードをタイトルに含み、かつステータスに完全一致するタスク絞り込まれる" do
        expect(Task.search_title_status('task2','着手中').count).to eq 1
        expect(Task.search_title_status('task3','完了').count).to eq 1
        expect(Task.search_title_status('sample','未着手').count).to eq 1
        expect(Task.search_title_status('task','実行').count).to eq 0
      end
    end
  end
end
