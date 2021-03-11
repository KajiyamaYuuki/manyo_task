# README

# Taskテーブル
| id | title | content | created_at | updated_at |
|----|-------|---------|------------|------------|
| td |  td   |   td    |     td     |     td     |


# herokuデプロイ手順
1. herokuにログインする
```
  $ heroku login
```
以下のメッセージが表示されたら、何かしらのキーを入力する
```
  heroku: Press any key to open up the browser to login or q to exit:
```
入力すると、ブラウザが起動し、ログイン画面が表示されるので、画面の指示に従い、「Log In」をクリック

2. アセットプリコンパイルをする
アセット（app/assets/以下のファイルの総称）を本番環境で実行できる形式に変換する
```
  $ rails assets:precompile RAILS_ENV=production
```

3. git commit コマンドを使用してコミットする
```
  $ git add -A
  $ git commit -m "init"
```
